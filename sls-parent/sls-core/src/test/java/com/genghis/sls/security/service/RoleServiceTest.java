package com.genghis.sls.security.service;


import com.genghis.core.page.entity.PageParameter;
import com.genghis.sls.security.dao.UserDao;
import com.genghis.sls.security.dao.UserRoleDao;
import com.genghis.sls.security.entity.*;
import edu.jostutor.spring.test.SpringTransactionalTestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

/**
 * 角色单元测试
 *
 * @author chenl
 * @version 1.0.1
 */

@ContextConfiguration("/applicationContext-dev-test.xml")
public class RoleServiceTest extends SpringTransactionalTestCase {
    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRoleDao userRoleDao;

    public Role getRole() {
        Role role = new Role();
        role.setRoleName("角色");
        role.setDescription("描述文字");
        return role;
    }

    public User getUser() {
        User user = new User();
        user.setLoginName("11111");
        user.setUserName("22222");
        user.setPassword("33333");
        user.setDepartmentId(1);
        return user;
    }

    public Permission getPermission() {
        Permission permission = new Permission();
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
    public void testRole() throws Exception {
        Role role = getRole();
        int roleId = roleService.addRole(role);
        assertEquals("描述文字", roleService.findRoleByRoleName(role.getRoleName()).getDescription());
        role.setRoleName("角色新");
        role.setId(roleId);
        roleService.editRole(role, "");
        assertEquals("角色新", roleService.findRoleById(roleId).getRoleName());
        assertEquals(1, roleService.delRoleDo(role));
    }

    @Test
    public void testFindRolePageList() throws Exception {
        Role role = getRole();
        PageParameter pageParameter = getPageParameter();
        roleService.findRolePageList(pageParameter, role);
    }

    @Test
    public void testFindAllRole() throws Exception {
        roleService.findAllRole();
    }

    @Test
    public void testRoleService() throws Exception {
        Role role = getRole();
        User user = getUser();
        int roleId = roleService.addRole(role);
        role = roleService.findRoleById(roleId);
        List<Permission> permissions = new ArrayList<Permission>();
        List<MenuPerm> menuPermList = permissionService.getMenuPermTree();
        setPermissions(permissions, menuPermList);
        Boolean isRepeat = testEditRole(role, permissions);
        assertEquals(true, isRepeat);
        int userId = userDao.addUser(user);
        userRoleDao.addUserRole(new UserRole(userId, roleId));
        roleService.findRoleByUserId(userId);
        roleService.findAllRole();
        roleService.findRoleByRoleName("修改角色");
        roleService.setHasChecked(menuPermList, permissions);
    }

    private void setPermissions(List<Permission> permissions, List<MenuPerm> menuPermList) {
        String permToken = menuPermList.get(1).getPermissionToken();
        Permission permission = permissionService.findPermissionByPermissionToken(permToken);
        permissions.add(permission);
        permToken = menuPermList.get(2).getPermissionToken();
        permission = permissionService.findPermissionByPermissionToken(permToken);
        permissions.add(permission);
    }

    private Boolean testEditRole(Role role, List<Permission> permissionList) {
        role.setRoleName("修改角色");
        roleService.getPermissionTokenValue(permissionList);
        String permTokens = "";
        for (Permission permission : permissionList) {
            permTokens = permTokens + permission.getPermissionToken() + ",";
        }
        roleService.editRole(role, permTokens);
        return roleService.checkRepeatRoleName("修改角色", "修改角色");
    }

}