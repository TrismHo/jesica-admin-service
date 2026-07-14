package com.trism.jesica.Service;

import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaBadgeFile;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaBadgeSt;
import com.trism.jesica.persistence.mysql.Repository.manna.TbMannaBadgeFileRepository;
import com.trism.jesica.persistence.mysql.Repository.manna.TbMannaBadgeStRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
@Slf4j
public class BadgeService {
    private final TbMannaBadgeFileRepository tbMannaBadgeFileRepository;
    private final TbMannaBadgeStRepository tbMannaBadgeStRepository;

    private final JesicaProperties jesicaProperties;
    @Transactional
    public void updateBadge(
            Long badgeFileNo,
            Integer badgeType,
            String stCode,
            String userId,
            String usingYn,
            Integer dataStatus,
            MultipartFile badgeFile
    ) {
        if (badgeFileNo == null) {
            throw new IllegalArgumentException("뱃지 번호가 없습니다.");
        }

        if (badgeType == null) {
            throw new IllegalArgumentException("뱃지 타입이 없습니다.");
        }

        if (userId == null || userId.trim().isEmpty()) {
            throw new IllegalArgumentException("사용자 정보가 없습니다.");
        }

        if (usingYn == null || usingYn.trim().isEmpty()) {
            throw new IllegalArgumentException("사용 여부가 없습니다.");
        }

        if (dataStatus == null) {
            throw new IllegalArgumentException("데이터 상태가 없습니다.");
        }

        if (badgeType == 2 && "Y".equals(usingYn) && (stCode == null || stCode.trim().isEmpty())) {
            throw new IllegalArgumentException("개별 뱃지를 사용중으로 수정하려면 가맹점 코드가 필요합니다.");
        }

        TbMannaBadgeFile badgeInfo = tbMannaBadgeFileRepository.findById(badgeFileNo)
                .orElseThrow(() -> new IllegalArgumentException("뱃지 정보를 찾을 수 없습니다."));

        badgeInfo.setBadgeType(badgeType);
        badgeInfo.setStCode(badgeType == 2 ? stCode : null);
        badgeInfo.setUsingYn(usingYn);
        badgeInfo.setDataStatus(dataStatus);
        badgeInfo.setUpdateUserId(userId);
        badgeInfo.setUpdateDate(LocalDateTime.now());

        /*
         * 새 이미지가 들어온 경우에만 파일 교체
         */
        if (badgeFile != null && !badgeFile.isEmpty()) {
            validateBadgeImageFile(badgeFile);

            String originalFileName = badgeFile.getOriginalFilename();

            String saveFileName = RandomStringUtils.random(8, 33, 125, true, true);

            String ext = "";
            int pos = originalFileName.lastIndexOf(".");
            if (pos > -1) {
                ext = originalFileName.substring(pos);
            }

            saveFileName = saveFileName + ext;

            Path dirPath = Paths.get(
                    jesicaProperties.getBaseImgPath().getPath(),
                    jesicaProperties.getBadgePath().getPath()
            );

            File dir = dirPath.toFile();

            if (!dir.exists()) {
                dir.mkdirs();
            }

            Path savePath = dirPath.resolve(saveFileName);

            try {
                badgeFile.transferTo(savePath.toFile());
            } catch (IOException e) {
                throw new RuntimeException("뱃지 이미지 저장 중 오류가 발생했습니다.", e);
            }

            /*
             * DB에는 실제 파일 경로만 저장
             * 예: /image/badge/xxxx.png 말고
             * 기존 fileLoad API에서 읽을 수 있는 상대 경로 형태로 맞춰야 함
             */
            String badgeFilePath = Paths.get(
                    jesicaProperties.getBadgePath().getPath(),
                    saveFileName
            ).toString();

            badgeFilePath = badgeFilePath.replace("\\", "/");

            badgeInfo.setOriginalFileName(originalFileName);
            badgeInfo.setStoredFileName(saveFileName);
            badgeInfo.setFileUrl(badgeFilePath);
            badgeInfo.setFileSize(badgeFile.getSize());
        }

        tbMannaBadgeFileRepository.save(badgeInfo);
    }

    @Transactional
    public void deleteBadgeFile(Long badgeFileNo) {

        int updateCount = tbMannaBadgeFileRepository.deleteBadgeFile(badgeFileNo);

        if (updateCount < 1) {
            throw new RuntimeException("삭제할 뱃지 정보를 찾을 수 없습니다.");
        } else {
            tbMannaBadgeStRepository.deleteByBadgeFileNo(badgeFileNo);
        }
    }
    private void validateBadgeImageFile(MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return;
        }

        String originalFileName = file.getOriginalFilename();

