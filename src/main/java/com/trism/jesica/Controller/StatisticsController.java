package com.trism.jesica.Controller;

import com.trism.jesica.Service.ApiService;
import com.trism.jesica.Service.StatisticsService;
import com.trism.jesica.Util.DateUtil;
import com.trism.jesica.persistence.Entitiy.business.TbStore;
import com.trism.jesica.persistence.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.Entitiy.common.LoginSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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

@RequestMapping("/statistics")
@RestController
@RequiredArgsConstructor
@Slf4j
public class StatisticsController {
    private final StatisticsService statisticsService;
    private final ApiService apiService;

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
        if (!searchValue.isEmpty()){

            List<Map<String,Object>> timeList = null;
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;
            Integer platfromCode = null;
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
            timeList =  statisticsService.getUserList(startDate,endDate, platfromCode );
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
            timeList =  statisticsService.getUserList(startDate,endDate, platfromCode );
            model.addAttribute("timeList",timeList);

        }
        model.addAttribute("searchValue",searchValue);
        return new ModelAndView("jesica/statistics/user/list");
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

            String ordPathCd = null;
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
            timeList =  statisticsService.getMannaOrderList(startDate,endDate, ordPathCd );
            model.addAttribute("timeList",timeList);
        } else {

            List<Map<String,Object>> timeList = null;
            String ordPathCd = null;
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
            timeList =  statisticsService.getMannaOrderList(startDate,endDate, ordPathCd );
            model.addAttribute("timeList",timeList);

        }
        model.addAttribute("searchValue",searchValue);
        return new ModelAndView("jesica/statistics/washing/list");
    }
    @GetMapping("/restaurant/list")
    public ModelAndView listByRestaurant(@RequestParam Map<String,Object> searchValue,
                                   HttpSession session,
                                   Model model) {
        log.info("@@searchValue {}",searchValue);
        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String company = loginSession.getCompany();
        if (!searchValue.isEmpty()){

            List<Map<String,Object>> timeList = null;
            LocalDateTime startDate = null;
            LocalDateTime endDate = null;
            String ordPathCd = null;
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
            timeList =  statisticsService.getMannaOrderList(startDate,endDate, ordPathCd );
            model.addAttribute("timeList",timeList);
        } else {

            List<Map<String,Object>> timeList = null;
            String ordPathCd = null;
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
            timeList =  statisticsService.getMannaOrderList(startDate,endDate, ordPathCd );
            model.addAttribute("timeList",timeList);

        }
        model.addAttribute("searchValue",searchValue);
        return new ModelAndView("jesica/statistics/restaurant/list");
    }


    //지역별통계(추후진행)
    @GetMapping("/location/list")
    public ModelAndView listByLocation() {
        return new ModelAndView("jesica/statistics/location/list");
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
