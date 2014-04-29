package com.sls.admin.service;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.entity.Role;

import java.util.List;

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

}
