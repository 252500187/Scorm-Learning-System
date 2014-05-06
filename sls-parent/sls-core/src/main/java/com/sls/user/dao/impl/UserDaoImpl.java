package com.sls.user.dao.impl;

import com.core.page.dao.PageDao;
import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.user.dao.UserDao;
import com.sls.user.entity.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public class UserDaoImpl extends PageDao implements UserDao {

    private StringBuilder getUserSql() {
        String sql = "SELECT a.*, c.*,d.*, c.role_name show_role_id FROM us_user a,us_user_role b,us_role c,us_user_info d WHERE a.user_id=b.user_id AND b.role_id=c.role_id AND d.user_id=a.user_id ";
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
        return getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<User>(User.class), loginName);
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
        String sql = "INSERT INTO us_user(login_name, user_name, password, in_use) " +
                "VALUES(:loginName, :userName, :password, :inUse)";
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
}
