package com.trism.jesica.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
@RestController
@RequestMapping("/session")
public class SessionController {

    @GetMapping("/set")
    public String setSession(HttpSession session) {
        session.setAttribute("redis-set", "success");
        return "Session set successfully!";
    }

    @GetMapping("/get")
    public String getSession(HttpSession session) {
        return "Stored redis-set: " + session.getAttribute("redis-set");
    }
}


