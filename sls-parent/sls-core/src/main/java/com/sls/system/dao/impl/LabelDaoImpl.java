package com.sls.system.dao.impl;

import com.core.page.dao.PageDao;
import com.sls.system.dao.LabelDao;
import com.sls.system.entity.Label;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("tagDao")
public class LabelDaoImpl extends PageDao implements LabelDao {
    @Override
    public List<Label> getAllUserLabel() {
        String sql = "SELECT * FROM us_label";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<Label>(Label.class));
    }
}
