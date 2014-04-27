package com.sls.admin.dao;

import com.sls.admin.entity.Permission;
import com.sls.admin.entity.RolePermission;

import java.util.List;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
public interface RolePermissionDao {

    void addRolePermission(RolePermission rolePermission);

    void deleteRolePermissionsByRoleId(int roleId);

    List<Permission> findChoosedPermsByRoleId(int roleId);

    List<RolePermission> findRolePermissionsByRoleId(int roleId);

}
