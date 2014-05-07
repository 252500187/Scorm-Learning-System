package com.sls.scorm.service.impl;

import com.sls.scorm.dao.ScoDao;
import com.sls.scorm.dao.ScormDao;
import com.sls.scorm.entity.ScoInfo;
import com.sls.scorm.entity.ScormSummarize;
import com.sls.scorm.service.ScormService;
import com.sls.user.dao.UserDao;
import com.sls.scorm.entity.Sco;
import com.sls.scorm.entity.Scorm;
import com.sls.util.BaseUtil;
import com.sls.util.DictConstant;
import com.sls.util.FileUp;
import com.sls.util.LoginUserUtil;
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
    public void registerScorm(String id, HttpServletRequest request) {
        int scormId = Integer.parseInt(id);
        int userId = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        if (scoDao.findScosByScormIdAndUserId(scormId, userId).size() > 0) {
            return;
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
    }

    @Override
    public Boolean checkIsLoginUser() {
        String userName = LoginUserUtil.getLoginName();
        return !("".equals(userName));
    }

    @Override
    public ScoInfo findScormInfoByScormId(int scormId) {
        return scormDao.findScormInfoByScormId(scormId);
    }
}
