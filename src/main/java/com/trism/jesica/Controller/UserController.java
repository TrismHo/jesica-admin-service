package com.trism.jesica.Controller;

import com.trism.jesica.Service.CustService;
import com.trism.jesica.persistence.Entitiy.cust.TbCust;
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

@RequestMapping("/user")
@RestController
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final CustService custService;


    /**
     * 탈퇴회원 리스트
     */
    @GetMapping("/outcust/list")
    public ModelAndView listOutCust(HttpSession session, @RequestParam Map<String, Object> searchValue, Model model) {
        log.info("@@searchValue::{}", searchValue);

        try {
            if (ObjectUtils.isNotEmpty(searchValue)) {
                log.info("searchValue::{}", searchValue);
                putSearchOption(session, searchValue);
                List<TbCust> tbCustList = custService.getCustList(searchValue);

                model.addAttribute("custList", tbCustList);
            } else {
                getSearchOption(session);
                model.addAttribute("custList", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("jesica/user/secession/list");
    }

    /**
     * 탈퇴 상세
     */
    @GetMapping("/outcust/detail")
    public ModelAndView detailOutCust(@RequestParam Long custNo, Model model) {
        log.info("@@custNo:: ", custNo);

        try {
            Map<String, Object> map = custService.getCustDetail(custNo);

            model.addAttribute("tbCust", map.get("tbCust"));
            model.addAttribute("tbCustUsedCouponList", map.get("tbCustUsedCoupon"));
            model.addAttribute("tbCustUnUsedCouponList", map.get("tbCustUnUsedCoupon"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/user/secession/detail");
    }

    private void putSearchOption(HttpSession session, Map<String,Object> searchValue) {
        session.setAttribute("isMember", searchValue.get("isMember"));
        session.setAttribute("dataStatus", searchValue.get("dataStatus"));
        session.setAttribute("startDate", searchValue.get("startDate"));
        session.setAttribute("endDate", searchValue.get("endDate"));
        session.setAttribute("custName", searchValue.get("custName"));
    }

    private Map<String,Object> getSearchOption(HttpSession session) {
        Map<String,Object> searchValue = new HashMap<>();
        if (session == null) return searchValue;

        String isMember = (String) session.getAttribute("isMember");
        String dataStatus = (String) session.getAttribute("dataStatus");
        String startDate = (String) session.getAttribute("startDate");
        String endDate = (String) session.getAttribute("endDate");
        String custName = (String) session.getAttribute("custName");

        searchValue.put("isMember", isMember);
        searchValue.put("dataStatus", dataStatus);
        searchValue.put("startDate", startDate);
        searchValue.put("endDate", endDate);
        searchValue.put("custName", custName);

        return searchValue;
    }
}
