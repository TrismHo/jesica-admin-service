
package com.trism.jesica.Controller;

import com.trism.jesica.Service.ApiService;
import com.trism.jesica.Service.AuthService;
import com.trism.jesica.Service.FileService;
import com.trism.jesica.Service.LibraryService;
import com.trism.jesica.Util.DateUtil;
import com.trism.jesica.persistence.mysql.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.mysql.Entitiy.file.TbFile;
import com.trism.jesica.persistence.mysql.Entitiy.library.TbLibrary;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteAcl;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteMenu;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSystemCode;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;


@RequestMapping("/library")
@RestController
@RequiredArgsConstructor
@Slf4j
public class LibraryController {

    @Autowired
    private AuthService authService;
    @Autowired
    private LibraryService libraryService;
    @Autowired
    private FileService fileService;

    @Autowired
    private ApiService apiService;

    /** 관리자 자료 **/
    @GetMapping("/file/list")
    public ModelAndView fileList(HttpSession session, @RequestParam Map<String, Object> searchValue, Model model) {
        log.info("@@searchValue::{}", searchValue);
        Map<String,Object> map = permission(session,"system/master");
        searchValue.put("appCode",map.get("appCode"));
        searchValue.put("startDate", DateUtil.now_yyyy_mm_dd_week());
        searchValue.put("endDate", DateUtil.now_yyyy_mm_dd());
        model.addAttribute("permission",map.get("permission"));
        model.addAttribute("downloadAble",map.get("downloadAble"));

        model.addAttribute("searchValue", searchValue);

        return new ModelAndView("jesica/library/file/list");
    }

    /** 관리자 자료 상세 **/
    @GetMapping("/file/detail")
    public ModelAndView fileDetail(@RequestParam("libNo") Long libNo, Model model, HttpSession session) {
        log.info("libNo:: {}", libNo);
        try {
            Map<String,Object> map = permission(session,"system/master");

            TbLibrary libraryDetail = libraryService.tbLibraryDetail(libNo);
            List<TbFile> files = fileService.getFileList(libNo);

            List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
            model.addAttribute("appVersionList",appVersionList);
            model.addAttribute("tbLibrary", libraryDetail);
            model.addAttribute("files", files);
            model.addAttribute("appCode",map.get("appCode"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ModelAndView("jesica/library/file/detail");
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

                    if(!ObjectUtils.isEmpty(permission)){
                        map.put("permission",permission.getPermission());
                        map.put("downloadAble",permission.getDownloadAble());
                    } else {
                        map.put("permission",0);
                        map.put("downloadAble",0);
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



