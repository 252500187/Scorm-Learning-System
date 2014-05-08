package com.sls.scorm.dao.impl;

import com.core.page.dao.PageDao;
import com.sls.scorm.dao.ScormDao;
import com.sls.scorm.entity.ScoInfo;
import com.sls.scorm.entity.Scorm;
import com.sls.scorm.entity.ScormSummarize;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository("scormDao")
public class ScormDaoImpl extends PageDao implements ScormDao {

    @Override
    public int addScorm(Scorm scorm) {
        String sql = "INSERT INTO ss_scorm(scorm_id,scorm_name,register_sum,recommend_level,img_path, description, upload_user_id, upload_date,in_use) " +
                "VALUES(:scormId, :scormName, :registerSum,:recommendLevel, :imgPath,:description, :uploadUserId, :uploadDate,:inUse)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(scorm), keyHolder);
        return keyHolder.getKey().intValue();
    }

    @Override
    public void addScormSummarize(ScormSummarize scormSummarize) {
        String sql = "INSERT INTO luss_scorm_summarize(user_id,scorm_id,score,discuss,grade,discuss_date,complete_date) " +
                "VALUES(:userId, :scormId, :score, :discuss, :grade, :discussDate, :completeDate)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(scormSummarize));
    }

    @Override
    public void addVisitSum(int scormId) {
        String sql = "UPDATE ss_scorm SET register_sum=register_sum+1 WHERE scorm_id=?";
        getJdbcTemplate().update(sql, scormId);
    }

    @Override
    public Scorm findScormInfoByScormId(int scormId) {
        String sql = "SELECT * FROM ss_scorm WHERE scorm_id = ?";
        return getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper<Scorm>(Scorm.class), scormId);
    }
}
