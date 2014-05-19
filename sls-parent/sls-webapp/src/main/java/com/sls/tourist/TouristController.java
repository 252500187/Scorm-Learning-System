package com.sls.tourist;


import com.sls.scorm.service.ScormService;
import com.sls.user.entity.User;
import com.sls.user.service.UserService;
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
@RequestMapping("/tourist/")
public class TouristController {
    @Autowired
    private UserService userService;

    @Autowired
    private ScormService scormService;

    @RequestMapping(value = "register", method = {RequestMethod.POST})
    @ResponseBody
    public void register(User user) {
        userService.addUser(user);
    }

    @RequestMapping(value = "checkRepeatLoginName", method = RequestMethod.POST)
    @ResponseBody
    public boolean checkRepeatLoginName(@RequestParam("registerLoginName") String loginName) {
        return userService.checkRepeatLoginName(loginName);
    }

    @RequestMapping(value = "scormInfo", method = {RequestMethod.GET})
    public String scormInfo(@RequestParam("scormId") String scormId, HttpServletRequest request) {
        scormService.getScormInfo(Integer.parseInt(scormId), request);
        scormService.getScormOperate(Integer.parseInt(scormId), request);
        return "scormfront/scorm/scormInfo";
    }

    @RequestMapping(value = "findScorm", method = {RequestMethod.GET})
    public String findScorm(@RequestParam("findInfo") String findInfo, HttpServletRequest request) {
        //todo 找到课件搜索
        return "scormfront/scorm/findResult";
    }
}
