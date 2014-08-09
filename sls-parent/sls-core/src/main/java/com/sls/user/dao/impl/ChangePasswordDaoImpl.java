package com.sls.user.dao.impl;

import com.core.page.dao.PageDao;
import com.sls.user.dao.ChangePasswordDao;
import com.sls.user.entity.ChangePassword;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;

@Repository("changePasswordDao")
public class ChangePasswordDaoImpl extends PageDao implements ChangePasswordDao {

    @Override
    public void addChangePassword(ChangePassword changePassword) {
        String sql = "INSERT INTO us_change_password(user_id, change_key,send_date,state) VALUES(:userId,:changeKey,:sendDate,:state)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(changePassword));
    }
}
