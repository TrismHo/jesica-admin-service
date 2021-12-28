package com.trism.jesica.config;

import com.trism.jesica.persistence.Entitiy.common.LoginSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component
@Slf4j
public class SessionConfig implements HttpSessionListener {


    private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<>();

    //신규 로그인시 중복 로그인 삭제 처리
    public synchronized static void newSession(String loginId , HttpSession session){
        //중복된 세션이 있는지 확인
        boolean duplicated = sessions.containsKey(loginId);
        //있으면 기존 세션 삭제
       /* if (duplicated) {
            sessions.remove(loginId).invalidate();
        }*/
        //신규 세션 추가
        sessions.put(loginId, session);
    }

    private static void removeSessionForDoubleLogin(String bmLoginId, String sessionKey, HttpSession session){
        System.out.println("remove bmLoginId : " + bmLoginId);
        if(bmLoginId != null && bmLoginId.length() > 0){
            session.invalidate();
        }
    }

    @Override
    public void sessionCreated(HttpSessionEvent hse) {
        log.info("세션호출");
        log.info(hse.getSession().getId());
        //sessions.put(hse.getSession().getId(), hse.getSession());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent hse) {
        log.info("세션호출2");
        HttpSession session = hse.getSession();
        LoginSession sessionObj = (LoginSession)session.getAttribute(LoginSession.KEY);

        if(sessionObj != null && sessionObj.getUserLoginId() != null){
            session.invalidate();
            sessions.remove(sessionObj.getUserLoginId());
        }
    }
}
