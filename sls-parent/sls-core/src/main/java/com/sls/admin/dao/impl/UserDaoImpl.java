/*
* UserDaoImpl.java
* Created on  2013-9-26 下午10:03
* 版本       修改时间          作者      修改内容
* V1.0.1    2013-9-26       gaoxinyu    初始版本
*
*/
package com.sls.admin.dao.impl;

import com.core.page.dao.PageDao;
import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.dao.UserDao;
import com.sls.admin.entity.User;
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
@Repository("userDao")
public class UserDaoImpl extends PageDao implements UserDao {

    private StringBuilder getUserSql() {
        String sql = "SELECT a.*,b.role_id,c.role_name show_role_id" +
                " FROM sys_user a,sys_user_role b,sys_role c" +
                " WHERE a.id=b.user_id AND b.role_id=c.id";
        return new StringBuilder(sql);
    }

    @Override
    public Page<User> findUserPageList(PageParameter pageParameter, User user) {
        StringBuilder sql = getUserSql();
        if (!("").equals(user.getLoginName())) {
            sql.append(" AND a.login_name like '%").append(user.getLoginName().trim()).append("%'");
        }
        if (!("").equals(user.getUserName())) {
            sql.append(" AND a.user_name like '%").append(user.getUserName().trim()).append("%'");
        }
        if (!("").equals(user.getShowDepartmentId())) {
            sql.append(" AND a.department_id = ").append(user.getShowDepartmentId());
        }
        if (!("").equals(user.getShowRoleId())) {
            sql.append(" AND b.role_id = ").append(user.getShowRoleId());
        }
        return queryForPage(pageParameter, sql.toString(), new BeanPropertySqlParameterSource(user), new BeanPropertyRowMapper<User>(User.class));
    }

    @Override
    public User findUserAllInfoById(int id) {
        StringBuilder sql = getUserSql();
        sql.append(" AND a.id=?");
        return getJdbcTemplate().queryForObject(sql.toString(), new BeanPropertyRowMapper<User>(User.class), id);
    }

    @Override
    public List<User> findUserByLoginName(String loginName) {
        StringBuilder sql = getUserSql();
        sql.append(" AND a.login_name=?");
        return getJdbcTemplate().queryForList(sql.toString(), User.class, loginName);
    }

    @Override
    public Boolean checkRepeatLoginName(String loginName) {
        String sql = "select * from sys_user where login_name =?";
        return !getJdbcTemplate().query(sql, new BeanPropertyRowMapper<User>(User.class), loginName).isEmpty();
    }

    @Override
    public Boolean checkRepeatUserName(String userName) {
        String sql = "select * from sys_user where user_name =?";
        return !getJdbcTemplate().query(sql, new BeanPropertyRowMapper<User>(User.class), userName).isEmpty();
    }

    @Override
    public int addUser(User user) {
        String sql = "INSERT INTO sys_user(login_name, user_name, password, department_id) " +
                "VALUES(:loginName, :userName, :password, :departmentId)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(user), keyHolder);
        return keyHolder.getKey().intValue();
    }

    @Override
    public void editUser(User user) {
        String sql = "UPDATE sys_user " +
                "SET login_name = :loginName, user_name = :userName, password = :password, department_id = :departmentId  " +
                "WHERE id = :id";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(user));
    }

    @Override
    public int delUser(int id) {
        String sql = "DELETE FROM sys_user WHERE id = ?";
        return getJdbcTemplate().update(sql, id);
    }

    @Override
    public List<String> findAllPermTokensByUserId(int userId) {
        String sql = "SELECT p.permission_token FROM sys_user_permission up,sys_permission p WHERE p.id = up.permission_id and up.user_id = ?";
        return getJdbcTemplate().queryForList(sql, String.class, userId);
    }
}
