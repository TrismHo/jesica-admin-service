package com.trism.jesica.Service;

import com.trism.jesica.Util.SearchUtil;
import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.persistence.mysql.Entitiy.app.TbAppService;
import com.trism.jesica.persistence.mysql.Entitiy.app.TbAppServiceLocation;
import com.trism.jesica.persistence.mysql.Repository.app.TbAppServiceLocationRepository;
import com.trism.jesica.persistence.mysql.Repository.app.TbAppServiceRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

@RequiredArgsConstructor
@Service
@Slf4j
public class AppServiceService {
    private final TbAppServiceRepository tbAppServiceRepository;
    private final TbAppServiceLocationRepository tbAppServiceLocationRepository;
    private final JesicaProperties jesicaProperties;
    @Transactional(readOnly = true)
    public List<TbAppService> getServiceList() {
        try {
            return tbAppServiceRepository.findByDataStatusOrderByServiceNoAsc(1);
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    @Transactional(readOnly = true)
    public TbAppService getServiceDetail(Integer serviceNo) {
        try {
            Optional<TbAppService> opt = tbAppServiceRepository.findById(serviceNo);
            return opt.orElse(null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Transactional(readOnly = true)
    public List<TbAppServiceLocation> getLocationList(Integer serviceNo) {
        try {
            return tbAppServiceLocationRepository.findByServiceNoOrderByLocationNoDesc(serviceNo);
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
    @Transactional
    public int deleteService(Integer serviceNo) {
        int result = 0;
        try {
            Optional<TbAppService> opt = tbAppServiceRepository.findById(serviceNo);
            if (opt.isPresent()) {
                TbAppService service = opt.get();
                service.setDataStatus(0);
                tbAppServiceRepository.save(service);
                result = 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

   /* @Transactional
    public int updateService(TbAppService param) {
        int result = 0;
        try {
            Optional<TbAppService> opt = tbAppServiceRepository.findById(param.getServiceNo());
            if (opt.isPresent()) {
                TbAppService service = opt.get();

                service.setServiceName(param.getServiceName());
                service.setBrandTypeCd(param.getBrandTypeCd());
                service.setCsTel(param.getCsTel());
                service.setKakaoUrl(param.getKakaoUrl());

                tbAppServiceRepository.save(service);
                result = 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }*/
   public Map<String, Object> tbAppServiceSearch(Map<String, Object> searchValue, Pageable pageable) {

       Map<String, Object> map = new HashMap<>();

       // 1) searchValue 값들 String 변환 + trim + null/공백 정리
       Map<String, Object> param = new HashMap<>();
       if (searchValue != null) {
           for (Map.Entry<String, Object> entry : searchValue.entrySet()) {
               Object value = entry.getValue();
               if (value == null) continue;

               String str = value.toString().trim();
               // DataTables 기본 파라미터(start,length,draw 등)는 빈값 아니면 유지
               // 검색용 키워드는 빈값이면 굳이 넣지 않아도 됨
               if ("".equals(str)) continue;

               param.put(entry.getKey(), str);
           }
       }

       // 2) predicate는 "한 번만" 생성
       Specification<TbAppService> predicate =
               (Specification<TbAppService>) SearchUtil.searchAppService(param);

       // 3) 조회
       Page<TbAppService> page = tbAppServiceRepository.findAll(predicate, pageable);

       // 4) 응답
       map.put("serviceList", page.getContent());
       map.put("totalPage", page.getTotalPages());
       map.put("totalElement", page.getTotalElements());

       return map;
   }
    @Transactional
    public TbAppService tbAppServiceSave(TbAppService param,
                                         List<TbAppServiceLocation> locations,
                                         MultipartFile serviceBi) {

        final boolean isInsert = (param.getServiceNo() == null);
        TbAppService service;

        if (isInsert) {
            service = TbAppService.builder()
                    .serviceName(param.getServiceName())
                    .brandTypeCd(param.getBrandTypeCd())
                    .csTel(param.getCsTel())
                    .kakaoUrl(param.getKakaoUrl())
                    .dataStatus(1)
                    .build();

            service = tbAppServiceRepository.save(service); // serviceNo 생성
        } else {
            Optional<TbAppService> opt = tbAppServiceRepository.findById(param.getServiceNo());
            if (!opt.isPresent()) return null;

            service = opt.get();
            service.setServiceName(param.getServiceName());
            service.setBrandTypeCd(param.getBrandTypeCd());
            service.setCsTel(param.getCsTel());
            service.setKakaoUrl(param.getKakaoUrl());

            tbAppServiceLocationRepository.deleteByServiceNo(service.getServiceNo());
        }

        // ✅ BI 업로드 저장 (있을 때만)
        OutputStream os = null;
        try {
            if (serviceBi != null && !serviceBi.isEmpty()) {

                String fileName = RandomStringUtils.random(8, 33, 125, true, true);

                // 확장자 추출
                int pos = serviceBi.getOriginalFilename().lastIndexOf(".");
                String ext = (pos > -1) ? serviceBi.getOriginalFilename().substring(pos + 1) : "png";

                // 폴더: /baseImgPath/appservice/{serviceNo}/
                Path dirPath = Paths.get(
                        jesicaProperties.getBaseImgPath().getPath(),
                        "appservice",
                        service.getServiceNo().toString()
                );

                File uploadDir = new File(dirPath.toFile().getPath());
                if (!uploadDir.exists()) uploadDir.mkdirs();

                // 실제 저장 경로
                Path uploadFullPath = dirPath.resolve(fileName + "." + ext);

                // DB에 넣을 상대 경로 (너 store랑 동일하게 "/" 시작)
                Path fileNamePath = Paths.get(
                        "/appservice",
                        service.getServiceNo().toString(),
                        fileName + "." + ext
                );

                // 저장 + 엔티티 세팅 (service_bi <- serviceBi)
                byte[] bytes = serviceBi.getBytes();
                os = new FileOutputStream(new File(uploadFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();
                os = null;

                service.setServiceBi(fileNamePath.toFile().getPath());

                log.debug("serviceBi uploadFullPath={}", uploadFullPath);
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try { if (os != null) os.close(); } catch (Exception ignore) {}
        }

        // ✅ 서비스 저장 (BI 경로 포함)
        service = tbAppServiceRepository.save(service);

        // ✅ 지역 저장(네 기존 로직)
        if (locations != null && !locations.isEmpty()) {
            Set<String> seen = new HashSet<>();
            for (TbAppServiceLocation l : locations) {
                if (l == null) continue;

                String addr1 = l.getAddr1();
                String addr2 = l.getAddr2();

                if (addr1 == null || addr1.trim().isEmpty()) continue;
                if (addr2 == null || addr2.trim().isEmpty()) addr2 = "0";

                String key = addr1 + "::" + addr2;
                if (!seen.add(key)) continue;

                TbAppServiceLocation n = TbAppServiceLocation.builder()
                        .serviceNo(service.getServiceNo())
                        .addr1(addr1)
                        .addr2(addr2)
                        .build();

                tbAppServiceLocationRepository.save(n);
            }
        }

        return service;
    }



    @Transactional
    public int updateServiceFull(TbAppService param,
                                 List<TbAppServiceLocation> locations,
                                 MultipartFile serviceBi,
                                 String removeServiceBi) {

        Optional<TbAppService> opt = tbAppServiceRepository.findById(param.getServiceNo());
        if(!opt.isPresent()) return 0;

        TbAppService service = opt.get();

        // ===== 기본 정보 업데이트 =====
        service.setServiceName(param.getServiceName());
        service.setCsTel(param.getCsTel());
        service.setKakaoUrl(param.getKakaoUrl());
        service.setBrandTypeCd(param.getBrandTypeCd());

        // ===== ✅ BI 제거 요청 처리 (removeServiceBi=1) =====
        if ("1".equals(removeServiceBi)) {
            service.setServiceBi(null);
        }

        // ===== ✅ BI 업로드 처리 (파일 있으면 덮어쓰기) =====
        OutputStream os = null;
        try {
            if (serviceBi != null && !serviceBi.isEmpty()) {

                // 이미지 타입 최소 검증(선택)
                String ct = serviceBi.getContentType();
                if (ct == null || !ct.startsWith("image/")) {
                    throw new IllegalArgumentException("이미지 파일만 업로드 가능합니다.");
                }

                String fileName = RandomStringUtils.random(8, 33, 125, true, true);

                // 확장자 추출
                String original = serviceBi.getOriginalFilename();
                int pos = (original != null) ? original.lastIndexOf(".") : -1;
                String ext = (pos > -1) ? original.substring(pos + 1) : "png";

                // 저장 폴더: {baseImgPath}/appservice/{serviceNo}/
                Path dirPath = Paths.get(
                        jesicaProperties.getBaseImgPath().getPath(),
                        "appservice",
                        service.getServiceNo().toString()
                );

                File uploadDir = new File(dirPath.toFile().getPath());
                if (!uploadDir.exists()) uploadDir.mkdirs();

                // 실제 저장 파일 경로
                Path uploadFullPath = dirPath.resolve(fileName + "." + ext);

                // DB 저장용 상대 경로 (fileLoad에서 filePath로 받는 값)
                Path fileNamePath = Paths.get(
                        "/appservice",
                        service.getServiceNo().toString(),
                        fileName + "." + ext
                );

                byte[] bytes = serviceBi.getBytes();

                os = new FileOutputStream(new File(uploadFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();
                os = null;

                // DB 컬럼 service_bi <- 필드 serviceBi
                service.setServiceBi(fileNamePath.toFile().getPath());

                // 새 파일 업로드되면 제거 플래그는 의미 없으니(혹시 동시에 들어왔을 때)
                // removeServiceBi가 1이어도 업로드가 있으면 업로드 우선 처리된 상태가 됨
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try { if (os != null) os.close(); } catch (Exception ignore) {}
        }



        // ===== 서비스 저장 (BI 포함) =====
        tbAppServiceRepository.save(service);

        // ===== 기존 지역 삭제 후 재등록 =====
        tbAppServiceLocationRepository.deleteByServiceNo(service.getServiceNo());

        if (locations != null && !locations.isEmpty()) {

            // (선택) 중복 제거: addr1::addr2
            Set<String> seen = new HashSet<>();

            for (TbAppServiceLocation l : locations) {
                if (l == null) continue;

                String addr1 = l.getAddr1();
                String addr2 = l.getAddr2();

                if (addr1 == null || addr1.trim().isEmpty()) continue;
                if (addr2 == null || addr2.trim().isEmpty()) addr2 = "0";

                String key = addr1 + "::" + addr2;
                if (!seen.add(key)) continue;

                TbAppServiceLocation n = TbAppServiceLocation.builder()
                        .serviceNo(service.getServiceNo())
                        .addr1(addr1)
                        .addr2(addr2)
                        .build();

                tbAppServiceLocationRepository.save(n);
            }
        }

        return 1;
    }
}

