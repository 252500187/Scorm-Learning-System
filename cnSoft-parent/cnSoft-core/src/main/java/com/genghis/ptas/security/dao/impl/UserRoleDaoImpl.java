package com.genghis.ptas.security.dao.impl;

import com.genghis.core.page.dao.PageDao;
import com.genghis.ptas.security.dao.UserRoleDao;
import com.genghis.ptas.security.entity.UserRole;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
@Repository("userRoleDao")
public class UserRoleDaoImpl extends PageDao implements UserRoleDao {
    @Override
    public int createUserRole(final String[] usernames, final String roleName) {
        final String insertSql = "INSERT INTO acl_user_role(username, role_name) VALUES(?, ?)";
        int[] nums = getJdbcTemplate().batchUpdate(insertSql, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setString(1, usernames[i]);
                ps.setString(2, roleName);
            }

            @Override
            public int getBatchSize() {
                return usernames.length;
            }
        });

        return getSum(nums);
    }

    @Override
    public int addUserRole(UserRole userRole) {
        final String sql = "INSERT INTO sys_user_role(user_id, role_id) VALUES(:userId, :roleId)";
        return getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(userRole));
    }

    @Override
    public int editRoleByUserId(UserRole userRole){
        String sql = "UPDATE sys_user_role SET role_id = :roleId WHERE user_id = :userId";
        return getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(userRole));
    }

    @Override
    public int deleteUserRoleByUserId(String userId) {
        final String sql = "DELETE FROM sys_user_role WHERE user_id = ?";
        return getJdbcTemplate().update(sql, userId);
    }

    @Override
    public int deleteUserRoleByRoleId(String roleId) {
        final String sql = "DELETE FROM acl_user_role WHERE role_Id = ?";
        return getJdbcTemplate().update(sql, roleId);
    }

    @Override
    public List<String> findAllRoleNamesByUserId(int userId) {
        final String sql = "SELECT r.role_name FROM sys_user_role ur,sys_role r WHERE r.id = ur.role_id and ur.user_id = ?";
        return getJdbcTemplate().queryForList(sql,String.class, userId);
    }

    @Override
    public UserRole findUserRoleByUserId (String userId) {
        final String sql = "select * from acl_user_role where user_id=?";
        return getJdbcTemplate().queryForObject(sql,new BeanPropertyRowMapper<UserRole>(UserRole.class),userId);
    }
}
