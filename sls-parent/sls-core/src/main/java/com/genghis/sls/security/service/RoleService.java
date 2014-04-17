package com.genghis.sls.security.service;

import com.genghis.core.page.entity.Page;
import com.genghis.core.page.entity.PageParameter;
import com.genghis.sls.security.entity.MenuPerm;
import com.genghis.sls.security.entity.Permission;
import com.genghis.sls.security.entity.Role;

import java.util.List;

/**
 * 角色service接口
 *
 * @author chenl
 * @version 1.0.1
 */

public interface RoleService {

    Page<Role> findRolePageList(PageParameter pageParameter, Role role);

    List<Role> findAllRole();

    int addRole(Role role);

    void editRole(Role role);

    int delRoleDo(Role role);

    Role findRoleById(int id);

    Role findRoleByRoleName(String roleName);

    Boolean checkRepeatRoleName(String roleName, String primaryRoleName);

    Role findRoleByUserId(int userId);

    void setHasChecked(List<MenuPerm> menuPermList, List<Permission> choosedPerms);

    String getPermissionTokenValue(List<Permission> choosedPerms);
}
