package com.genghis.sls.system.service.impl;

import com.genghis.sls.constant.DictConstant;
import com.genghis.sls.system.service.UpScormService;
import com.genghis.sls.util.FileUp;
import com.genghis.sls.util.XmalInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.xml.sax.SAXException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;
import java.io.IOException;
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
    @Override
    public void upScorm(HttpServletRequest request, String upFile, String upImg) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        //上传Scorm课件和图片，返回使用的图片路径和文件绝对路径
        FileUp fileUp = new FileUp();
        String fileName = "iddate";//todo 用户ID和日期
        //0 图片路径 1 xml的文件夹路径
        String path[] = fileUp.upScorm(request, fileName, upFile, upImg);
        request.setAttribute("jpg", path[0]);           //todo 存入数据库
        List<XmalInfo> scormNodes = fileUp.analyzeXml(path[1] + DictConstant.IMSMANIFEST);  //todo 存入数据库
        request.setAttribute("scormNodes",scormNodes);
    }
}
