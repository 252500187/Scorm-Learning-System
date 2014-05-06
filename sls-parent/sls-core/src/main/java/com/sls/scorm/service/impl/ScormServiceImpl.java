package com.sls.scorm.service.impl;

import com.sls.scorm.service.ScormService;
import com.sls.user.dao.UserDao;
import com.sls.scorm.entity.Sco;
import com.sls.scorm.entity.Scorm;
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

    @Override
    public void upScorm(HttpServletRequest request, String upFile, String upImg, Scorm scorm) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        try {
            FileUp fileUp = new FileUp();
            Date date = new Date();
            int userId = userDao.findUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
            String fileName = date.getTime() + userId + "";//todo 用户ID和日期
            scorm.setRecommendLevel(DictConstant.RECOMMEND_0);
            scorm.setImgPath(fileUp.upImg(request, DictConstant.TOP_SCORM_FILE_NAME + "/" + fileName, DictConstant.SCORM_IMG, upImg));
            scorm.setUploadUserId(userId);
            scorm.setInUse(DictConstant.NO_USE);
            //TODO CHUAN
            String scormPath = fileUp.upScorm(request, fileName, upFile);
            List<Sco> scoNodes = fileUp.analyzeXml(scormPath + DictConstant.IMSMANIFEST);
            scoNodes.add(new Sco(scorm.getName(), DictConstant.SCO_MAIN, "0", "1", ""));
            request.setAttribute("scormNodes", scoNodes);      //todo 存入数据库
        } catch (Exception e) {
            request.setAttribute("result", "上传失败！");
        }
    }
}
