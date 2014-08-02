package com.sls.scorm.dao.impl;

import com.core.page.dao.PageDao;
import com.sls.scorm.dao.PublicDiscussesDao;
import com.sls.scorm.entity.PublicDiscusses;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("publicDiscussesDao")
public class PublicDiscussesDaoImpl extends PageDao implements PublicDiscussesDao {

    @Override
    public void addPublicDiscusses(PublicDiscusses publicDiscusses) {
        String sql = "INSERT INTO ss_public_discusses (public_id, user_id,send_time,discuss)VALUES (:publicId, :userId, :sendTime,:discuss)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(publicDiscusses));
    }

    @Override
    public List<PublicDiscusses> getInlineDiscussesByPublicIdAndTime(String lastTime, int publicId, int userId) {
        String sql = "SELECT a.*,b.user_name,b.img_url FROM ss_public_discusses a, us_user_info b WHERE a.user_id=b.user_id " +
                "AND a.public_id=? AND send_time>? AND a.user_id!=? ORDER BY a.send_time";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<PublicDiscusses>(PublicDiscusses.class), publicId, lastTime, userId);
    }
}
