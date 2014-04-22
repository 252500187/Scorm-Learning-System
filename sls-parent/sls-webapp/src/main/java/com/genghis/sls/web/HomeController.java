package com.genghis.sls.web;

import com.genghis.sls.constant.DictConstant;
import com.genghis.sls.security.entity.Role;
import com.genghis.sls.security.entity.User;
import com.genghis.sls.security.service.RoleService;
import com.genghis.sls.security.service.UserService;
import com.genghis.sls.util.LoginUserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
@Controller
@RequestMapping("/")
public class HomeController {
    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @RequestMapping(method = {RequestMethod.GET, RequestMethod.POST})
    public String index(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String loginName = LoginUserUtil.findLoginUserName();
        User user = userService.findUserByLoginName(loginName);
        Role role = roleService.findRoleByUserId(user.getId());
        Boolean isChairman;
        session.setAttribute("roleName", role.getRoleName());
        session.setAttribute("userId", user.getId());
        request.setAttribute("user", user);
        return "/index";
    }

    @RequestMapping("lock_screen.*")
    public String displayLockScreenPage() {
        return "lockScreen";
    }
}