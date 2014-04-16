/*
* PermissionDaoTest.java
* Created on  2014-2-28 下午6:05
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-2-28       qinw    初始版本
*
*/
package com.genghis.ptas.security.dao;

import com.genghis.ptas.security.entity.Permission;
import edu.jostutor.spring.test.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import static org.junit.Assert.assertEquals;

/**
 * 权限单元测试
 *
 * @author qinw
 * @version 1.0.1
 */
@ContextConfiguration("/applicationContext-dev-test.xml")
public class PermissionDaoTest extends SpringTransactionalTestCase {
    @Autowired
    private PermissionDao permissionDao;

    public Permission getNewPermission() {
        Permission permission = new Permission();
        permission.setId(1);
        permission.setPermissionToken("权限字符串");
        permission.setDescription("描述");
        return permission;
    }

    @Test
    public void checkRepeatPermToken() throws Exception {
        Permission permission = getNewPermission();
        permissionDao.addPermission(permission);
        assertEquals(true, permissionDao.checkRepeatPermToken(permission.getPermissionToken()));
    }
}
