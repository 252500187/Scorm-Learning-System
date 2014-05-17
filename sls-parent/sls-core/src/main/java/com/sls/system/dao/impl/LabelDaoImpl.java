package com.sls.system.dao.impl;

import com.core.page.dao.PageDao;
import com.sls.system.dao.LabelDao;
import com.sls.system.entity.Label;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("tagDao")
public class LabelDaoImpl extends PageDao implements LabelDao {
    @Override
    public List<Label> getAllUserLabel() {
        String sql = "SELECT * FROM us_label";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<Label>(Label.class));
    }

    @Override
    public void delAllUserLabelsByUserId(int userId) {
        String sql = "DELETE FROM us_user_label WHERE user_id = ?";
        getJdbcTemplate().update(sql, userId);
    }

    @Override
    public void addUserLabel(Label label) {
        String sql = "INSERT INTO us_user_label(user_id, label_id)" +
                "VALUES(:userId, :labelId)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(label));
    }
}
