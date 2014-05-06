package com.sls.user;


import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@Transactional
@RequestMapping("/user/scorm/")
public class ScormController {

    @RequestMapping(value = "registerScorm", method = {RequestMethod.GET})
    @ResponseBody
    public String registerScorm(HttpServletRequest request) {
//        userCenterService.toUserCenter(request);
        return "success";
    }
}
