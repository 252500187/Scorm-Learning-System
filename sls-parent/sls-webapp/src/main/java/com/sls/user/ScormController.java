package com.sls.user;


import com.sls.scorm.entity.ScoInfo;
import com.sls.scorm.entity.StudyNote;
import com.sls.scorm.service.ScormService;
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
public class ScormController {

    @Autowired
    private ScormService scormService;

    @RequestMapping(value = "registerScorm", method = {RequestMethod.GET})
    @ResponseBody
    public String[] registerScorm(HttpServletRequest request, @RequestParam("scormId") String scormId) {
        String str[] = {scormService.registerScorm(Integer.parseInt(scormId), request)};
        return str;
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
        scormService.getAllStudyNotesByScormIdAndUserId(Integer.parseInt(scormId), request);
        return "scormfront/scorm/studyScorm";
    }


    @RequestMapping(value = "changeScoState", method = {RequestMethod.GET})
    @ResponseBody
    public void changeScoState(@RequestParam("scormId") String scormId, @RequestParam("scoId") String scoId) {
        scormService.changeScoState(Integer.parseInt(scormId), Integer.parseInt(scoId));
    }

    @RequestMapping(value = "takeNote", method = {RequestMethod.POST})
    @ResponseBody
    public void takeNote(StudyNote studyNote) {
        studyNote.setNoteType(DictConstant.TEXT_TYPE);
        studyNote.setImgPath("");
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
        scormService.changeScoInfoByScoId(scoInfo, Integer.parseInt(scormId));
    }

    @RequestMapping(value = "upStudyImgDo", method = {RequestMethod.GET})
    public String upStudyImgDo(HttpServletRequest request, @RequestParam("scormId") String scormId, @RequestParam("scoId") String scoId) {
        request.setAttribute("scormId", scormId);
        request.setAttribute("scoId", scoId);
        return "scormfront/scorm/studyNoteUpImg";
    }

    @RequestMapping(value = "upStudyImg", method = {RequestMethod.POST})
    public String upStudyImg(HttpServletRequest request, StudyNote studyNote) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        studyNote.setNoteType(DictConstant.IMG);
        scormService.upStudyImg(request, "noteImg", studyNote);
        request.setAttribute("close", "close");
        return "scormfront/scorm/studyNoteUpImg";
    }

}
