package com.trism.jesica.Controller;

import com.trism.jesica.Service.*;
import com.trism.jesica.dto.TbStoreCategoryDTO;
import com.trism.jesica.dto.TbStoreGoodsItemDTO;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbStore;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreCategory;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreGoods;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreOption;
import com.trism.jesica.persistence.mysql.Entitiy.service.TbServiceChargeGroup;
import com.trism.jesica.persistence.mysql.Entitiy.service.TbStoreServiceCharge;
import com.trism.jesica.persistence.mysql.Entitiy.storedlvy.TbStoreDlvyCharge;
import com.trism.jesica.persistence.mysql.Entitiy.storedlvy.TbStoreMngCharge;
import com.trism.jesica.persistence.mysql.Entitiy.street.TbDlvyPriceCharge;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/merchant")
@RestController
@RequiredArgsConstructor
@Slf4j
public class MerchantController {

    private final MerchandiseService merchandiseService;

    private final MerchanGroupService merchanGroupService;

    private final MerchanExtraService merchanExtraService;

    private final WorkGroupService workGroupService;

    private final ApiService apiService;


    //사전등록 엑세파일 헤더 이름
    private final String[] uploadExcelHeaderList = {
            "차량번호", "모델명", "안심번호"
    };

    //필수 입력 항목 index
    private final int[] mandatoryIndex = {
            0, 1, 2,  	//차량번호, 모델명, 안심번호
    };



