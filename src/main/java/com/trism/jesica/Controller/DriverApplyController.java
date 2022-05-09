package com.trism.jesica.Controller;

import com.trism.jesica.Service.ApiService;
import com.trism.jesica.Service.DriverApplyService;
import com.trism.jesica.Service.WorkGroupService;
import com.trism.jesica.Service.WorkerApplyService;
import com.trism.jesica.Util.PoiUtil;
import com.trism.jesica.Util.Secure.CipherAESUtils;
import com.trism.jesica.config.KeyGeneratorConfig;
import com.trism.jesica.dto.TbStoreRentalCarDTO;
import com.trism.jesica.dto.TbStoreRentalCarData;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.Entitiy.business.TbStore;
import com.trism.jesica.persistence.Entitiy.business.TbUserWorker;
import com.trism.jesica.persistence.Entitiy.call.TbCallAll;
import com.trism.jesica.persistence.Entitiy.car.TbRentalInfo;
import com.trism.jesica.persistence.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.Entitiy.safe.TbSafenMapping;
import com.trism.jesica.persistence.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.Entitiy.worker.TbWorkerApply;
import com.trism.jesica.persistence.Entitiy.worker.TbWorkerCharge;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.util.*;

/*import com.trism.manna.dto.TbHeadDTO;*/

@RequestMapping("/driver")
@RestController
@RequiredArgsConstructor
@Slf4j
public class DriverApplyController {

    private final LocaleResolver localeResolver;

    private final MessageSource messageSource;

    private final WorkerApplyService workerApplyService;

    private final WorkGroupService workGroupService;

    private final ApiService apiService;

    private final DriverApplyService driverApplyService;


    //사전등록 엑세파일 헤더 이름
    private final String[] uploadExcelHeaderList = {
            "차량번호", "모델명", "안심번호"
    };

    //필수 입력 항목 index
    private final int[] mandatoryIndex = {
            0, 1, 2,  	//차량번호, 모델명, 안심번호
    };


    @Autowired
    private final KeyGeneratorConfig keyGeneratorConfig;

