package com.sls.user;

import com.sls.scorm.entity.ScoInfo;
import com.sls.scorm.entity.ScormSummarize;
import com.sls.scorm.entity.StudyNote;
import com.sls.scorm.service.ScormService;
import com.sls.user.service.UserCenterService;
import com.sls.util.DictConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.xml.sax.SAXException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@Transactional
@RequestMapping("/user/scorm/")
public class StudyScormController {

    @Autowired
    private ScormService scormService;

    @Autowired
    private UserCenterService userCenterService;

    @RequestMapping(value = "registerScorm", method = {RequestMethod.GET})
    @ResponseBody
    public void registerScorm(HttpServletRequest request, @RequestParam("scormId") String scormId) {
        scormService.registerScorm(Integer.parseInt(scormId), request);
    }

    @RequestMapping(value = "collectScorm", method = {RequestMethod.GET})
    @ResponseBody
    public String[] collectScorm(HttpServletRequest request, @RequestParam("scormId") String scormId) {
        String str[] = {scormService.collectScorm(Integer.parseInt(scormId), request)};
        return str;
    }

    @RequestMapping(value = "studyScorm", method = {RequestMethod.GET})
    public String studyScorm(HttpServletRequest request, @RequestParam("scormId") String scormId) {
        scormService.studyScorm(Integer.parseInt(scormId), request);
        scormService.getDiscusses(Integer.parseInt(scormId), request);
        scormService.setScormSummarizeInfo(Integer.parseInt(scormId));
        scormService.getSummarizeInfo(Integer.parseInt(scormId), request);
        scormService.getAllStudyNotesByScormIdAndUserId(Integer.parseInt(scormId), request);
        return "scormfront/scorm/studyScorm";
    }

    @RequestMapping(value = "studyScormZtree", method = {RequestMethod.GET})
    public String studyScormZtree(HttpServletRequest request, @RequestParam("scormId") String scormId) {
        scormService.studyScormZtree(Integer.parseInt(scormId), request);
        return "scormfront/scorm/scormZtree";
    }


    @RequestMapping(value = "treeScoClick", method = {RequestMethod.GET})
    @ResponseBody
    public void changeScoState(@RequestParam("scormId") String scormId, @RequestParam("scoId") String scoId) {
        scormService.changeScoState(Integer.parseInt(scormId), Integer.parseInt(scoId));
    }

    @RequestMapping(value = "takeNote", method = {RequestMethod.POST})
    @ResponseBody
    public void takeNote(StudyNote studyNote) {
        scormService.addStudyNote(studyNote);
    }

    @RequestMapping(value = "getScoApiInfo", method = {RequestMethod.GET})
    @ResponseBody
    public List<ScoInfo> getScoApiInfo(@RequestParam("scoId") String scoId) {
        return scormService.getScoApiInfo(Integer.parseInt(scoId));
    }

    @RequestMapping(value = "commitScoApiInfo", method = {RequestMethod.POST})
    @ResponseBody
    public void commitScoApiInfo(ScoInfo scoInfo, @RequestParam("scormId") String scormId) {
        scormService.commitScoApiInfoByScoId(scoInfo, Integer.parseInt(scormId));
    }

    @RequestMapping(value = "upStudyImg", method = {RequestMethod.POST})
    @ResponseBody
    public void upStudyImg(HttpServletRequest request, StudyNote studyNote) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        scormService.upStudyImg(request, "noteImg", studyNote);
    }

    @RequestMapping(value = "userCenterUpNote", method = {RequestMethod.POST})
    public String userCenterUpStudyImg(HttpServletRequest request, StudyNote studyNote, @RequestParam("haveImg") String haveImg) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        studyNote.setScoId(-1);
        if (!("").equals(haveImg)) {
            scormService.upStudyImg(request, "noteImg", studyNote);
        }
        scormService.addStudyNote(studyNote);
        userCenterService.getAllRegisterScormInfo(request);
        request.setAttribute("result", "true");
        return "scormfront/usercenter/note/addNote";
    }
}
