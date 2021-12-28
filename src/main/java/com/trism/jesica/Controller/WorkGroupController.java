package com.trism.jesica.Controller;

import com.trism.jesica.Service.ApiService;
import com.trism.jesica.Service.WorkGroupService;
import com.trism.jesica.Util.Secure.CipherAESUtils;
import com.trism.jesica.config.KeyGeneratorConfig;
import com.trism.jesica.dto.TbStoreCategoryFoDTO;
import com.trism.jesica.dto.TbSystemCategoryDTO;
import com.trism.jesica.persistence.Entitiy.block.TbDlvyAreaCharge;
import com.trism.jesica.persistence.Entitiy.business.*;
import com.trism.jesica.persistence.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.Entitiy.street.TbDlvyPriceCharge;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/*import com.trism.jesica.dto.TbHeadDTO;*/

@RequestMapping("/workgroup")
@RestController
@RequiredArgsConstructor
@Slf4j
public class WorkGroupController {

    private final LocaleResolver localeResolver;

    private final MessageSource messageSource;

    private final WorkGroupService workGroupService;

    private final ApiService apiService;

    @Autowired
    private final KeyGeneratorConfig keyGeneratorConfig;

    /**
     * 제휴본사목록
     */
    @GetMapping("/affiliated/list")
    public ModelAndView listAffiliated(Locale locale, HttpServletRequest request,
                                       @RequestParam Map<String,Object> searchValue,
                                       LoginSession session,
                                       Model model) {
        log.info("@@searchValue {}",searchValue);

        if (!searchValue.isEmpty()){

            model.addAttribute("workGroup", workGroupService.tbHeadSearch(searchValue));
        } else {
            model.addAttribute("workGroup", null);
        }

        model.addAttribute("searchValue",searchValue);



        return new ModelAndView("/jesica/workgroup/affiliated/list");
    }

