package com.sls.login.service;

import com.sls.admin.entity.User;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface LoginService {
    String toIndex(HttpServletRequest request);

    ModelAndView loginResult(HttpServletRequest request, User user, HttpSession session);
}
