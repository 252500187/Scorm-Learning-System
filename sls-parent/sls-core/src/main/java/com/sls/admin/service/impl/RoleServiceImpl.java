package com.sls.admin.service.impl;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.dao.RoleDao;
import com.sls.admin.entity.Role;
import com.sls.admin.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 角色service实现
 *
 * @author chenl
 * @version 1.0.1
 */

@Transactional
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public Page<Role> findRolePageList(PageParameter pageParameter, Role role) {
        return roleDao.findRolePageList(pageParameter, role);
    }

    @Override
    public List<Role> findAllRole() {
        return roleDao.findAllRole();
    }

    @Override
    public int addRole(Role role) {
        return roleDao.addRole(role);
    }

    @Override
    public void editRole(Role role) {
        roleDao.editRole(role);
    }

    @Override
    public int delRoleDo(Role role) {
        return roleDao.delRole(role.getId());
    }

    @Override
    public Role findRoleById(int id) {
        return roleDao.findRoleById(id);
    }

    @Override
    public Role findRoleByRoleName(String roleName) {
        return roleDao.findRoleByRoleName(roleName);
    }

    @Override
    public Boolean checkRepeatRoleName(String roleName, String primaryRoleName) {
        Boolean notHasRepeatName = roleDao.checkRepeatRoleName(roleName);
        Boolean notEquOldName = !(roleName.equals(primaryRoleName));
        return !(!notHasRepeatName & notEquOldName);
    }

    @Override
    public Role findRoleByUserId(int userId) {
        return roleDao.findRoleByUserId(userId);
    }
}
