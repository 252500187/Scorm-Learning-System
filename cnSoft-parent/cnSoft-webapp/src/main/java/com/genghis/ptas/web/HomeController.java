package com.genghis.ptas.web;

import com.genghis.ptas.constant.DictConstant;
import com.genghis.ptas.security.entity.Role;
import com.genghis.ptas.security.entity.User;
import com.genghis.ptas.security.service.RoleService;
import com.genghis.ptas.security.service.UserService;
import com.genghis.ptas.util.LoginUserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.GeneralSecurityException;

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
        Boolean isChairman = DictConstant.ROLE_CHAIRMAN.equals(role.getRoleName());
        session.setAttribute("roleName", role.getRoleName());
        session.setAttribute("isChairman", isChairman);
        session.setAttribute("userId", user.getId());
        request.setAttribute("user", user);
        if (DictConstant.ROLE_CHAIRMAN.equals(role.getRoleName()) || DictConstant.ROLE_JUDGE.equals(role.getRoleName())) {
            return "judges/headPage";
        } else {
            return "/index";
        }
    }

    @RequestMapping("lock_screen.*")
    public String displayLockScreenPage() {
        return "lockScreen";
    }
}