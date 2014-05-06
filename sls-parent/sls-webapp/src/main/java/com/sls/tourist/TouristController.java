package com.sls.tourist;


import com.sls.user.entity.User;
import com.sls.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Transactional
@RequestMapping("/tourist/")
public class TouristController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "register", method = {RequestMethod.POST})
    public void register(User user) {
        userService.addUser(user);
    }
}
