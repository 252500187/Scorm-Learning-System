package com.sls.scorm.dao.impl;

import com.core.page.dao.PageDao;
import com.sls.scorm.dao.SummarizeDao;
import com.sls.scorm.entity.Scorm;
import com.sls.scorm.entity.ScormSummarize;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("summarizeDao")
public class SummarizeDaoImpl extends PageDao implements SummarizeDao {

    @Override
    public void addScormSummarize(ScormSummarize scormSummarize) {
        String sql = "INSERT INTO luss_scorm_summarize(user_id,scorm_id,score,discuss,grade,discuss_date,complete_date) " +
                "VALUES(:userId, :scormId, :score, :discuss, :grade, :discussDate, :completeDate)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(scormSummarize));
    }

    @Override
    public boolean getCompleteInfo(int scormId, int userId) {
        String sql = "SELECT * FROM luss_scorm_summarize WHERE complete_date <> '' AND scorm_id = ? AND user_id = ? ";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<Scorm>(Scorm.class), scormId, userId).isEmpty();
    }

    @Override
    public void changeSummarizeScoreByUserIdAndScormId(ScormSummarize scormSummarize) {
        String sql = "UPDATE luss_scorm_summarize SET score=? WHERE user_id=? AND scorm_id=?";
        getJdbcTemplate().update(sql, scormSummarize.getScore(), scormSummarize.getUserId(), scormSummarize.getScormId());
    }

    @Override
    public void changeCompleteInfoByScormIdAndUserId(ScormSummarize scormSummarize) {
        String sql = "UPDATE luss_scorm_summarize SET grade=?, complete_date=? WHERE scorm_id=? AND user_id=?";
        getJdbcTemplate().update(sql, scormSummarize.getGrade(), scormSummarize.getCompleteDate(), scormSummarize.getScormId(), scormSummarize.getUserId());
    }


    @Override
    public ScormSummarize findScormSummarizeByUserIdAndScormId(int userId, int scormId) {
        String sql = "SELECT * FROM luss_scorm_summarize WHERE user_id=? AND scorm_id=?";
        return getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper<ScormSummarize>(ScormSummarize.class), userId, scormId);
    }

    @Override
    public List<ScormSummarize> getAllCommentsByScormId(int scormId) {
        String sql = " SELECT lss.*,uu.`login_name` FROM luss_scorm_summarize lss " +
                " JOIN us_user uu ON lss.`user_id` = uu.user_id " +
                " WHERE uu.`in_use`='1' AND scorm_id = ?";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<ScormSummarize>(ScormSummarize.class), scormId);
    }

    @Override
    public List<Scorm> getAllRegisterScormInfoByUserId(int userId) {
        String sql = "SELECT b.* , a.`complete_date` FROM luss_scorm_summarize a, ss_scorm b WHERE a.`scorm_id`=b.`scorm_id` AND a.`user_id` = ? ";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<Scorm>(Scorm.class), userId);
    }
}
