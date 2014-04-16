/*
* PermissionServiceTest.java
* Created on  2014-3-15 下午6:22
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-3-15       gaoxinyu    初始版本
*
*/
package com.genghis.ptas.security.service;

import com.genghis.core.page.entity.PageParameter;
import com.genghis.ptas.security.entity.Permission;
import edu.jostutor.spring.test.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import static org.junit.Assert.assertEquals;

/**
 * 权限测试类
 *
 * @author qinw
 * @version 1.0.1
 */
@ContextConfiguration("/applicationContext-dev-test.xml")
public class PermissionServiceTest extends SpringTransactionalTestCase {
    @Autowired
    private PermissionService permissionService;

    public Permission getPermission() {
        Permission permission = new Permission();
        permission.setPermissionToken("permissionToken");
        permission.setDescription("description");
        return permission;
    }

    public PageParameter getPageParameter() {
        PageParameter pageParameter = new PageParameter();
        pageParameter.setPageSize(2);
        pageParameter.setPageNumber(1);
        pageParameter.setSortColumn("");
        pageParameter.setSortDirection("ASC");
        return pageParameter;
    }

    @Test
    public void testPermission() throws Exception {
        Permission permission = getPermission();
        int id = permissionService.addPermission(permission);
        permission.setId(id);
        permission.setPermissionToken("permissionTokenNew");
        permissionService.editPermission(permission);
        assertEquals("permissionTokenNew", permissionService.findPermissionById(String.valueOf(permission.getId())).getPermissionToken());
        assertEquals("permissionTokenNew", permissionService.findPermissionByPermissionToken(permission.getPermissionToken()).getPermissionToken());
        permissionService.delPermissionDo(permission);
    }

    @Test
    public void testListAllPermission() throws Exception {
        Permission permission = getPermission();
        PageParameter pageParameter = getPageParameter();
        permissionService.listAllPermission(pageParameter, permission);
    }
}
