package com.trism.jesica.Controller;

import com.trism.jesica.Service.ApiService;
import com.trism.jesica.Service.AppServiceService;
import com.trism.jesica.Service.AuthService;
import com.trism.jesica.Service.BoardService;
import com.trism.jesica.Util.DateUtil;
import com.trism.jesica.dto.TbAppBannerLocationDTO;
import com.trism.jesica.persistence.mysql.Entitiy.app.TbAppService;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbAppBanner;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbNoticeCompany;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbNoticePlatform;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbNoticeWorker;
import com.trism.jesica.persistence.mysql.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.mysql.Entitiy.coupon.TbCoupon;
import com.trism.jesica.persistence.mysql.Entitiy.event.TbEvent;
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
import java.net.URLEncoder;
import java.util.*;

@RequestMapping("/board")
@RestController
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    private final ApiService apiService;
    private final AuthService authService;
    private final BoardService boardService;
    private final AppServiceService serviceService;

    /**
     * 블록배달리스트
     */
    @GetMapping("/platform/list")
    public ModelAndView listPlatformNotice(@RequestParam Map<String,Object> searchValue,
                                           Model model, HttpSession session) {

        log.info("@@searchValue {}",searchValue);
        Map<String,Object> map = permission(session,"board/platform");


        searchValue.put("appCode",map.get("appCode"));
        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        List<TbAppService> appServiceList = apiService.getAppServiceList();
        model.addAttribute("appVersionList",appVersionList);
        model.addAttribute("appServiceList",appServiceList);
        //searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
        searchValue.put("startDate","2020-01-01");
        searchValue.put("endDate", DateUtil.now_yyyy_mm_dd());
        model.addAttribute("searchValue", searchValue);
        model.addAttribute("permission",map.get("permission"));
        model.addAttribute("downloadAble",map.get("downloadAble"));

      /*  try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);

                searchValue.put("startDate","2020-01-01");
                searchValue.put("endDate", DateUtil.now_yyyy_mm_dd());
            }
            searchValue.put("platformType",map.get("platformType"));
            searchValue.put("appCode",map.get("appCode"));
            List<TbNoticePlatform> resultList =  boardService.tbNoticePlatFormSearch(searchValue);
            model.addAttribute("tbNoticePlatformList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }*/

        return new ModelAndView("/jesica/board/platform/list");
    }

    @GetMapping("/platform/insert")
    public ModelAndView insertformPlatformNotice(Model model, HttpSession session) {
        Map<String,Object> map = permission(session,"board/cust");

        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        List<TbAppService> appServiceList = apiService.getAppServiceList();
        model.addAttribute("appVersionList",appVersionList);
        model.addAttribute("appServiceList",appServiceList);
        model.addAttribute("appCode",map.get("appCode"));
        model.addAttribute("permission",map.get("permission"));
        model.addAttribute("downloadAble",map.get("downloadAble"));
        return new ModelAndView("jesica/board/platform/insert");
    }

    @GetMapping("/platform/detail")
    public ModelAndView detailformPlatformNotice(@RequestParam("noticeNo") Long noticeNo , Model model, HttpSession session) {
        Map<String,Object> map = permission(session,"board/platform");
        List<TbAppService> appServiceList = apiService.getAppServiceList();
        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        model.addAttribute("appVersionList",appVersionList);
        model.addAttribute("appCode",map.get("appCode"));
        model.addAttribute("appServiceList",appServiceList);

        log.info("noticeNo :: {}",noticeNo);
        try {
            TbNoticePlatform tbNoticePlatform = boardService.getTbNoticePlatFormDetail(noticeNo);

            model.addAttribute("tbNoticePlatform", tbNoticePlatform);
            model.addAttribute("permission",map.get("permission"));
            model.addAttribute("downloadAble",map.get("downloadAble"));
        } catch (Exception e){
            e.printStackTrace();
        }

        return new ModelAndView("jesica/board/platform/detail");
    }


    @GetMapping("/company/list")
    public ModelAndView listCompanyNotice(@RequestParam Map<String,Object> searchValue,
                                          Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        Map<String,Object> map = permission(session,"board/company");
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            List<TbNoticeCompany> resultList =  boardService.tbNoticeCompanySearch(searchValue);
            model.addAttribute("tbNoticeCompanyList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("jesica/board/company/list");
    }

    @GetMapping("/company/insert")
    public ModelAndView insertCompanyNotice() {

        return new ModelAndView("jesica/board/company/insert");
    }

    @GetMapping("/company/detail")
    public ModelAndView detailCompanyNotice(@RequestParam("noticeNo") Long noticeNo , Model model) {
        log.info("noticeNo :: {}",noticeNo);
        try {
            TbNoticeCompany tbNoticeCompany = boardService.getTbNoticeCompanyDetail(noticeNo);

            model.addAttribute("tbNoticeCompany", tbNoticeCompany);
        } catch (Exception e){
            e.printStackTrace();
        }

        return new ModelAndView("jesica/board/company/detail");
    }


    @GetMapping("/worker/list")
    public ModelAndView listDeliverNotice(@RequestParam Map<String,Object> searchValue,
                                          Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            List<TbNoticeWorker> resultList =  boardService.tbNoticeWorkerSearch(searchValue);
            model.addAttribute("tbNoticeWorkerList", resultList);

        } catch (Exception e) {
        }
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("jesica/board/worker/list");
    }

    @GetMapping("/worker/insert")
    public ModelAndView insertDeliverNotice() {

        return new ModelAndView("jesica/board/worker/insert");
    }

    @GetMapping("/worker/detail")
    public ModelAndView detailDeliverNotice(@RequestParam("noticeNo") Long noticeNo , Model model) {
        log.info("noticeNo :: {}",noticeNo);
        try {
            TbNoticeWorker tbNoticeWorker = boardService.getTbNoticeWorkerDetail(noticeNo);

            model.addAttribute("tbNoticeWorker", tbNoticeWorker);
        } catch (Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("jesica/board/worker/detail");
    }



    @GetMapping("/event/list")
    public ModelAndView listEvent(@RequestParam Map<String,Object> searchValue,
                                          Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);

        Map<String,Object> map = permission(session,"board/event");

        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
                searchValue.put("startDate","2020-01-01");
                searchValue.put("endDate", DateUtil.now_yyyy_mm_dd());
            }
            searchValue.put("platformType",map.get("platformType"));
            searchValue.put("appCode",map.get("appCode"));
            List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
            List<TbAppService> appServiceList = apiService.getAppServiceList();

            model.addAttribute("appVersionList",appVersionList);
            model.addAttribute("appServiceList",appServiceList);

            List<TbEvent> resultList =  boardService.tbEventSearch(searchValue);
            model.addAttribute("tbEventList", resultList);
            model.addAttribute("permission",map.get("permission"));
            model.addAttribute("downloadAble",map.get("downloadAble"));

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);
        return new ModelAndView("jesica/board/event/list");
    }

    @GetMapping("/event/insert")
    public ModelAndView insertEvent(Model model, HttpSession session) {
        Map<String,Object> map = permission(session,"board/event");
        List<TbAppService> appServiceList = apiService.getAppServiceList();
        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        model.addAttribute("appVersionList",appVersionList);
        model.addAttribute("appServiceList",appServiceList);
        model.addAttribute("appCode",map.get("appCode"));
        model.addAttribute("permission",map.get("permission"));
        model.addAttribute("downloadAble",map.get("downloadAble"));
        return new ModelAndView("jesica/board/event/insert");
    }

    @GetMapping("/event/detail")
    public ModelAndView detailEvent(@RequestParam("eventNo") Long eventNo , Model model, HttpSession session) {
        log.info("eventNo :: {}",eventNo);
        Map<String,Object> map = permission(session,"board/event");
        List<TbAppService> appServiceList = apiService.getAppServiceList();
        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        model.addAttribute("appServiceList",appServiceList);
        model.addAttribute("appVersionList",appVersionList);
        model.addAttribute("appCode",map.get("appCode"));
      /*  try {

            model.addAttribute("tbEvent", tbEvent);
            if(tbEvent.getImgFileSmall() != null){
                model.addAttribute("imgFileSmall", URLEncoder.encode(tbEvent.getImgFileSmall(),"UTF-8"));
            } else {
                model.addAttribute("imgFileSmall", null);
            }
        } catch (Exception e){
            e.printStackTrace();
        }*/

        TbEvent tbEvent = boardService.getTbEventDetail(eventNo);
        model.addAttribute("tbEvent", tbEvent);
        model.addAttribute("permission",map.get("permission"));
        model.addAttribute("downloadAble",map.get("downloadAble"));
        return new ModelAndView("jesica/board/event/detail");
    }




    @GetMapping("/platforminquiry/list")
    public ModelAndView listPlatformInquiry() {

        return new ModelAndView("jesica/board/platforminquiry/list");
    }

    @GetMapping("/platforminquiry/detail")
    public ModelAndView detailPlatformInquiry() {

        return new ModelAndView("jesica/board/platforminquiry/detail");
    }

    @GetMapping("/bursimcust/list")
    public ModelAndView listBursimCustomerNotice() {

        return new ModelAndView("jesica/board/bursimcust/list");
    }

    @GetMapping("/bursimcust/insert")
    public ModelAndView insertBursimCustomerNotice() {

        return new ModelAndView("jesica/board/bursimcust/insert");
    }

    @GetMapping("/bursimcust/detail")
    public ModelAndView detailBursimCustomerNotice() {

        return new ModelAndView("jesica/board/bursimcust/detail");
    }

    @GetMapping("/banner/list")
    public ModelAndView listAppBanner(
            @RequestParam(required = false) Long appService,
            Model model,
            HttpSession session
    ) {
        Map<String, Object> map = permission(session, "board/banner");

        try {
            model.addAttribute("appServiceList", serviceService.getServiceList());
            model.addAttribute("appVersionList", apiService.systemCodeList("AC"));

            Map<String, Object> viewSearchValue = new HashMap<>();
            viewSearchValue.put("serviceNo", appService); // JSP selected 유지용
            model.addAttribute("searchValue", viewSearchValue);

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("permission", map.get("permission"));
        model.addAttribute("downloadAble", map.get("downloadAble"));
        return new ModelAndView("jesica/board/banner/list");
    }

    @GetMapping("/bannerSp/list")
    public ModelAndView listAppBannerSp(
            @RequestParam(required = false) Long appService,
            Model model,
            HttpSession session
    ) {
        Map<String, Object> map = permission(session, "board/banner");

        try {
            List<TbSystemCode> sidoList = apiService.systemCodeList("A1");
            List<HashMap<String, String>> areaArray = new ArrayList<>();
            for(TbSystemCode areaList : sidoList){
                HashMap<String, String> appMap = new HashMap<>();
                appMap.put("locationName",areaList.getCodeName());
                appMap.put("locationNo",areaList.getSysCode());
                areaArray.add(appMap);
            }

            /*model.addAttribute("appServiceList", serviceService.getServiceList());*/
            model.addAttribute("locationList", areaArray);
            model.addAttribute("appVersionList", apiService.systemCodeList("AC"));

            Map<String, Object> viewSearchValue = new HashMap<>();
            viewSearchValue.put("serviceNo", appService); // JSP selected 유지용
            model.addAttribute("searchValue", viewSearchValue);

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("permission", map.get("permission"));
        model.addAttribute("downloadAble", map.get("downloadAble"));
        return new ModelAndView("jesica/board/bannerSp/list");
    }

    @GetMapping("/banner/insert")
    public ModelAndView insertAppBanner(Model model, HttpSession session) {
        Map<String,Object> map = permission(session,"board/banner");

        List<TbSystemCode> sysCodeList =  apiService.systemCodeList("A1");
        List<TbSystemCode> sysCodeList2 =  apiService.systemCodeList("A2","11%");
        List<TbSystemCode> sysLangCode = apiService.systemCodeList("LANG");
        //List<TbAppVersion> appVersionList = apiService.getAppVersionListTypeOne(appCode);

        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        List<TbAppService> appServiceList = apiService.getAppServiceList();
        model.addAttribute("appVersionList",appVersionList);

        model.addAttribute("appServiceList" , appServiceList);
        model.addAttribute("sysCodeList" , sysCodeList);
        model.addAttribute("sysCodeList2" , sysCodeList2);
        model.addAttribute("sysLangCode",sysLangCode);
        model.addAttribute("appVersionList",appVersionList);
        model.addAttribute("appCode",map.get("appCode"));
        model.addAttribute("permission",map.get("permission"));
        model.addAttribute("downloadAble",map.get("downloadAble"));

        return new ModelAndView("jesica/board/banner/insert");
    }

    @GetMapping("/bannerSp/insert")
    public ModelAndView insertAppBannerSp(Model model, HttpSession session) {
        Map<String,Object> map = permission(session,"board/banner");

        List<TbSystemCode> sysCodeList =  apiService.systemCodeList("A1");
        List<TbSystemCode> sysCodeList2 =  apiService.systemCodeList("A2","11%");
        List<TbSystemCode> sysLangCode = apiService.systemCodeList("LANG");
        //List<TbAppVersion> appVersionList = apiService.getAppVersionListTypeOne(appCode);

        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        List<TbAppService> appServiceList = apiService.getAppServiceList();
        model.addAttribute("appVersionList",appVersionList);

        model.addAttribute("appServiceList" , appServiceList);
        model.addAttribute("sysCodeList" , sysCodeList);
        model.addAttribute("sysCodeList2" , sysCodeList2);
        model.addAttribute("sysLangCode",sysLangCode);
        model.addAttribute("appVersionList",appVersionList);
        model.addAttribute("appCode",map.get("appCode"));
        model.addAttribute("permission",map.get("permission"));
        model.addAttribute("downloadAble",map.get("downloadAble"));

        return new ModelAndView("jesica/board/bannerSp/insert");
    }

    @GetMapping("/banner/detail")
    public ModelAndView detailAppBanner(@RequestParam("bannerNo") Long bannerNo, Model model, HttpSession session) {
        log.info("bannerNo:: ", bannerNo);
        Map<String,Object> map = permission(session,"board/banner");

        try {
            TbAppBanner tbAppBanner = boardService.tbAppBannerDetail(bannerNo);
            List<TbAppBannerLocationDTO> tbAppBannerLocation = boardService.getAppBannerLocation(bannerNo);
            List<TbSystemCode> sysCodeList =  apiService.systemCodeList("A1");
            List<TbSystemCode> sysCodeList2 =  apiService.systemCodeList("A2","11%");
            List<TbSystemCode> sysLangCode = apiService.systemCodeList("LANG");
            //List<TbAppVersion> appVersionList = apiService.getAppVersionListTypeOne(appCode);
            List<TbAppService> appServiceList = apiService.getAppServiceList();
            List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
            model.addAttribute("appVersionList",appVersionList);
            model.addAttribute("appServiceList" , appServiceList);
            model.addAttribute("sysCodeList" , sysCodeList);
            model.addAttribute("sysCodeList2" , sysCodeList2);
            model.addAttribute("sysLangCode",sysLangCode);
            model.addAttribute("appCode",map.get("appCode"));

            String url = "";
            if (ObjectUtils.isNotEmpty(tbAppBanner.getBannerFile())) {
                url = URLEncoder.encode(tbAppBanner.getBannerFile(), "UTF-8");
            }
            if (ObjectUtils.isNotEmpty(tbAppBannerLocation)) {
                model.addAttribute("appBannerLocation" , tbAppBannerLocation);
            } else {
                model.addAttribute("appBannerLocation" , null);
            }

            model.addAttribute("tbAppBanner", tbAppBanner);
            model.addAttribute("imgFile", url);
            model.addAttribute("permission",map.get("permission"));
            model.addAttribute("downloadAble",map.get("downloadAble"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/board/banner/detail");
    }

    @GetMapping("/bannerSp/detail")
    public ModelAndView detailAppBannerSp(@RequestParam("bannerNo") Long bannerNo, Model model, HttpSession session) {
        log.info("bannerNo:: ", bannerNo);
        Map<String,Object> map = permission(session,"board/banner");

        try {
            TbAppBanner tbAppBanner = boardService.tbAppBannerDetail(bannerNo);
            List<TbAppBannerLocationDTO> tbAppBannerLocation = boardService.getAppBannerLocation(bannerNo);
            List<TbSystemCode> sysCodeList =  apiService.systemCodeList("A1");
            List<TbSystemCode> sysCodeList2 =  apiService.systemCodeList("A2","11%");
            List<TbSystemCode> sysLangCode = apiService.systemCodeList("LANG");
            //List<TbAppVersion> appVersionList = apiService.getAppVersionListTypeOne(appCode);
            List<TbAppService> appServiceList = apiService.getAppServiceList();
            List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
            model.addAttribute("appVersionList",appVersionList);
            model.addAttribute("appServiceList" , appServiceList);
            model.addAttribute("sysCodeList" , sysCodeList);
            model.addAttribute("sysCodeList2" , sysCodeList2);
            model.addAttribute("sysLangCode",sysLangCode);
            model.addAttribute("appCode",map.get("appCode"));

            String url = "";
            if (ObjectUtils.isNotEmpty(tbAppBanner.getBannerFile())) {
                url = URLEncoder.encode(tbAppBanner.getBannerFile(), "UTF-8");
            }
            if (ObjectUtils.isNotEmpty(tbAppBannerLocation)) {
                model.addAttribute("appBannerLocation" , tbAppBannerLocation);
            } else {
                model.addAttribute("appBannerLocation" , null);
            }

            model.addAttribute("tbAppBanner", tbAppBanner);
            model.addAttribute("imgFile", url);
            model.addAttribute("permission",map.get("permission"));
            model.addAttribute("downloadAble",map.get("downloadAble"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/board/bannerSp/detail");
    }

    @GetMapping("/management/list")
    public ModelAndView listCoupon(@RequestParam Map<String, Object> searchValue,
                                   Model model, HttpSession session) {
        log.info("@@searchValue {}", searchValue);
        try {
            if (ObjectUtils.isNotEmpty(searchValue)) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
                searchValue.put("startDate","2020-01-01");
                searchValue.put("endDate", DateUtil.now_yyyy_mm_dd());
            }

            List<TbCoupon> resultList = boardService.tbCouponSearch(searchValue);
            model.addAttribute("tbCouponList", resultList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("jesica/board/management/list");
    }

    @GetMapping("/management/insert")
    public ModelAndView insertCoupon() {

        return new ModelAndView("jesica/board/management/insert");
    }

    @GetMapping("/management/detail")
    public ModelAndView detailCoupon(@RequestParam("couponNo") Long couponNo, Model model) {
        log.info("couponNo:: ", couponNo);

        try {
            //쿠폰정보
            Map detailCouponMap = boardService.getCouponDetail(couponNo);
            TbCoupon tbCoupon = (TbCoupon)detailCouponMap.get("tbCoupon");
            model.addAttribute("tbCoupon", tbCoupon);

            //쿠폰 개별정보
            List<Map<String, Object>> unUsedUsers = (List<Map<String, Object>>)detailCouponMap.get("unUsedUsers");
            List<Map<String, Object>> usedUsers = (List<Map<String, Object>>)detailCouponMap.get("usedUsers");
            model.addAttribute("unUsedUsers", unUsedUsers);
            model.addAttribute("usedUsers", usedUsers);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/board/management/detail");
    }

    /**
     * 고객 리스트
     */
    @GetMapping("/cust/list")
    public ModelAndView listCust(HttpSession session, @RequestParam Map<String, Object> searchValue, Model model) {
        log.info("@@searchValue::{}", searchValue);
        Map<String,Object> map = permission(session,"board/cust");

        searchValue.put("appCode",map.get("appCode"));

        searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_week());
        searchValue.put("endDate", DateUtil.now_yyyy_mm_dd());

        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        model.addAttribute("appVersionList",appVersionList);
        model.addAttribute("searchValue", searchValue);
        model.addAttribute("permission",map.get("permission"));
        model.addAttribute("downloadAble",map.get("downloadAble"));

        return new ModelAndView("jesica/board/customer/list");
    }

    /**
     * 고객 상세
     */
    @GetMapping("/cust/detail")
    public ModelAndView detailCust(HttpSession session,@RequestParam Long custNo, Model model) {
        log.info("@@custNo:: ", custNo);

        try {
            Map<String,Object> mapCust = permission(session,"board/cust");
            Map<String, Object> map = boardService.getCustDetail(custNo);
            List<Map<String,Object>> friends = boardService.getFriends(custNo);
            List<TbSystemCode> sysCodeList =  apiService.systemCodeList("A1");

            model.addAttribute("sysCodeList" , sysCodeList);
            model.addAttribute("friends" , friends);
            model.addAttribute("tbCust", map.get("tbCust"));
            model.addAttribute("tbCustUsedCouponList", map.get("tbCustUsedCoupon"));
            model.addAttribute("tbCustUnUsedCouponList", map.get("tbCustUnUsedCoupon"));
            model.addAttribute("tbPointHistoryList", map.get("tbPointHistory"));
            model.addAttribute("tbCustLocation", map.get("tbCustLocation"));
            model.addAttribute("permission",mapCust.get("permission"));
            model.addAttribute("downloadAble",mapCust.get("downloadAble"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/board/customer/detail");
    }



    private void putSearchOption(HttpSession session, Map<String,Object> searchValue) {
        session.setAttribute("headNo", searchValue.get("headNo"));
        session.setAttribute("headNoText", searchValue.get("headNoText"));
        session.setAttribute("branchNo", searchValue.get("branchNo"));
        session.setAttribute("branchNoText", searchValue.get("branchNoText"));
        session.setAttribute("storeNo", searchValue.get("storeNo"));
        session.setAttribute("storeNoText", searchValue.get("storeNoText"));
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
