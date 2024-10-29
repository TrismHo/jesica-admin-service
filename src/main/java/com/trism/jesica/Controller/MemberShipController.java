package com.trism.jesica.Controller;

import com.trism.jesica.Service.AuthService;
import com.trism.jesica.Service.MemberShipService;
import com.trism.jesica.Util.RestTemplateUtil;
import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.persistence.mysql.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteAcl;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteMenu;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
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
import java.util.Optional;

@RequestMapping("/membership")
@RestController
@RequiredArgsConstructor
@Slf4j
public class MemberShipController {
    @Autowired
    private final MemberShipService memberShipService;

    @Autowired
    private RestTemplateUtil restTemplateUtil;

    @Autowired
    private JesicaProperties jesicaProperties;
    @Autowired
    private AuthService authService;
    /**
     * 쿠폰 리스트
     */
    @GetMapping("/coupon/list")
    public ModelAndView listPlatformNotice(@RequestParam Map<String,Object> searchValue,
                                           Model model, HttpSession session) {
        Map<String,Object> map = permission(session,"membership/coupon");
        model.addAttribute("authKey",jesicaProperties.getMomPosServer().getAuthKey());
        model.addAttribute("ordPathCd",jesicaProperties.getOrdPathCd().getPickOrder());
        model.addAttribute("permission",map.get("permission"));
        model.addAttribute("downloadAble",map.get("downloadAble"));

        return new ModelAndView("/jesica/membership/coupon/list");
    }

    /**
     * 쿠폰 상세
     */
    @GetMapping("/coupon/detail")
    public ModelAndView detailCoupon(@RequestParam String cpnNo, Model model, HttpSession session) {
        log.info("@@searchValue {}",cpnNo);
        try {
            Map<String,Object> map = permission(session,"membership/coupon");
            ResponseEntity<Map> tokenMap = restTemplateUtil.getCouponDetailApi(Integer.parseInt(cpnNo));
            Map<String,Object> body = (Map)tokenMap.getBody();//아이디가 있으면 update

            model.addAttribute("cpnNo",cpnNo);
            model.addAttribute("body",(Map)tokenMap.getBody());
            model.addAttribute("permission",map.get("permission"));
            model.addAttribute("downloadAble",map.get("downloadAble"));

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/membership/coupon/detail");
    }
    /**
     * 쿠폰 등록
     */
    @GetMapping("/coupon/insert")
    public ModelAndView insertCoupon(HttpSession session,Model model) {
        Map<String,Object> map = permission(session,"membership/coupon");
        model.addAttribute("permission",map.get("permission"));
        model.addAttribute("downloadAble",map.get("downloadAble"));
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
