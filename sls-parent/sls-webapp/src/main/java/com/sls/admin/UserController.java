package com.sls.admin;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.entity.User;
import com.sls.admin.service.UserService;
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
import java.security.GeneralSecurityException;

@Controller
@Transactional
@RequestMapping("/admin/user/")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "listAllUserDo", method = {RequestMethod.GET})
    public String listAllUserDo(HttpServletRequest request) {
        request.setAttribute("myLoginId", userService.findUserByLoginName(LoginUserUtil.findLoginUserName()).get(0).getId());
        request.setAttribute("shield", DictConstant.SHIELD);
        return "scormadmin/user/listAllUserDo";
    }

    @RequestMapping(value = "listAllUser", method = RequestMethod.POST)
    @ResponseBody
    public Page listAllUser(PageParameter pageParameter, User user) {
        return userService.findUserPageList(pageParameter, user);
    }




    @RequestMapping(value = "addUserDo", method = {RequestMethod.GET})
    public String addUserDo() {
        return "scormadmin/front/addUserDo";
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
        return "scormadmin/front/editUserDo";
    }

    @RequestMapping(value = "editUser", method = {RequestMethod.POST})
    @ResponseBody
    public void editUser(User user, @RequestParam("oldLoginName") String oldLoginName) {
        userService.checkRepeatLoginName(user.getLoginName(), oldLoginName);
        userService.editUser(user);
    }
}