package com.sls.login;

import com.sls.login.service.LoginService;
import com.sls.user.entity.User;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.naming.AuthenticationException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@Transactional
@RequestMapping()
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String login(HttpServletRequest request, @RequestParam("page") String page) {
        WebUtils.getAndClearSavedRequest(request);
        request.setAttribute("page", page);
        return "scormfront/login";
    }

    @RequestMapping(value = "/loginResult", method = {RequestMethod.POST})
    public ModelAndView loginResult(HttpServletRequest request, User user, HttpSession session) throws AuthenticationException {
        return loginService.loginResult(request, user, session);
    }

    @RequestMapping(value = "/", method = {RequestMethod.GET})
    public String toIndex(HttpServletRequest request, HttpSession session) {
        return loginService.toIndex(request, session);
    }

    @RequestMapping(value = "/sendPasswordEmail", method = RequestMethod.POST)
    @ResponseBody
    public Boolean sendPasswordEmail(@RequestParam("email") String email, @RequestParam("basePath") String basePath) {
        return loginService.sendPasswordEmail(email, basePath);
    }

    @RequestMapping(value = "/emailChangePassword", method = RequestMethod.GET)
    public String sendPasswordEmail(HttpServletRequest request, @RequestParam("key") String key) {
        request.setAttribute("key", key);
        return "scormfront/forgetChangePassword";
    }
}
