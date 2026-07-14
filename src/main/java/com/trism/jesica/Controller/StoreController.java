package com.trism.jesica.Controller;

import com.trism.jesica.Service.ApiService;
import com.trism.jesica.Service.AuthService;
import com.trism.jesica.Service.BrCodeService;
import com.trism.jesica.Service.MannaService;
import com.trism.jesica.Util.DateUtil;
import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.dto.MannaOrderDetailDto;
import com.trism.jesica.dto.TbMannaOrderGoodsDTO;
import com.trism.jesica.persistence.mysql.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaEventPush;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaStRegist;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteAcl;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteMenu;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSystemCode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RequestMapping("/store")
@RestController
@RequiredArgsConstructor
@Slf4j
public class StoreController {
    private final MannaService mannaService;

    private final BrCodeService brCodeService;
    private String ordPathCd = "1105";

    private final ApiService apiService;
    private final AuthService authService;
    private final JesicaProperties jesicaProperties;

    /**
     * 주문내역
     */
    @GetMapping("/order/list")
    public ModelAndView orderList(@RequestParam Map<String,Object> searchValue,
                                  Model model, HttpSession session) {

        log.info("@@searchValue {}",searchValue);
        List<Map<String,Object>> brCodeList = null;
        Map<String,Object> map = permission(session,"store/order");
        // 총판 리스트 조회
        brCodeList = brCodeService.getBrCodeList();
        searchValue.put("appCode",map.get("appCode"));
        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        model.addAttribute("appVersionList",appVersionList);
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
                if(ObjectUtils.isNotEmpty(searchValue.get("ordType"))){
                    if(Integer.parseInt(searchValue.get("ordType").toString()) != 1){
                        searchValue.put("dvryServiceType", "");
                    }
                } else {
                    searchValue.put("dvryServiceType", "");
                }
                searchValue.put("startDate", DateUtil.now_yyyy_mm_dd_week() );
                searchValue.put("endDate", DateUtil.now_yyyy_mm_dd());

            } else {
                searchValue = getSearchOption(session);
                searchValue.put("startDate", DateUtil.now_yyyy_mm_dd_week() );
                searchValue.put("endDate", DateUtil.now_yyyy_mm_dd());
                searchValue.put("keywordType", "ordCuTel");
                searchValue.put("dvryServiceType", "");
                searchValue.put("ordStatus", "5");
            }