        if (originalFileName == null || originalFileName.trim().isEmpty()) {
            throw new IllegalArgumentException("파일명이 없습니다.");
        }

        if (originalFileName.length() > 100) {
            throw new IllegalArgumentException("파일명은 최대 100자까지 등록 가능합니다.");
        }

        if (file.getSize() > 10 * 1024 * 1024) {
            throw new IllegalArgumentException("뱃지 이미지는 최대 10MB까지 등록 가능합니다.");
        }

        String contentType = file.getContentType();

        if (contentType == null || !contentType.startsWith("image/")) {
            throw new IllegalArgumentException("이미지 파일만 등록할 수 있습니다.");
        }

        String lowerFileName = originalFileName.toLowerCase();

        if (
                !lowerFileName.endsWith(".jpg")
                        && !lowerFileName.endsWith(".jpeg")
                        && !lowerFileName.endsWith(".png")
                        && !lowerFileName.endsWith(".gif")
                        && !lowerFileName.endsWith(".webp")
        ) {
            throw new IllegalArgumentException("JPG, PNG, GIF, WEBP 파일만 등록할 수 있습니다.");
        }
    }
    public Map<String, Object> getBadgeFilePageList(Object badgeType,
                                                    Object usingYn,
                                                    Object dataStatus,
                                                    Object stCode,
                                                    Object originalFileName,
                                                    LocalDateTime startDate,
                                                    LocalDateTime endDate,
                                                    Pageable pageable) {

        Map<String, Object> resultMap = new HashMap<>();

        Integer badgeTypeValue = parseIntegerOrNull(badgeType);
        Integer dataStatusValue = parseIntegerOrNull(dataStatus);

        String usingYnValue = parseStringOrNull(usingYn);
        String stCodeValue = parseStringOrNull(stCode);
        String originalFileNameValue = parseStringOrNull(originalFileName);

        Page<TbMannaBadgeFile> pageList =
                tbMannaBadgeFileRepository.getBadgeFilePageList(
                        badgeTypeValue,
                        usingYnValue,
                        dataStatusValue,
                        stCodeValue,
                        originalFileNameValue,
                        startDate,
                        endDate,
                        pageable
                );

        resultMap.put("badgeFileList", pageList.getContent());
        resultMap.put("totalElement", pageList.getTotalElements());

        return resultMap;
    }


    public List<TbMannaBadgeSt> getBadgeStList(Long badgeFileNo) {
        if (badgeFileNo == null) {
            throw new IllegalArgumentException("뱃지 파일 번호가 없습니다.");
        }

        return tbMannaBadgeStRepository
                .findByBadgeFileNoOrderByInsertDateDesc(badgeFileNo);
    }

    private Integer parseIntegerOrNull(Object value) {
        if (value == null) {
            return null;
        }

        String str = String.valueOf(value).trim();

        if (str.isEmpty()) {
            return null;
        }

        return Integer.valueOf(str);
    }

    private String parseStringOrNull(Object value) {
        if (value == null) {
            return null;
        }

        String str = String.valueOf(value).trim();

        if (str.isEmpty()) {
            return null;
        }

        return str;
    }

        /**
         * 뱃지 이미지 등록
         */
        @Transactional
        public void insertBadgeFile(MultipartFile badgeFile,
                                    Integer badgeType,
                                    String stCode,
                                    String usingYn,
                                    Integer dataStatus,
                                    String insertUserId) throws Exception {

            validateBadgeFile(badgeFile, badgeType, stCode, usingYn, dataStatus);

            OutputStream os = null;

            try {
                if (badgeFile != null && !badgeFile.isEmpty()) {

                    String originalFileName = badgeFile.getOriginalFilename();

                    String fileName = RandomStringUtils.random(8, 33, 125, true, true);

                    int pos = originalFileName != null ? originalFileName.lastIndexOf(".") : -1;
                    String ext = (pos > -1) ? originalFileName.substring(pos + 1) : "png";
                    ext = ext.toLowerCase();

                    String storedFileName = fileName + "." + ext;


                    String badgePath = jesicaProperties.getBadgePath().getPath();

                    // 실제 서버 폴더용 경로는 앞 "/" 제거
                    String saveBadgePath = badgePath;
                    if (saveBadgePath.startsWith("/")) {
                        saveBadgePath = saveBadgePath.substring(1);
                    }

                    // DB / 화면 접근용 URL은 "/" 시작 보장
                    String urlPrefix = badgePath;
                    if (!urlPrefix.startsWith("/")) {
                        urlPrefix = "/" + urlPrefix;
                    }
                    if (!urlPrefix.endsWith("/")) {
                        urlPrefix = urlPrefix + "/";
                    }

                    // 실제 저장 폴더
                    Path dirPath = Paths.get(
                            jesicaProperties.getBaseImgPath().getPath(),
                            saveBadgePath
                    );

                    File dir = dirPath.toFile();

                    if (!dir.exists()) {
                        dir.mkdirs();
                    }

                    // 실제 저장 경로
                    Path uploadFullPath = dirPath.resolve(storedFileName);

                    // DB에 넣을 상대 URL
                    String fileUrl = urlPrefix + storedFileName;

                    byte[] bytes = badgeFile.getBytes();

                    os = new FileOutputStream(uploadFullPath.toFile());
                    os.write(bytes);
                    os.close();
                    os = null;

                    TbMannaBadgeFile badge = new TbMannaBadgeFile();

                    badge.setBadgeType(badgeType);
                    badge.setStCode(badgeType == 1 ? null : stCode);

                    badge.setOriginalFileName(originalFileName);
                    badge.setStoredFileName(storedFileName);

                    // 실제 물리 경로
                    badge.setFilePath(uploadFullPath.toFile().getPath());

                    // 화면에서 접근할 상대 경로
                    badge.setFileUrl(fileUrl);

                    badge.setFileSize(badgeFile.getSize());
                    badge.setFileExt(ext);
                    badge.setUsingYn(usingYn);
                    badge.setDataStatus(dataStatus);
                    badge.setInsertUserId(insertUserId);

                    tbMannaBadgeFileRepository.save(badge);

                    log.debug("badge uploadFullPath={}", uploadFullPath);
                    log.debug("badge fileUrl={}", fileUrl);
                }

            } catch (IOException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    if (os != null) {
                        os.close();
                    }
                } catch (Exception ignore) {
                }
            }
        }

        private void validateBadgeFile(MultipartFile badgeFile,
                                       Integer badgeType,
                                       String stCode,
                                       String usingYn,
                                       Integer dataStatus) {

            if (badgeFile == null || badgeFile.isEmpty()) {
                throw new IllegalArgumentException("뱃지 이미지를 선택해주세요.");
            }

            if (badgeType == null) {
                throw new IllegalArgumentException("뱃지 타입을 선택해주세요.");
            }

            if (badgeType != 1 && badgeType != 2) {
                throw new IllegalArgumentException("올바르지 않은 뱃지 타입입니다.");
            }

            if (usingYn == null || usingYn.trim().isEmpty()) {
                throw new IllegalArgumentException("사용 여부를 선택해주세요.");
            }

            if (!"Y".equals(usingYn) && !"N".equals(usingYn)) {
                throw new IllegalArgumentException("올바르지 않은 사용 여부입니다.");
            }

            if (dataStatus == null) {
                throw new IllegalArgumentException("데이터 상태를 선택해주세요.");
            }

            if (dataStatus != 0 && dataStatus != 1 && dataStatus != 2) {
                throw new IllegalArgumentException("올바르지 않은 데이터 상태입니다.");
            }

            if (badgeType == 1) {
                stCode = null;
            }

            if (badgeType == 2 && "Y".equals(usingYn)) {
                if (stCode == null || stCode.trim().isEmpty()) {
                    throw new IllegalArgumentException("개별 뱃지를 사용중으로 등록하려면 가맹점 코드를 입력해주세요.");
                }
            }

            String contentType = badgeFile.getContentType();

            if (contentType == null || !contentType.startsWith("image/")) {
                throw new IllegalArgumentException("이미지 파일만 등록할 수 있습니다.");
            }

            String originalFileName = badgeFile.getOriginalFilename();
            String fileExt = getFileExt(originalFileName);

            if (fileExt == null || fileExt.trim().isEmpty()) {
                throw new IllegalArgumentException("파일 확장자를 확인할 수 없습니다.");
            }

            fileExt = fileExt.toLowerCase();

            if (!"jpg".equals(fileExt)
                    && !"jpeg".equals(fileExt)
                    && !"png".equals(fileExt)
                    && !"gif".equals(fileExt)
                    && !"webp".equals(fileExt)) {
                throw new IllegalArgumentException("jpg, jpeg, png, gif, webp 파일만 등록할 수 있습니다.");
            }

            long maxSize = 5 * 1024 * 1024;

            if (badgeFile.getSize() > maxSize) {
                throw new IllegalArgumentException("파일은 최대 5MB까지 등록할 수 있습니다.");
            }
        }

        private static String getFileExt(String fileName) {
            if (fileName == null || fileName.trim().isEmpty()) {
                return "";
            }

            int dotIndex = fileName.lastIndexOf(".");

            if (dotIndex < 0 || dotIndex == fileName.length() - 1) {
                return "";
            }

            return fileName.substring(dotIndex + 1);
        }
}
