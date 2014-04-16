package com.genghis.sls.security.service;

import com.genghis.core.page.entity.PageParameter;
import com.genghis.sls.security.entity.User;
import edu.jostutor.spring.test.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import static org.junit.Assert.assertEquals;

/**
 * Created with IntelliJ IDEA.
 * User: genghis4
 * Date: 14-3-1
 * Time: 下午5:56
 * To change this template use File | Settings | File Templates.
 */

@ContextConfiguration("/applicationContext-dev-test.xml")
public class UserServiceTest extends SpringTransactionalTestCase {
    @Autowired
    private UserService userService;

    public User getNewUser() {
        User user = new User();
        user.setId(-1);
        user.setLoginName("11111");
        user.setUserName("22222");
        user.setPassword("33333");
        user.setDepartmentId(1);
        user.setRoleId(1);
        return user;
    }

    @Test
    public void testUserService() throws Exception {
        User user = getNewUser();
        userService.addUser(user);
        assertEquals(user.getLoginName(), userService.findUserByLoginName(user.getLoginName()).getLoginName());
        userService.checkRepeatLoginName(user.getLoginName(), "1");

        PageParameter pageParameter = new PageParameter();
        User newUser = new User();
        newUser.setId(-1);
        newUser.setLoginName("");
        newUser.setUserName("");
        newUser.setShowDepartmentId("");
        newUser.setShowRoleId("");
        userService.findUserPageList(pageParameter, newUser);
    }
}
