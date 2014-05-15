package com.sls.user.dao.impl;

import com.core.page.dao.PageDao;
import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.entity.Scorm;
import com.sls.user.dao.UserDao;
import com.sls.user.entity.User;
import com.sls.user.entity.UserLevel;
import com.sls.util.DictConstant;
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

    private StringBuilder getUserManageSql() {
        String sql = "SELECT " +
                "  a.`user_id`,a.`login_name`,d.`user_name`,c.role_name,d.register_date,a.`in_use`," +
                "  d.`email`,d.`score`" +
                "FROM" +
                "  us_user a," +
                "  us_user_role b," +
                "  us_role c," +
                "  us_user_info d " +
                "WHERE a.user_id = b.user_id " +
                "  AND b.role_id = c.role_id " +
                "  AND d.user_id = a.user_id";
        return new StringBuilder(sql);
    }

    @Override
    public Page<User> findUserPageList(PageParameter pageParameter, User user) {
        StringBuilder sql = getUserManageSql();
        if (!("").equals(user.getLoginName())) {
            sql.append(" AND a.login_name like '%").append(user.getLoginName().trim()).append("%'");
        }
        if (!("").equals(user.getUserName())) {
            sql.append(" AND d.user_name like '%").append(user.getUserName().trim()).append("%'");
        }
        return queryForPage(pageParameter, sql.toString(), new BeanPropertySqlParameterSource(user), new BeanPropertyRowMapper<User>(User.class));
    }

    @Override
    public User findUserAllInfoById(int id) {
        StringBuilder sql = getUserSql();
        sql.append(" AND a.user_id=?");
        return getJdbcTemplate().queryForObject(sql.toString(), new BeanPropertyRowMapper<User>(User.class), id);
    }

    @Override
    public List<User> findInUseUserByLoginName(String loginName) {
        StringBuilder sql = getUserSql();
        sql.append(" AND a.in_use = ? AND a.login_name=? ");
        return getJdbcTemplate().query(sql.toString(), new BeanPropertyRowMapper<User>(User.class), DictConstant.IN_USE, loginName);
    }

    @Override
    public Boolean checkRepeatLoginName(String loginName) {
        String sql = "select * from us_user where login_name =?";
        return !getJdbcTemplate().query(sql, new BeanPropertyRowMapper<User>(User.class), loginName).isEmpty();
    }

    @Override
    public Boolean checkRepeatUserName(String userName) {
        String sql = "select * from sys_user where user_name =?";
        return !getJdbcTemplate().query(sql, new BeanPropertyRowMapper<User>(User.class), userName).isEmpty();
    }

    @Override
    public int addUser(User user) {
        String sql = "INSERT INTO us_user(login_name, password, in_use) " +
                "VALUES(:loginName, :password, :inUse)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(user), keyHolder);
        return keyHolder.getKey().intValue();
    }

    @Override
    public void editUser(User user) {
        String sql = "UPDATE us_user_info " +
                "SET user_name = :userName, sex = :sex  " +
                "WHERE user_id = :userId";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(user));
    }

    @Override
    public void upUserPhoto(User user) {
        String sql = "UPDATE us_user_info SET img_url = :imgUrl WHERE user_id = :userId";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(user));
    }

    @Override
    public int delUser(int id) {
        String sql = "DELETE FROM sys_user WHERE id = ?";
        return getJdbcTemplate().update(sql, id);
    }

    @Override
    public void addUserInfo(User user) {
        String sql = "INSERT INTO us_user_info(user_id, user_name, register_date, email, score,img_url, sex ) " +
                "VALUES(:userId, :userName, :registerDate, :email, :score,:imgUrl, :sex)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(user));
    }

    @Override
    public UserLevel findUserLevelNameByScore(int score) {
        String sql = "SELECT level_name FROM us_level WHERE score = (SELECT MAX(score)  FROM us_level WHERE score<=?)";
        return getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper<UserLevel>(UserLevel.class), score);
    }

    @Override
    public int findUploadScormNumByUserId(int userId) {
        String sql = "SELECT COUNT(*) AS a FROM ss_scorm WHERE upload_user_id = ? ";
        return getJdbcTemplate().queryForObject(sql, Integer.class, userId);
    }

    @Override
    public void editUseState(User user) {
        String sql = "UPDATE us_user " +
                "SET in_use = :inUse " +
                "WHERE user_id = :userId";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(user));

    }

    @Override
    public List<Scorm> getAllRegisterScormInfoByUserId(int userId) {
        String sql = "SELECT * FROM ss_scorm WHERE scorm_id IN (SELECT scorm_id FROM luss_user_collect WHERE user_id = ?)";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<Scorm>(Scorm.class), userId);
    }
}