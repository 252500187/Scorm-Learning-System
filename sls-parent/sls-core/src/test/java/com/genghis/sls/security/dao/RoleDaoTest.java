package com.genghis.sls.security.dao;

import com.genghis.core.page.entity.PageParameter;
import com.genghis.sls.security.entity.Role;
import com.genghis.sls.security.entity.User;
import com.genghis.sls.security.entity.UserRole;
import edu.jostutor.spring.test.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import static org.junit.Assert.assertEquals;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
@ContextConfiguration("/applicationContext-dev-test.xml")
public class RoleDaoTest extends SpringTransactionalTestCase {

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRoleDao userRoleDao;

    public Role getNewRole() {
        Role role = new Role();
        role.setRoleName("角色一");
        role.setDescription("描述文字一");
        return role;
    }

    public User getNewUser() {
        User user = new User();
        user.setId(-1);
        user.setLoginName("11111");
        user.setUserName("22222");
        user.setPassword("33333");
        user.setDepartmentId(1);
        return user;
    }

    public PageParameter getPageParameter() {
        PageParameter pageParameter = new PageParameter();
        pageParameter.setPageSize(10);
        pageParameter.setPageNumber(0);
        pageParameter.setSortColumn("");
        pageParameter.setSortDirection("ASC");
        return pageParameter;
    }

    @Test
    public void testCheckRepeatRoleName() throws Exception {
        Role role = getNewRole();
        roleDao.addRole(role);
        assertEquals(false, roleDao.checkRepeatRoleName(role.getRoleName()));
    }

    @Test
    public void testFindRolePageList() throws Exception {
        PageParameter pageParameter = getPageParameter();
        Role role = getNewRole();
        roleDao.addRole(role);
        assertEquals(true, roleDao.findRolePageList(pageParameter, role).getResultList().size() > 0);
    }

    @Test
    public void testRoleDao() throws Exception {
        Role role = getNewRole();
        User user = getNewUser();
        int roleId = roleDao.addRole(role);
        Role getRole1 = roleDao.findRoleById(roleId);
        roleDao.findRoleByRoleName(getRole1.getRoleName());
        role.setRoleName("修改角色一");
        roleDao.editRole(role);
        user.setRoleId(roleId);
        int userId = userDao.addUser(user);
        userRoleDao.addUserRole(new UserRole(userId, roleId));
        roleDao.findRoleByUserId(userId);
        roleDao.findAllRole();
        roleDao.delRole(roleId);
    }
}


