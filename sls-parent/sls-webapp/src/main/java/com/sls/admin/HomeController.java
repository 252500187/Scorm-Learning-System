package com.sls.admin;

import com.sls.admin.entity.User;
import com.sls.admin.service.RoleService;
import com.sls.admin.service.UserService;
import com.sls.util.LoginUserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
@Controller
@RequestMapping()
public class HomeController {
    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/index", method = {RequestMethod.GET, RequestMethod.POST})
    public String index(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String loginName = LoginUserUtil.findLoginUserName();
        List<User> user = userService.findUserByLoginName(loginName);
        if (user.size() > 0) {
            session.setAttribute("userId", user.get(0).getId());
            if (true) {                 //todo 若登陆了， 且登陆身份为管理员
                return "/scormadmin/index";
            }
        }
        return "/scormfront/index";
    }

    @RequestMapping("lock_screen.*")
    public String displayLockScreenPage() {
        return "lockScreen";
    }
}