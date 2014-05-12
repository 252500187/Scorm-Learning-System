package com.sls.scorm.dao.impl;

import com.core.page.dao.PageDao;
import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.dao.StatisticsDao;
import com.sls.scorm.entity.Scorm;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;

@Repository("statisticsDao")
public class StatisticsDaoImpl extends PageDao implements StatisticsDao {
    private StringBuilder getUserSql() {
        String sql = "SELECT * FROM ss_scorm where 1=1 ";
        return new StringBuilder(sql);
    }

    @Override
    public Page<Scorm> findScormPageList(PageParameter pageParameter, Scorm scorm) {
        StringBuilder sql = getUserSql();
        if (!("").equals(scorm.getScormName())){
            sql.append(" AND scorm_name like '%").append(scorm.getScormName().trim()).append("%'");
        }
        if (!("").equals(scorm.getInUse())){
            sql.append(" AND in_use like '%").append(scorm.getInUse()).append("%'");
        }
        return queryForPage(pageParameter, sql.toString(), new BeanPropertySqlParameterSource(scorm), new BeanPropertyRowMapper<Scorm>(Scorm.class));
    }
}
