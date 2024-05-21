package com.trism.jesica.Controller;

import com.trism.jesica.Service.MemberShipService;
import com.trism.jesica.Util.RestTemplateUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/membership")
@RestController
@RequiredArgsConstructor
@Slf4j
public class MemberShipController {

    private final MemberShipService memberShipService;

    @Autowired
    private RestTemplateUtil restTemplateUtil;
    /**
     * 쿠폰 리스트
     */
    @GetMapping("/coupon/list")
    public ModelAndView listPlatformNotice(@RequestParam Map<String,Object> searchValue,
                                           Model model, HttpSession session) {

        return new ModelAndView("/jesica/membership/coupon/list");
    }

    /**
     * 쿠폰 상세
     */
    @GetMapping("/coupon/detail")
    public ModelAndView detailCoupon(@RequestParam String cpnNo, Model model) {
        log.info("@@searchValue {}",cpnNo);
        try {

            ResponseEntity<Map> tokenMap = restTemplateUtil.getCouponDetailApi(Integer.parseInt(cpnNo));
            System.out.println(tokenMap);
            Map<String,Object> body = (Map)tokenMap.getBody();//아이디가 있으면 update

            model.addAttribute("cpnNo",cpnNo);
            model.addAttribute("body",(Map)tokenMap.getBody());

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/membership/coupon/detail");
    }
    /**
     * 쿠폰 등록
     */
    @GetMapping("/coupon/insert")
    public ModelAndView insertCoupon() {
        return new ModelAndView("jesica/membership/coupon/insert");
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
