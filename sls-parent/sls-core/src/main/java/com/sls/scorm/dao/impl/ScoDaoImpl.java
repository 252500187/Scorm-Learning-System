package com.sls.scorm.dao.impl;

import com.core.page.dao.PageDao;
import com.sls.scorm.dao.ScoDao;
import com.sls.scorm.dao.ScormDao;
import com.sls.scorm.entity.Sco;
import com.sls.scorm.entity.ScoInfo;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("scoDao")
public class ScoDaoImpl extends PageDao implements ScoDao {

    @Override
    public int addSco(Sco sco) {
        String sql = "INSERT INTO luss_scorm_sco(scorm_id,user_id,title,type,tree_parent_id,tree_id,url,last_visit,study_state) " +
                "VALUES(:scormId, :userId, :title, :type, :treeParentId,:treeId,:url,:lastVisit,:studyState)";
        KeyHolder keyHolder = new GeneratedKeyHolder();
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(sco), keyHolder);
        return keyHolder.getKey().intValue();
    }

    @Override
    public void addScoInfo(ScoInfo scoInfo) {
        String sql = "INSERT INTO luss_scorm_sco_api_info(sco_id,coreStudentId,coreStudentName,coreLessonLocation,coreCredit,coreLessonStatus,coreEntry,coreScore,coreScoreRaw,coreTotalTime,coreLessonMode,coreExit,coreSessionTime,suspendData) " +
                "VALUES(:scoId, :coreStudentId, :coreStudentName, :coreLessonLocation, :coreCredit, :coreLessonStatus,:coreEntry,:coreScore,:coreScoreRaw,:coreTotalTime,:coreLessonMode,:coreExit,:coreSessionTime,:suspendData)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(scoInfo));
    }

    @Override
    public List<Sco> findScosByScormIdAndUserId(int scormId, int userId) {
        String sql = "SELECT * FROM luss_scorm_sco WHERE scorm_id=? AND user_id=?";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<Sco>(Sco.class), scormId, userId);
    }

    @Override
    public void changeStudyStateByScoId(int scoId, int studyState) {
        String sql = "UPDATE luss_scorm_sco SET study_state=? WHERE sco_id=?";
        getJdbcTemplate().update(sql, studyState, scoId);
    }

    @Override
    public List<ScoInfo> getScoApiInfoByScoId(int scoId) {
        String sql = "SELECT * FROM luss_scorm_sco_api_info WHERE sco_id=?";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<ScoInfo>(ScoInfo.class), scoId);
    }
}
