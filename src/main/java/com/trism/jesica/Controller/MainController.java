package com.trism.jesica.Controller;

import com.google.gson.JsonObject;
import com.mysql.cj.Session;
import com.trism.jesica.Service.*;
import com.trism.jesica.Util.GetClientIp;
import com.trism.jesica.Util.RestTemplateUtil;
import com.trism.jesica.config.SessionConfig;
import com.trism.jesica.dto.ClientDTO;
import com.trism.jesica.dto.LoginDTO;
import com.trism.jesica.persistence.Entitiy.board.TbNoticePlatform;
import com.trism.jesica.persistence.Entitiy.board.TbNoticeRelease;
import com.trism.jesica.persistence.Entitiy.business.TbBranch;
import com.trism.jesica.persistence.Entitiy.business.TbHead;
import com.trism.jesica.persistence.Entitiy.business.TbUser;
import com.trism.jesica.persistence.Entitiy.business.TbUserStaff;
import com.trism.jesica.persistence.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.Entitiy.system.TbSiteAcl;
import com.trism.jesica.persistence.Entitiy.system.TbSiteMenu;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
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
    public ModelAndView main(Model model, Session session) {


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

        //업데이트 내역
        model.addAttribute("updateList",boardService.getUpdateListLimit());
        model.addAttribute("updatePlatList",boardService.getPlatformListLimit());


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
    @ResponseBody
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
    }

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
        HttpSession session = request.getSession();

        //String clientId = null;
        String code = null;
        String deviceId = null;
        String refreshTokenEnd= null;

        if (StringUtils.isNotEmpty(bmLoginId) && StringUtils.isNotEmpty(bmLoginPwd)){
            TbUser tbUser = apiService.getUser(bmLoginId);
            //본사 정보상세


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

            //클라이언트 아이디/코드가 널이면 정보세팅 + 만료일이 다가오면 다시 세팅
            if(clientId == null || code == null || deviceId == null || refreshTokenEnd == null) {

                log.info("--------------cookieSetting------------------");

                ClientDTO clientDTO = getClient(response,uuid);

                clientId = clientDTO.getClientId();
                code = clientDTO.getCode();
                deviceId = clientDTO.getDeviceId();
                /*HttpUtil.callInfo(params,"GET", request);*/
              /*  ResponseEntity<Map> tokenNullMap = restTemplateUtil.authorizeToken();
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

               clientId = codeNullMap.get("clientId");
               code = codeNullMap.get("code");
               deviceId = uuid;*/
            }

            //클라이언트 아이디/코드값으로 로그인 시도
            log.info("--------------auth/login------------------");
            JsonObject params = new JsonObject();
            /*HttpUtil.callInfo(params,"GET", request);*/
            String encPass = cipherService.encryptAES(bmLoginPwd);

//            LoginDTO loginDTO = getLogin(clientId, bmLoginId, code, deviceId, encPass);

            int count = 0;
            Optional<LoginDTO> opLoginDto = getLoginChk(clientId, bmLoginId, code, deviceId, encPass, response, uuid, count);
            if (opLoginDto.isPresent()) {
                log.info("login auth success...");
                LoginDTO loginDTO = opLoginDto.get();
                //캐시에 저장
                Cache ehCacheAll      = cacheManager.getCache("loginCache");
                ehCacheAll.put("clientId", clientId);
                ehCacheAll.put("code", code);
                ehCacheAll.put("deviceId", deviceId);
                ehCacheAll.put("refreshToken", loginDTO.getData().getToken().getRefreshToken());

                session.setAttribute("accessToken",loginDTO.getData().getToken().getAccessToken());
                Cookie refreshToken = new Cookie("refreshToken",loginDTO.getData().getToken().getRefreshToken());
                //데이터내 시간대로 쿠키 저장
                refreshToken.setPath("/");
                refreshToken.setMaxAge(loginDTO.getData().getToken().getRefreshTokenExpiresIn().intValue());
                response.addCookie(refreshToken);
                isPwdMatch = true;
            } else {
                isPwdMatch = false;
                map.put("result", "500");
                map.put("message", "로그인오류입니다. 재로그인해주세요.");
            }


            //쿠키에 만료일
            //엑세스토큰 세션

            log.info("-----------------------------------------");

            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            if(StringUtils.isNotEmpty(bmLoginPwd) && ObjectUtils.isNotEmpty(tbUser)) {
                /*if(encoder.matches(bmLoginPwd, tbUser.getUserPwd())) {
                    isPwdMatch = true;
                }*/

                // 관리자
                if(tbUser.getUserType().ordinal() == 6 ) {
                    //로그인 세션 저장

                    if(isPwdMatch == true) {
                        LoginSession loginSession = LoginSession.from(bm);

                        //loginSession.setUserStaffName("마스터");
                        /*loginSession.setUserStaffName(tbUser.get());*/
                        loginSession.setUserRole(0);

                        //로그인 중복 방지
                        session.setAttribute(LoginSession.KEY, loginSession);
                        //세션 30분유지
                        session.setMaxInactiveInterval(60*60);
                        sessionConfig.newSession(bmLoginId, session);
                        // 성공이면 실패카운트 0으로 + 로그인 시간 등록
                        apiService.setSuccessLoginSet(tbUser.getUserNo());

                        //메뉴 권한 저장
                        List<TbSiteAcl> tbSiteAclList =  authService.getSiteAcl(Long.valueOf(loginSession.getUserStaffNo()));
                        List<TbSiteMenu> tbSiteMenus =  authService.getTbSiteMenuList();
                        List<Map<String, Object>>  tbSiteMenuAclList = authService.getTbSiteMenuAclList(Long.valueOf(loginSession.getUserStaffNo()));
                        session.setAttribute("tbSiteMenus",tbSiteMenus);
                        session.setAttribute("tbSiteAclList",tbSiteAclList);
                        session.setAttribute("tbSiteMenuAclList",tbSiteMenuAclList);
                        map.put("result", "200");
                        map.put("message", "로그인 성공");
                        map.put("url", "main");
                        /*} else {
                            map.put("result", "500");
                            map.put("message", "로그인중복으로 이전계정이 로그아웃됩니다.");
                            map.put("url", "login");*/


                    } else {
                        //비밀번호가 다르다면 실패 카운트 추가
                        if (isPwdMatch == false ) {
                            //실패횟수가 5회이상이면 정지 => 마스터 계정은 횟수만 증가
                            apiService.setPassCount(tbUser.getUserNo(), tbUser.getPwdFailCount()+1);
                        }
                    }

                    //제휴본사, 총판
                } else if(tbUser.getUserType().ordinal() == 1 || tbUser.getUserType().ordinal() == 2) {
                    tbUserStaff = apiService.getUserStaff(tbUser.getUserId());
                    if(tbUser.getUserType().ordinal() == 1 ){
                        tbHead = workGroupService.getTbHeadDetail(Long.parseLong(tbUserStaff.getHeadNo().toString()));
                    }
                    if(tbUser.getUserType().ordinal() == 2 ){
                        tbBranch = workGroupService.getTbBranchDetail(Long.parseLong(tbUserStaff.getBranchNo().toString()));
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
                            //로그인 세션 저장
                            LoginSession loginSession = LoginSession.from(bm);
                            session.setAttribute(LoginSession.KEY, loginSession);
                            //세션 30분유지
                            session.setMaxInactiveInterval(60*120);
                            if(tbUser.getUserType().ordinal() == 1 ){
                                session.setAttribute("headName",tbHead.getHeadName());
                            }
                            if(tbUser.getUserType().ordinal() == 2 ){
                                session.setAttribute("headName",tbBranch.getHead().getHeadName());
                                session.setAttribute("branchName",tbBranch.getBranchName());
                            }

                            session.setAttribute(LoginSession.KEY, loginSession);
                            //세션 30분유지
                            session.setMaxInactiveInterval(60*60);
                            sessionConfig.newSession(bmLoginId, session);

                            //메뉴 권한 저장
                            List<TbSiteAcl> tbSiteAclList =  authService.getSiteAcl(Long.valueOf(loginSession.getUserStaffNo()));
                            List<TbSiteMenu> tbSiteMenus =  authService.getTbSiteMenuList();
                            session.setAttribute("tbSiteMenus",tbSiteMenus);
                            session.setAttribute("tbSiteAclList",tbSiteAclList);

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

    private LoginDTO getLogin(String clientId, String bmLoginId, String code, String deviceId, String encPass) {

        ResponseEntity<Map> tokenMap = restTemplateUtil.loginAuth(clientId, code, deviceId, bmLoginId, encPass);
        Map<String,Object> codeMap = (Map)tokenMap.getBody();
        LoginDTO loginDTO = modelMapper.map(codeMap, LoginDTO.class);

        log.info("getLogin:::::{}",loginDTO);
        return loginDTO;
    }



    private Optional<LoginDTO> getLoginChk(String clientId, String bmLoginId, String code, String deviceId, String encPass, HttpServletResponse response, String uuid, int count){
        log.info("count cnt :::::::::{}",count);
        if(count >= 3) {
            return Optional.empty();
        }
        LoginDTO loginDTO = getLogin(clientId, bmLoginId, code, deviceId, encPass);
        log.info("loginDTO {}" ,loginDTO);

        if(!"OK".equals(loginDTO.getServiceStatus())){
            if("NOT_FOUND_CLIENT".equals(loginDTO.getServiceStatus())) {
                ClientDTO clientDTO = getClient(response,uuid);

                clientId = clientDTO.getClientId();
                code = clientDTO.getCode();
                deviceId = clientDTO.getDeviceId();
                return getLoginChk(clientId, bmLoginId, code, deviceId, encPass, response, uuid,count++);
            } else {
                return Optional.empty();
                //isPwdMatch = false;
                //map.put("result", "500");
                //map.put("message", "로그인오류입니다. 재로그인해주세요.");
            }

        }
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
            session.invalidate();
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
    public ModelAndView noticeUpdatePopup(@PathVariable Long noticeNo, Model model){
        log.info("noticeNo :: {}",noticeNo);
        try {
            TbNoticeRelease tbNoticeRelease = boardService.getTbReleaseDetail(noticeNo);
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
            @RequestParam("no") String no,
            @RequestParam("oldBankCode") String oldBankCode,
            @RequestParam("oldNo") String oldNo,
            Model model
    ) {
        model.addAttribute("type",type);
        model.addAttribute("no",no);
        model.addAttribute("oldBankCode",oldBankCode);
        model.addAttribute("oldNo",oldNo);
        return new ModelAndView("/jesica/search/cyBankAccountSearch");
    }

    private ClientDTO getClient(HttpServletResponse response,String uuid){
        log.info("--------------cookieSetting------------------");
        /*HttpUtil.callInfo(params,"GET", request);*/
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
    }
}


