package com.genghis.ptas.security.dao;

import com.genghis.ptas.security.entity.Permission;
import com.genghis.ptas.security.entity.RolePermission;

import java.util.List;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
public interface RolePermissionDao {

    List<String> findAllPermTokensByAnyRoleNames(String[] roleNames);

    void addRolePermission(RolePermission rolePermission);

    void deleteRolePermissionsByRoleId(int roleId);

    List<Permission> findChoosedPermsByRoleId(int roleId);

    List<RolePermission> findRolePermissionsByRoleId(int roleId);

}
