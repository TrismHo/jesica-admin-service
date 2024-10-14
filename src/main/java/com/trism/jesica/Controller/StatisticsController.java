package com.trism.jesica.Controller;

import com.trism.jesica.Service.ApiService;
import com.trism.jesica.Service.AuthService;
import com.trism.jesica.Service.BrCodeService;
import com.trism.jesica.Service.StatisticsService;
import com.trism.jesica.Util.DateUtil;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbStore;
import com.trism.jesica.persistence.mysql.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.mysql.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteAcl;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteMenu;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RequestMapping("/statistics")
@RestController
@RequiredArgsConstructor
@Slf4j
public class StatisticsController {
    private final StatisticsService statisticsService;

    private final BrCodeService brCodeService;
    private final ApiService apiService;
    @Autowired
    private final AuthService authService;

    //시간대별 통계
    @GetMapping("/time/list")
    public ModelAndView listByTime(@RequestParam Map<String,Object> searchValue,
                                   Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        if (!searchValue.isEmpty()){
            List<Map<String,Object>> timeList = null;
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            if (searchValue.get("startDate") != null) {
                String string = searchValue.get("startDate").toString() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            } else {
                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("endDate") != null) {
                String string = searchValue.get("endDate").toString() + " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            } else {
                String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("day") != "" && searchValue.get("orderTypeCode") != "") {
                 timeList =  statisticsService.getTimeList(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString());
            }
            if(searchValue.get("day") == "" && searchValue.get("orderTypeCode") != "") {
                timeList =  statisticsService.getTimeListOrderType(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString());
            }
            if(searchValue.get("day") != "" && searchValue.get("orderTypeCode") == "") {
                timeList =  statisticsService.getTimeListDay(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString());
            }
            if(searchValue.get("day") == "" && searchValue.get("orderTypeCode") == "") {
                timeList =  statisticsService.getTimeListAll(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString());
            }

            model.addAttribute("timeList",timeList);
        } else {
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;

            searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
            searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());
            searchValue.put("selectDay", "");
            searchValue.put("orderTypeCode", "");
            searchValue.put("day", "");

            String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
            String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            startDate = LocalDateTime.parse(string, formatter);
            endDate = LocalDateTime.parse(string1, formatter);

            List<Map<String,Object>> timeList =  statisticsService.getTimeListAll(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString());

            model.addAttribute("timeList",timeList);

        }
        model.addAttribute("searchValue",searchValue);
        return new ModelAndView("jesica/statistics/time/list");
    }

    //일별통계
    @GetMapping("/day/list")
    public ModelAndView listByDay(@RequestParam Map<String,Object> searchValue,
                                   Model model, HttpSession session) {
        log.info("@@searchValue {}",searchValue);
        List<TbStore> tbStoreList = apiService.getStoreList();

        if (!searchValue.isEmpty()){
            List<Map<String,Object>> timeList = null;
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            if (searchValue.get("startDate") != null) {
                String string = searchValue.get("startDate").toString() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            } else {
                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("endDate") != null) {
                String string = searchValue.get("endDate").toString() + " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            } else {
                String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            }
            if( !"-1".equals(searchValue.get("storeNo").toString())) {
                if (searchValue.get("day") != "" && searchValue.get("orderTypeCode") != "") {
                    timeList =  statisticsService.getDayList(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString() ,searchValue.get("storeNo").toString());
                }
                if(searchValue.get("day") == "" && searchValue.get("orderTypeCode") != "") {
                    timeList =  statisticsService.getDayListOrderType(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString(),searchValue.get("storeNo").toString());
                }
                if(searchValue.get("day") != "" && searchValue.get("orderTypeCode") == "") {
                    timeList =  statisticsService.getDayListDay(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString(),searchValue.get("storeNo").toString());
                }
                if(searchValue.get("day") == "" && searchValue.get("orderTypeCode") == "") {
                    timeList =  statisticsService.getDayListAll(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString(),searchValue.get("storeNo").toString());
                }
            } else {
                if (searchValue.get("day") != "" && searchValue.get("orderTypeCode") != "") {
                    timeList =  statisticsService.getDayList(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString());
                }
                if(searchValue.get("day") == "" && searchValue.get("orderTypeCode") != "") {
                    timeList =  statisticsService.getDayListOrderType(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString());
                }
                if(searchValue.get("day") != "" && searchValue.get("orderTypeCode") == "") {
                    timeList =  statisticsService.getDayListDay(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString());
                }
                if(searchValue.get("day") == "" && searchValue.get("orderTypeCode") == "") {
                    timeList =  statisticsService.getDayListAll(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString());
                }
            }

            model.addAttribute("timeList",timeList);
        } else {
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;

            searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
            searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());
            searchValue.put("selectDay", "");
            searchValue.put("orderTypeCode", "");
            searchValue.put("day", "");
            searchValue.put("storeNo", "-1");

            String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
            String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            startDate = LocalDateTime.parse(string, formatter);
            endDate = LocalDateTime.parse(string1, formatter);

            List<Map<String,Object>> timeList =  statisticsService.getDayListAll(searchValue.get("orderTypeCode").toString(),startDate,endDate,searchValue.get("day").toString());

            model.addAttribute("timeList",timeList);


        }
        model.addAttribute("tbStoreList",tbStoreList);
        model.addAttribute("searchValue",searchValue);
        return new ModelAndView("jesica/statistics/day/list");
    }

    //주별통계
    @GetMapping("/week/list")
    public ModelAndView listByWeek(@RequestParam Map<String,Object> searchValue,
                                   Model model) {
        log.info("@@searchValue {}",searchValue);
        if (!searchValue.isEmpty()){
            List<Map<String,Object>> timeList = null;
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            if (searchValue.get("startDate") != null) {
                String string = searchValue.get("startDate").toString() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            } else {
                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("endDate") != null) {
                String string = searchValue.get("endDate").toString() + " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            } else {
                String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            }
            if ( searchValue.get("orderTypeCode") != "") {
                timeList =  statisticsService.getWeekListOrderType(searchValue.get("orderTypeCode").toString(),startDate,endDate);
            } else {
                timeList =  statisticsService.getWeekListAll(startDate,endDate);
            }

            model.addAttribute("timeList",timeList);
        } else {
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;

            searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
            searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());
            searchValue.put("selectDay", "");
            searchValue.put("orderTypeCode", "");

            String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
            String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            startDate = LocalDateTime.parse(string, formatter);
            endDate = LocalDateTime.parse(string1, formatter);

            List<Map<String,Object>> timeList =  statisticsService.getWeekListAll(startDate,endDate);

            model.addAttribute("timeList",timeList);

        }
        model.addAttribute("searchValue",searchValue);

        return new ModelAndView("jesica/statistics/week/list");
    }

    //안심번호 할당통게
    @GetMapping("/safetynumber/list")
    public ModelAndView listBySafetynumber(@RequestParam Map<String,Object> searchValue,
                                   Model model) {
        log.info("@@searchValue {}",searchValue);
        if (!searchValue.isEmpty()){
            List<Map<String,Object>> safenList = null;
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            if (searchValue.get("startDate") != null) {
                String string = searchValue.get("startDate").toString() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            } else {
                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("endDate") != null) {
                String string = searchValue.get("endDate").toString() + " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            } else {
                String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            }
            if ( searchValue.get("storeNo") != "") {
                safenList =  statisticsService.getSafenNumberList(searchValue.get("storeNo").toString(),startDate,endDate);
            } else {
                safenList =  statisticsService.getSafenNumberListAll(startDate,endDate);
            }

            model.addAttribute("safenList",safenList);
        } else {
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;

            searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
            searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());
            searchValue.put("selectDay", "");
            searchValue.put("orderTypeCode", "");

            String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
            String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            startDate = LocalDateTime.parse(string, formatter);
            endDate = LocalDateTime.parse(string1, formatter);

            List<Map<String,Object>> safenNumberList =  statisticsService.getSafenNumberListAll(startDate,endDate);

            model.addAttribute("safenNumberList",safenNumberList);

        }

        List<TbStoreRentalCar> resultList = null;
        List<TbStore> tbStoreList = apiService.getStoreList();

        model.addAttribute("tbStoreList", tbStoreList);
        model.addAttribute("searchValue",searchValue);

        return new ModelAndView("jesica/statistics/safetynumber/list");
    }


    //월별통계
    @GetMapping("/month/list")
    public ModelAndView listByMonth(@RequestParam Map<String,Object> searchValue,
                                    Model model) {
        log.info("@@searchValue {}",searchValue);
        if (!searchValue.isEmpty()){
            List<Map<String,Object>> timeList = null;
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            if (searchValue.get("startDate") != null) {
                String string = searchValue.get("startDate").toString() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            } else {
                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("endDate") != null) {
                String string = searchValue.get("endDate").toString() + " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            } else {
                String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            }
            if ( searchValue.get("orderTypeCode") != "") {
                timeList =  statisticsService.getMonthListOrderType(searchValue.get("orderTypeCode").toString(),startDate,endDate);
            } else {
                timeList =  statisticsService.getMonthListAll(startDate,endDate);
            }

            model.addAttribute("timeList",timeList);
        } else {
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;

            searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
            searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());
            searchValue.put("selectDay", "");
            searchValue.put("orderTypeCode", "");

            String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
            String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            startDate = LocalDateTime.parse(string, formatter);
            endDate = LocalDateTime.parse(string1, formatter);

            List<Map<String,Object>> timeList =  statisticsService.getMonthListAll(startDate,endDate);

            model.addAttribute("timeList",timeList);

        }
        model.addAttribute("searchValue",searchValue);

        return new ModelAndView("jesica/statistics/month/list");
    }

    //기본통계
    @GetMapping("/base/list")
    public ModelAndView listByBase(@RequestParam Map<String,Object> searchValue,
                                   Model model) {
        log.info("@@searchValue {}",searchValue);
        List<Map<String,Object>> timeList = null;
        if (!searchValue.isEmpty()){
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            if (searchValue.get("startDate") != null) {
                String string = searchValue.get("startDate").toString() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            } else {
                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("endDate") != null) {
                String string = searchValue.get("endDate").toString() + " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            } else {
                String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            }
                timeList =  statisticsService.getBaseList("%"+searchValue.get("storeName").toString()+"%", startDate, endDate);
        } else {
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;

            searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
            searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());

            String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
            String string1 =  DateUtil.now_yyyy_mm_dd()+ " 23:59:59";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            startDate = LocalDateTime.parse(string, formatter);
            endDate = LocalDateTime.parse(string1, formatter);

            timeList =  statisticsService.getBaseList("%%",startDate,endDate);
        }

        model.addAttribute("timeList",timeList);
        model.addAttribute("searchValue",searchValue);
        return new ModelAndView("jesica/statistics/base/list");
    }

    //회원통계
    @GetMapping("/user/list")
    public ModelAndView listByUser(@RequestParam Map<String,Object> searchValue,
                                   HttpSession session,
                                   Model model) {
        log.info("@@searchValue {}",searchValue);
        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String company = loginSession.getCompany();
        List<Map<String,Object>> brCodeList = null;
        // 총판 리스트 조회
        brCodeList = brCodeService.getBrCodeList();

        // cust extBrCode 조회

        if (!searchValue.isEmpty()){

            List<Map<String,Object>> timeList = null;
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;
            Integer platfromCode = null;
            String extBrCode = null;
            if("jesicar".equals(company)) {
                platfromCode = 1;
                searchValue.put("platformType","1");
            } else if ("yangpa".equals(company)) {
                platfromCode = 2;
                searchValue.put("platformType","2");
            }
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            if (searchValue.get("startDate") != null) {
                String string = searchValue.get("startDate").toString() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            } else {
                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("endDate") != null) {
                String string = searchValue.get("endDate").toString() + " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            } else {
                String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("extBrCode") != null) {
                extBrCode = searchValue.get("extBrCode").toString();
            } else {
                extBrCode = "";
            }
   /*         timeList =  statisticsService.getUserList(startDate,endDate, platfromCode );
            model.addAttribute("timeList",timeList);*/
        } else {

            List<Map<String,Object>> timeList = null;
            Integer platfromCode = null;
            if("jesicar".equals(company)) {
                platfromCode = 1;
                searchValue.put("platformType","1");
            } else if ("yangpa".equals(company)) {
                platfromCode = 2;
                searchValue.put("platformType","2");
            }
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;

            searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
            searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());

            String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
            String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            startDate = LocalDateTime.parse(string, formatter);
            endDate = LocalDateTime.parse(string1, formatter);
         /*   timeList =  statisticsService.getUserList(startDate,endDate, platfromCode );
            model.addAttribute("timeList",timeList);*/

        }
        model.addAttribute("searchValue",searchValue);
        model.addAttribute("brCodeList",brCodeList);
        return new ModelAndView("jesica/statistics/user/list");
    }



    //회원통계
    @GetMapping("/location/list")
    public ModelAndView listByUserLocation(@RequestParam Map<String,Object> searchValue,
                                   HttpSession session,
                                   Model model) {
        log.info("@@searchValue {}",searchValue);
        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String company = loginSession.getCompany();
        List<Map<String,Object>> brCodeList = null;
        // 총판 리스트 조회
        brCodeList = brCodeService.getBrCodeList();

        // cust extBrCode 조회

        if (!searchValue.isEmpty()){

            List<Map<String,Object>> timeList = null;
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;
            Integer platfromCode = null;
            String extBrCode = null;
            if("jesicar".equals(company)) {
                platfromCode = 1;
                searchValue.put("platformType","1");
            } else if ("yangpa".equals(company)) {
                platfromCode = 2;
                searchValue.put("platformType","2");
            }
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            if (searchValue.get("startDate") != null) {
                String string = searchValue.get("startDate").toString() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            } else {
                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("endDate") != null) {
                String string = searchValue.get("endDate").toString() + " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            } else {
                String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("extBrCode") != null) {
                extBrCode = searchValue.get("extBrCode").toString();
            } else {
                extBrCode = "";
            }
            model.addAttribute("timeList",timeList);
        } else {

            List<Map<String,Object>> timeList = null;
            Integer platfromCode = null;
            if("jesicar".equals(company)) {
                platfromCode = 1;
                searchValue.put("platformType","1");
            } else if ("yangpa".equals(company)) {
                platfromCode = 2;
                searchValue.put("platformType","2");
            }
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;

            searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
            searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());

            String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
            String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            startDate = LocalDateTime.parse(string, formatter);
            endDate = LocalDateTime.parse(string1, formatter);
            model.addAttribute("timeList",timeList);

        }
        model.addAttribute("searchValue",searchValue);
        model.addAttribute("brCodeList",brCodeList);
        return new ModelAndView("jesica/statistics/location/list");
    }

    @GetMapping("/washing/list")
    public ModelAndView listByWashing(@RequestParam Map<String,Object> searchValue,
                                   HttpSession session,
                                   Model model) {
        log.info("@@searchValue {}",searchValue);
        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String company = loginSession.getCompany();
        if (!searchValue.isEmpty()){

            List<Map<String,Object>> timeList = null;
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;
            Integer platfromCode = null;
            String brCode = null;
            String ordPathCd = null;
            String ordStatus = null;
            if("jesicar".equals(company)) {
                ordPathCd = "1063";
                searchValue.put("ordPathCd","1063");
            } else if ("yangpa".equals(company)) {
                ordPathCd = "1069";
                searchValue.put("ordPathCd","1069");
            }
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            if (searchValue.get("startDate") != null) {
                String string = searchValue.get("startDate").toString() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            } else {
                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("endDate") != null) {
                String string = searchValue.get("endDate").toString() + " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            } else {
                String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            }
            timeList =  statisticsService.getMannaOrderList(startDate,endDate, ordPathCd ,brCode, ordStatus);
            model.addAttribute("timeList",timeList);
        } else {

            List<Map<String,Object>> timeList = null;
            String ordPathCd = null;
            String brCode = null;
            String ordStatus = null;
            if("jesicar".equals(company)) {
                ordPathCd = "1063";
                searchValue.put("ordPathCd","1063");
            } else if ("yangpa".equals(company)) {
                ordPathCd = "1069";
                searchValue.put("ordPathCd","1069");
            }
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;

            searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
            searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());

            String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
            String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            startDate = LocalDateTime.parse(string, formatter);
            endDate = LocalDateTime.parse(string1, formatter);
            timeList =  statisticsService.getMannaOrderList(startDate,endDate, ordPathCd ,brCode,ordStatus);
            model.addAttribute("timeList",timeList);

        }
        model.addAttribute("searchValue",searchValue);
        return new ModelAndView("jesica/statistics/washing/list");
    }
    @GetMapping("/order/list")
    public ModelAndView listByRestaurant(@RequestParam Map<String,Object> searchValue,
                                   HttpSession session,
                                   Model model) {
        log.info("@@searchValue {}",searchValue);
        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String company = loginSession.getCompany();
        List<Map<String,Object>> brCodeList = null;
        // 총판 리스트 조회
        brCodeList = brCodeService.getBrCodeList();

        if (!searchValue.isEmpty()){

            List<Map<String,Object>> timeList = null;
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;
            String ordPathCd = null;
            String brCode = null;
            String ordStatus = null;
            if("jesicar".equals(company)) {
                ordPathCd = "1063";
                searchValue.put("ordPathCd","1063");
            } else if ("yangpa".equals(company)) {
                ordPathCd = "1069";
                searchValue.put("ordPathCd","1069");
            }
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            if (searchValue.get("startDate") != null) {
                String string = searchValue.get("startDate").toString() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            } else {
                String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
                startDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("endDate") != null) {
                String string = searchValue.get("endDate").toString() + " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            } else {
                String string =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
                endDate = LocalDateTime.parse(string, formatter);
            }
            if (searchValue.get("brCode") != null) {
                brCode = searchValue.get("brCode").toString();
            }
            if (searchValue.get("ordStatus") != null) {
                ordStatus = searchValue.get("ordStatus").toString();
            }
            timeList =  statisticsService.getMannaOrderList(startDate,endDate, ordPathCd, brCode, ordStatus);
            model.addAttribute("timeList",timeList);
        } else {

            List<Map<String,Object>> timeList = null;
            String ordPathCd = null;
            String brCode = null;
            String ordStatus = null;
            if("jesicar".equals(company)) {
                ordPathCd = "1063";
                searchValue.put("ordPathCd","1063");
            } else if ("yangpa".equals(company)) {
                ordPathCd = "1069";
                searchValue.put("ordPathCd","1069");
            }
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;

            searchValue.put("startDate",DateUtil.now_yyyy_mm_dd_month());
            searchValue.put("endDate", DateUtil.now_yyyy_mm_dd_yester());

            String string = DateUtil.now_yyyy_mm_dd_month() + " 00:00:00";
            String string1 =  DateUtil.now_yyyy_mm_dd_yester()+ " 23:59:59";
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            startDate = LocalDateTime.parse(string, formatter);
            endDate = LocalDateTime.parse(string1, formatter);
            timeList =  statisticsService.getMannaOrderList(startDate,endDate, ordPathCd, brCode , ordStatus);
            model.addAttribute("timeList",timeList);

        }
        model.addAttribute("searchValue",searchValue);
        model.addAttribute("brCodeList",brCodeList);
        return new ModelAndView("jesica/statistics/order/list");
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
                    map.put("downloadChk",1);
                    map.put("permission",2);
                }else {
                    permission = authService.getTbSiteAcl(nLong,siteMenu.get().getMenuNo());
                    map.put("downloadChk",permission.getDownloadAble());
                    if(!ObjectUtils.isEmpty(permission)){
                        map.put("permission",permission.getPermission());
                    } else {
                        map.put("permission",0);
                    }
                }
            }
        } else {
            map.put("downloadChk",0);
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
