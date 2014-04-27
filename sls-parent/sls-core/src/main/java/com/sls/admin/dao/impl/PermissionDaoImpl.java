/*
* PermissionDaoImpl.java
* Created on  2014-3-14 下午3:19
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-3-14       gaoxinyu    初始版本
*
*/
package com.sls.admin.dao.impl;

import com.core.page.dao.PageDao;
import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.dao.PermissionDao;
import com.sls.admin.entity.Permission;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

/**
 * 类的描述信息
 *
 * @author qinw
 * @version 1.0.1
 */
@Repository("permissionDao")
public class PermissionDaoImpl extends PageDao implements PermissionDao {

    private StringBuilder getPermissionSql() {
        String userSql = "SELECT * FROM sys_permission where 1=1 ";
        return new StringBuilder(userSql);
    }

    @Override
    public Page<Permission> listAllPermission(PageParameter pageParameter, Permission permission) {
        StringBuilder sql = getPermissionSql();
        if (!"".equals(permission.getPermissionToken())) {
            sql.append("AND permission_token like '%").append(permission.getPermissionToken().trim()).append("%'");
        }
        if (!"".equals(permission.getDescription())) {
            sql.append("AND description like '%").append(permission.getDescription().trim()).append("%'");
        }
        return queryForPage(pageParameter, sql.toString(), new BeanPropertySqlParameterSource(permission), new BeanPropertyRowMapper<Permission>(Permission.class));
    }

    @Override
    public Boolean checkRepeatPermToken(String permissionToken) {
        String sql = "select * from sys_permission where permission_token =?";
        return !getJdbcTemplate().query(sql, new BeanPropertyRowMapper<Permission>(Permission.class), permissionToken).isEmpty();
    }

    @Override
    public int addPermission(Permission permission) {
        String sql = "INSERT INTO sys_permission(permission_token, description)" + "VALUES(:permissionToken, :description)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(permission), keyHolder);
        return keyHolder.getKey().intValue();
    }

    @Override
    public void editPermission(Permission permission) {
        String sql = "UPDATE sys_permission SET permission_token = :permissionToken, description = :description WHERE id = :id";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(permission));
    }

    @Override
    public void delPermissionDo(int id) {
        String sql = "DELETE FROM sys_permission WHERE id =?";
        getJdbcTemplate().update(sql, id);
    }

    @Override
    public Permission findPermissionById(String id) {
        String sql = "SELECT * FROM sys_permission WHERE id=?";
        return getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper<Permission>(Permission.class), id);
    }

    @Override
    public Permission findPermissionByPermissionToken(String permissionToken) {
        String sql = "SELECT * FROM sys_permission WHERE permission_token=?";
        return getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper<Permission>(Permission.class), permissionToken);
    }

}