    /**
     * 제휴본사등록
     */
    @GetMapping("/affiliated/insert")
    public ModelAndView insertAffiliated(Model model) {
        try {

            //브랜드 리스트 조회
            List<TbBrand> tbBrandList = workGroupService.tbBrandList();
            model.addAttribute("tbBrandList", tbBrandList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("/jesica/workgroup/affiliated/insert");
    }


    /**
     * 제휴본사상세
     */
    @GetMapping("/affiliated/detail")
    public ModelAndView detailAffiliated(@RequestParam Long headNo, Model model) {
        log.info("@@headNo {}",headNo);

        try {
            //본사 정보상세
            TbHead tbHead = workGroupService.getTbHeadDetail(headNo);
            //브랜드 리스트 조회
            List<TbBrand> tbBrandList = workGroupService.tbBrandList();
            //사용자 정보 조회
            /*TbUser tbUser = workGroupService.getTbUser(headNo);*/


            //은행명 조회
            if(workGroupService.getSystemCode("BT",tbHead.getBankTypeCode()) != null){
                model.addAttribute("bankName",workGroupService.getSystemCode("BT",tbHead.getBankTypeCode()).getCodeName());
            } else {
                model.addAttribute("bankName",null);
            }
            //가상계좌 은행명 조회
            if(workGroupService.getSystemCode("CBT",tbHead.getCybankTypeCode()) != null){
                model.addAttribute("cBankName",workGroupService.getSystemCode("CBT",tbHead.getCybankTypeCode()).getCodeName());
            } else {
                model.addAttribute("cBankName",null);
            }

            CipherAESUtils cipherAESUtils = new CipherAESUtils(keyGeneratorConfig.generateSecretKeySpec(),keyGeneratorConfig.generateIvParameterSpec());

            model.addAttribute("tbHead", tbHead);
            model.addAttribute("bankAccount", cipherAESUtils.decryptAES(tbHead.getBankAccount()));
            model.addAttribute("bankOwner", cipherAESUtils.decryptAES(tbHead.getBankOwner()));

            model.addAttribute("tbBrandList", tbBrandList);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("MethodArgumentTypeMismatchException");
        }

        return new ModelAndView("/jesica/workgroup/affiliated/detail");
    }


    /**
     * 총판목록
     */
    @GetMapping("/distributor/list")
    public ModelAndView listDistributor(
                                        @RequestParam Map<String,Object> searchValue,
                                        Model model) {
        if (!searchValue.isEmpty()){
            model.addAttribute("tbBranch", workGroupService.tbBranchSerch(searchValue));
        } else {
            model.addAttribute("tbBranch", null);
        }

        model.addAttribute("searchValue",searchValue);

        return new ModelAndView("/jesica/workgroup/distributor/list");
    }

    /**
     * 총판등록
     */
    @GetMapping("/distributor/insert")
    public ModelAndView insertDistributor(Model model) {
        try {
            //브랜드 리스트 조회
            List<TbBrand> tbBrandList = workGroupService.tbBrandList();
            model.addAttribute("tbBrandList", tbBrandList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("/jesica/workgroup/distributor/insert");
    }

    /**
     * 총판상세
     */
    @GetMapping("/distributor/detail")
    public ModelAndView detailDistributor(@RequestParam Long branchNo, Model model) {
        log.info("@@branchNo {}",branchNo);

        try {
            //본사 정보상세
            TbBranch tbBranch = workGroupService.getTbBranchDetail(branchNo);
            //브랜드 리스트 조회
            List<TbBrand> tbBrandList = workGroupService.tbBrandList();
            //사용자 정보 조회
            /*TbUser tbUser = workGroupService.getTbUser(headNo);*/

            //은행명 조회
            if(workGroupService.getSystemCode("BT",tbBranch.getBankTypeCode()) != null){
                model.addAttribute("bankName",workGroupService.getSystemCode("BT",tbBranch.getBankTypeCode()).getCodeName());
            } else {
                model.addAttribute("bankName",null);
            }
            //가상계좌 은행명 조회
            if(workGroupService.getSystemCode("CBT",tbBranch.getCybankTypeCode()) != null){
                model.addAttribute("cBankName",workGroupService.getSystemCode("CBT",tbBranch.getCybankTypeCode()).getCodeName());
            } else {
                model.addAttribute("cBankName",null);
            }

            CipherAESUtils cipherAESUtils = new CipherAESUtils(keyGeneratorConfig.generateSecretKeySpec(),keyGeneratorConfig.generateIvParameterSpec());

            model.addAttribute("bankAccount", cipherAESUtils.decryptAES(tbBranch.getBankAccount()));
            model.addAttribute("bankOwner", cipherAESUtils.decryptAES(tbBranch.getBankOwner()));
            model.addAttribute("tbBranch", tbBranch);
            model.addAttribute("tbBrandList", tbBrandList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("/jesica/workgroup/distributor/detail");
    }

    /**
     * 소속가맹점목록
     */
    @GetMapping("/affilfranch/list")
    public ModelAndView listAffiliatedFranchise(HttpServletRequest request,
                                                @RequestParam Map<String,Object> searchValue,
                                                HttpSession session,
                                                Model model) {
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }
            if (!searchValue.isEmpty()){
                model.addAttribute("tbStore", workGroupService.tbStoreSearch(searchValue));
            } else {
                model.addAttribute("tbStore", null);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }



        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("/jesica/workgroup/affilfranch/list");
    }

    /**
     * 소속가맹점등록
     */
    @GetMapping("/affilfranch/insert")
    public ModelAndView insertAffiliatedFranchise(Model model) {
        //주문 카테고리 조회
        List<TbSystemCategoryDTO> tbSystemCategory = workGroupService.tbSystemCategorySearch("FO", 1);
        model.addAttribute("tbSystemCategory", tbSystemCategory);
        return new ModelAndView("/jesica/workgroup/affilfranch/insert");
    }

    /**
     * 소속가맹점상세
     */
    @GetMapping("/affilfranch/detail")
    public ModelAndView detailAffiliatedFranchise(@RequestParam Long storeNo, Model model) {
        log.info("@@storeNo {}",storeNo);

        try {
            //본사 정보상세
            TbStore tbStore = workGroupService.getTbStoreDetail(storeNo);
            //브랜드 리스트 조회
            List<TbBrand> tbBrandList = workGroupService.tbBrandList();
            //주문 카테고리 조회
            List<TbSystemCategoryDTO> tbSystemCategory = workGroupService.tbSystemCategorySearch("FO",1);

            //주문 카테고리 (선택되어있는 카테고리) 조회
            List<TbStoreCategoryFoDTO> tbStoreCategoryFo = workGroupService.tbStoreCategorySearch(storeNo);

            //사용자 정보 조회
            /*TbUser tbUser = workGroupService.getTbUser(headNo);*/



            model.addAttribute("tbStore", tbStore);
            String url = "";
            String url2 = "";
            if (tbStore.getImgFile1() != null) {
                url = URLEncoder.encode(tbStore.getImgFile1(),"UTF-8");
            }
            if (tbStore.getImgFileSmall() != null) {
                url2 = URLEncoder.encode(tbStore.getImgFileSmall(),"UTF-8");
            }

            //은행명 조회
            if(workGroupService.getSystemCode("BT",tbStore.getBankTypeCode()) != null){
                model.addAttribute("bankName",workGroupService.getSystemCode("BT",tbStore.getBankTypeCode()).getCodeName());
            } else {
                model.addAttribute("bankName",null);
            }
            //가상계좌 은행명 조회
            if(workGroupService.getSystemCode("CBT",tbStore.getCybankTypeCode()) != null){
                model.addAttribute("cBankName",workGroupService.getSystemCode("CBT",tbStore.getCybankTypeCode()).getCodeName());
            } else {
                model.addAttribute("cBankName",null);
            }
            model.addAttribute("imgFile1", url);
            model.addAttribute("imgFileSmall", url2);
            model.addAttribute("tbBrandList", tbBrandList);
            CipherAESUtils cipherAESUtils = new CipherAESUtils(keyGeneratorConfig.generateSecretKeySpec(),keyGeneratorConfig.generateIvParameterSpec());

            model.addAttribute("bankAccount", cipherAESUtils.decryptAES(tbStore.getBankAccount()));
            model.addAttribute("bankOwner", cipherAESUtils.decryptAES(tbStore.getBankOwner()));
            model.addAttribute("tbSystemCategory", tbSystemCategory);
            model.addAttribute("tbStoreCategoryFo", tbStoreCategoryFo);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("/jesica/workgroup/affilfranch/detail");
    }

    /**
     * 영업가맹점목록
     */
    @GetMapping("/businessfranch/list")
    public ModelAndView listBusinessFranchise() {

        return new ModelAndView("/jesica/workgroup/businessfranch/list");
    }

    /**
     * 영업가맹점상세
     */
    @GetMapping("/businessfranch/detail")
    public ModelAndView detailBusinessFranchise() {

        return new ModelAndView("/jesica/workgroup/businessfranch/detail");
    }

 /*   *//**
     * 배송원목록
     *//*
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

      *//*      List<TbDelivery> resultList = null;
            model.addAttribute("tbUserWork", workGroupService.tbUserWorkSerch(searchValue));*//*
        *//*    resultList =  workGroupService.getTbDeliveryList(searchValue);
            model.addAttribute("tbDelivery", resultList);
*//*
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("searchValue",searchValue);

        return new ModelAndView("/jesica/workgroup/deliveryman/list");
    }

    *//**
     * 배송원등록
     *//*
    @GetMapping("/deliveryman/insert")
    public ModelAndView insertDeliveryMan(){
        return new ModelAndView("/jesica/workgroup/deliveryman/insert");
    }

    *//**
     * 배송원상세
     *//*
    @GetMapping("/deliveryman/detail")
    public ModelAndView detailDeliveryMan(@RequestParam("userNo") Long userNo , Model model) {

        try {
            TbUserWorker tbUserWorker = workGroupService.getTbUserWorker(userNo);

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

            CipherAESUtils cipherAESUtils = new CipherAESUtils(keyGeneratorConfig.generateSecretKeySpec(),keyGeneratorConfig.generateIvParameterSpec());

            model.addAttribute("bankAccount", cipherAESUtils.decryptAES(tbUserWorker.getBankAccount()));
            model.addAttribute("bankOwner", cipherAESUtils.decryptAES(tbUserWorker.getBankOwner()));
            model.addAttribute("tbUserWorker", tbUserWorker);
            model.addAttribute("imgFile", url);
        } catch (Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("/jesica/workgroup/deliveryman/detail");
    }*/

    /**
     * 배송그룹목록
     */
    @GetMapping("/deliverygrp/list")
    public ModelAndView listDeliveryGroup(@RequestParam Map<String,Object> searchValue,
                                           Model model, HttpSession session) {


        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {

                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            List<TbDelivery> resultList = null;
            resultList =  workGroupService.getTbDeliveryList(searchValue);
            model.addAttribute("tbDelivery", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        /*model.addAttribute("tbStoreGoods", merchandiseService.tbStoreGoodsSearch(searchValue));*/
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("/jesica/workgroup/deliverygrp/list");
    }

    /**
     * 배송그룹등록
     */
    @GetMapping("/deliverygrp/insert")
    public ModelAndView insertDeliveryGroup() {

        return new ModelAndView("/jesica/workgroup/deliverygrp/insert");
    }

    /**
     * 배송그룹상세
     */
    @GetMapping("/deliverygrp/detail")
    public ModelAndView detailDeliveryGroup(@RequestParam("dlvyNo") Long dlvyNo , Model model) {
        try {
            TbDelivery tbUserWorker = workGroupService.getTbDelivery(dlvyNo);

            List<TbDlvyPriceCharge> tbDlvyPriceChargeList = workGroupService.getTbDlvyPriceChargeListAll();

            model.addAttribute("tbDelivery", tbUserWorker);
            model.addAttribute("tbDlvyPriceChargeList", tbDlvyPriceChargeList);
        } catch (Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("/jesica/workgroup/deliverygrp/detail");
    }

    /**
     * 배송그룹공유목록
     */
    @GetMapping("/deliveryshare/list")
    public ModelAndView listShareDeliveryGroup(Model model,HttpSession session,@RequestParam Map<String,Object> searchValue) {
        if (!searchValue.isEmpty()) {

            putSearchOption(session, searchValue);
        } else {
            searchValue = getSearchOption(session);
        }
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("/jesica/workgroup/deliveryshare/list");
    }

    /**
     * 배송그룹공유목록
     */
    @GetMapping("/intradeliverygrp/list")
    public ModelAndView listIntraDeliveryGroup() {

        return new ModelAndView("/jesica/workgroup/intradeliverygrp/list");
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


    /**
     * 블록배달리스트
     */
    @GetMapping("/deliveryblock/list")
    public ModelAndView deliveryBlockList(@RequestParam Map<String,Object> searchValue,
                                          Model model, HttpSession session) {

        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {

                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            if(searchValue.get("headNo") == null){
                searchValue.put("headNo",0);
            }
            if(searchValue.get("branchNo") == null){
                searchValue.put("branchNo",0);
            }

            List<TbDlvyAreaCharge> resultList = null;
            resultList =  workGroupService.tbDlvyAreaChargeList(searchValue);
            model.addAttribute("tbDlvyAreaChargeList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        /*model.addAttribute("tbStoreGoods", merchandiseService.tbStoreGoodsSearch(searchValue));*/
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("/jesica/workgroup/deliveryblock/list");
    }


    /**
     * 블록배달리스트 등록
     */
    @GetMapping("/deliveryblock/insert")
    public ModelAndView insertDeliveryBlock() {

        return new ModelAndView("/jesica/workgroup/deliveryblock/insert");
    }

    /**
     * 블록배달리스트 상세
     */
    @GetMapping("/deliveryblock/detail")
    public ModelAndView detailDeliveryBlock(@RequestParam("areaChargeNo") Long areaChargeNo , Model model) {
        log.info("areaChargeNo :: {}",areaChargeNo);
        try {
            TbDlvyAreaCharge tbDlvyAreaCharge = workGroupService.getTbDeliveryBlock(areaChargeNo);

            model.addAttribute("tbDlvyAreaCharge", tbDlvyAreaCharge);
        } catch (Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("/jesica/workgroup/deliveryblock/detail");
    }

    /**
     * 거리요금리스트
     */
    @GetMapping("/deliverystreet/list")
    public ModelAndView deliveryStreetList(@RequestParam Map<String,Object> searchValue,
                                          Model model, HttpSession session) {

        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {

                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            List<TbDlvyPriceCharge> resultList = null;
            resultList =  workGroupService.tbDlvyStreetChargeList(searchValue);
            model.addAttribute("tbDlvyStreetChargeList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        /*model.addAttribute("tbStoreGoods", merchandiseService.tbStoreGoodsSearch(searchValue));*/
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("/jesica/workgroup/deliverystreet/list");
    }

    /**
     * 거리요금리스트 등록
     */
    @GetMapping("/deliverystreet/insert")
    public ModelAndView insertDeliveryStreet() {

        return new ModelAndView("/jesica/workgroup/deliverystreet/insert");
    }

    /**
     * 거리요금리스트 상세
     */
    @GetMapping("/deliverystreet/detail")
    public ModelAndView detailDeliveryStreet(@RequestParam("priceChargeNo") Long priceChargeNo , Model model) {
        log.info("priceChargeNo :: {}",priceChargeNo);
        try {
            TbDlvyPriceCharge tbDlvyPriceCharge = workGroupService.getTbDeliveryPrice(priceChargeNo);

            model.addAttribute("tbDlvyPriceCharge", tbDlvyPriceCharge);
        } catch (Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("/jesica/workgroup/deliverystreet/detail");
    }

}
