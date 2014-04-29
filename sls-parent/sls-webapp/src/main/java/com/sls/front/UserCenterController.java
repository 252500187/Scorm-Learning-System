package com.sls.front;

import com.sls.front.scorm.service.UpScormService;
import com.sls.util.ScoInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;
import java.io.IOException;

@Controller
@Transactional
@RequestMapping("/user/")
public class UserCenterController {

    @Autowired
    private UpScormService upScormService;

    @RequestMapping(value = "upScormDo", method = {RequestMethod.GET})
    public String upScormDo() {
        return "scormfront/usercenter/upscorm/upScorm";
    }

    @RequestMapping(value = "upScorm", method = {RequestMethod.POST})
    public String upScorm(HttpServletRequest request) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        try {
            upScormService.upScorm(request, "upScorm", "upImg");
        } catch (IOException e) {
            return "";
        }
        return "scormfront/studyscorm/studyScorm";
    }


    @RequestMapping(value = "scoInfo", method = {RequestMethod.POST})
    @ResponseBody
    public void scoInfo(ScoInfo scoInfo) {
        //todo 存入数据库
    }
}
