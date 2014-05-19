package com.sls.scorm.service;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.entity.ScoInfo;
import com.sls.scorm.entity.Scorm;
import com.sls.scorm.entity.ScormSummarize;
import com.sls.scorm.entity.StudyNote;
import org.xml.sax.SAXException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;
import java.io.IOException;
import java.util.List;

public interface ScormService {
    int upScorm(HttpServletRequest request, String upFile, String upImg, Scorm scorm) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException;

    String registerScorm(int scormId, HttpServletRequest request);

    void studyScorm(int scormId, HttpServletRequest request);

    void setScormSummarizeInfo(int scormId, HttpServletRequest request);

    void studyScormZtree(int scormId, HttpServletRequest request);

    void changeScoState(int scormId, int scoId);

    List<ScoInfo> getScoApiInfo(int scoId);

    void changeScoInfoByScoId(ScoInfo scoInfo, int scormId);

    void getScormInfo(int scormId, HttpServletRequest request);

    void getScormOperate(int scormId, HttpServletRequest request);

    String collectScorm(int scormId, HttpServletRequest request);

    void addStudyNote(StudyNote studyNote);

    void getAllStudyNotesByScormIdAndUserId(int scormId, HttpServletRequest request);

    void upStudyImg(HttpServletRequest request, String upImg, StudyNote studyNote) throws ServletException, IOException;

    Page<Scorm> listNotAuditScormPageList(PageParameter pageParameter, Scorm scorm);

    Page<Scorm> listAuditScormPageList(PageParameter pageParameter, Scorm scorm);

    void checkScormInfo(HttpServletRequest request, int scormId);

    void changeScormInUse(int scormId, int isUse);

    String changeScormRecommend(int scormId, int recommend);

    void changScormCompleteWay(int scormId, int completeWay);

    void evaluateScorm(ScormSummarize scormSummarize);

    void getDiscusses(int scormId, HttpServletRequest request);

    void discussScorm(ScormSummarize scormSummarize);

    void getSummarizeInfo(int scormId, HttpServletRequest request);

    void findScorm(String info, HttpServletRequest request);
}
