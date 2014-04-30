package com.sls.front.scorm.service.impl;

import com.sls.admin.dao.UserDao;
import com.sls.front.scorm.service.UpScormService;
import com.sls.util.DictConstant;
import com.sls.util.FileUp;
import com.sls.util.LoginUserUtil;
import com.sls.util.XmalInfo;
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

/**
 * Created with IntelliJ IDEA.
 * User: genghis4
 * Date: 14-4-22
 * Time: 下午8:16
 * To change this template use File | Settings | File Templates.
 */
@Transactional
@Service("upScormService")
public class UpScormServiceImpl implements UpScormService {

    @Autowired
    private UserDao userDao;

    @Override
    public void upScorm(HttpServletRequest request, String upFile, String upImg) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        FileUp fileUp = new FileUp();
        Date date = new Date();
        String fileName = date.getTime() + userDao.findUserByLoginName(LoginUserUtil.findLoginUserName()).get(0).getId() + "";//todo 用户ID和日期
        //0 图片路径 1 xml的文件夹路径
        String path[] = fileUp.upScorm(request, fileName, upFile, upImg);
        request.setAttribute("jpg", path[0]);           //todo 存入数据库
        List<XmalInfo> scormNodes = fileUp.analyzeXml(path[1] + DictConstant.IMSMANIFEST);
        request.setAttribute("scormNodes", scormNodes);      //todo 存入数据库
    }
}
