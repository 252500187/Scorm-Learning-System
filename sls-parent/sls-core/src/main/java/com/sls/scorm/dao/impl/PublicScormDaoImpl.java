package com.sls.scorm.dao.impl;

import com.core.page.dao.PageDao;
import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.dao.PublicScormDao;
import com.sls.scorm.entity.PublicScorm;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;

@Repository("publicScormDao")
public class PublicScormDaoImpl extends PageDao implements PublicScormDao {

    @Override
    public Page<PublicScorm> listAllPublicScormPageList(PageParameter pageParameter, PublicScorm publicScorm) {
        StringBuilder sql = new StringBuilder("SELECT a.*,b.scorm_name FROM ss_public_scorm a,ss_scorm b WHERE a.scorm_id=b.scorm_id");
        if (!("").equals(publicScorm.getStartTime())) {
            sql.append(" AND a.start_time >= " + publicScorm.getStartTime());
        }
        if (!("").equals(publicScorm.getEndTime())) {
            sql.append(" AND a.end_time <= " + publicScorm.getEndTime());
        }
        return queryForPage(pageParameter, sql.toString(), new BeanPropertySqlParameterSource(publicScorm), new BeanPropertyRowMapper<PublicScorm>(PublicScorm.class));
    }

    @Override
    public void delPublicScormByPublicId(int publicId) {
        String sql = "DELETE FROM ss_public_scorm WHERE public_id=?";
        getJdbcTemplate().update(sql, publicId);
    }
}
