package com.sls.admin;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.user.entity.User;
import com.sls.user.service.UserService;
import com.sls.util.DictConstant;
import com.sls.util.LoginUserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@Transactional
@RequestMapping("/admin/user/")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "listAllUserDo", method = {RequestMethod.GET})
    public String listAllUserDo(HttpServletRequest request) {
        request.setAttribute("myLoginId", userService.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId());
        request.setAttribute("shield", DictConstant.NO_USE);
        return "scormadmin/user/listAllUserDo";
    }

    @RequestMapping(value = "shieldUser", method = RequestMethod.POST)
    @ResponseBody
    public void shieldUser(@RequestParam("id") int id) {
        userService.shieldUser(id);
    }

    @RequestMapping(value = "listAllUser", method = RequestMethod.POST)
    @ResponseBody
    public Page listAllUser(PageParameter pageParameter, User user) {
        return userService.findUserPageList(pageParameter, user);
    }

    @RequestMapping(value = "addUserDo", method = {RequestMethod.GET})
    public String addUserDo() {
        return "scormadmin/user/addUserDo";
    }

    @RequestMapping(value = "addUser", method = {RequestMethod.POST})
    @ResponseBody
    public void addUser(User user) {
        userService.addUser(user);
    }

    @RequestMapping(value = "checkRepeatLoginName", method = {RequestMethod.POST})
    @ResponseBody
    public boolean checkRepeatPermissionToken(@RequestParam("loginName") String loginName, @RequestParam("oldName") String oldName) {
        return userService.checkRepeatLoginName(loginName, oldName);
    }

    @RequestMapping(value = "checkRepeatUserName", method = {RequestMethod.POST})
    @ResponseBody
    public boolean checkRepeatUserName(@RequestParam("userName") String userName, @RequestParam("oldName") String oldName) {
        return userService.checkRepeatUserName(userName, oldName);
    }

    @RequestMapping(value = "editUserDo", method = {RequestMethod.GET})
    public String editUserDo(HttpServletRequest request, @RequestParam("id") int id) {
        User user = userService.findUserAllInfoById(id);
        request.setAttribute("user", user);
        return "scormadmin/user/editUserDo";
    }
}
