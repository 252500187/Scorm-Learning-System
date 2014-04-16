package com.genghis.ptas.security.dao;

import com.genghis.core.page.entity.PageParameter;
import com.genghis.ptas.security.entity.User;
import com.genghis.ptas.security.entity.UserRole;
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
public class UserDaoTest extends SpringTransactionalTestCase {
    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRoleDao userRoleDao;

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
    public void testUserDao() throws Exception {
        User user = getNewUser();
        user.setId(userDao.addUser(user));
        UserRole userRole = new UserRole();
        userRole.setRoleId(user.getRoleId());
        userRole.setUserId(user.getId());
        userRoleDao.addUserRole(userRole);

        userDao.editUser(user);
        assertEquals(user.getLoginName(), userDao.findUserAllInfoById(user.getId()).getLoginName());
        assertEquals(user.getLoginName(), userDao.findUserByLoginName(user.getLoginName()).getLoginName());
        assertEquals(true, userDao.checkRepeatLoginName(user.getLoginName()));
        userDao.findAllPermTokensByUserId(user.getId());
        userDao.delUser(user.getId());

        PageParameter pageParameter = new PageParameter();
        User newUser = new User();
        newUser.setId(-1);
        newUser.setLoginName("");
        newUser.setUserName("");
        newUser.setShowDepartmentId("");
        newUser.setShowRoleId("");
        userDao.findUserPageList(pageParameter, newUser);
    }
}