    //상품
    @GetMapping("/merchandise/list")
    public ModelAndView listMerchandise(@RequestParam Map<String,Object> searchValue,
                                        Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {

              /*  List<TbStoreGoods> tbStoreGoodsSearch = merchandiseService.tbStoreGoodsSearch(searchValue);
                List<TbStoreGoodsData> tbStoreGoodsDataList = null;

                String url = "";
                String url2 = "";
                for (TbStoreGoods tbStoreGoodsSearchData : tbStoreGoodsSearch) {
                    TbStoreGoodsData tbStoreGoodsData = new TbStoreGoodsData();
                    if (tbStoreGoodsSearchData.getImgFile1() != null) {
                        url = URLEncoder.encode(tbStoreGoodsData.getImgFile1(), "UTF-8");
                    }
                    if (tbStoreGoodsSearchData.getImgFileSmall() != null) {
                        url2 = URLEncoder.encode(tbStoreGoodsData.getImgFileSmall(), "UTF-8");
                    }
                    tbStoreGoodsData.setImgFile1(url);
                    tbStoreGoodsData.setImgFileSmall(url2);
                    tbStoreGoodsDataList.add(tbStoreGoodsData);
                }
*/
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            List<TbStoreGoods> resultList = null;
            if (searchValue.containsKey("storeNo")) {
                resultList = merchandiseService.tbStoreGoodsSearch(searchValue);
            }
            model.addAttribute("tbStoreGoods", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        /*model.addAttribute("tbStoreGoods", merchandiseService.tbStoreGoodsSearch(searchValue));*/
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("jesica/merchant/merchandise/list");
    }

    @GetMapping("/merchandise/insert")
    public ModelAndView insertMerchandise(HttpSession session, Model model) {
        model.addAttribute("searchValue",getSearchOption(session));
        return new ModelAndView("jesica/merchant/merchandise/insert");
    }

    @GetMapping("/merchandise/detail")
    public ModelAndView detailMerchandise(@RequestParam Long storeGoodsNo,Model model) {
        log.info("@@storeGoodsNo {}",storeGoodsNo);

        try {
            TbStoreGoods tbStoreGoods = merchandiseService.getTbStoreGoodsDetail(storeGoodsNo);

            List<TbStoreCategoryDTO> tbStoreCategoryList = merchandiseService.getTbStoreCategoryList(tbStoreGoods.getStoreNo(),Integer.parseInt(storeGoodsNo.toString()));
            List<TbStoreGoodsItemDTO> tbStoreGoodsItemList = merchandiseService.getTbStoreGoodsItemList(storeGoodsNo);
            int maxNo = merchandiseService.getTbStoreGoodsItemMaxNo(storeGoodsNo);

            model.addAttribute("tbStoreGoodsDetail",tbStoreGoods);
            model.addAttribute("tbStoreGoodsItemList",tbStoreGoodsItemList);
            model.addAttribute("tbStoreCategoryList",tbStoreCategoryList);
            model.addAttribute("maxNo",maxNo);
            if(tbStoreGoods.getImgFile1() != null){
                model.addAttribute("imgFile1", URLEncoder.encode(tbStoreGoods.getImgFile1(),"UTF-8"));
            } else {
                model.addAttribute("imgFile1", null);
            }

            if(tbStoreGoods.getImgFile2() != null){
                model.addAttribute("imgFile2", URLEncoder.encode(tbStoreGoods.getImgFile2(),"UTF-8"));
            } else {
                model.addAttribute("imgFile2", null);
            }

            if(tbStoreGoods.getImgFile3() != null){
                model.addAttribute("imgFile3", URLEncoder.encode(tbStoreGoods.getImgFile3(),"UTF-8"));
            } else {
                model.addAttribute("imgFile3", null);
            }

            if(tbStoreGoods.getImgFileSmall() != null){
                model.addAttribute("imgFileSmall", URLEncoder.encode(tbStoreGoods.getImgFileSmall(),"UTF-8"));
            } else {
                model.addAttribute("imgFileSmall", null);
            }
          /*  model.addAttribute("imgFile1", URLEncoder.encode(tbStoreGoods.getImgFile1(),"UTF-8"));
            model.addAttribute("imgFile2", URLEncoder.encode(tbStoreGoods.getImgFile2(),"UTF-8"));
            model.addAttribute("imgFile3", URLEncoder.encode(tbStoreGoods.getImgFile3(),"UTF-8"));
            model.addAttribute("imgFileSmall", URLEncoder.encode(tbStoreGoods.getImgFileSmall(),"UTF-8"));*/
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/merchant/merchandise/detail");
    }

    @GetMapping("/merchanext/list")
    public ModelAndView listMerchanExtra(@RequestParam Map<String,Object> searchValue,
                                       Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        if (!searchValue.isEmpty()){
            putSearchOption(session, searchValue);
        } else {
            searchValue = getSearchOption(session);
        }

        List<TbStoreOption> resultList = null;
        if (searchValue.containsKey("storeNo")) {
            resultList = merchanExtraService.tbStoreOptionSearch(searchValue);
        }
        model.addAttribute("tbStoreOption", resultList);
        model.addAttribute("searchValue",searchValue);
        return new ModelAndView("jesica/merchant/merchandiseextra/list");
    }

    @GetMapping("/merchanext/detail")
    public ModelAndView listMerchanExtraDetail(Long storeOptNo, Model model) {
        log.info("@@@@ storeOptNo {}", storeOptNo);
        try {
            TbStoreOption tbStoreOption = merchanExtraService.tbStoreOptionSearchDetail(storeOptNo);
            int maxNo = merchanExtraService.getTbStoreOptionItemMaxNo(storeOptNo);
            Integer storeNo =  tbStoreOption.getStoreNo();
            TbStore tbStore = workGroupService.getTbStoreDetail(Long.parseLong(Integer.toString(storeNo)));
            model.addAttribute("tbStoreOptionDetail",tbStoreOption);
            model.addAttribute("tbStore",tbStore);
            model.addAttribute("maxNo",maxNo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/merchant/merchandiseextra/detail");
    }

    @GetMapping("/merchanext/insert")
    public ModelAndView listMerchanExtraInsert(HttpSession session, Model model) {
        model.addAttribute("searchValue",getSearchOption(session));
        return new ModelAndView("jesica/merchant/merchandiseextra/insert");
    }

    @GetMapping("/merchangroup/list")
    public ModelAndView listMerchanGroup(@RequestParam Map<String,Object> searchValue,
                                         Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        if (!searchValue.isEmpty()){
            putSearchOption(session, searchValue);
        } else {
            searchValue = getSearchOption(session);
        }

        List<TbStoreCategory> resultList = null;
        if (searchValue.containsKey("storeNo")) {
            resultList = merchanGroupService.tbStoreCategotySearch(searchValue);
        }
        model.addAttribute("tbStoreCategory", resultList);
        model.addAttribute("searchValue",searchValue);
        return new ModelAndView("jesica/merchant/merchandisegroup/list");
    }

    @GetMapping("/storemngcharge/list")
    public ModelAndView listStoreMngCharge(@RequestParam Map<String,Object> searchValue,
                                           Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        if (!searchValue.isEmpty()){
            putSearchOption(session, searchValue);
        } else {
            searchValue = getSearchOption(session);
        }

        List<TbStoreMngCharge> resultList = null;
        if (searchValue.containsKey("storeNo")) {
            resultList = merchanGroupService.tbStoreMngChargeSearch(searchValue);
        }
        model.addAttribute("tbStoreMngCharge", resultList);
        model.addAttribute("searchValue",searchValue);
        return new ModelAndView("jesica/merchant/storemngcharge/list");
    }

    @GetMapping("/storemngcharge/insert")
    public ModelAndView storemngchargeInsert(HttpSession session, Model model) {
        model.addAttribute("searchValue",getSearchOption(session));
        return new ModelAndView("jesica/merchant/storemngcharge/insert");
    }

    @GetMapping("/storemngcharge/detail")
    public ModelAndView storemngchargeDetail(Long storeNo, Model model) {
        log.info("@@@@ storeNo {}", storeNo);
        try {
            TbStore tbStore = workGroupService.getTbStoreDetail(storeNo);
            /*List<TbDlvyAreaCharge> tbDlvyAreaChargeList = workGroupService.getTbDlvyAreaChargeListAll()*/;
            TbStoreMngCharge tbStoreMngCharge = workGroupService.getTbStoreMngCharge(storeNo);
            List<TbDlvyPriceCharge> tbDlvyPriceChargeList = workGroupService.getTbDlvyPriceChargeListAll();
            List<TbServiceChargeGroup> tbServiceChargeGroup = workGroupService.getTbServiceChargeGroup();
            TbStoreServiceCharge tbStoreServiceCharge0 = workGroupService.getTbStoreServiceCharge(storeNo, 0);
            TbStoreServiceCharge tbStoreServiceCharge1 = workGroupService.getTbStoreServiceCharge(storeNo, 1);

            model.addAttribute("tbStore",tbStore);
            model.addAttribute("tbStoreMngCharge",tbStoreMngCharge);
            /*model.addAttribute("tbDlvyAreaChargeList",tbDlvyAreaChargeList);*/
            model.addAttribute("tbDlvyPriceChargeList",tbDlvyPriceChargeList);
            model.addAttribute("tbServiceChargeGroup",tbServiceChargeGroup);
            model.addAttribute("tbStoreServiceCharge0",tbStoreServiceCharge0);
            model.addAttribute("tbStoreServiceCharge1",tbStoreServiceCharge1);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/merchant/storemngcharge/detail");
    }



    @GetMapping("/storedlvycharge/list")
    public ModelAndView listStoreDlvyCharge(@RequestParam Map<String,Object> searchValue,
                                           Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        if (!searchValue.isEmpty()){
            putSearchOption(session, searchValue);
        } else {
            searchValue = getSearchOption(session);
        }

        List<TbStoreDlvyCharge> resultList = null;
        if (searchValue.containsKey("storeNo")) {
            resultList = merchanGroupService.tbStoreDlvyChargeSearch(searchValue);
        }
        model.addAttribute("tbStoreDlvyCharge", resultList);
        model.addAttribute("searchValue",searchValue);
        return new ModelAndView("jesica/merchant/storedlvycharge/list");
    }

    @GetMapping("/storedlvycharge/insert")
    public ModelAndView storrDlvyChargeInsert(HttpSession session, Model model) {
        model.addAttribute("searchValue",getSearchOption(session));
        return new ModelAndView("jesica/merchant/storedlvycharge/insert");
    }

    @GetMapping("/storedlvycharge/detail")
    public ModelAndView storeDlvyChargeDetail(Long storeNo, Model model) {
        log.info("@@@@ storeNo {}", storeNo);
        try {
            TbStore tbStore = workGroupService.getTbStoreDetail(storeNo);
            TbStoreDlvyCharge tbStoreDlvyCharge = workGroupService.getTbStoreDlvyCharge(storeNo);
            /*List<TbDlvyAreaCharge> tbDlvyAreaChargeList = workGroupService.getTbDlvyAreaChargeListAll();*/
            List<TbDlvyPriceCharge> tbDlvyPriceChargeList = workGroupService.getTbDlvyPriceChargeListAll();

            model.addAttribute("tbStore",tbStore);
            model.addAttribute("tbStoreDlvyCharge",tbStoreDlvyCharge);
            /*model.addAttribute("tbDlvyAreaChargeList",tbDlvyAreaChargeList);*/
            model.addAttribute("tbDlvyPriceChargeList",tbDlvyPriceChargeList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/merchant/storedlvycharge/detail");
    }

    @GetMapping("/merchancopy/list")
    public ModelAndView listMerchanCopy() {

        return new ModelAndView("jesica/merchant/merchandisecopy/list");
    }

    @GetMapping("/uploadexcel/list")
    public ModelAndView listUploadExcel() {

        return new ModelAndView("jesica/merchant/uploadexcel/list");
    }

    @GetMapping("/uploadexcel/insert")
    public ModelAndView insertExcel() {

        return new ModelAndView("jesica/merchant/uploadexcel/insert");
    }

    @GetMapping("/uploadexcel/excelform")
    public ModelAndView formExcel() {

        return new ModelAndView("jesica/merchant/uploadexcel/excelform");
    }

    @GetMapping("/multifrchi/list")
    public ModelAndView listMultifranchise() {

        return new ModelAndView("jesica/merchant/multifranchise/list");
    }

    @GetMapping("/othgrpset/list")
    public ModelAndView listOtherGroupSetting() {

        return new ModelAndView("jesica/merchant/othergroupsetting/list");
    }

    @GetMapping("/onlineevent/list")
    public ModelAndView listOnlineEvent() {

        return new ModelAndView("jesica/merchant/onlineevent/list");
    }

    @GetMapping("/onlineevent/detail")
    public ModelAndView detailOnlineEvent() {

        return new ModelAndView("jesica/merchant/onlineevent/detail");
    }

    @GetMapping("/ratemgt/list")
    public ModelAndView listRateManagement() {

        return new ModelAndView("jesica/merchant/ratemanagement/list");
    }

    @GetMapping("/ratemgt/detail")
    public ModelAndView detailRateManagement() {

        return new ModelAndView("jesica/merchant/ratemanagement/detail");
    }


    //차량관리
   /* @GetMapping("/car/list")
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
                resultList = merchandiseService.tbStoreRentalCar(searchValue);
            }
            model.addAttribute("tbStoreRentalCar", resultList);
            model.addAttribute("tbStoreLIst", tbStoreLIst);

        } catch (Exception e) {
            e.printStackTrace();
        }
        *//*model.addAttribute("tbStoreGoods", merchandiseService.tbStoreGoodsSearch(searchValue));*//*
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("jesica/merchant/car/list");
    }*/

    /*@GetMapping("/car/insert")
    public ModelAndView insertCar(HttpSession session, Model model) {
        model.addAttribute("searchValue",getSearchOption(session));

        //렌트카 가맹점리스트
        List<TbStoreRentalCar> resultList = null;
        List<TbStore> tbStoreList = apiService.getStoreList();

        //안심번호 리스트(매칭안된것들)
        List<TbSafenMapping> tbSafenMapping = merchandiseService.getTbSafenMappingList();
        model.addAttribute("tbSafenMapping",tbSafenMapping);
        model.addAttribute("tbStoreList",tbStoreList);

        return new ModelAndView("jesica/merchant/car/insert");
    }*/

 /*   @GetMapping("/car/detail")
    public ModelAndView rentailCar(@RequestParam Integer rentalCarNo,Model model) {
        log.info("@@rentalCarNo {}",rentalCarNo);

        try {
            TbStoreRentalCar tbStoreRentalCar = merchandiseService.getTbStoreRentalCarDetail(rentalCarNo);

            model.addAttribute("tbStoreRentalCar",tbStoreRentalCar);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/merchant/car/detail");
    }*/


   /* @GetMapping("/car/insertExcel")
    public ModelAndView insertExcel( Model model) {
        List<TbStore> tbStoreLIst = apiService.getStoreList();
        model.addAttribute("tbStoreLIst", tbStoreLIst);

        return new ModelAndView("jesica/merchant/car/insertExcel");
    }*/


    /**
     * 렌터카 엑셀파일 입력
     * @param session
     * @param model
     * @param excelFile
     */
   /* @RequestMapping(value = "/car/Excelupload")
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
                int result = merchandiseService.tbStoreRentCarExcelUpdate(tbStoreRentalCarData);
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
        return new ModelAndView("jesica/merchant/car/resultExcel");
        //return "redirect:jesica/merchant/car/resultExcel";
    }*/



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
