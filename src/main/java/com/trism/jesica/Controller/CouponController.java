package com.trism.jesica.Controller;

import com.trism.jesica.Service.CouponService;
import com.trism.jesica.persistence.Entitiy.coupon.TbCoupon;
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

@RequestMapping("/coupon")
@RestController
@RequiredArgsConstructor
@Slf4j
public class CouponController {

    private final CouponService couponService;

    @GetMapping("/management/list")
    public ModelAndView listCoupon(@RequestParam Map<String, Object> searchValue,
                                   Model model, HttpSession session) {
        log.info("@@searchValue {}", searchValue);
        try {
            if (ObjectUtils.isNotEmpty(searchValue)) {
                putSearchOption(session, searchValue);
            } else {
                searchValue = getSearchOption(session);
            }

            List<TbCoupon> resultList = couponService.tbCouponSearch(searchValue);
            model.addAttribute("tbCouponList", resultList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("jesica/coupon/management/list");
    }

    @GetMapping("/management/insert")
    public ModelAndView insertCoupon() {

        return new ModelAndView("jesica/coupon/management/insert");
    }

    @GetMapping("/management/detail")
    public ModelAndView detailCoupon(@RequestParam("couponNo") Long couponNo, Model model) {
        log.info("couponNo:: ", couponNo);

        try {
            //쿠폰정보
            Map detailCouponMap = couponService.getCouponDetail(couponNo);
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

        return new ModelAndView("jesica/coupon/management/detail");
    }

    private void putSearchOption(HttpSession session, Map<String,Object> searchValue) {
        session.setAttribute("serviceType", searchValue.get("serviceType"));
        session.setAttribute("dataStatus", searchValue.get("dataStatus"));
        session.setAttribute("startDate", searchValue.get("startDate"));
        session.setAttribute("endDate", searchValue.get("endDate"));
        session.setAttribute("title", searchValue.get("title"));
    }

    private Map<String,Object> getSearchOption(HttpSession session) {
        Map<String,Object> searchValue = new HashMap<>();
        if (session == null) return searchValue;

        String headNo = (String) session.getAttribute("headNo");
        if (headNo != null) {
            String serviceType = (String) session.getAttribute("serviceType");
            String dataStatus = (String) session.getAttribute("dataStatus");
            String startDate = (String) session.getAttribute("startDate");
            String endDate = (String) session.getAttribute("endDate");
            String title = (String) session.getAttribute("title");

            searchValue.put("serviceType", serviceType);
            searchValue.put("dataStatus", dataStatus);
            searchValue.put("startDate", startDate);
            searchValue.put("endDate", endDate);
            searchValue.put("title", title);
        }

        return searchValue;
    }
}
