package com.sls.user;

import com.sls.scorm.entity.Scorm;
import com.sls.scorm.service.ScormService;
import com.sls.system.service.LabelService;
import com.sls.user.entity.User;
import com.sls.user.service.UserCenterService;
import com.sls.user.service.UserService;
import com.sls.util.DictConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;
import java.io.IOException;

@Controller
@Transactional
@RequestMapping("/user/center/")
public class UserCenterController {

    @Autowired
    private UserCenterService userCenterService;

    @Autowired
    private ScormService upScormService;

    @Autowired
    private UserService userService;

    @Autowired
    private ScormService scormService;

    @Autowired
    private LabelService labelService;

    @RequestMapping(value = "userCenterDo", method = {RequestMethod.GET})
    public String userCenter(HttpServletRequest request) {
        userCenterService.toUserCenter(request);
        return "scormfront/usercenter/userCenter";
    }

    //个人中心  首页
    @RequestMapping(value = "userCenterInfo", method = {RequestMethod.GET})
    public String userCenterInfo() {
        return "scormfront/usercenter/userCenterInfo";
    }

    //个人中心  上传课件
    @RequestMapping(value = "upScormDo", method = {RequestMethod.GET})
    public String upScormDo() {
        return "scormfront/usercenter/upScorm";
    }

    @RequestMapping(value = "upScorm", method = {RequestMethod.POST})
    public String upScorm(HttpServletRequest request, Scorm scorm) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        upScormService.upScorm(request, "upScorm", "upImg", scorm);
        return "scormfront/usercenter/upScorm";
    }

    //个人中心  个人资料
    @RequestMapping(value = "userInfoDo", method = {RequestMethod.GET})
    public String userInfoDo(HttpServletRequest request) {
        userCenterService.toUserInfo(request);
        labelService.getAllUserLabel(request);
        labelService.getLabelsByUserId(request);
        return "scormfront/usercenter/userInfo";
    }

    @RequestMapping(value = "editUserInfo", method = {RequestMethod.POST})
    @ResponseBody
    public void editUserInfo(User user, @RequestParam("myLabelList") String myLabelList) {
        userService.editUser(user);
        labelService.editMyLabelList(myLabelList);
    }

    @RequestMapping(value = "upHeadImg", method = {RequestMethod.POST})
    public String upHeadImg(HttpServletRequest request) throws ServletException, IOException, ParserConfigurationException, SAXException,
            XPathExpressionException {
        userService.upHeadImg(request, "upImg");
        userCenterService.toUserInfo(request);
        return "scormfront/usercenter/userInfo";
    }

    //个人中心  已注册课件
    @RequestMapping(value = "registerScormDo", method = {RequestMethod.GET})
    public String registerScormDo(HttpServletRequest request) {
        userCenterService.getAllRegisterScormInfo(request);
        return "scormfront/usercenter/myscorm/registerScorm";
    }

    //个人中心  已收藏课件
    @RequestMapping(value = "collectScormDo", method = {RequestMethod.GET})
    public String collectScormDo() {
        return "scormfront/usercenter/myscorm/collectScorm";
    }

    //个人中心  笔记本
    @RequestMapping(value = "notesDo", method = {RequestMethod.GET})
    public String notesDo(HttpServletRequest request) {
        scormService.getAllStudyNotesByScormIdAndUserId(DictConstant.VOID_VALUE,request);
        return "scormfront/usercenter/notes";
    }
}
