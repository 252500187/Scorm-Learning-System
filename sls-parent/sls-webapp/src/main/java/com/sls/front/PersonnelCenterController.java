package com.sls.front;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created with IntelliJ IDEA.
 * User: zhangtq
 * Date: 14-5-2
 * Time: 下午2:27
 * To change this template use File | Settings | File Templates.
 */
@Controller
@Transactional
@RequestMapping("/user/scormfront/usercenter/")
public class PersonnelCenterController {
    @RequestMapping(value = "personnelInfo", method = {RequestMethod.GET})
    public String personnelInfo() {
        return "scormfront/usercenter/personnelInfo";
    }
}
