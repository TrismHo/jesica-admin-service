package com.trism.jesica.Controller;

import com.trism.jesica.Service.SafeService;
import com.trism.jesica.Service.SystemGoodsService;
import com.trism.jesica.Service.WorkerApplyService;
import com.trism.jesica.config.KeyGeneratorConfig;
import com.trism.jesica.dto.TbSystemCategoryDTO;
import com.trism.jesica.persistence.Entitiy.TbWorkerApply;
import com.trism.jesica.persistence.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.Entitiy.goods.TbSystemGoods;
import com.trism.jesica.persistence.Entitiy.safe.TbSafenMapping;
import com.trism.jesica.persistence.Entitiy.safe.TbSafenMappingLog;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.reflections.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

@RequestMapping("/system")
@RestController
@RequiredArgsConstructor
@Slf4j
public class SystemController {

    private final SystemGoodsService systemGoodsService;

    private final WorkerApplyService workerApplyService;

    @GetMapping("/coopcompany/list")
    public ModelAndView listCooperativeCompany() {

        return new ModelAndView("jesica/system/coopcompany/list");
    }
    /**
     * 기사가입신청내역 리스트
     */
    @GetMapping("/control/view")
    public ModelAndView listAffiliated(Locale locale, HttpServletRequest request,
                                       @RequestParam Map<String,Object> searchValue,
                                       Model model) {
        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()){

                if(searchValue.get("endDate") == null && searchValue.get("startDate") == null) {
                    Calendar c1 = new GregorianCalendar();
                    c1.add(Calendar.DATE, -1); // 오늘날짜로부터 -1
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포맷
                    String yesterday = sdf.format(c1.getTime()); // String으로 저장

                    searchValue.put("endDate",yesterday);
                    searchValue.put("startDate",yesterday);
                }
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
                model.addAttribute("workList", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue",searchValue);


        return new ModelAndView("jesica/system/control/control");
    }

    @GetMapping("/systemgoods/list")
    public ModelAndView systemGoodsList(@RequestParam Map<String,Object> searchValue,
                                        Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        Integer selCatLevel = null;
        try {
            if (!searchValue.isEmpty()) {

                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            if (!searchValue.isEmpty() && searchValue != null) {
                if(searchValue.get("catCode") != null && !Utils.isEmpty(searchValue.get("catCode").toString())) {
                    TbSystemCategoryDTO tbSystemCategoryDTO = systemGoodsService.findByCatCode(searchValue.get("catCode").toString());

                    String catCode = tbSystemCategoryDTO.getCatCode();
                    selCatLevel =tbSystemCategoryDTO.getCatLevel();
                    String lv2ParentCatCode = "";
                    String lv3ParentCatCode = "";

                    if (selCatLevel == 1) {

                        model.addAttribute("catCode1",catCode);
                        model.addAttribute("catCode2","");
                        model.addAttribute("catCode3", "");

                    } else if (selCatLevel == 2) {
                        lv2ParentCatCode =  systemGoodsService.findByCatCode(catCode).getParentCatCode();

                        model.addAttribute("catCode1",lv2ParentCatCode);
                        model.addAttribute("catCode2",catCode);
                        model.addAttribute("catCode3", "");

                    } else if (selCatLevel == 3) {
                        lv3ParentCatCode =  systemGoodsService.findByCatCode(catCode).getParentCatCode();
                        lv2ParentCatCode =  systemGoodsService.findByCatCode(lv3ParentCatCode).getParentCatCode();

                        model.addAttribute("catCode1",lv2ParentCatCode);
                        model.addAttribute("catCode2",lv3ParentCatCode);
                        model.addAttribute("catCode3", catCode);
                    }
                } else {
                     selCatLevel = 1;

                    model.addAttribute("catCode1","");
                    model.addAttribute("catCode2","");
                    model.addAttribute("catCode3", "");
                }

                putSearchOption(session, searchValue);
            } else {
                selCatLevel = 1;
                model.addAttribute("catCode1","");
                model.addAttribute("catCode2","");
                model.addAttribute("catCode3", "");
                searchValue = getSearchOption(session);
            }
            List<TbSystemGoods> resultList = null;
            resultList = systemGoodsService.tbStoreGoodsSearch(searchValue);
            model.addAttribute("tbSystemGoods", resultList);
            model.addAttribute("selCatLevel",selCatLevel);
            model.addAttribute("catList1", systemGoodsService.tbSystemCategoryList(1));
            model.addAttribute("catList2", systemGoodsService.tbSystemCategoryList(2));
            model.addAttribute("catList3", systemGoodsService.tbSystemCategoryList(3));

            model.addAttribute("selCatLevel",selCatLevel);

        } catch (Exception e) {
            e.printStackTrace();
        }
        /*model.addAttribute("tbStoreGoods", merchandiseService.tbStoreGoodsSearch(searchValue));*/
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("jesica/system/systemgoods/list");
    }

    @GetMapping("/systemgoods/insert")
    public ModelAndView insertSystemGoods(Model model) {
        model.addAttribute("categoryList", systemGoodsService.tbSystemCategoryList(1));
        return new ModelAndView("jesica/system/systemgoods/insert");
    }

    @GetMapping("/systemgoods/detail")
    public ModelAndView detailSystemGoods(@RequestParam Long goodsNo, Model model) {

        try {
            TbSystemGoods tbSystemGoods = systemGoodsService.getSystemGoods(goodsNo);

            String catCode = tbSystemGoods.getCatCode();
            String lv2ParentCatCode = "";
            String lv3ParentCatCode = "";
            Integer selCatLevel = null;
            /*List<TbSystemCategoryDTO> tbSystemCategoryDTOList = ;*/

            model.addAttribute("catList1", systemGoodsService.tbSystemCategoryList(1));
            model.addAttribute("catList2", systemGoodsService.tbSystemCategoryList(2));
            model.addAttribute("catList3", systemGoodsService.tbSystemCategoryList(3));
            TbSystemCategoryDTO tbSystemCategoryDTO =  systemGoodsService.findByCatCode(catCode);
            selCatLevel = tbSystemCategoryDTO.getCatLevel();

            if (selCatLevel == 1) {

                model.addAttribute("catCode1",catCode);
                model.addAttribute("catCode2","");
                model.addAttribute("catCode3", "");

            } else if (selCatLevel == 2) {
                lv2ParentCatCode =  systemGoodsService.findByCatCode(catCode).getParentCatCode();

                model.addAttribute("catCode1",lv2ParentCatCode);
                model.addAttribute("catCode2",catCode);
                model.addAttribute("catCode3", "");

            } else if (selCatLevel == 3) {
                lv3ParentCatCode =  systemGoodsService.findByCatCode(catCode).getParentCatCode();
                lv2ParentCatCode =  systemGoodsService.findByCatCode(lv3ParentCatCode).getParentCatCode();

                model.addAttribute("catCode1",lv2ParentCatCode);
                model.addAttribute("catCode2",lv3ParentCatCode);
                model.addAttribute("catCode3", catCode);
            }
            model.addAttribute("selCatLevel",selCatLevel);
            model.addAttribute("tbSystemGoods", systemGoodsService.getSystemGoods(goodsNo));
            if(tbSystemGoods.getImgFile1() != null){
                model.addAttribute("imgFile1", URLEncoder.encode(tbSystemGoods.getImgFile1(),"UTF-8"));
            } else {
                model.addAttribute("imgFile1", null);
            }

            if(tbSystemGoods.getImgFile2() != null){
                model.addAttribute("imgFile2", URLEncoder.encode(tbSystemGoods.getImgFile2(),"UTF-8"));
            } else {
                model.addAttribute("imgFile2", null);
            }

            if(tbSystemGoods.getImgFile3() != null){
                model.addAttribute("imgFile3", URLEncoder.encode(tbSystemGoods.getImgFile3(),"UTF-8"));
            } else {
                model.addAttribute("imgFile3", null);
            }

            if(tbSystemGoods.getImgFileSmall() != null){
                model.addAttribute("imgFileSmall", URLEncoder.encode(tbSystemGoods.getImgFileSmall(),"UTF-8"));
            } else {
                model.addAttribute("imgFileSmall", null);
            }
        } catch (Exception e) {

        }



        return new ModelAndView("jesica/system/systemgoods/detail");
    }

    private final SafeService safeService;

    @Autowired
    private final KeyGeneratorConfig keyGeneratorConfig;

    /**
     * 안심번호리스트
     */
    @GetMapping("/number/list")
    public ModelAndView listSafeNumber(Locale locale, HttpServletRequest request,
                                       @RequestParam Map<String,Object> searchValue,
                                       LoginSession session,
                                       Model model) {
        log.info("@@searchValue {}",searchValue);

        if (!searchValue.isEmpty()){

            model.addAttribute("tbSafenMapping", safeService.tbSafenMapping(searchValue));
        } else {
            model.addAttribute("tbSafenMapping", null);
        }

        model.addAttribute("searchValue",searchValue);



        return new ModelAndView("/jesica/system/number/list");
    }

    /**
     * 안심번호등록
     */
    @GetMapping("/number/detail")
    public ModelAndView insertSafeNumber(@RequestParam String safenNum, Model model) {
        try {

            //브랜드 리스트 조회
            TbSafenMapping tbSafenMapping = safeService.getTbSafenMappingDetail(safenNum);
            List<TbSafenMappingLog> tbSafenMappingLog = safeService.getTbSafenMappingDetailList(safenNum);
            if(tbSafenMapping.getRentalCarNo() != null){
                TbStoreRentalCar tbStoreRentalCar = safeService.getTbStoreRentalCarDetail(tbSafenMapping.getRentalCarNo());
                model.addAttribute("tbStoreRentalCar", tbStoreRentalCar);
            }else {
                model.addAttribute("tbStoreRentalCar", null);
            }
            model.addAttribute("tbSafenMappingLog", tbSafenMappingLog);
            model.addAttribute("tbSafenMapping", tbSafenMapping);


        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("/jesica/system/number/detail");
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
