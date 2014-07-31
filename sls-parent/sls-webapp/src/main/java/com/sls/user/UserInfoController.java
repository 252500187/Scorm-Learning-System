package com.sls.user;

import com.sls.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@Transactional
@RequestMapping("/user/info/")
public class UserInfoController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "userAttentionDeal", method = {RequestMethod.GET})
    @ResponseBody
    public void userAttentionDeal(@RequestParam("userAttentionId") int userAttentionId) {
        userService.userAttentionDeal(userAttentionId);
    }

    @RequestMapping(value = "addUserQuestion", method = {RequestMethod.POST})
    @ResponseBody
    public Boolean addUserQuestion(@RequestParam("questionDescribe") String questionDescribe, @RequestParam("answerUserId") int answerUserId) {
        return userService.addUserQuestion(answerUserId, questionDescribe);
    }

    @RequestMapping(value = "cancelMessage", method = {RequestMethod.POST})
    @ResponseBody
    public void cancelMessage(@RequestParam("messageId") int messageId) {
        userService.cancelMessageByMessageId(messageId);
    }

    @RequestMapping(value = "changePassword",method = {RequestMethod.GET})
    public String changePassword(@RequestParam("userId") int userId,HttpServletRequest request)   {
        userService.toChangePassword(userId,request);
        return "scormfront/changePassword" ;
    }

}
