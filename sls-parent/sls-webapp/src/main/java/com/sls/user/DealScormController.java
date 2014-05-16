package com.sls.user;

import com.sls.scorm.service.ScormService;
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
@RequestMapping("/user/dealScorm/")
public class DealScormController {

    @Autowired
    private ScormService scormService;

    @RequestMapping(value = "registerScorm", method = {RequestMethod.GET})
    @ResponseBody
    public String[] registerScorm(HttpServletRequest request, @RequestParam("scormId") String scormId) {
        String str[] = {scormService.registerScorm(Integer.parseInt(scormId), request)};
        return str;
    }
}
