package com.sls.scorm.service;

import com.sls.scorm.entity.ScoInfo;
import com.sls.scorm.entity.Scorm;
import com.sls.scorm.entity.StudyNote;
import org.xml.sax.SAXException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;
import java.io.IOException;
import java.util.List;

public interface ScormService {
    void upScorm(HttpServletRequest request, String upFile, String upImg, Scorm scorm) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException;

    String registerScorm(int scormId, HttpServletRequest request);

    void studyScorm(int scormId, HttpServletRequest request);

    void findScormInfoByScormId(int scormId, HttpServletRequest request);

    void changeScoState(int scormId, int scoId);

    List<ScoInfo> getScoApiInfo(int scoId);

    void changeScoInfoByScoId(ScoInfo scoInfo);

    void getScormInfoAndChapterInfo(int scormId, HttpServletRequest request);

    void getAllCommentsByScormId(int scormId, HttpServletRequest request);

    void judgeDemonstrationStatus(int scormId, HttpServletRequest request);

    String collectScorm(int scormId, HttpServletRequest request);

    void addStudyNote(StudyNote studyNote);
}
