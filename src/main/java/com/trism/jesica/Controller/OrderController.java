package com.trism.jesica.Controller;

import com.trism.jesica.Service.OrderService;
import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderAll;
import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderDay;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSystemCode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@RequestMapping("/order")
@RestController
@RequiredArgsConstructor
@Slf4j
public class OrderController {

    private final OrderService orderService;

    /**
     * 금일 주문내역
     */
    @GetMapping("/day/list")
    public ModelAndView orderDayList(@RequestParam Map<String,Object> searchValue,
                                           Model model, HttpSession session) {

        log.info("@@searchValue {}",searchValue);
        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            List<TbOrderDay> resultList =  orderService.tbOrderDayList(searchValue);
            //주문 카테고리 조회
            List<TbSystemCode> tbSystemCode = orderService.searchTbSystemCode("OP");


            //List<TbOrderDayExtra> resultList =  orderService.tbOrderDayExtraList(searchValue);
            model.addAttribute("dayList", resultList);
            model.addAttribute("tbSystemCode", tbSystemCode);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("/jesica/order/day/list");
    }

    /**
     * 금일 주문내역 상세
     */
    @GetMapping("/day/detail")
    public ModelAndView dayDetail(@RequestParam Long orderNo,Model model) {
        log.info("@@orderNo {}",orderNo);

        try {
            model.addAttribute("orderDetail",orderService.getOrderDetail(orderNo));
           model.addAttribute("orderCharge",orderService.getOrderCharge(orderNo));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/order/day/detail");
    }


    /**
     * 과거 주문내역
     */
    @GetMapping("/old/list")
    public ModelAndView orderOldList(@RequestParam Map<String,Object> searchValue,
                                           Model model, HttpSession session) {

        log.info("@@searchValue {}",searchValue);

        try {
            if (!searchValue.isEmpty()) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }
            if(searchValue.get("endDate") == null && searchValue.get("startDate") == null) {
                Calendar c1 = new GregorianCalendar();
                Calendar c2 = new GregorianCalendar();
                c1.add(Calendar.DATE, -30);
                c2.add(Calendar.DATE, -1);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포맷
                String yesterday = sdf.format(c1.getTime()); // String으로 저장
                String today = sdf.format(c2.getTime()); // String으로 저장
                searchValue.put("endDate",yesterday+ " 00:00:00");
                searchValue.put("startDate",today+ " 23:59:59");
            }

            if(searchValue.get("storeNo") == null) {
                searchValue.put("storeNo","0");
            }
            List<TbOrderAll> resultList =  orderService.tbOrderAllList(searchValue);

            List<TbSystemCode> tbSystemCode = orderService.searchTbSystemCode("OP");
            model.addAttribute("tbSystemCode", tbSystemCode);
            //List<TbOrderAllExtra> resultList =  orderService.tbOrderAllList(searchValue);
            model.addAttribute("oldList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("/jesica/order/old/list");
    }

    /**
     * 과거 주문내역 상세
     */
    @GetMapping("/old/detail")
    public ModelAndView oldDetail(@RequestParam Long orderNo,Model model) {
        log.info("@@orderNo {}",orderNo);

        try {
            model.addAttribute("orderDetail",orderService.getOrderAllDetail(orderNo));
            model.addAttribute("orderCharge",orderService.getOrderCharge(orderNo));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/order/old/detail");
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
     * 과거 주문내역(탁송)
     */
   /* @GetMapping("/consignment/list")
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
            List<TbCallAll> resultList =  orderService.tbCallAllList(searchValue);
            List<TbSystemCode> tbSystemCode = orderService.searchTbSystemCode("OP");
            model.addAttribute("tbSystemCode", tbSystemCode);
            model.addAttribute("consignmentList", resultList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("/jesica/order/consignment/list");
    }

    *//**
     * 과거 주문내역 상세(탁송)
     *//*
    @GetMapping("/consignment/detail")
    public ModelAndView consignmentDetail(@RequestParam Long orderNo,Model model) {
        log.info("@@orderNo {}",orderNo);

        try {
            //;
            TbCallAll tbCallAll = orderService.getCallAllDetail(orderNo);
            List<TbSystemCode> tbSystemCodeAll = orderService.searchTbSystemCodeAll();
            model.addAttribute("callDetail",tbCallAll);
            model.addAttribute("tbSystemCodeAll",tbSystemCodeAll);
            model.addAttribute("callCharge",orderService.getCallCharge(orderNo));
            model.addAttribute("callHistory",orderService.getOrderHistory(orderNo));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/order/consignment/detail");
    }
*/

}
