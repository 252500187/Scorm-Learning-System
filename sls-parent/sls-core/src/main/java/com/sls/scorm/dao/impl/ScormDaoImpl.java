package com.sls.scorm.dao.impl;

import com.core.page.dao.PageDao;
import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.dao.ScormDao;
import com.sls.scorm.entity.Sco;
import com.sls.scorm.entity.Scorm;
import com.sls.util.DictConstant;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository("scormDao")
public class ScormDaoImpl extends PageDao implements ScormDao {

    @Override
    public int addScorm(Scorm scorm) {
        String sql = "INSERT INTO ss_scorm(scorm_name,register_sum,score,recommend_level,total_time,img_path,description,upload_user_id,upload_date,in_use,complete_way) " +
                "VALUES(:scormName,:registerSum,:score,:recommendLevel,:totalTime,:imgPath,:description,:uploadUserId,:uploadDate,:inUse,:completeWay)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(scorm), keyHolder);
        return keyHolder.getKey().intValue();
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

    @Override
    public boolean checkNotHasRegister(int scormId, int userId) {
        String sql = "SELECT * FROM luss_scorm_sco WHERE scorm_id = " + scormId + " AND user_id = ? ";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<Sco>(Sco.class), userId).isEmpty();
    }

    @Override
    public void changeTotalTimeByScormId(int scormId, String totalTime) {
        String sql = "UPDATE ss_scorm SET total_time=? WHERE scorm_id=?";
        getJdbcTemplate().update(sql, totalTime, scormId);
    }

    @Override
    public Page<Scorm> listNotAuditScormPageList(PageParameter pageParameter, Scorm scorm) {
        StringBuilder sql = new StringBuilder("SELECT ss_scorm.*,us_user_info.user_name AS showUploadUserId FROM ss_scorm ,us_user_info WHERE us_user_info.user_id=ss_scorm.upload_user_id AND ss_scorm.in_use=" + DictConstant.NO_USE);
        if (scorm.getScormName() != null && !scorm.getScormName().equals("")) {
            sql.append(" AND ss_scorm.scorm_name like '%").append(scorm.getScormName()).append("%'");
        }
        if (scorm.getShowUploadUserId() != null && !scorm.getShowUploadUserId().equals("")) {
            sql.append(" AND us_user_info.user_name like '%").append(scorm.getShowUploadUserId()).append("%'");
        }
        return queryForPage(pageParameter, sql.toString(), new BeanPropertySqlParameterSource(scorm), new BeanPropertyRowMapper<Scorm>(Scorm.class));
    }

    @Override
    public Page<Scorm> listAuditScormPageList(PageParameter pageParameter, Scorm scorm) {
        StringBuilder sql = new StringBuilder("SELECT * FROM ss_scorm WHERE in_use =" + DictConstant.IN_USE);
        if (scorm.getScormName() != null && !scorm.getScormName().equals("")) {
            sql.append(" AND scorm_name like '%").append(scorm.getScormName()).append("%'");
        }
        return queryForPage(pageParameter, sql.toString(), new BeanPropertySqlParameterSource(scorm), new BeanPropertyRowMapper<Scorm>(Scorm.class));
    }

    @Override
    public void changeScormInUse(int scormId, int isUse) {
        String sql = "UPDATE ss_scorm SET in_use=? WHERE scorm_id=?";
        getJdbcTemplate().update(sql, isUse, scormId);
    }

    @Override
    public void changeScormRecommend(int scormId, int recommend) {
        String sql = "UPDATE ss_scorm SET recommend_level=? WHERE scorm_id=?";
        getJdbcTemplate().update(sql, recommend, scormId);
    }

    @Override
    public void changScormCompleteWayByScormId(int scormId, int completeWay) {
        String sql = "UPDATE ss_scorm SET complete_way=? WHERE scorm_id=?";
        getJdbcTemplate().update(sql, completeWay, scormId);
    }

    @Override
    public void updateScormScoreByScormId(int scormId) {
        String sql = "UPDATE ss_scorm SET score=(SELECT AVG(score) FROM luss_scorm_summarize WHERE score!='' AND scorm_id=?) WHERE scorm_id=?";
        getJdbcTemplate().update(sql, scormId, scormId);
    }
}
