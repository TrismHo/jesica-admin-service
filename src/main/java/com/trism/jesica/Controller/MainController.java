package com.trism.jesica.Controller;

import com.google.gson.JsonObject;
import com.trism.jesica.Service.*;
import com.trism.jesica.Util.GetClientIp;
import com.trism.jesica.Util.RestTemplateUtil;
import com.trism.jesica.config.SessionConfig;
import com.trism.jesica.dto.LoginDTO;
import com.trism.jesica.dto.SiteMenuAclSessionDto;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbNoticePlatform;
import com.trism.jesica.persistence.mysql.Entitiy.board.TbNoticeRelease;
import com.trism.jesica.persistence.mysql.Entitiy.business.*;
import com.trism.jesica.persistence.mysql.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.mysql.Entitiy.event.TbEvent;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteAcl;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteMenu;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.mysql.projection.SiteMenuAclProjection;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@RequestMapping("/")
@RestController
@RequiredArgsConstructor
@Slf4j
public class MainController {

   /* private final BasManagerService basManagerService;*/
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    private final ApiService apiService;
    private final WorkGroupService workGroupService;
    private final SessionConfig sessionConfig;
    @Autowired
    private RestTemplateUtil restTemplateUtil;
    @Autowired
    private CipherService cipherService;
    @Autowired
    private StatisticsService statisticsService;
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private CacheManager cacheManager;

    @Autowired
    private BoardService boardService;

    @Autowired
    private AuthService authService;

    /**
     * 핑테스트
     */
    @GetMapping("/ping")
    public String ping() {
        return "ping";
    }

    /**
     * 약관 페이지
     */
    @GetMapping("/terms")
    public ModelAndView terms() {
        return new ModelAndView("/terms");
    }

    /**
     * 최초 페이지
     */
    @GetMapping("/")
    public ModelAndView index() {

        return new ModelAndView("/index");
    }
    /**
     * 최초 페이지
     */
    @GetMapping("/authError")
    public ModelAndView auth() {

        return new ModelAndView("/error/auth");
    }

    /**
     * main페이지
     */
    @GetMapping("/main")
    public ModelAndView main(Model model, HttpSession session) {
        LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
        String appCode = loginSession.getAppCode();

        model.addAttribute("appCode",appCode);
        List<TbSystemCode> appVersionList = apiService.systemCodeList("AC");
        model.addAttribute("appVersionList",appVersionList);
        //신규고객
        model.addAttribute("userChart",apiService.getCustChart().get(0).get("cnt"));
        //정상기사
        model.addAttribute("userWorkerChart",apiService.getUserWorkerChart().get(0).get("cnt"));
        //기사심사요청
        model.addAttribute("workerApplyChart",apiService.getWorkerApplyChart().get(0).get("cnt"));
        //렌터카 가맹점
        model.addAttribute("storeRentChart",apiService.getStoreRentChart().get(0).get("cnt"));
      /*  //인수대행 변화추이(system_code_type OT= 20)
        model.addAttribute("getCallAllListType20",apiService.getCallAllListType20());
        //반납대행 변화추이(system_code_type OT= 21)
        model.addAttribute("getCallAllListType21",apiService.getCallAllListType21());*/

        model.addAttribute("updateList",boardService.getUpdateListLimit());
       /* if("jesicar".equals(loginSession.getCompany())) {
            model.addAttribute("updateEventList",boardService.getUpdateEventListLimit(1));
            model.addAttribute("updatePlatList",boardService.getPlatformListLimit(1));
        } else if ("yangpa".equals(loginSession.getCompany())) {
            model.addAttribute("updateEventList",boardService.getUpdateEventListLimit(2));
            model.addAttribute("updatePlatList",boardService.getPlatformListLimit(2));
        }*/
        model.addAttribute("updateEventList",boardService.getUpdateEventListLimit(2));
        model.addAttribute("updatePlatList",boardService.getPlatformListLimit(2));



        return new ModelAndView("main");
    }

    /**
     * main페이지
     */
    @GetMapping("/index")
    public ModelAndView index_sub() {
        return new ModelAndView("/index");
    }

