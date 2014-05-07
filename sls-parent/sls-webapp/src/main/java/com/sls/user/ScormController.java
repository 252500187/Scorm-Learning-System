package com.sls.user;


import com.sls.scorm.service.ScormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@Transactional
@RequestMapping("/user/scorm/")
public class ScormController {

    @Autowired
    private ScormService scormService;

    @RequestMapping(value = "registerScorm", method = {RequestMethod.GET})
    @ResponseBody
    public void registerScorm(HttpServletRequest request, @RequestParam("scormId") String scormId) {
        scormService.registerScorm(Integer.parseInt(scormId), request);
    }


    @RequestMapping(value = "studyScorm", method = {RequestMethod.GET})
    public String studyScorm(HttpServletRequest request, @RequestParam("scormId") String scormId) {
        scormService.studyScorm(Integer.parseInt(scormId), request);
        return "scormfront/scorm/studyScorm";
    }
}
