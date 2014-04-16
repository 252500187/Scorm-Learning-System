package com.genghis.ptas.security.dao;

import com.genghis.ptas.security.entity.RolePermission;
import edu.jostutor.spring.test.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import static org.junit.Assert.assertEquals;

/**
 * Created with IntelliJ IDEA.
 * User: gaoyang
 * To change this template use File | Settings | File Templates.
 */
@ContextConfiguration("/applicationContext-dev-test.xml")
public class RolePermissionDaoTest extends SpringTransactionalTestCase {
    @Autowired
    private RolePermissionDao rolePermissionDao;

    @Test
    public void testCheckRepeatRoleName() throws Exception {
        rolePermissionDao.addRolePermission(new RolePermission(1000,38));
        rolePermissionDao.deleteRolePermissionsByRoleId(1000);
        assertEquals(0, rolePermissionDao.findRolePermissionsByRoleId(1000).size());
    }
}