    /**
     * 로그인페이지
     */
    @GetMapping("/login")
    public ModelAndView login(HttpSession session){
       /* LoginSession sessionObj = (LoginSession)session.getAttribute(LoginSession.KEY);
        if(ObjectUtils.isEmpty(sessionObj)) {
            return new ModelAndView("/login");
        } else {
            return new ModelAndView("/index");
        }
*/
        return new ModelAndView("/login");
    }
    @ResponseBody
    @GetMapping(value = "/chk/cookieOut")
    public ResponseEntity<?> cookieOut(
            HttpServletRequest request,
            HttpServletResponse response
    ) {
        //쿠키 조회
        Map<String, String> map = new HashMap<>();
        //쿠키 삭제
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie cookie:cookies) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }

        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }
    /*@ResponseBody
    @GetMapping(value = "/chk/test")
    public ResponseEntity<?> getLoginChk(
            HttpServletRequest request
 ) {
        //쿠키 조회
        Map<String, String> map = new HashMap<>();
        String clientId = null;
        String code = null;
        String deviceId = null;
        String refreshTokenEnd = null;
        //쿠키 조회
        Cookie[] cookies = request.getCookies();
        for(Cookie cookie:cookies) {
            if(cookie.getName().contains("clientId")) {
                clientId = cookie.getValue();
                log.info("clientId_first::"+clientId);
            } else if(cookie.getName().contains("code")) {
                code = cookie.getValue();
                log.info("code_first::"+code);
            } else if(cookie.getName().contains("deviceId")) {
                deviceId = cookie.getValue();
                log.info("deviceId_first::"+deviceId);
            } else if(cookie.getName().contains("refreshToken")) {
                refreshTokenEnd = cookie.getValue();
                log.info("refreshTokenEnd_first::"+refreshTokenEnd);
            }


        }
        return new ResponseEntity<>(map, HttpStatus.OK);
    }*/

    /**
     * 로그인처리
     */
    @ResponseBody
    @PostMapping(value = "/chk/login")
    public ResponseEntity<?> loginCheck(
                                        HttpServletRequest request,
                                        HttpServletResponse response,
                                        String clientId,
                                        @RequestParam("uuid") String uuid,
                                        @RequestParam("bmLoginId") String bmLoginId,
                                        @RequestParam("bmLoginPwd") String bmLoginPwd) {

        boolean isPwdMatch = false;
        TbUserStaff bm = apiService.getUserStaff(bmLoginId);
        Map<String, String> map = new HashMap<>();
        TbUserStaff tbUserStaff = null;
        TbHead tbHead = null;
        TbBranch tbBranch = null;
        TbStore tbStore = null;
        HttpSession session = request.getSession();

        //String clientId = null;
        /*String code = null;
        String deviceId = null;
        String refreshTokenEnd= null;*/

        if (StringUtils.isNotEmpty(bmLoginId) && StringUtils.isNotEmpty(bmLoginPwd)){

            //TBUser 조회
            TbUser tbUser = apiService.getUser(bmLoginId);

            //클라이언트 아이디/코드값으로 로그인 시도
            log.info("--------------auth/login------------------");
            System.out.println("Id :"+ bmLoginId);
            JsonObject params = new JsonObject();

            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            if(StringUtils.isNotEmpty(bmLoginPwd) && ObjectUtils.isNotEmpty(tbUser)) {
                if(encoder.matches(bmLoginPwd, tbUser.getUserPwd())) {
                    isPwdMatch = true;
                }
                // 관리자
                if(tbUser.getUserType().ordinal() == 6) {
                    //로그인 세션 저장
                    if(isPwdMatch == true) {
                        String appCodeName = "";
                        if(!StringUtils.isEmpty(bm.getAppCode())){
                            List<TbSystemCode> appVersionList = apiService.systemCodeList("AC", bm.getAppCode());
                            if(appVersionList.size() < 1){
                                appCodeName = "전체";
                            } else {
                                appCodeName = appVersionList.get(0).getCodeName();
                            }
                        } else {
                            appCodeName = "전체";
                        }

                        LoginSession loginSession = LoginSession.from(bm,appCodeName);
                        //loginSession.setUserStaffName("마스터");
                        /*loginSession.setUserStaffName(tbUser.get());*/
                        loginSession.setUserRole(0);
                        //로그인 중복 방지
                        session.setAttribute("sessionKey", loginSession);
                        //세션 30분유지
                        session.setMaxInactiveInterval(60 * 60);
                        // 로그인 성공 시
                        int timeout = session.getMaxInactiveInterval(); // 초
                        long expiresAt = System.currentTimeMillis() + timeout * 1000L;

                        session.setAttribute("SESSION_EXPIRES_AT", expiresAt);
                        sessionConfig.newSession(bmLoginId, session);
                        // 성공이면 실패카운트 0으로 + 로그인 시간 등록
                        apiService.setSuccessLoginSet(tbUser.getUserNo());

                        //메뉴 권한 저장
                        List<TbSiteAcl> tbSiteAclList =  authService.getSiteAcl(Long.valueOf(loginSession.getUserStaffNo()));
                        List<TbSiteMenu> tbSiteMenus =  authService.getTbSiteMenuList();

                        List<SiteMenuAclProjection> tbSiteMenuAclList =
                                authService.getTbSiteMenuAclList(Long.valueOf(loginSession.getUserStaffNo()));

                        List<SiteMenuAclSessionDto> tbSiteMenuAclSessionList = tbSiteMenuAclList.stream()
                                .map(item -> new SiteMenuAclSessionDto(
                                        item.getMenuNo(),
                                        item.getMenuName(),
                                        item.getMenuUrl(),
                                        item.getMenuIcon(),
                                        item.getPermission(),
                                        item.getDownloadAble(),
                                        item.getStaffNo(),
                                        item.getMenuLevel(),
                                        item.getMenuGroup(),
                                        item.getVisibleLevel()
                                ))
                                .collect(Collectors.toList());

                        if(StringUtils.isNotEmpty(bm.getAppCode())){
                            session.setAttribute("appCode",bm.getAppCode());
                        } else {
                            session.setAttribute("appCode","");
                        }

                        session.setAttribute("tbSiteMenus",tbSiteMenus);
                        session.setAttribute("tbSiteAclList",tbSiteAclList);
                        session.setAttribute("tbSiteMenuAclList",tbSiteMenuAclSessionList);
                        map.put("result", "200");
                        map.put("message", "로그인 성공");
                        map.put("url", "main");


                    } else {
                        //비밀번호가 다르다면 실패 카운트 추가
                        if (isPwdMatch == false ) {
                            //실패횟수가 5회이상이면 정지 => 마스터 계정은 횟수만 증가
                            apiService.setPassCount(tbUser.getUserNo(), tbUser.getPwdFailCount()+1);
                            map.put("result", "500");
                            map.put("message", "로그인 정보가 일치하지 않습니다.");
                            map.put("url", "login");
                        }
                    }

                    //제휴본사, 총판 // 2022 09 14 가맹점 추가
                } else if(tbUser.getUserType().ordinal() == 1 || tbUser.getUserType().ordinal() == 2 || tbUser.getUserType().ordinal() == 3) {
                    tbUserStaff = apiService.getUserStaff(tbUser.getUserId());
                    if(tbUser.getUserType().ordinal() == 1 ){
                        tbHead = workGroupService.getTbHeadDetail(Long.parseLong(tbUserStaff.getHeadNo().toString()));
                    }
                    if(tbUser.getUserType().ordinal() == 2 ){
                        tbBranch = workGroupService.getTbBranchDetail(Long.parseLong(tbUserStaff.getBranchNo().toString()));
                    }
                    if(tbUser.getUserType().ordinal() == 3 ){
                        tbStore = workGroupService.getTbStoreDetail(Long.parseLong(tbUserStaff.getStoreNo().toString()));
                    }

                    if (tbUserStaff.getDataStatus().ordinal() == 2 || tbUserStaff.getDataStatus().ordinal() == 0) {
                        map.put("result", "400");
                        map.put("message", "로그인이 제한된 계정입니다. 관리자에 문의하세요.");
                    } else {
                        if (StringUtils.isEmpty(bmLoginId) || isPwdMatch == false) {
                            map.put("result", "500");
                            map.put("message", "로그인 정보가 일치하지 않습니다.");

                            //비밀번호가 다르다면 실패 카운트 추가
                            if (isPwdMatch == false ) {
                                //비밀번호가 다르다면 실패 카운트 추가
                                if (isPwdMatch == false ) {
                                    //실패횟수가 5회이상이면 정지
                                    if(tbUser.getPwdFailCount() > 5) {
                                        /*apiService.setUserStop(tbUser.getUserNo());*/
                                    } else {
                                        apiService.setPassCount(tbUser.getUserNo(), tbUser.getPwdFailCount()+1);
                                    }
                                }
                            }
                        } else {
                            List<TbSystemCode> appVersionList = apiService.systemCodeList("AC", bm.getAppCode());
                            String appCodeName = "";
                            if(appVersionList.size() < 1){
                                appCodeName = "전체";
                            } else {
                                appCodeName = appVersionList.get(0).getCodeName();
                            }
                            //로그인 세션 저장
                            LoginSession loginSession = LoginSession.from(bm, appCodeName);
                            session.setAttribute("sessionKey", loginSession);

                            // 로그인 성공 시
                            sessionConfig.newSession(bmLoginId, session);

                            //세션 60분유지
                            session.setMaxInactiveInterval(60 * 60);

                            int timeout = session.getMaxInactiveInterval(); // 초
                            long expiresAt = System.currentTimeMillis() + timeout * 1000L;

                            session.setAttribute("SESSION_EXPIRES_AT", expiresAt);

                            if(tbUser.getUserType().ordinal() == 1 ){
                                session.setAttribute("headName",tbHead.getHeadName());
                            }
                            if(tbUser.getUserType().ordinal() == 2 ){
                                session.setAttribute("headName",tbBranch.getHead().getHeadName());
                                session.setAttribute("branchName",tbBranch.getBranchName());
                            }
                            if(tbUser.getUserType().ordinal() == 3 ){
                                session.setAttribute("headName",tbStore.getHead().getHeadName());
                                session.setAttribute("branchName",tbStore.getBranch().getBranchName());
                                session.setAttribute("storeName",tbStore.getStoreName());
                            }

                            //메뉴 권한 저장
                            List<TbSiteAcl> tbSiteAclList =  authService.getSiteAcl(Long.valueOf(loginSession.getUserStaffNo()));
                            List<TbSiteMenu> tbSiteMenus =  authService.getTbSiteMenuList();
                            session.setAttribute("tbSiteMenus",tbSiteMenus);
                            session.setAttribute("tbSiteAclList",tbSiteAclList);
                            if(StringUtils.isNotEmpty(bm.getAppCode())){
                                session.setAttribute("appCode",bm.getAppCode());
                            } else {
                                session.setAttribute("appCode","");
                            }

                            // 성공이면 실패카운트 0으로 + 로그인 시간 등록
                            apiService.setSuccessLoginSet(tbUser.getUserNo());
                            map.put("result", "200");
                            map.put("message", "로그인 성공");
                            map.put("url", "main");
                        }
                    }
                }  else {
                    //없는 권한일때
                    map.put("result", "500");
                    map.put("message", "권한등급이 다른계정입니다. 관리자에 문의하세요.");
                }
            }   else {

                //조회된 정보가 없을때
                map.put("result", "500");
                map.put("message", "로그인 정보가 일치하지 않습니다.");
            }
        } else {
            //둘중하나가 비었을때
            map.put("result", "500");
            map.put("message", "아아디,패스워드를 입력해주세요.");
        }


        String ip = GetClientIp.getClientIP(request);
        log.info("Login_user : ip = {} / ID = {} / result = {}", ip, bmLoginId, map.get("result") +": "+map.get("message"));

        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    private LoginDTO getLogin(String bmLoginId, String deviceId, String bmLoginPwd) {


        ResponseEntity<Map> tokenMap = restTemplateUtil.loginAuth(deviceId, bmLoginId, bmLoginPwd);
        Map<String,Object> codeMap = (Map)tokenMap.getBody();
        LoginDTO loginDTO = modelMapper.map(codeMap, LoginDTO.class);

        //log.info("getLogin:::::{}",loginDTO);
        return loginDTO;
    }


    private Optional<LoginDTO> getLoginChk(String deviceId,String bmLoginId ,String bmLoginPwd, HttpServletResponse response, String uuid, int count){
        log.info("count cnt :::::::::{}",count);
        if(count >= 3) {
            return Optional.empty();
        }
        LoginDTO loginDTO = getLogin( bmLoginId, uuid, bmLoginPwd);
        return Optional.of(loginDTO);
    }

    /**
     * 로그인처리
     */
    /*@PostMapping("/login/chk")
    public ModelAndView loginChk(BasManager basManager, HttpSession session, Model model) {
        BasManager manager = basManagerService.getManager(basManager);

        boolean isPwdMatch = false;

        if(manager != null) {
            if(bCryptPasswordEncoder.matches(basManager.getBmLoginPwd(), manager.getBmLoginPwd())) {
                isPwdMatch = true;
            }
        }


        //로그인 정보 일치하지 않는 경우
        if (manager == null || isPwdMatch == false) {
            model.addAttribute("message", "로그인 정보가 일치하지 않습니다");
            return new ModelAndView("/redirect/redirectBackUrl");
        } else if (manager.getBmActive() == 0) {
            model.addAttribute("message",  "로그인이 제한된 계정입니다. 관리자에 문의하세요.");
            return new ModelAndView("/redirect/redirectBackUrl");
        } else {
            //로그인 세션 저장
            LoginSession loginSession = LoginSession.from(manager);
            session.setAttribute(LoginSession.KEY, loginSession);

            return new ModelAndView("/index");
        }
    }*/

    /**
     * 이전페이지 이동
     */
    @RequestMapping("/back")
    public ModelAndView back(Model model) {
        model.addAttribute("message", "접근 권한이 없습니다.");
        return new ModelAndView("/redirect/redirectBackUrl");
    }

    /**
     * 로그아웃 요청 처리
     */
    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        if (session != null) {
            session.removeAttribute("sessionKey");
            session.removeAttribute("SESSION_EXPIRES_AT");
            session.invalidate(); // 세션 완전 종료
        }
        return new ModelAndView("redirect:/login");
    }

    /**
     * 로그인페이지
     */
    @GetMapping("/newPassWord")
    public ModelAndView newPassWord(HttpSession session){
       /* LoginSession sessionObj = (LoginSession)session.getAttribute(LoginSession.KEY);
        if(ObjectUtils.isEmpty(sessionObj)) {
            return new ModelAndView("/login");
        } else {
            return new ModelAndView("/index");
        }
*/
        return new ModelAndView("/masterFindPassword");
    }

    /**
     * 이벤트공지
     */
    @GetMapping("/notice/event/{eventNo}")
    public ModelAndView noticeEventPopup(@PathVariable Long eventNo, Model model){
        log.info("eventNo :: {}",eventNo);
        try {
            TbEvent tbNoticeEvent = boardService.getTbNoticeEventDetail(eventNo);

            model.addAttribute("tbNoticeEvent", tbNoticeEvent);
        } catch (Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("/searchPopupEvent");
    }
    /**
     * 플랫폼공지
     */
    @GetMapping("/notice/platform/{noticeNo}")
    public ModelAndView noticeFlatFormPopup(@PathVariable Long noticeNo, Model model){
        log.info("noticeNo :: {}",noticeNo);
        try {
            TbNoticePlatform tbNoticePlatform = boardService.getTbNoticePlatFormDetail(noticeNo);

            model.addAttribute("tbNoticePlatform", tbNoticePlatform);
        } catch (Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("/searchPopupPlatform");
    }

    /**
     * 업데이트공지
     */
    @GetMapping("/notice/update/{noticeNo}")
    public ModelAndView noticeUpdatePopup(@PathVariable Long noticeNo, Model model, HttpSession session){
        log.info("noticeNo :: {}",noticeNo);
        try {
            LoginSession loginSession = (LoginSession)session.getAttribute("sessionKey");
            String company = loginSession.getCompany();
            int platformType = 0;
            if("jesicar".equals(company)) {
                platformType = 1;
            } else if ("yangpa".equals(company)) {
                platformType = 2;
            }

            TbNoticeRelease tbNoticeRelease = boardService.getTbReleaseDetail(noticeNo,platformType);
            model.addAttribute("tbNoticeRelease", tbNoticeRelease);
        } catch (Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("/searchPopupUpdate");
    }

    /**
     * 가상계좌 할당
     */
    @GetMapping("/cyBankAccount/reset")
    public ModelAndView cyBankAccountSearch(
            @RequestParam("type") Integer type,
            @RequestParam("owner") String owner,
            @RequestParam("no") String no,
            @RequestParam("oldBankCode") String oldBankCode,
            @RequestParam("oldNo") String oldNo,
            Model model
    ) {
        model.addAttribute("type",type);
        model.addAttribute("no",no);
        model.addAttribute("oldBankCode",oldBankCode);
        model.addAttribute("oldNo",oldNo);
        model.addAttribute("owner",owner);
        return new ModelAndView("/jesica/search/cyBankAccountSearch");
    }

    /*private ClientDTO getClient(HttpServletResponse response,String uuid){
        log.info("--------------cookieSetting------------------");
        *//*HttpUtil.callInfo(params,"GET", request);*//*
        ResponseEntity<Map> tokenNullMap = restTemplateUtil.authorizeToken();
        Map<String,String> codeNullMap = (Map)tokenNullMap.getBody().get("data");

        Cookie clientIdC = new Cookie("clientId",codeNullMap.get("clientId"));
        Cookie codeC = new Cookie("code",codeNullMap.get("code"));
        Cookie deviceIdC = new Cookie("deviceId",uuid);

        //1년 쿠키 저장
        clientIdC.setMaxAge(365*60*60*24*1);
        //1년 쿠키 저장
        codeC.setMaxAge(365*60*60*24*1);
        //1년 쿠키 저장
        deviceIdC.setMaxAge(365*60*60*24*1);

        clientIdC.setPath("/");
        codeC.setPath("/");
        deviceIdC.setPath("/");

        response.addCookie(clientIdC);
        response.addCookie(codeC);
        response.addCookie(deviceIdC);


        return ClientDTO.builder()
                .clientId(codeNullMap.get("clientId"))
                .code(codeNullMap.get("code"))
                .deviceId(uuid).build();
    }*/
}


