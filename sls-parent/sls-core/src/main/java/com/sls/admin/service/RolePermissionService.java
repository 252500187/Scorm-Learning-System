package com.sls.admin.service;

import com.sls.admin.entity.Permission;

import java.util.List;

/**
 * 角色权限service接口
 *
 * @author chenl
 * @version 1.0.1
 */
public interface RolePermissionService {

    void addRolePermissions(int roleId, String permissionTokens);

    List<Permission> findChoosedPermsByRoleId(int roleId);
}
