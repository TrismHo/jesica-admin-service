package com.trism.jesica.config;

import com.trism.jesica.Service.AuthService;
import com.trism.jesica.Service.CipherService;
import com.trism.jesica.persistence.mysql.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteAcl;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteMenu;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

    //private static final String ACCESS_TOKEN_SUBJECT = ":AccessToken";

    //@Autowired
    //private AuthTokenProvider authTokenProvider;
    @Autowired
    private CipherService cipherService;
    //@Autowired
    //private RestTemplateUtil restTemplateUtil;
    @Autowired
    private AuthService authService;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("============================== START ==============================");

        log.info(" Class       \t:  " + handler.getClass());
        log.info(" Request URI \t:  " + request.getRequestURI());
        log.info(" Servlet URI \t:  " + request.getServletPath());

        HttpSession session = request.getSession();
        LoginSession sessionObj = (LoginSession)session.getAttribute(LoginSession.KEY);



        int userRole = 0;
        String parentMenuId = "";
        String parentparentMenuId = "";
        String menuId = "";
        /*log.info(" Servlet URI \t:  " + sessionObj);*/

      /*  if(sessionObj != null) {
            userRole = sessionObj.getUserRole();
        }*/

        String servletPath = request.getServletPath();



        if(!servletPath.equals("/")) {
            parentMenuId = servletPath.split("/")[servletPath.split("/").length - 2];
            menuId = servletPath.split("/")[servletPath.split("/").length - 1];
        }


        if(ObjectUtils.isEmpty(sessionObj) ) {
            if(!servletPath.contains("fileLoad")
                    && !servletPath.contains("terms")
                    && !servletPath.contains("ping")
                    && !servletPath.contains("login")
                    && !servletPath.contains("test/test")
                    && !servletPath.contains("token")) {
                response.sendRedirect("/login");
                return false;
            }
        } else {
            if(servletPath.contains("/login")) {
                response.sendRedirect("/main");
                return false;
            }else {
                //마스터 사용자는 제외
                if(sessionObj.getRoleType() != Integer.parseInt("1")){
                    if(servletPath.split("/").length > 2){
                        int userSfaffNo = sessionObj.getUserStaffNo();
                        TbSiteMenu tbSiteMenu = authService.getTbSiteMenu(servletPath.split("/")[1]+"/"+servletPath.split("/")[2]);
                        if(!ObjectUtils.isEmpty(tbSiteMenu)){
                            TbSiteAcl tbSiteAcl = authService.getTbSiteAcl(Long.valueOf(userSfaffNo),Long.parseLong(tbSiteMenu.getMenuNo().toString()));
                            if(!ObjectUtils.isEmpty(tbSiteAcl)) {
                                if (tbSiteAcl.getPermission() == 0) {
                                    response.sendRedirect("/authError");
                                    return false;
                                }
                            } else {
                                response.sendRedirect("/authError");
                                return false;
                            }
                        }
                    }
                }
            }
        }

        boolean result = false;

        /*String authorization = request.getHeader(HttpHeaders.AUTHORIZATION);*/
        //String authorization = "Bearer +2UQDyNvYSgPLhdF6kBOV/7ENBFgsuTGQpX0TnpQe89arDVhc77v1kfsOm0HFbC6Jm3/9raFPBOEFJSeKGdry4QNkvVFaGj1CeBUP/J3fJe8pJBJeLQyZehx9X9HzafXKAsvWdtsObaEj2gLp6X8+dB7MZZmjzcQRmmuZETwOXTguxZcVSFRETgfGrun0vJo6hmaH8o7AnZeNQmLatTe26SHQk/XFkEwh9C/GXu1qeGveNNrbO+PMXIHO1DB6pTvEIvFEAOQey3FljQiuZnM8xRs8aOrjD/BT1EY/529POQn+nK2S4IH50XzvrCqyBE3kQ1muz49/RT5X9bdCyKqWrPkiJ30tk5VHlg3eWXTjL1iV05/ouOi2gd9eoIakB1ThxlI4ZGSTdGlg/heLICIYodJVDAUOnk14ctDsW4sNOXaP9JBv4Dg4q/nS3hYGa4e6OoXMBx8spCTKnWWGIFMY2wnjTigcgf43OEn4DfdqqcALRdPQdKhKP3dLglsJxGhuGGio2xpgNpwfElB/DQGEmgjUC3dW70jIl+PD2g29x2cLo6U0yIR8LUe5yJpY6LTCFRBNXOTsJ/2iTIjkJhBSJ5cdJNrkjw/bGY+Tbuu8YbOg/oqkcVnbK7WVzeC2E9iDVAUaXtX4O2/mbBou8tL0yHZ/dH93rjACKf2dTOxXvNvcgtyxpaDHNHs8oIWvoVRSCNT+OfmzZF/eeDcadQJ0aoh7uLHpI65jjkM+tXXVHA=";
        //세션으로 호출
        //String bearer = "Bearer ";
        //String plus = "";
        //String authorization = "";

        /*if (session.getAttribute("accessToken") != null ){
            plus = session.getAttribute("accessToken").toString();
            authorization = bearer+plus;
        }else {
            log.info("errorType4");
        }*/
       /* String a = null;
        String b = null;
        String c = null;
        String d = null;
        Cookie[] cookiess = request.getCookies();
        for(Cookie cookie:cookiess) {
            if(cookie.getName().contains("clientId")) {
                a = cookie.getValue();
                log.info("clientId_first_inter::"+a);
            } else if(cookie.getName().contains("code")) {
                b  = cookie.getValue();
                log.info("code_first_inter::"+b);
            } else if(cookie.getName().contains("deviceId")) {
                c = cookie.getValue();
                log.info("deviceId_first_inter::"+c);
            } else if(cookie.getName().contains("refreshToken")) {
                d = cookie.getValue();
                log.info("refreshTokenEnd_first_inter::"+d);
            }
        }*/


        /*if (StringUtils.isNotBlank(authorization) && authorization.startsWith("Bearer ")) {
            String encAccessToken = authorization.substring(7);
            String accessToken = null;
            try {
                accessToken = cipherService.decryptAES(encAccessToken);

                result = true;
//                log.debug("accessToken={}", accessToken);
            } catch (Exception e) {
//                log.error("INVALID_ACCESS_TOKEN");
                //TODO
            }

            *//*Token token = authTokenProvider.createToken(accessToken);
            //token sign check
            if (!token.isSign(accessToken)) {
                log.info("errorType1");
               *//**//* String clientId = null;
                String code = null;
                String refreshToken = null;

                //쿠키 조회
                Cookie[] cookies = request.getCookies();
                for(Cookie cookie:cookies) {
                    if(cookie.getName().contains("clientId")) {
                        clientId = cookie.getValue();
                    } else if(cookie.getName().contains("code")) {
                        code = cookie.getValue();
                    } else if(cookie.getName().contains("refreshToken")) {
                        refreshToken = cookie.getValue();
                    }
                }*//**//*
                //리프레쉬토큰이 있으면 갱신 없으면 재로그인
               *//**//* if(refreshToken != null){
                    //토큰 갱신
                    HttpSession sesssion = request.getSession();
                    ResponseEntity<Map> tokenMap = restTemplateUtil.refreshToken(sesssion,clientId,code,refreshToken);
                    Map<String,Object> codeMap2 = (Map)tokenMap.getBody();
                    Map<String,Object> tokenMap2 = (Map)((Map) tokenMap.getBody().get("data")).get("token");

                    if(!"OK".equals(codeMap2.get("serviceStatus"))){
                        session.setAttribute("accessToken",tokenMap2.get("accessToken"));
                        Cookie refreshToken2 = new Cookie("refreshToken",(String)tokenMap2.get("refreshToken"));
                        //데이터내 시간대로 쿠키 저장
                        refreshToken2.setPath("/");
                        refreshToken2.setMaxAge(((Long)tokenMap2.get("refreshTokenExpiresIn")).intValue());
                        response.addCookie(refreshToken2);
                        result = true;
                    }
                } else {
                    return false;
                }*//**//*

//                log.error("INVALID_ACCESS_TOKEN");
                //TODO
            }

            //token expired check
            if (token.isTokenExpired(accessToken)) {
                log.info("errorType2");
                String clientId = null;
                String code = null;
                String refreshToken = null;

                //쿠키 조회
               *//**//* Cookie[] cookies = request.getCookies();
                for(Cookie cookie:cookies) {
                    if(cookie.getName().contains("clientId")) {
                        clientId = cookie.getValue();
                    } else if(cookie.getName().contains("code")) {
                        code = cookie.getValue();
                    } else if(cookie.getName().contains("refreshToken")) {
                        refreshToken = cookie.getValue();
                    }
                }*//**//*
                //리프레쉬토큰이 있으면 갱신 없으면 재로그인
                *//**//*if(refreshToken != null){
                    //토큰 갱신
                    HttpSession sesssion = request.getSession();
                    ResponseEntity<Map> tokenMap = restTemplateUtil.refreshToken(sesssion,clientId,code,refreshToken);
                    Map<String,Object> codeMap2 = (Map)tokenMap.getBody();
                    Map<String,Object> tokenMap2 = (Map)((Map) tokenMap.getBody().get("data")).get("token");

                    if(!"OK".equals(codeMap2.get("serviceStatus"))){
                        session.setAttribute("accessToken",tokenMap2.get("accessToken"));
                        Cookie refreshToken2 = new Cookie("refreshToken",(String)tokenMap2.get("refreshToken"));
                        //데이터내 시간대로 쿠키 저장
                        refreshToken2.setPath("/");
                        refreshToken2.setMaxAge(((Long)tokenMap2.get("refreshTokenExpiresIn")).intValue());
                        response.addCookie(refreshToken2);
                        result = true;
                    }
                } else {
                    return false;
                }*//**//*

                //TODO
//                log.error("CREDENTIAL_EXPIRED_TOKEN");
//                throw new ApiException(ServiceCode.CREDENTIAL_EXPIRED_TOKEN);
            }*//*
//            LockedException
         *//*   Claims claims = token.getAllClaimsFromToToken(accessToken);
            String clientId = claims.get("clientId", String.class);
            String subjectAccessToken = clientId + ACCESS_TOKEN_SUBJECT;
            String subject = claims.getSubject();*//*

           *//* if (!subjectAccessToken.equals(subject)) {
                //TODO
//                throw new ApiException(ServiceCode.BAD_CREDENTIAL_ERROR);
            }*//*
        }else {
            log.info("errorType3");
        }*/
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
}
