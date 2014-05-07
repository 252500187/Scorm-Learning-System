package com.sls.user;


import com.sls.scorm.service.ScormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@Transactional
@RequestMapping("/user/scorm/")
public class ScormController {

    @Autowired
    private ScormService scormService;

    @RequestMapping(value = "registerScorm", method = {RequestMethod.GET})
    @ResponseBody
    public String[] registerScorm(HttpServletRequest request, @RequestParam("scormId") String scormId) {
        String str[] = {scormService.registerScorm(Integer.parseInt(scormId), request)};
        return str;
    }


    @RequestMapping(value = "studyScorm", method = {RequestMethod.GET})
    public String studyScorm(HttpServletRequest request, @RequestParam("scormId") String scormId) {
        scormService.studyScorm(Integer.parseInt(scormId), request);
        return "scormfront/scorm/studyScorm";
    }


    @RequestMapping(value = "changeScoState", method = {RequestMethod.GET})
    @ResponseBody
    public int changeScoState(@RequestParam("scormId") String scormId, @RequestParam("scoId") String scoId) {
        scormService.changeScoState(Integer.parseInt(scormId), Integer.parseInt(scoId));
        return 2;
    }
}
