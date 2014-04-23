package com.genghis.sls.admin.web;

import com.genghis.core.page.entity.Page;
import com.genghis.core.page.entity.PageParameter;
import com.genghis.sls.security.entity.User;
import com.genghis.sls.security.service.UserService;
import com.genghis.sls.system.service.UpScormService;
import com.genghis.sls.util.LoginUserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;

/**
 * @author ljb
 * @version 1.0.1
 */
@Controller
@Transactional
@RequestMapping("/admin/user/")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UpScormService upScormService;

    @RequestMapping(value = "listAllUserDo", method = {RequestMethod.GET})
    public String listAllUserDo(HttpServletRequest request) {
        request.setAttribute("myLoginId", userService.findUserByLoginName(LoginUserUtil.findLoginUserName()).getId());
        return "admin/user/listAllUserDo";
    }

    @RequestMapping(value = "listAllUser", method = RequestMethod.POST)
    @ResponseBody
    public Page listAllUser(PageParameter pageParameter, User user) {
        return userService.findUserPageList(pageParameter, user);
    }

    @RequestMapping(value = "addUserDo", method = {RequestMethod.GET})
    public String addUserDo() {
        return "admin/user/addUserDo";
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
        return "admin/user/editUserDo";
    }

    @RequestMapping(value = "editUser", method = {RequestMethod.POST})
    @ResponseBody
    public void editUser(User user, @RequestParam("oldLoginName") String oldLoginName) {
        userService.checkRepeatLoginName(user.getLoginName(), oldLoginName);
        userService.editUser(user);
    }

    @RequestMapping(value = "delUser", method = {RequestMethod.DELETE})
    @ResponseBody
    public void delUser(@RequestParam("ids") String ids) throws GeneralSecurityException {
        String[] userIds = ids.split(",");
        userService.delUsers(userIds);
    }

    @RequestMapping(value = "UP", method = {RequestMethod.GET})
    public String UP() {
        return "test/test";
    }

    @RequestMapping(value = "upup", method = {RequestMethod.POST})
    public String upup(HttpServletRequest request) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        upScormService.upScorm(request, "upScorm", "upImg");
        return "test/jpg";
    }
}
