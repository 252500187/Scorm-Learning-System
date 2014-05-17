package com.sls.system.dao.impl;

import com.core.page.dao.PageDao;
import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.system.dao.LabelDao;
import com.sls.system.entity.Label;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("tagDao")
public class LabelDaoImpl extends PageDao implements LabelDao {
    public StringBuilder getAllLabelSql() {
        String sql = "SELECT  *  FROM  us_label ";
        return new StringBuilder(sql);
    }

    @Override
    public List<Label> getAllUserLabel() {
        String sql = "SELECT  *  FROM  us_label " +
                "  WHERE label_id NOT IN " +
                "    (SELECT ul.label_id " +
                "    FROM us_label ul " +
                "      JOIN us_user_label uul " +
                "        ON ul.`label_id` = uul.`label_id`)";
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

    @Override
    public List<Label> getLabelsByUserId(int userId) {
        String sql = "SELECT uul.*,ul.`label_name` FROM us_user_label uul JOIN us_label ul ON uul.`label_id` = ul.`label_id` WHERE user_id = ?";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<Label>(Label.class), userId);
    }

    @Override
    public List<Label> getAllLabel() {
        String sql = "SELECT  *  FROM  us_label ";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<Label>(Label.class));
    }

    @Override
    public void addScormLabel(Label label) {
        String sql = "INSERT INTO ss_scorm_label(scorm_id, label_id)" +
                "VALUES(:scormId, :labelId)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(label));
    }

    @Override
    public Page<Label> getAllLabelPageList(PageParameter pageParameter, Label label) {
        StringBuilder sql = getAllLabelSql();
        if (!(0 == label.getLabelId())) {
            sql.append(" AND label_id like '%").append(label.getLabelId()).append("%'");
        }
        return queryForPage(pageParameter, sql.toString(), new BeanPropertySqlParameterSource(label), new BeanPropertyRowMapper<Label>(Label.class));
    }
}
