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
        String sql = "INSERT INTO luss_scorm_sco_api_info(sco_id,coreStudentId,coreStudentName,coreLessonLocation,coreCredit,coreLessonStatus,coreEntry,coreScore,coreScoreRaw,coreTotalTime,coreLessonMode,coreExit,coreSessionTime,suspendData,launchData) " +
                "VALUES(:scoId, :coreStudentId, :coreStudentName, :coreLessonLocation, :coreCredit, :coreLessonStatus,:coreEntry,:coreScore,:coreScoreRaw,:coreTotalTime,:coreLessonMode,:coreExit,:coreSessionTime,:suspendData,:launchData)";
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

    @Override
    public void changeScoInfoByScoId(ScoInfo scoInfo) {
        StringBuilder findSql = new StringBuilder("");
        if (!("").equals(scoInfo.getCoreStudentId())) {
            findSql.append(" coreStudentId='" + scoInfo.getCoreStudentId() + "',");
        }
        if (!("").equals(scoInfo.getCoreStudentName())) {
            findSql.append(" coreStudentName='" + scoInfo.getCoreStudentName() + "',");
        }
        if (!("").equals(scoInfo.getCoreLessonLocation())) {
            findSql.append(" coreLessonLocation='" + scoInfo.getCoreLessonLocation() + "',");
        }
        if (!("").equals(scoInfo.getCoreCredit())) {
            findSql.append(" coreCredit='" + scoInfo.getCoreCredit() + "',");
        }
        if (!("").equals(scoInfo.getCoreLessonStatus())) {
            findSql.append(" coreLessonStatus='" + scoInfo.getCoreLessonStatus() + "',");
        }
        if (!("").equals(scoInfo.getCoreEntry())) {
            findSql.append(" coreEntry='" + scoInfo.getCoreEntry() + "',");
        }
        if (!("").equals(scoInfo.getCoreScore())) {
            findSql.append(" coreScore='" + scoInfo.getCoreScore() + "',");
        }
        if (!("").equals(scoInfo.getCoreScoreRaw())) {
            findSql.append(" coreScoreRaw='" + scoInfo.getCoreScoreRaw() + "',");
        }
        if (!("").equals(scoInfo.getCoreTotalTime())) {
            findSql.append(" coreTotalTime='" + scoInfo.getCoreTotalTime() + "',");
        }
        if (!("").equals(scoInfo.getCoreLessonMode())) {
            findSql.append(" coreLessonMode='" + scoInfo.getCoreLessonMode() + "',");
        }
        if (!("").equals(scoInfo.getCoreExit())) {
            findSql.append(" coreExit='" + scoInfo.getCoreExit() + "',");
        }
        if (!("").equals(scoInfo.getCoreSessionTime())) {
            findSql.append(" coreSessionTime='" + scoInfo.getCoreSessionTime() + "',");
        }
        if (!("").equals(scoInfo.getSuspendData())) {
            findSql.append(" suspendData='" + scoInfo.getSuspendData() + "',");
        }
        if (!("").equals(scoInfo.getLaunchData())) {
            findSql.append(" launchData='" + scoInfo.getLaunchData() + "',");
        }
        if (findSql.equals("")) {
            return;
        }
        String mainSql = "UPDATE luss_scorm_sco_api_info SET " + findSql.substring(0, findSql.length() - 1) + " WHERE sco_id=?";
        getJdbcTemplate().update(mainSql, scoInfo.getScoId());
    }
}
