package com.trism.jesica.config;

import com.trism.jesica.Service.AuthService;
import com.trism.jesica.persistence.mysql.Entitiy.common.LoginSession;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteAcl;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteMenu;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.Optional;
import java.util.UUID;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

    private final AntPathMatcher pathMatcher = new AntPathMatcher();

    /**
     * 운영에서 너무 많은 로그가 찍히면 false 유지.
     * 갑자기 로그아웃되는 원인 추적할 때만 true로 바꿔서 상세 세션 로그 확인.
     */
    private static final boolean SESSION_DETAIL_LOG_ENABLED = false;

    @Autowired
    private AuthService authService;

    /**
     * 로그인 없이 접근 가능한 경로
     */
    private boolean isPublicPath(String servletPath) {
        return servletPath.equals("/")
                || servletPath.startsWith("/login")
                || servletPath.startsWith("/terms")
                || servletPath.startsWith("/ping")

                // 에러 페이지
                || servletPath.equals("/error")
                || servletPath.startsWith("/error/")

                // 권한 에러 페이지
                || servletPath.equals("/authError")
                || servletPath.startsWith("/authError/")

                // library 공개 API
                || pathMatcher.match("/api/library/file/list/**", servletPath)
                || pathMatcher.match("/api/library/file/detail/**", servletPath)
                || pathMatcher.match("/api/file/**", servletPath)
                || pathMatcher.match("/api/file/**", servletPath)

                // 택배비 조회 API
                || pathMatcher.match("/api/system/surcharge/check", servletPath)

                //모바일 faq
                || pathMatcher.match("/mobile/**", servletPath)
                || pathMatcher.match("/api/system/faq/**", servletPath)

                // 기존 허용 path
                || servletPath.contains("fileLoad")
                || servletPath.contains("test/test")

                // token 관련 URL
                || pathMatcher.match("/api/token/**", servletPath)
                || pathMatcher.match("/api/auth/token/**", servletPath)
                || pathMatcher.match("/token/**", servletPath);
    }

    /**
     * 정적 리소스
     */
    private boolean isStaticResource(String uri) {
        return uri.startsWith("/assets/")
                || uri.startsWith("/js/")
                || uri.startsWith("/css/")
                || uri.startsWith("/images/")
                || uri.startsWith("/img/")
                || uri.startsWith("/fonts/")
                || uri.startsWith("/favicon/")
                || uri.equals("/favicon.ico");
    }

    /**
     * API 요청인지 확인
     */
    private boolean isApiRequest(String servletPath) {
        return servletPath.startsWith("/api/");
    }

    /**
     * Ajax 요청인지 확인
     */
    private boolean isAjaxRequest(HttpServletRequest request) {
        String requestedWith = request.getHeader("X-Requested-With");
        String accept = request.getHeader("Accept");

        return "XMLHttpRequest".equalsIgnoreCase(requestedWith)
                || (accept != null && accept.contains("application/json"));
    }

    /**
     * 로그인 필요 응답 처리
     */
    private boolean rejectLogin(HttpServletRequest request,
                                HttpServletResponse response,
                                String servletPath,
                                String traceId,
                                String reason) throws Exception {

        log.warn("[{}] [REJECT LOGIN] reason={}, method={}, uri={}, servletPath={}, requestedSessionId={}, requestedSessionIdValid={}, hasJSESSIONID={}, hasSESSION={}, remoteAddr={}, xForwardedFor={}",
                traceId,
                reason,
                request.getMethod(),
                request.getRequestURI(),
                servletPath,
                maskSessionId(request.getRequestedSessionId()),
                request.isRequestedSessionIdValid(),
                hasCookie(request, "JSESSIONID"),
                hasCookie(request, "SESSION"),
                request.getRemoteAddr(),
                request.getHeader("X-Forwarded-For"));

        if (isApiRequest(servletPath) || isAjaxRequest(request)) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write("{\"code\":\"LOGIN_REQUIRED\",\"message\":\"로그인이 필요합니다.\"}");
            return false;
        }

        response.sendRedirect("/login");
        return false;
    }

    /**
     * 권한 없음 응답 처리
     */
    private boolean rejectAuth(HttpServletRequest request,
                               HttpServletResponse response,
                               String servletPath,
                               String traceId,
                               String reason) throws Exception {

        log.warn("[{}] [REJECT AUTH] reason={}, method={}, uri={}, servletPath={}, requestedSessionId={}, requestedSessionIdValid={}, remoteAddr={}, xForwardedFor={}",
                traceId,
                reason,
                request.getMethod(),
                request.getRequestURI(),
                servletPath,
                maskSessionId(request.getRequestedSessionId()),
                request.isRequestedSessionIdValid(),
                request.getRemoteAddr(),
                request.getHeader("X-Forwarded-For"));

        if (isApiRequest(servletPath) || isAjaxRequest(request)) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write("{\"code\":\"AUTH_DENIED\",\"message\":\"권한이 없습니다.\"}");
            return false;
        }

        response.sendRedirect("/authError");
        return false;
    }

    /**
     * 세션 만료 예상 시간 저장
     *
     * 이 값은 화면 표시용.
     * Redis TTL을 직접 연장하는 핵심 로직은 아님.
     */
    private void refreshExpire(HttpSession session) {
        int timeout = session.getMaxInactiveInterval();
        long expiresAt = System.currentTimeMillis() + timeout * 1000L;
        session.setAttribute("SESSION_EXPIRES_AT", expiresAt);
    }

    /**
     * 세션 요약 로그
     */
    private void logSessionSummary(String traceId,
                                   HttpServletRequest request,
                                   HttpSession session,
                                   LoginSession sessionObj,
                                   String status) {

        if (session == null) {
            log.info("[{}] [SESSION] status={}, session=null, requestedSessionId={}, requestedSessionIdValid={}, hasJSESSIONID={}, hasSESSION={}",
                    traceId,
                    status,
                    maskSessionId(request.getRequestedSessionId()),
                    request.isRequestedSessionIdValid(),
                    hasCookie(request, "JSESSIONID"),
                    hasCookie(request, "SESSION"));
            return;
        }

        long now = System.currentTimeMillis();
        long usedSeconds = (now - session.getLastAccessedTime()) / 1000;
        long remainSeconds = session.getMaxInactiveInterval() - usedSeconds;

        log.info("[{}] [SESSION] status={}, sessionId={}, isNew={}, maxInactiveInterval={}초, remain={}초, userStaffNo={}, roleType={}",
                traceId,
                status,
                maskSessionId(session.getId()),
                session.isNew(),
                session.getMaxInactiveInterval(),
                Math.max(remainSeconds, 0),
                sessionObj != null ? sessionObj.getUserStaffNo() : null,
                sessionObj != null ? sessionObj.getRoleType() : null);
    }

    /**
     * 세션 상세 로그
     *
     * 갑자기 로그아웃 원인 추적할 때만 사용.
     * SESSION_DETAIL_LOG_ENABLED=true 로 켜면 됨.
     */
    private void logSessionDetail(String traceId,
                                  HttpServletRequest request,
                                  HttpSession session) {
        if (!SESSION_DETAIL_LOG_ENABLED) {
            return;
        }

        try {
            log.info("[{}] [SESSION DETAIL] method={}, uri={}, servletPath={}",
                    traceId,
                    request.getMethod(),
                    request.getRequestURI(),
                    request.getServletPath());

            log.info("[{}] [SESSION DETAIL] requestedSessionId={}, requestedSessionIdValid={}",
                    traceId,
                    maskSessionId(request.getRequestedSessionId()),
                    request.isRequestedSessionIdValid());

            log.info("[{}] [SESSION DETAIL] remoteAddr={}, xForwardedFor={}, xForwardedProto={}, referer={}, accept={}, contentType={}",
                    traceId,
                    request.getRemoteAddr(),
                    request.getHeader("X-Forwarded-For"),
                    request.getHeader("X-Forwarded-Proto"),
                    request.getHeader("Referer"),
                    request.getHeader("Accept"),
                    request.getContentType());

            logCookieSummary(traceId, request);

            if (session == null) {
                log.info("[{}] [SESSION DETAIL] session=null", traceId);
                return;
            }

            log.info("[{}] [SESSION DETAIL] sessionId={}, creationTime={}, lastAccessedTime={}, maxInactiveInterval={}, isNew={}",
                    traceId,
                    maskSessionId(session.getId()),
                    session.getCreationTime(),
                    session.getLastAccessedTime(),
                    session.getMaxInactiveInterval(),
                    session.isNew());

            Enumeration<String> names = session.getAttributeNames();

            if (!names.hasMoreElements()) {
                log.info("[{}] [SESSION DETAIL] attributes=empty", traceId);
                return;
            }

            while (names.hasMoreElements()) {
                String name = names.nextElement();
                Object value = session.getAttribute(name);

                log.info("[{}] [SESSION DETAIL] attr name={}, type={}, value={}",
                        traceId,
                        name,
                        value != null ? value.getClass().getName() : "null",
                        safeAttributeValue(name, value));
            }

        } catch (Exception e) {
            log.error("[{}] [SESSION DETAIL ERROR]", traceId, e);
        }
    }

    /**
     * 쿠키 요약 로그
     *
     * 쿠키 값 전체는 찍지 않음.
     */
    private void logCookieSummary(String traceId, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();

        if (cookies == null || cookies.length == 0) {
            log.info("[{}] [COOKIE] empty", traceId);
            return;
        }

        StringBuilder names = new StringBuilder();

        for (Cookie cookie : cookies) {
            if (names.length() > 0) {
                names.append(",");
            }

            names.append(cookie.getName())
                    .append("(")
                    .append(maskCookieValue(cookie.getValue()))
                    .append(")");
        }

        log.info("[{}] [COOKIE] names={}", traceId, names);
    }

    /**
     * 쿠키 존재 여부
     */
    private boolean hasCookie(HttpServletRequest request, String cookieName) {
        Cookie[] cookies = request.getCookies();

        if (cookies == null || cookies.length == 0) {
            return false;
        }

        for (Cookie cookie : cookies) {
            if (cookieName.equals(cookie.getName())) {
                return true;
            }
        }

        return false;
    }

    /**
     * 쿠키 값 마스킹
     */
    private String maskCookieValue(String value) {
        if (value == null) {
            return null;
        }

        if (value.length() <= 8) {
            return "****";
        }

        return value.substring(0, 4) + "****" + value.substring(value.length() - 4);
    }

    /**
     * 세션 ID 마스킹
     */
    private String maskSessionId(String value) {
        if (value == null) {
            return null;
        }

        if (value.length() <= 8) {
            return "****";
        }

        return value.substring(0, 4) + "****" + value.substring(value.length() - 4);
    }

    /**
     * 세션 attribute 로그 값 제한
     */
    private Object safeAttributeValue(String name, Object value) {
        if (value == null) {
            return null;
        }

        if (LoginSession.KEY.equals(name)) {
            LoginSession loginSession = (LoginSession) value;

            return "LoginSession{" +
                    "userStaffNo=" + loginSession.getUserStaffNo() +
                    ", roleType=" + loginSession.getRoleType() +
                    "}";
        }

        if ("SESSION_EXPIRES_AT".equals(name)) {
            return value;
        }

        return "[value hidden]";
    }

    /**
     * 메뉴 권한 체크
     *
     * - 마스터 roleType == 0 은 권한 체크 제외
     * - /{menuGroup}/{menuPage}/... 형태일 때만 체크
     */
    private boolean hasMenuPermission(LoginSession sessionObj,
                                      String servletPath,
                                      String traceId) {
        if (sessionObj == null) {
            log.warn("[{}] [MENU PERMISSION] sessionObj=null", traceId);
            return false;
        }

        if (sessionObj.getRoleType() == 0) {
            log.info("[{}] [MENU PERMISSION] master pass. userStaffNo={}, servletPath={}",
                    traceId,
                    sessionObj.getUserStaffNo(),
                    servletPath);
            return true;
        }

        String[] parts = servletPath.split("/");

        if (parts.length <= 2) {
            log.info("[{}] [MENU PERMISSION] root path pass. servletPath={}",
                    traceId,
                    servletPath);
            return true;
        }

        String menuPath = parts[1] + "/" + parts[2];

        Optional<TbSiteMenu> tbSiteMenuOpt = authService.getTbSiteMenu(menuPath);

        if (!tbSiteMenuOpt.isPresent()) {
            log.info("[{}] [MENU PERMISSION] menu not found pass. menuPath={}, servletPath={}",
                    traceId,
                    menuPath,
                    servletPath);
            return true;
        }

        TbSiteMenu menu = tbSiteMenuOpt.get();

        TbSiteAcl acl = authService.getTbSiteAcl(
                Long.valueOf(sessionObj.getUserStaffNo()),
                Long.parseLong(menu.getMenuNo().toString())
        );

        boolean result = acl != null && acl.getPermission() != 0;

        log.info("[{}] [MENU PERMISSION] userStaffNo={}, roleType={}, menuPath={}, menuNo={}, permission={}, result={}",
                traceId,
                sessionObj.getUserStaffNo(),
                sessionObj.getRoleType(),
                menuPath,
                menu.getMenuNo(),
                acl != null ? acl.getPermission() : null,
                result);

        return result;
    }

    /**
     * traceId 생성
     */
    private String createTraceId() {
        return UUID.randomUUID().toString().replace("-", "").substring(0, 12);
    }

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        final String uri = request.getRequestURI();
        final String servletPath = request.getServletPath();
        final String method = request.getMethod();

        /*
         * 0. 정적 리소스는 로그도 남기지 않고 바로 통과
         *
         * /js/**
         * /css/**
         * /images/**
         * /img/**
         * /fonts/**
         * /favicon.ico
         *
         * 이런 요청은 세션 추적에 거의 필요 없고 로그만 더럽힘.
         */
        if (isStaticResource(uri)) {
            return true;
        }

        final String traceId = createTraceId();
        final long startTime = System.currentTimeMillis();

        request.setAttribute("TRACE_ID", traceId);
        request.setAttribute("REQUEST_START_TIME", startTime);

        boolean publicPath = isPublicPath(servletPath);
        boolean apiRequest = isApiRequest(servletPath);
        boolean ajaxRequest = isAjaxRequest(request);

        log.info("[{}] [REQUEST START] method={}, uri={}, servletPath={}, api={}, ajax={}, public={}, remoteAddr={}, xForwardedFor={}",
                traceId,
                method,
                uri,
                servletPath,
                apiRequest,
                ajaxRequest,
                publicPath,
                request.getRemoteAddr(),
                request.getHeader("X-Forwarded-For"));

        /*
         * 1. 세션 조회
         */
        HttpSession session = request.getSession(false);

        /*
         * 2. 세션 상세 로그
         * 기본은 꺼져 있음.
         */
        logSessionDetail(traceId, request, session);

        /*
         * 3. 세션 없음
         */
        if (session == null) {
            logSessionSummary(traceId, request, null, null, "NO_SESSION");

            if (publicPath) {
                log.info("[{}] [PASS] public path without session. servletPath={}",
                        traceId,
                        servletPath);
                return true;
            }

            return rejectLogin(request, response, servletPath, traceId, "SESSION_NULL");
        }

        /*
         * 4. 로그인 세션 객체 확인
         */
        LoginSession sessionObj = (LoginSession) session.getAttribute(LoginSession.KEY);

        if (sessionObj == null) {
            logSessionSummary(traceId, request, session, null, "LOGIN_SESSION_MISSING");

            if (publicPath) {
                log.info("[{}] [PASS] public path without login session. servletPath={}",
                        traceId,
                        servletPath);
                return true;
            }

            return rejectLogin(request, response, servletPath, traceId, "LOGIN_SESSION_ATTRIBUTE_NULL");
        }

        /*
         * 5. 로그인 상태인데 로그인 페이지 접근 시 main으로 이동
         */
        if (servletPath.startsWith("/login")) {
            logSessionSummary(traceId, request, session, sessionObj, "ALREADY_LOGIN");

            log.info("[{}] [REDIRECT] already logged in. /login -> /main. sessionId={}",
                    traceId,
                    maskSessionId(session.getId()));

            response.sendRedirect("/main");
            return false;
        }

        /*
         * 6. 세션 만료 예상 시간 갱신
         */
        refreshExpire(session);

        /*
         * 정상 요청마다 세션 로그가 너무 많으면 이것도 주석 가능.
         * 세션 튕김 추적 중이면 유지.
         */
        logSessionSummary(traceId, request, session, sessionObj, "LOGIN_OK");

        /*
         * 7. 권한 체크
         */
        try {
            if (!hasMenuPermission(sessionObj, servletPath, traceId)) {
                log.warn("[{}] [AUTH DENIED] uri={}, servletPath={}, sessionId={}, userStaffNo={}, roleType={}",
                        traceId,
                        uri,
                        servletPath,
                        maskSessionId(session.getId()),
                        sessionObj.getUserStaffNo(),
                        sessionObj.getRoleType());

                return rejectAuth(request, response, servletPath, traceId, "MENU_PERMISSION_DENIED");
            }
        } catch (Exception e) {
            log.error("[{}] [MENU PERMISSION ERROR] uri={}, servletPath={}, sessionId={}, userStaffNo={}",
                    traceId,
                    uri,
                    servletPath,
                    maskSessionId(session.getId()),
                    sessionObj.getUserStaffNo(),
                    e);

            return rejectAuth(request, response, servletPath, traceId, "MENU_PERMISSION_ERROR");
        }

        log.info("[{}] [PASS] method={}, uri={}, sessionId={}, userStaffNo={}, roleType={}",
                traceId,
                method,
                uri,
                maskSessionId(session.getId()),
                sessionObj.getUserStaffNo(),
                sessionObj.getRoleType());

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response,
                           Object handler,
                           ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response,
                                Object handler,
                                Exception ex) throws Exception {

        /*
         * 정적 리소스는 preHandle에서 TRACE_ID를 만들지 않음.
         * 그래서 여기서도 로그 제외.
         */
        if (isStaticResource(request.getRequestURI())) {
            super.afterCompletion(request, response, handler, ex);
            return;
        }

        Object traceIdObj = request.getAttribute("TRACE_ID");
        Object startTimeObj = request.getAttribute("REQUEST_START_TIME");

        String traceId = traceIdObj != null ? traceIdObj.toString() : "-";
        long startTime = startTimeObj instanceof Long ? (Long) startTimeObj : System.currentTimeMillis();
        long elapsed = System.currentTimeMillis() - startTime;

        if (ex != null) {
            log.error("[{}] [REQUEST ERROR] method={}, uri={}, status={}, elapsed={}ms",
                    traceId,
                    request.getMethod(),
                    request.getRequestURI(),
                    response.getStatus(),
                    elapsed,
                    ex);
        } else {
            log.info("[{}] [REQUEST END] method={}, uri={}, status={}, elapsed={}ms",
                    traceId,
                    request.getMethod(),
                    request.getRequestURI(),
                    response.getStatus(),
                    elapsed);
        }

        super.afterCompletion(request, response, handler, ex);
    }
}
