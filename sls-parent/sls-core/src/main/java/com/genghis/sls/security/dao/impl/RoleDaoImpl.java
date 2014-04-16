/*
* RoleDaoImpl.java
* Created on  2013-9-26 下午10:03
* 版本       修改时间          作者      修改内容
* V1.0.1    2013-9-26       gaoxinyu    初始版本
*
*/
package com.genghis.sls.security.dao.impl;

import com.genghis.core.page.dao.PageDao;
import com.genghis.core.page.entity.Page;
import com.genghis.core.page.entity.PageParameter;
import com.genghis.sls.security.dao.RoleDao;
import com.genghis.sls.security.entity.Role;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 角色dao实现
 *
 * @author gaoxinyu
 * @version 1.0.1
 */

@Repository("roleDao")
public class RoleDaoImpl extends PageDao implements RoleDao {

    private StringBuilder getRoleSql() {
        String roleSql = "SELECT * FROM sys_role where 1=1 ";
        return new StringBuilder(roleSql);
    }

    @Override
    public Page<Role> findRolePageList(PageParameter pageParameter, Role role) {
        StringBuilder sql = getRoleSql();
        if (!role.getRoleName().equals("")) {
            sql.append(" AND role_name like '%").append(role.getRoleName().trim()).append("%'");
        }
        if (!role.getDescription().equals("")) {
            sql.append(" AND description like '%").append(role.getDescription().trim()).append("%'");
        }
        return queryForPage(pageParameter, sql.toString(), new BeanPropertySqlParameterSource(role), new BeanPropertyRowMapper<Role>(Role.class));
    }

    @Override
    public List<Role> findAllRole() {
        StringBuilder sql = getRoleSql();
        return getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<Role>(Role.class));
    }

    @Override
    public int addRole(Role role) {
        String sql = "INSERT INTO sys_role(role_name, description) VALUES(:roleName, :description)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(role), keyHolder);
        return keyHolder.getKey().intValue();
    }

    @Override
    public void editRole(Role role) {
        String sql = "UPDATE sys_role SET role_name = :roleName, description = :description WHERE id = :id";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(role));
    }

    @Override
    public int delRole(int id) {
        String sql = "DELETE FROM sys_role WHERE id = ?";
        return getJdbcTemplate().update(sql, id);
    }

    @Override
    public Role findRoleById(int id) {
        StringBuilder sql = getRoleSql();
        sql.append(" AND id=?");
        return getJdbcTemplate().queryForObject(sql.toString(), new BeanPropertyRowMapper<Role>(Role.class), id);
    }

    @Override
    public Role findRoleByRoleName(String roleName) {
        StringBuilder sql = getRoleSql();
        sql.append(" AND role_name=?");
        return getJdbcTemplate().queryForObject(sql.toString(), new BeanPropertyRowMapper<Role>(Role.class), roleName);
    }

    @Override
    public Boolean checkRepeatRoleName(String roleName) {
        String sql = "SELECT * FROM sys_role WHERE role_name =?";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<Role>(Role.class), roleName).isEmpty();
    }

    @Override
    public Role findRoleByUserId(int userId) {
        String sql = "SELECT r.* FROM sys_role r,sys_user_role ur where ur.role_id=r.id and ur.user_id=?";
        return getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper<Role>(Role.class), userId);
    }
}