          /*  searchValue.put("ordPathCd",ordPathCd);
            List<TbMannaOrder> resultList =  mannaService.tbCallAllList(searchValue);
            //List<TbSystemCode> tbSystemCode = driverApplyService.searchTbSystemCode("OP");
            //model.addAttribute("tbSystemCode", tbSystemCode);
            model.addAttribute("orderList", resultList);*/

        } catch (Exception e) {
            e.printStackTrace();
        }


        model.addAttribute("permission",map.get("permission"));
        model.addAttribute("downloadAble",map.get("downloadAble"));
        model.addAttribute("searchValue", searchValue);
        model.addAttribute("brCodeList", brCodeList);

        return new ModelAndView("/jesica/store/order/list");

    }

    @GetMapping("/eventpush/list")
    public ModelAndView listPushEvent(@RequestParam Map<String,Object> searchValue,
                                      Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        Map<String,Object> map = permission(session,"store/eventpush");

        searchValue.put("appCode",map.get("appCode"));
        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        model.addAttribute("appVersionList",appVersionList);
        model.addAttribute("permission",map.get("permission"));
        model.addAttribute("downloadAble",map.get("downloadAble"));
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("jesica/store/eventpush/list");
    }

    @GetMapping("/eventpush/detail")
    public ModelAndView eventPushDetail(@RequestParam("logNo") Long logNo , Model model) {
        log.info("logNo :: {}",logNo);
        TbMannaEventPush tbMannaEventPush = mannaService.getTbEventPushDetail(logNo);
        model.addAttribute("tbMannaEventPush", tbMannaEventPush);
        return new ModelAndView("jesica/store/eventpush/detail");
    }

    /* 가맹점 신청관리 */
    @GetMapping("/regist/list")
    public ModelAndView registList(@RequestParam Map<String,Object> searchValue,
                                      Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        Map<String,Object> map = permission(session,"store/regist");

        searchValue.put("appCode",map.get("appCode"));
        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        model.addAttribute("appVersionList",appVersionList);
        searchValue.put("startDate", DateUtil.now_yyyy_mm_dd_week());
        searchValue.put("endDate", DateUtil.now_yyyy_mm_dd());
        model.addAttribute("permission",map.get("permission"));
        model.addAttribute("downloadAble",map.get("downloadAble"));
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("jesica/store/regist/list");
    }


    /* 가맹점 신청관리 상세*/
    @GetMapping("/regist/detail")
    public ModelAndView registDetail(@RequestParam("stCode") String stCode , Model model) {
        log.info("stCode :: {}",stCode);
        model.addAttribute("cwPath", jesicaProperties.getCwPath().getPath());
        model.addAttribute("stPath", jesicaProperties.getStPath().getPath());
        model.addAttribute("stDwPath", jesicaProperties.getStDwPath().getPath());
        TbMannaStRegist tbMannaStRegist = mannaService.getMannaStRegist(stCode);
        List<Map<String, Object>> tbMannaStRegistFile = mannaService.getMannaStRegistFileList(stCode);
        model.addAttribute("tbMannaStRegist", tbMannaStRegist);
        model.addAttribute("tbMannaStRegistFile", tbMannaStRegistFile);
        return new ModelAndView("jesica/store/regist/detail");
    }


    /**
     * 주문내역 상세
     */
    @GetMapping("/order/detail")
    public ModelAndView orderDetail(@RequestParam Long ordNo,Model model) {
        log.info("@@ordNo {}",ordNo);
        List<TbMannaOrderGoodsDTO> tbMannaOrderGoodsDTO;
        try {
            //;
            MannaOrderDetailDto detail = mannaService.getCallAllDetail(ordNo);

            model.addAttribute("callDetail", detail.getOrder());
            model.addAttribute("logisticsDetail", detail.getLogistics());
            tbMannaOrderGoodsDTO = mannaService.getOrderGoods(ordNo);
            model.addAttribute("goodsInfo",tbMannaOrderGoodsDTO);
            model.addAttribute("goodsInfoDetail",mannaService.getOrderGoodOpt(ordNo));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("/jesica/store/order/detail");
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

    private Map<String,Object> permission(HttpSession session, String menuPath) {
        HashMap<String ,Object> map = new HashMap<>();
        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        int staffNo = loginSession.getUserStaffNo();
        Long nLong = new Long(staffNo);
        String company = loginSession.getCompany();
        String appCode = loginSession.getAppCode();


        Optional<TbSiteMenu> siteMenu = authService.getTbSiteMenu(menuPath);
        TbSiteAcl permission = null;

        if("jesicar".equals(company)) {
            map.put("platformType","1");
        } else if ("yangpa".equals(company)) {
            map.put("platformType","2");
        }

        /* 사이트 메뉴 정보가 없으면 */
        if(siteMenu.isPresent()) {
            /* 권한이 존재하지 않는경우 */
            if(!ObjectUtils.isEmpty(loginSession.getRoleType())){
                /* 권한이 마스터 :0 인경우*/
                if(loginSession.getRoleType() == 0){
                    map.put("downloadAble",1);
                    map.put("permission",2);
                }else {
                    permission = authService.getTbSiteAcl(nLong,siteMenu.get().getMenuNo());
                    map.put("downloadAble",permission.getDownloadAble());
                    if(!ObjectUtils.isEmpty(permission)){
                        map.put("permission",permission.getPermission());
                    } else {
                        map.put("permission",0);
                    }
                }
            }
        } else {
            map.put("downloadAble",0);
            map.put("permission",0);
        }

        if(!ObjectUtils.isEmpty(appCode)){
            map.put("appCode",appCode);
        } else {
            map.put("appCode","");
        }

        map.put("company",company);
        return map;
    }
}
