package com.sls.scorm.service.impl;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.dao.ScoDao;
import com.sls.scorm.dao.ScormDao;
import com.sls.scorm.entity.*;
import com.sls.scorm.service.ScormService;
import com.sls.system.service.DictService;
import com.sls.user.dao.UserDao;
import com.sls.user.entity.User;
import com.sls.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.xml.sax.SAXException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Transactional
@Service("scormService")
public class ScormServiceImpl implements ScormService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private ScormDao scormDao;

    @Autowired
    private ScoDao scoDao;

    @Autowired
    private DictService dictService;

    @Override
    public void upScorm(HttpServletRequest request, String upFile, String upImg, Scorm scorm) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        try {
            FileUp fileUp = new FileUp();
            Date date = new Date();
            int userId = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
            String fileName = date.getTime() + userId + "";
//            scorm.setScormName(BaseUtil.iso2utf(scorm.getScormName()));
            scorm.setImgPath(fileUp.upImg(request, DictConstant.TOP_SCORM_FILE_NAME, "/" + fileName, DictConstant.SCORM_IMG, upImg));
            scorm.setUploadUserId(userId);
            int scormId = scormDao.addScorm(scorm);
            List<Sco> scoNodes = fileUp.analyzeXml(fileUp.upScorm(request, fileName, upFile) + DictConstant.IMSMANIFEST);
            scoNodes.add(new Sco(scorm.getScormName(), DictConstant.SCO_MAIN, "0", "1", "", ""));
            ScoInfo scoInfo = new ScoInfo();
            for (Sco scoNode : scoNodes) {
                scoNode.setScormId(scormId);
                scoInfo.setScoId(scoDao.addSco(scoNode));
                scoInfo.setLaunchData(scoNode.getLaunchData());
                scoDao.addScoInfo(scoInfo);
            }
            request.setAttribute("result", "上传成功");
        } catch (Exception e) {
            request.setAttribute("result", "上传失败");
        }
    }

    @Override
    public String registerScorm(int scormId, HttpServletRequest request) {
        User user = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0);
        int scormState = scormDao.findScormInfoByScormId(scormId).getInUse();
        if (scoDao.findScosByScormIdAndUserId(scormId, user.getUserId()).size() > 0) {
            return "对不起，您已注册。";
        }
        if (scormState == DictConstant.NO_USE) {
            return "此课件不可注册。";
        }
        List<Sco> scoList = scoDao.findScosByScormIdAndUserId(scormId, DictConstant.VOID_VALUE);
        ScoInfo scoInfo;
        for (Sco sco : scoList) {
            sco.setUserId(user.getUserId());
            scoInfo = scoDao.getScoApiInfoByScoId(sco.getScoId()).get(0);
            scoInfo.setScoId(scoDao.addSco(sco));
            //TOdo 找到用户级别名称
            user.getLevelName();
            scoInfo.setCoreStudentId("");
            scoInfo.setCoreStudentName(user.getUserName());
            scoDao.addScoInfo(scoInfo);
        }
        ScormSummarize scormSummarize = new ScormSummarize();
        scormSummarize.setUserId(user.getUserId());
        scormSummarize.setScormId(scormId);
        scormDao.addScormSummarize(scormSummarize);
        scormDao.addVisitSum(scormId);
        return "注册成功。";
    }

    @Override
    public String collectScorm(int scormId, HttpServletRequest request) {
        int userId = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        int scormState = scormDao.findScormInfoByScormId(scormId).getInUse();
        if (scormDao.findCollectScormByScormIdAndUserId(scormId, userId).size() > 0) {
            return "对不起，您已收藏。";
        }
        if (scormState == DictConstant.NO_USE) {
            return "此课件不可收藏。";
        }
        Scorm scorm = new Scorm();
        scorm.setScormId(scormId);
        scorm.setUserId(userId);
        scorm.setCollectDate(DateUtil.getSystemDate("yyyy-MM-dd"));
        scormDao.addCollectScorm(scorm);
        return "收藏成功。";
    }

    @Override
    public void addStudyNote(StudyNote studyNote) {
        studyNote.setNoteType(DictConstant.TEXT_TYPE);
        studyNote.setImgPath("");
        studyNote.setDate(DateUtil.getSystemDate("yyyy-MM-dd"));
        studyNote.setUserId(userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId());
        scormDao.addStudyNote(studyNote);
    }

    @Override
    public void getAllStudyNotesByScormIdAndUserId(int i, HttpServletRequest request) {
        int userId = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        StudyNote studyNote = new StudyNote();
        studyNote.setScormId(i);
        studyNote.setUserId(userId);
        List<StudyNote> studyNoteList = scormDao.getAllStudyNotesByScormIdAndUserId(studyNote);
        request.setAttribute("noteList", studyNoteList.size() == 0 ? new LinkedList<StudyNote>() : studyNoteList);
    }

    @Override
    public void upStudyImg(HttpServletRequest request, String upImg, StudyNote studyNote) throws ServletException, IOException {
        FileUp fileUp = new FileUp();
        Date date = new Date();
        int userId = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        studyNote.setNoteType(DictConstant.IMG);
        studyNote.setUserId(userId);
        studyNote.setDate(DateUtil.getSystemDate("yyyy-MM-dd"));
        studyNote.setImgPath(fileUp.upImg(request, DictConstant.STUDY_IMG, "/" + userId, studyNote.getScormId() + date.getTime() + DictConstant.PHOTO_FORM, upImg));
        scormDao.addStudyNote(studyNote);
    }

    @Override
    public void studyScorm(int scormId, HttpServletRequest request) {
        Scorm scorm = scormDao.findScormInfoByScormId(scormId);
        if (scorm.getInUse() == DictConstant.NO_USE) {
            return;
        }
        request.setAttribute("scorm", scorm);
    }

    @Override
    public void studyScormZtree(int scormId, HttpServletRequest request) {
        int userId = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        List<Sco> scoList = scoDao.findScosByScormIdAndUserId(scormId, userId);
        for (Sco sco : scoList) {
            sco.setShowStudyState(dictService.changeDictCodeToValue(sco.getStudyState(), DictConstant.STUDY_STATE));
        }
        request.setAttribute("scoList", scoList);
        request.setAttribute("isLast", DictConstant.LAST_VISIT);
    }

    @Override
    public void changeScoState(int scormId, int scoId) {
        int userId = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        ScoInfo scoInfo = new ScoInfo();
        scoInfo.setScoId(scoId);
        scoInfo.setCoreEntry(DictConstant.ENTRY_RE);
        scoDao.changeScoInfoByScoId(scoInfo);
        //改变最后访问SCO
        Sco oneSco = new Sco();
        oneSco.setUserId(userId);
        oneSco.setScormId(scormId);
        oneSco.setScoId(scoId);
        scoDao.setLastVisitScoByScoId(oneSco);
        //将所有父节点变为已看
        List<Sco> scoList = scoDao.findScosByScormIdAndUserId(scormId, userId);
        for (Sco sco : scoList) {
            if (sco.getScoId() == scoId) {
                changeState(sco, scoList);
                break;
            }
        }
    }

    public void changeState(Sco sco, List<Sco> scoList) {
        if (sco.getStudyState() != DictConstant.STUDY_STATE_1) {
            scoDao.changeStudyStateByScoId(sco.getScoId(), DictConstant.STUDY_STATE_1);
            for (Sco onesco : scoList) {
                if (onesco.getTreeId().equals(sco.getTreeParentId())) {
                    changeState(onesco, scoList);
                    break;
                }
            }
        }
    }

    @Override
    public List<ScoInfo> getScoApiInfo(int scoId) {
        return scoDao.getScoApiInfoByScoId(scoId);
    }

    @Override
    public void changeScoInfoByScoId(ScoInfo scoInfo, int scormId) {
        String sessionTime = scoInfo.getCoreSessionTime();
        if (!("".equals(sessionTime))) {
            scoInfo.setCoreTotalTime(DateUtil.getTotalTime(sessionTime, scoDao.getScoApiInfoByScoId(scoInfo.getScoId()).get(0).getCoreTotalTime()));
            scormDao.changeTotalTimeByScormId(scormId, DateUtil.getTotalTime(sessionTime, scormDao.findScormInfoByScormId(scormId).getTotalTime()));
        }
        scoDao.changeScoInfoByScoId(scoInfo);
    }

    @Override
    public void getScormInfoAndChapterInfo(int scormId, HttpServletRequest request) {
        Scorm scormInfo = scormDao.findScormInfoByScormId(scormId);
        if (scormInfo.getInUse() == DictConstant.NO_USE) {
            return;
        }
        request.setAttribute("scormInfo", scormInfo);
        List<Sco> scoList = scoDao.findScosByScormIdAndUserId(scormId, DictConstant.VOID_VALUE);
        for (Sco sco : scoList) {
            sco.setShowStudyState(dictService.changeDictCodeToValue(sco.getStudyState(), DictConstant.STUDY_STATE));
        }
        request.setAttribute("scoList", scoList);
        request.setAttribute("isLast", DictConstant.LAST_VISIT);
    }

    @Override
    public void getAllCommentsByScormId(int scormId, HttpServletRequest request) {
        request.setAttribute("allComments", scormDao.getAllCommentsByScormId(scormId));
    }

    @Override
    public void judgeDemonstrationStatus(int scormId, HttpServletRequest request) {
        boolean collectScorm = true;
        boolean registerScorm = true;
        boolean isTourist = "".equals(LoginUserUtil.getLoginName());
        if (!isTourist) {
            int userId = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
            if (scormDao.checkNotHasCollected(scormId, userId)) {
                collectScorm = false;
            }
            if (scormDao.checkNotHasRegister(scormId, userId)) {
                registerScorm = false;
            }
        }
        request.setAttribute("collectScorm", collectScorm);
        request.setAttribute("registerScorm", registerScorm);
    }

    @Override
    public Page<Scorm> listNotAuditScormPageList(PageParameter pageParameter, Scorm scorm) {
        return scormDao.listNotAuditScormPageList(pageParameter, scorm);
    }

    @Override
    public Page<Scorm> listAuditScormPageList(PageParameter pageParameter, Scorm scorm) {
        Page<Scorm> scormPage = scormDao.listAuditScormPageList(pageParameter, scorm);
        String totalTime;
        int[] splitTime;
        for (Scorm oneScorm : scormPage.getResultList()) {
            totalTime = oneScorm.getTotalTime();
            if (("").equals(totalTime)) {
                oneScorm.setTotalTime(DictConstant.NO_LOG);
            } else {
                splitTime = DateUtil.splitScormTime(totalTime);
                oneScorm.setTotalTime(splitTime[0] + "小时" + splitTime[1] + "分钟" + splitTime[2] + "秒" + splitTime[3] + "毫秒");
            }
        }
        return scormPage;
    }

    @Override
    public void checkScormInfo(HttpServletRequest request, int scormId) {
        Scorm scorm = scormDao.findScormInfoByScormId(scormId);
        List<Sco> scoList = scoDao.findScosByScormIdAndUserId(scormId, DictConstant.VOID_VALUE);
        request.setAttribute("scorm", scorm);
        request.setAttribute("scoList", scoList);

    }
}
