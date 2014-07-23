package com.sls.user;

import com.sls.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Transactional
@RequestMapping("/user/info/")
public class UserInfoController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "userAttention", method = {RequestMethod.GET})
    @ResponseBody
    public void attentionUser(@RequestParam("userAttentionId") int userAttentionId) {
        userService.attentionUser(userAttentionId);
    }
}