    /**
     * 기사가입신청내역 리스트
     */
    @GetMapping("/apply/list")
    public ModelAndView listAffiliated(Locale locale, HttpServletRequest request,HttpSession session,
                                       @RequestParam Map<String,Object> searchValue,
                                       Model model) {
        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {

                    putSearchOption(session, searchValue);

                List<TbWorkerApply> tbWorkerApplyList =  workerApplyService.getWorkList(searchValue);
                List<TbWorkerApply> tbWorkerApplyListNew = new ArrayList<TbWorkerApply>();
                for (TbWorkerApply tbWorkerApply : tbWorkerApplyList) {
                    String url = "";
                    String url2 = "";
                    String url3 = "";
                    if (tbWorkerApply.getProfileFileSmall() != null) {
                        url = URLEncoder.encode(tbWorkerApply.getProfileFileSmall(), "UTF-8");
                    }
                    if (tbWorkerApply.getProfileFile() != null) {
                        url2 = URLEncoder.encode(tbWorkerApply.getProfileFile(), "UTF-8");
                    }
                    if (tbWorkerApply.getCareerFile() != null) {
                        url3 = URLEncoder.encode(tbWorkerApply.getCareerFile(), "UTF-8");
                    }
                    tbWorkerApply.setProfileFileSmall(url);
                    tbWorkerApply.setProfileFile(url2);
                    tbWorkerApply.setCareerFile(url3);
                    tbWorkerApplyListNew.add(tbWorkerApply);
                }
                model.addAttribute("workList", tbWorkerApplyListNew);
            } else {
                searchValue = getSearchOption(session);
                model.addAttribute("workList", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue",searchValue);


        return new ModelAndView("jesica/driver/apply/list");
    }

    /**
     * 기사가입신청내역 추가
     */
    @GetMapping("/apply/insert")
    public ModelAndView insertAffiliated(Model model) {
        try {

            //브랜드 리스트 조회

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/driver/apply/insert");
    }


    /**
     * 기사가입신청내역 상세
     */
    @GetMapping("/apply/detail")
    public ModelAndView detailAffiliated(@RequestParam Long headNo, Model model) {
        log.info("@@headNo {}",headNo);

        try {
            //본사 정보상세

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("MethodArgumentTypeMismatchException");
        }

        return new ModelAndView("jesica/driver/apply/detail");
    }


    /**
     * 배송원목록
     */
    @GetMapping("/deliveryman/list")
    public ModelAndView listDeliveryMan(@RequestParam Map<String,Object> searchValue,
                                        HttpSession session, Model model) {

        try {
            if (!searchValue.isEmpty()) {

                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            if (!searchValue.isEmpty()){
                model.addAttribute("tbUserWork", workGroupService.tbUserWorkSerch(searchValue));
            } else {
                model.addAttribute("tbUserWork", null);
            }

      /*      List<TbDelivery> resultList = null;
            model.addAttribute("tbUserWork", workGroupService.tbUserWorkSerch(searchValue));*/
        /*    resultList =  workGroupService.getTbDeliveryList(searchValue);
            model.addAttribute("tbDelivery", resultList);
*/
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("searchValue",searchValue);

        return new ModelAndView("/jesica/driver/deliveryman/list");
    }

    /**
     * 배송원등록
     */
    @GetMapping("/deliveryman/insert")
    public ModelAndView insertDeliveryMan(Model model){

        return new ModelAndView("/jesica/driver/deliveryman/insert");
    }

    /**
     * 배송원상세
     */
    @GetMapping("/deliveryman/detail")
    public ModelAndView detailDeliveryMan(@RequestParam("userNo") Long userNo , Model model) {

        List<TbSystemCode> systemCodeList = apiService.systemCodeList("BL");
        model.addAttribute("systemCodeList",systemCodeList);

        try {
            TbUserWorker tbUserWorker = workGroupService.getTbUserWorker(userNo);
            TbWorkerCharge tbWorkerCharge = workGroupService.getTbWorkerCharge(userNo);


            //은행명 조회
            if(workGroupService.getSystemCode("BT",tbUserWorker.getBankTypeCode()) != null){
                model.addAttribute("bankName",workGroupService.getSystemCode("BT",tbUserWorker.getBankTypeCode()).getCodeName());
            } else {
                model.addAttribute("bankName",null);
            }
            //가상계좌 은행명 조회
            if(workGroupService.getSystemCode("CBT",tbUserWorker.getCybankTypeCode()) != null){
                model.addAttribute("cBankName",workGroupService.getSystemCode("CBT",tbUserWorker.getCybankTypeCode()).getCodeName());
            } else {
                model.addAttribute("cBankName",null);
            }

            String url = "";
            if (tbUserWorker.getProfileFile() != null) {
                url = URLEncoder.encode(tbUserWorker.getProfileFile(), "UTF-8");
            }
            String url2 = "";
            if (tbUserWorker.getProfileFile() != null) {
                url2 = URLEncoder.encode(tbUserWorker.getLicenseFile(), "UTF-8");
            }

            CipherAESUtils cipherAESUtils = new CipherAESUtils(keyGeneratorConfig.generateSecretKeySpec(),keyGeneratorConfig.generateIvParameterSpec());

            model.addAttribute("bankAccount", cipherAESUtils.decryptAES(tbUserWorker.getBankAccount()));
            model.addAttribute("bankOwner", cipherAESUtils.decryptAES(tbUserWorker.getBankOwner()));
            model.addAttribute("tbUserWorker", tbUserWorker);
            model.addAttribute("tbWorkerCharge", tbWorkerCharge);
            model.addAttribute("registrationNum", cipherAESUtils.decryptAES(tbUserWorker.getRegistrationNum()));
            model.addAttribute("imgFile", url);
            model.addAttribute("imgFile2", url2);
        } catch (Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("/jesica/driver/deliveryman/detail");
    }


    /**
     * 과거 주문내역(탁송)
     */
    @GetMapping("/consignment/list")
    public ModelAndView consignmentList(@RequestParam Map<String,Object> searchValue,
                                        Model model, HttpSession session) {

        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            if(searchValue.get("storeNo") == null) {
                searchValue.put("storeNo","0");
            }
            List<TbCallAll> resultList =  driverApplyService.tbCallAllList(searchValue);
            List<TbSystemCode> tbSystemCode = driverApplyService.searchTbSystemCode("OP");
            model.addAttribute("tbSystemCode", tbSystemCode);
            model.addAttribute("consignmentList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("/jesica/driver/consignment/list");
    }

    /**
     * 과거 주문내역 상세(탁송)
     */
    @GetMapping("/consignment/detail")
    public ModelAndView consignmentDetail(@RequestParam Long orderNo,Model model) {
        log.info("@@orderNo {}",orderNo);

        try {
            //;
            TbCallAll tbCallAll = driverApplyService.getCallAllDetail(orderNo);
            List<TbSystemCode> tbSystemCodeAll = driverApplyService.searchTbSystemCodeAll();
            model.addAttribute("callDetail",tbCallAll);
            model.addAttribute("tbSystemCodeAll",tbSystemCodeAll);
            model.addAttribute("callCharge",driverApplyService.getCallCharge(orderNo));
            model.addAttribute("callHistory",driverApplyService.getOrderHistory(orderNo));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/driver/consignment/detail");
    }



    //차량관리
    @GetMapping("/car/list")
    public ModelAndView listCar(@RequestParam Map<String,Object> searchValue,
                                Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {

                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            List<TbStoreRentalCar> resultList = null;
            List<TbStore> tbStoreLIst = apiService.getStoreList();

            if (searchValue.containsKey("storeNo")) {
                resultList = driverApplyService.tbStoreRentalCar(searchValue);
            }
            model.addAttribute("tbStoreRentalCar", resultList);
            model.addAttribute("tbStoreLIst", tbStoreLIst);

        } catch (Exception e) {
            e.printStackTrace();
        }
        /*model.addAttribute("tbStoreGoods", merchandiseService.tbStoreGoodsSearch(searchValue));*/
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("jesica/driver/car/list");
    }

    @GetMapping("/car/insert")
    public ModelAndView insertCar(HttpSession session, Model model) {
        model.addAttribute("searchValue",getSearchOption(session));

        //렌트카 가맹점리스트
        List<TbStoreRentalCar> resultList = null;
        List<TbStore> tbStoreList = apiService.getStoreList();

        //안심번호 리스트(매칭안된것들)
        List<TbSafenMapping> tbSafenMapping = driverApplyService.getTbSafenMappingList();
        model.addAttribute("tbSafenMapping",tbSafenMapping);
        model.addAttribute("tbStoreList",tbStoreList);

        return new ModelAndView("jesica/driver/car/insert");
    }

    @GetMapping("/car/detail")
    public ModelAndView rentailCar(@RequestParam Integer rentalCarNo,Model model) {
        log.info("@@rentalCarNo {}",rentalCarNo);

        try {
            TbStoreRentalCar tbStoreRentalCar = driverApplyService.getTbStoreRentalCarDetail(rentalCarNo);

            model.addAttribute("tbStoreRentalCar",tbStoreRentalCar);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/driver/car/detail");
    }


    @GetMapping("/car/insertExcel")
    public ModelAndView insertExcel( Model model) {
        List<TbStore> tbStoreLIst = apiService.getStoreList();
        model.addAttribute("tbStoreLIst", tbStoreLIst);

        return new ModelAndView("jesica/driver/car/insertExcel");
    }


    /**
     * 렌터카 엑셀파일 입력
     * @param session
     * @param model
     * @param excelFile
     */
    @RequestMapping(value = "/car/Excelupload")
    public ModelAndView uploadExcel(Model model,@RequestParam("storeNo") String storeNo, @RequestParam("excelFile") MultipartFile excelFile) {
//        Map<String, Integer> departMap = departmentService.getDepartments().stream()
//                .collect(Collectors.toMap(Department::getName, Department::getId));
        List<TbStoreRentalCarData> userList = new ArrayList<>();
        Workbook workbook = null;
        try {
            workbook = WorkbookFactory.create(excelFile.getInputStream());
            Sheet sheet = workbook.getSheetAt(0); // 시트 가져오기

            //헤더 Row를 검색하고 컬럼 순서를 정한다
            boolean headerFound = false;
            Map<String, Integer> headerIndex = new HashMap<>();
            Iterator<Row> rows = sheet.rowIterator();
            while (rows.hasNext()) {
                Row row = rows.next();

                short minColIdx = row.getFirstCellNum();
                short maxColIdx = row.getLastCellNum();
                for(short colIdx = minColIdx; colIdx < maxColIdx; colIdx++) {
                    Cell cell = row.getCell(colIdx);
                    if(cell != null) {
                        String colName = cell.getStringCellValue();
                        for (String headerStr : uploadExcelHeaderList) {
                            if (headerStr.equals(colName)) {
                                //헤더 이름으로 Index 저장
                                headerIndex.put(headerStr, new Integer(colIdx));
                                headerFound = true;
                            }
                        }
                    }
                }
                if (headerFound) break;

            }

            //check required header column is absent
            for (int idx : mandatoryIndex) {
                if (headerIndex.containsKey(uploadExcelHeaderList[idx]) == false) {
                    throw new ServiceException(ErrorCode.BAD_REQUEST);
                }
            }

            //헤더 Row 다음부터 이어서 데이터 Row 처리
            while (rows.hasNext()) {
                Row row = rows.next();

                TbStoreRentalCarData tbStoreRentalCar = new TbStoreRentalCarData();
                //tbStoreRentalCar.setRentalCarNo();
                if (headerIndex.containsKey(uploadExcelHeaderList[0])) {	//차량번호
                    Integer cellIdx = headerIndex.get(uploadExcelHeaderList[0]);
                    String value = PoiUtil.getStringCellValue(row.getCell(cellIdx));
                    if (StringUtils.isEmpty(value)) continue;
                    tbStoreRentalCar.setCarNum(value);
                }
                if (headerIndex.containsKey(uploadExcelHeaderList[1])) {	//모델명
                    Integer cellIdx = headerIndex.get(uploadExcelHeaderList[1]);
                    String value = PoiUtil.getStringCellValue(row.getCell(cellIdx));
                    if (StringUtils.isEmpty(value)) continue;
                    tbStoreRentalCar.setCarModel(value);
                }
                if (headerIndex.containsKey(uploadExcelHeaderList[2])) {	//안심번호
                    Integer cellIdx = headerIndex.get(uploadExcelHeaderList[2]);
                    String value = PoiUtil.getStringCellValue(row.getCell(cellIdx));
                    if (StringUtils.isEmpty(value)) continue;
                    tbStoreRentalCar.setSafenNum(value);
                }

                //가맹점번호
                tbStoreRentalCar.setStoreNo(Long.parseLong(storeNo));
                //데이터상태
                tbStoreRentalCar.setDataStatus(DataStatus.OK);
                //입력일시
                tbStoreRentalCar.setInsertDate(LocalDateTime.now());

                userList.add(tbStoreRentalCar);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        } finally {
            if (workbook != null) {
                try { workbook.close(); } catch (Exception e) {}
            }
        }

        log.debug("updating user: {}", userList);

        List<TbStoreRentalCarData> successList = new ArrayList<>();
        List<TbStoreRentalCarData> failList = new ArrayList<>();
        for (TbStoreRentalCarData tbStoreRentalCarData : userList) {
            if (tbStoreRentalCarData.getCarNum() == null) {
                tbStoreRentalCarData.setError("차량번호없음");
                failList.add(tbStoreRentalCarData);
                continue;
            } else if (tbStoreRentalCarData.getCarModel() == null) {
                tbStoreRentalCarData.setError("모델명없음");
                failList.add(tbStoreRentalCarData);
                continue;
            } else if (tbStoreRentalCarData.getSafenNum() == null) {
                tbStoreRentalCarData.setError("안심번호없음");
                failList.add(tbStoreRentalCarData);
                continue;
            } else if (tbStoreRentalCarData.getStoreNo() == null) {
                tbStoreRentalCarData.setError("가맹점 번호없음");
                failList.add(tbStoreRentalCarData);
                continue;
            }

            try {
                int result = driverApplyService.tbStoreRentCarExcelUpdate(tbStoreRentalCarData);
                if (result == 0) {
                    tbStoreRentalCarData.setError("등록 실패");
                    failList.add(tbStoreRentalCarData);
                } else {
                    successList.add(tbStoreRentalCarData);
                }
            } catch (Exception e) {
                if (e.getMessage().contains("constraint")) {
                    tbStoreRentalCarData.setError("중복된 차량번호 / 안심번호입니다.");
                } else {
                    tbStoreRentalCarData.setError(e.getMessage());
                }
                failList.add(tbStoreRentalCarData);
            }
        }

        model.addAttribute("successList", successList);
        model.addAttribute("failList", failList);
        return new ModelAndView("jesica/driver/car/resultExcel");
        //return "redirect:jesica/merchant/car/resultExcel";
    }


    /**
            * 렌터카 API리스트
     */
    @GetMapping("/rentcar/list")
    public ModelAndView getRentalInfo(@RequestParam Map<String,Object> searchValue,
                                      Model model ) {

        log.info("@@searchValue {}",searchValue);
        try {
            List<TbRentalInfo> resultList =  driverApplyService.getRentalInfo(searchValue);
            model.addAttribute("tbRentalInfo", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("jesica/driver/rentcar/list");
    }

    @GetMapping("/rentcar/insert")
    public ModelAndView insertformPlatformNotice( Model model) {
        try {

            List<TbStore> tbStoreList = apiService.getStoreList();
            List<TbStoreRentalCarDTO> resultList = null;
            if(!tbStoreList.isEmpty()){
                resultList =  driverApplyService.getCarList(tbStoreList.get(0).getStoreNo());
            } else {
                resultList = null;
            }

            model.addAttribute("tbStoreList", tbStoreList);
            model.addAttribute("carList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/driver/rentcar/insert");
    }

    private void putSearchOption(HttpSession session, Map<String,Object> searchValue) {
        session.setAttribute("headNo", searchValue.get("headNo"));
        session.setAttribute("headNoText", searchValue.get("headNoText"));
        session.setAttribute("branchNo", searchValue.get("branchNo"));
        session.setAttribute("branchNoText", searchValue.get("branchNoText"));
        session.setAttribute("storeNo", searchValue.get("storeNo"));
        session.setAttribute("storeNoText", searchValue.get("storeNoText"));
    }

    private Map<String,Object> getSearchOption(HttpSession session) {
        Map<String,Object> searchValue = new HashMap<>();
        if (session == null) return searchValue;

        String headNo = (String) session.getAttribute("headNo");
        if (headNo != null) {
            String headNoText = (String) session.getAttribute("headNoText");
            String branchNo = (String) session.getAttribute("branchNo");
            String branchNoText = (String) session.getAttribute("branchNoText");
            String storeNo = (String) session.getAttribute("storeNo");
            String storeNoText = (String) session.getAttribute("storeNoText");

            searchValue.put("headNo", headNo);
            searchValue.put("headNoText", headNoText);
            searchValue.put("branchNo", branchNo);
            searchValue.put("branchNoText", branchNoText);
            searchValue.put("storeNo", storeNo);
            searchValue.put("storeNoText", storeNoText);
            searchValue.put("dataStatus", null);
        }

        return searchValue;
    }

}
