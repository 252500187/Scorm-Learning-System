/*
* LoginController.java
* Created on  2013-10-6 下午12:35
* 版本       修改时间          作者      修改内容
* V1.0.1    2013-10-6       gaoxinyu    初始版本
*
*/
package com.sls.login;

import com.sls.admin.entity.User;
import com.sls.admin.service.UserService;
import com.sls.util.LoginUserUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.naming.AuthenticationException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping()
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String login(HttpServletRequest request) {
        WebUtils.getAndClearSavedRequest(request);
        return "scormfront/login";
    }

    @RequestMapping(value = "/loginResult", method = {RequestMethod.POST})
    public ModelAndView loginResult(HttpServletRequest request, User user, HttpSession session) throws AuthenticationException {
        ModelAndView modelView = new ModelAndView();
        Subject currentUser = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(
                user.getUserName(), user.getPassword());
        token.setRememberMe(true);
        try {
            currentUser.login(token);
        } catch (Exception e) {
            modelView.addObject("message", "login errors");
            modelView.setViewName("/includes/error500");
            e.printStackTrace();
        }
        if (currentUser.isAuthenticated()) {
            String loginName = LoginUserUtil.findLoginUserName();
            List<User> userList = userService.findUserByLoginName(loginName);
            session.setAttribute("userId", userList.get(0).getId());
            String url = "/scormfront/index";
            if (userList.get(0).getRoleId()==1){
                url = "/scormadmin/index";
            }
            modelView.setViewName(url);
        } else {
            modelView.addObject("message", "密码错误！");
            modelView.setViewName("/scormfront/login");
        }
        return modelView;
    }

    @RequestMapping(value = "/", method = {RequestMethod.GET})
    public String index() {
        String loginName = LoginUserUtil.findLoginUserName();
        List<User> user = userService.findUserByLoginName(loginName);
        if (user.size() > 0) {
            if (user.get(0).getRoleId()==1) {                 //todo 若登陆了， 且登陆身份为管理员
                return "/scormadmin/index";
            }
        }
        return "/scormfront/index";
    }
}
