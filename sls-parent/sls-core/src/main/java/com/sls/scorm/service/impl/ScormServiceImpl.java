package com.sls.scorm.service.impl;

import com.sls.scorm.dao.ScoDao;
import com.sls.scorm.dao.ScormDao;
import com.sls.scorm.entity.ScoInfo;
import com.sls.scorm.entity.ScormSummarize;
import com.sls.scorm.service.ScormService;
import com.sls.system.service.DictService;
import com.sls.user.dao.UserDao;
import com.sls.scorm.entity.Sco;
import com.sls.scorm.entity.Scorm;
import com.sls.util.*;
import com.sun.org.apache.xml.internal.resolver.helpers.PublicId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.xml.sax.SAXException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;
import java.io.IOException;
import java.util.Date;
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
    public void upScorm(HttpServletRequest request, String upFile, String upImg, String scormName) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        try {
            FileUp fileUp = new FileUp();
            Date date = new Date();
            int userId = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
            String fileName = date.getTime() + userId + "";
            Scorm scorm = new Scorm();
            scorm.setScormName(BaseUtil.iso2utf(scormName));
            scorm.setRegisterSum(0);
            scorm.setRecommendLevel(DictConstant.RECOMMEND_0);
            scorm.setImgPath(fileUp.upImg(request, DictConstant.TOP_SCORM_FILE_NAME + "/" + fileName, DictConstant.SCORM_IMG, upImg));
            scorm.setUploadUserId(userId);
            scorm.setUploadDate(DateUtil.getCurrentTimestamp().toString().substring(0,16));
            scorm.setInUse(DictConstant.NO_USE);
            int scormId = scormDao.addScorm(scorm);
            List<Sco> scoNodes = fileUp.analyzeXml(fileUp.upScorm(request, fileName, upFile) + DictConstant.IMSMANIFEST);
            scoNodes.add(new Sco(scorm.getScormName(), DictConstant.SCO_MAIN, "0", "1", ""));
            for (Sco scoNode : scoNodes) {
                scoNode.setScormId(scormId);
                scoNode.setUserId(DictConstant.VOID_VALUE);
                scoNode.setLastVisit(DictConstant.VOID_VALUE);
                scoNode.setStudyState(DictConstant.STUDY_STATE_0);
                scoDao.addSco(scoNode);
            }
        } catch (Exception e) {
            request.setAttribute("result", "上传失败");
        }
    }

    @Override
    public String registerScorm(int scormId, HttpServletRequest request) {
        int userId = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        int scormState = scormDao.findScormInfoByScormId(scormId).getInUse();
        if (scoDao.findScosByScormIdAndUserId(scormId, userId).size() > 0) {
            return "对不起，您已注册。";
        }
        if (scormState == DictConstant.NO_USE) {
            return "此课件不可注册。";
        }
        List<Sco> scoList = scoDao.findScosByScormIdAndUserId(scormId, DictConstant.VOID_VALUE);
        ScoInfo scoInfo = new ScoInfo();
        for (Sco sco : scoList) {
            sco.setUserId(userId);
            scoInfo.setScoId(scoDao.addSco(sco));
            scoDao.addScoInfo(scoInfo);
        }
        ScormSummarize scormSummarize = new ScormSummarize();
        scormSummarize.setUserId(userId);
        scormSummarize.setScormId(scormId);
        scormSummarize.setScore("");
        scormSummarize.setDiscuss("");
        scormSummarize.setGrade("");
        scormDao.addScormSummarize(scormSummarize);
        scormDao.addVisitSum(scormId);
        return "注册成功。";
    }

    @Override
    public void studyScorm(int scormId, HttpServletRequest request) {
        Scorm scorm = scormDao.findScormInfoByScormId(scormId);
        if (scorm.getInUse() == DictConstant.NO_USE) {
            return;
        }
        request.setAttribute("scorm", scorm);
        int userId = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        List<Sco> scoList = scoDao.findScosByScormIdAndUserId(scormId, userId);
        for (Sco sco : scoList) {
            sco.setShowStudyState(dictService.changeDictCodeToValue(sco.getStudyState(), DictConstant.STUDY_STATE));
        }
        request.setAttribute("scoList", scoList);
        request.setAttribute("isLast", DictConstant.LAST_VISIT);
    }

    @Override
    public void findScormInfoByScormId(int scormId, HttpServletRequest request) {
        //todo 查询课件信息
        request.setAttribute("scormInfo",scormDao.findScormInfoByScormId(scormId));
    }

    @Override
    public void changeScoState(int scormId, int scoId) {
        int userId = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
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
    public void changeScoInfoByScoId(ScoInfo scoInfo) {
        scoDao.changeScoInfoByScoId(scoInfo);
    }
}
