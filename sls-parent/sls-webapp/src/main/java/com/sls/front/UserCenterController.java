package com.sls.front;

import com.sls.front.scorm.service.UpScormService;
import com.sls.front.scorm.service.UserCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.xml.sax.SAXException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;
import java.io.IOException;

@Controller
@Transactional
@RequestMapping("/user/center")
public class UserCenterController {

    @Autowired
    private UserCenterService userCenterService;

    @Autowired
    private UpScormService upScormService;

    @RequestMapping(value = "userCenterDo", method = {RequestMethod.GET})
    public String userCenter(HttpServletRequest request) {
        userCenterService.toUserCenter(request);
        return "scormfront/usercenter/userCenter";
    }

    @RequestMapping(value = "upScormDo", method = {RequestMethod.GET})
    public String upScormDo() {
        return "scormfront/usercenter/upscorm/upScorm";
    }

    @RequestMapping(value = "upScorm", method = {RequestMethod.POST})
    public String upScorm(HttpServletRequest request) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        upScormService.upScorm(request, "upScorm", "upImg");
//        return "scormfront/usercenter/upscorm/upResult";
        return "scormfront/studyscorm/studyScorm";
    }

    //个人中心  个人资料的页面跳转
    @RequestMapping(value = "personnelInfoDo", method = {RequestMethod.GET})
    public String personnelInfo() {
        return "scormfront/usercenter/personnelInfo";
    }

//    //个人中心  上传课件的页面跳转
//    @RequestMapping(value = "upScormDo", method = {RequestMethod.GET})
//    public String upScorm() {
//        return "scormfront/usercenter/upscorm/upScorm";
//    }

    //个人中心  已注册课件的页面跳转
    @RequestMapping(value = "registeredScormDo", method = {RequestMethod.GET})
    public String registeredScorm() {
        return "scormfront/usercenter/registeredScorm";
    }

    //个人中心  已完成课件的页面跳转
    @RequestMapping(value = "finishedScormDo", method = {RequestMethod.GET})
    public String finishedScorm() {
        return "scormfront/usercenter/finishedScorm";
    }

    //个人中心  我的收藏的页面跳转
    @RequestMapping(value = "collectionDo", method = {RequestMethod.GET})
    public String collection() {
        return "scormfront/usercenter/collection";
    }

    //个人中心  我的笔记本的页面跳转
    @RequestMapping(value = "noteDo", method = {RequestMethod.GET})
    public String note() {
        return "scormfront/usercenter/note";
    }


}
