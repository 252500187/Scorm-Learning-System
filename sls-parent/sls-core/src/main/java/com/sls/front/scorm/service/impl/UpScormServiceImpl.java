package com.sls.front.scorm.service.impl;

import com.sls.admin.dao.UserDao;
import com.sls.front.scorm.service.UpScormService;
import com.sls.util.DictConstant;
import com.sls.util.FileUp;
import com.sls.util.LoginUserUtil;
import com.sls.front.scorm.entity.XmalInfo;
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
@Service("upScormService")
public class UpScormServiceImpl implements UpScormService {

    @Autowired
    private UserDao userDao;

    @Override
    public void upScorm(HttpServletRequest request, String upFile, String upImg) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        try {
            FileUp fileUp = new FileUp();
            Date date = new Date();
            String fileName = date.getTime() + userDao.findUserByLoginName(LoginUserUtil.findLoginUserName()).get(0).getId() + "";//todo 用户ID和日期
            String imgPath = fileUp.upImg(request, DictConstant.TOP_SCORM_FILE_NAME + "/" + fileName, DictConstant.SCORM_IMG, upImg);
            request.setAttribute("jpg", imgPath);           //todo 存入数据库
            String scormPath = fileUp.upScorm(request, fileName, upFile);
            List<XmalInfo> scormNodes = fileUp.analyzeXml(scormPath + DictConstant.IMSMANIFEST);
            request.setAttribute("scormNodes", scormNodes);      //todo 存入数据库
        } catch (Exception e) {
            request.setAttribute("result", "上传失败！");
        }
    }
}
