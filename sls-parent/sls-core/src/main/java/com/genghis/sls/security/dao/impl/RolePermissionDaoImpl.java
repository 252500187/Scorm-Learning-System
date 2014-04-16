package com.genghis.sls.security.dao.impl;

import com.genghis.core.page.dao.PageDao;
import com.genghis.sls.security.dao.RolePermissionDao;
import com.genghis.sls.security.entity.Permission;
import com.genghis.sls.security.entity.RolePermission;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
@Repository("rolePermissionDao")
public class RolePermissionDaoImpl extends PageDao implements RolePermissionDao {

    @Override
    public List<String> findAllPermTokensByAnyRoleNames(String[] roleNames) {
        StringBuilder buf = new StringBuilder();
        for (int i = 0, len = roleNames.length; i < len; i++) {
            if (i > 0) {
                buf.append(",");
            }
            buf.append(roleNames[i]);
        }
        final String sql = "SELECT p.permission_token FROM sys_permission p,sys_role_permission rp,sys_role r WHERE p.id = rp.permission_id AND rp.role_id = r.id AND r.role_name IN (?)";
        return getJdbcTemplate().queryForList(sql, String.class, buf.toString());
    }

    @Override
    public void addRolePermission(RolePermission rolePermission) {
        String sql = "INSERT INTO sys_role_permission(role_Id, permission_id) VALUES(:roleId, :permissionId)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(rolePermission));
    }

    @Override
    public void deleteRolePermissionsByRoleId(int roleId) {
        final String sql = "DELETE FROM sys_role_permission WHERE role_Id = ?";
        getJdbcTemplate().update(sql, roleId);
    }

    @Override
    public List<Permission> findChoosedPermsByRoleId(int roleId) {
        final String sql = "SELECT p.* FROM sys_permission p,sys_role_permission rp WHERE p.id=rp.permission_id AND rp.role_id=?";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<Permission>(Permission.class), roleId);
    }

    @Override
    public List<RolePermission> findRolePermissionsByRoleId(int roleId) {
        final String sql = "SELECT * FROM sys_role_permission WHERE role_id=?";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<RolePermission>(RolePermission.class), roleId);
    }
}
