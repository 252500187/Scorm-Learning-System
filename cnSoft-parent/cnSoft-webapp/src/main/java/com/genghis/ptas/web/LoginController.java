/*
* LoginController.java
* Created on  2013-10-6 下午12:35
* 版本       修改时间          作者      修改内容
* V1.0.1    2013-10-6       gaoxinyu    初始版本
*
*/
package com.genghis.ptas.web;

import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
@Controller
@RequestMapping()
public class LoginController {

    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String login(HttpServletRequest request) {
        WebUtils.getAndClearSavedRequest(request);
        return "login";
    }

    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String loginPost(HttpServletRequest request) {
        WebUtils.getAndClearSavedRequest(request);
        request.setAttribute("message", "用户名或密码错误！");
        return "login";
    }
}
