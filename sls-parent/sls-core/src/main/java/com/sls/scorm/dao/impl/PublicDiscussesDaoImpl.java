package com.sls.scorm.dao.impl;

import com.core.page.dao.PageDao;
import com.sls.scorm.dao.PublicDiscussesDao;
import com.sls.scorm.entity.PublicDiscusses;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;

@Repository("publicDiscussesDao")
public class PublicDiscussesDaoImpl extends PageDao implements PublicDiscussesDao {

    @Override
    public void addPublicDiscusses(PublicDiscusses publicDiscusses) {
        String sql = "INSERT INTO ss_public_discusses (public_id, user_id,send_time,discuss)VALUES (:publicId, :userId, :sendTime,:discuss)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(publicDiscusses));
    }
}
