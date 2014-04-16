package com.genghis.ptas.security.service.impl;

import com.genghis.ptas.security.dao.PermissionDao;
import com.genghis.ptas.security.dao.RolePermissionDao;
import com.genghis.ptas.security.entity.Permission;
import com.genghis.ptas.security.entity.RolePermission;
import com.genghis.ptas.security.service.RolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色权限service实现
 *
 * @author chenl
 * @version 1.0.1
 */

@Service("rolePermissionService")
public class RolePermissionServiceImpl implements RolePermissionService {

    @Autowired
    private RolePermissionDao rolePermissionDao;

    @Autowired
    private PermissionDao permissionDao;

    public void addRolePermissions(int roleId, String permissionTokens) {
        if (permissionTokens.length() != 0) {
            RolePermission rolePermission = new RolePermission();
            rolePermission.setRoleId(roleId);
            String[] permTokens = permissionTokens.split(",");
            for (String permToken : permTokens) {
                int permId = permissionDao.findPermissionByPermissionToken(permToken).getId();
                rolePermission.setPermissionId(permId);
                rolePermissionDao.addRolePermission(rolePermission);
            }
        }
    }

    public void editRolePermissions(int roleId, String permissionIds) {
        rolePermissionDao.deleteRolePermissionsByRoleId(roleId);
        addRolePermissions(roleId, permissionIds);
    }

    public List<Permission> findChoosedPermsByRoleId(int roleId) {
        return rolePermissionDao.findChoosedPermsByRoleId(roleId);
    }

    @Override
    public List<RolePermission> findRolePermissionsByRoleId(int roleId) {
        return rolePermissionDao.findRolePermissionsByRoleId(roleId);
    }
}
