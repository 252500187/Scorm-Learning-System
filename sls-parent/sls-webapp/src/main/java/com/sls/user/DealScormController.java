package com.sls.user;

import com.sls.scorm.entity.ScormSummarize;
import com.sls.scorm.service.ScormService;
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
@RequestMapping("/user/dealScorm/")
public class DealScormController {

    @Autowired
    private ScormService scormService;

    @RequestMapping(value = "evaluateScorm", method = {RequestMethod.POST})
    @ResponseBody
    public void evaluateScorm(ScormSummarize scormSummarize) {
        scormService.evaluateScorm(scormSummarize);
    }

    @RequestMapping(value = "discussScorm", method = {RequestMethod.POST})
    @ResponseBody
    public void discussScorm(ScormSummarize scormSummarize) {
        scormService.discussScorm(scormSummarize);
    }

    @RequestMapping(value = "userStudyInfo", method = {RequestMethod.GET})
    public String userStudyInfo(@RequestParam("scormId") String scormId, HttpServletRequest request) {
        scormService.studyScormZtree(Integer.parseInt(scormId), request);
        scormService.studyScorm(Integer.parseInt(scormId), request);
        scormService.getSummarizeInfo(Integer.parseInt(scormId), request);
        scormService.getAllStudyNotesByScormIdAndUserId(Integer.parseInt(scormId), request);
        return "scormfront/scorm/studyInfo";
    }

    @RequestMapping(value = "review", method = {RequestMethod.GET})
    public String review(@RequestParam("scormId") String scormId, HttpServletRequest request) {
        request.setAttribute("scormId",scormId);
        scormService.findReviewsByScormId(scormId,request);
        return "scormfront/scorm/review";
    }
}
