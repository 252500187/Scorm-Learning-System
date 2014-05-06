package com.sls.scorm.dao.impl;

import com.core.page.dao.PageDao;
import com.sls.scorm.dao.ScoDao;
import com.sls.scorm.dao.ScormDao;
import com.sls.scorm.entity.Sco;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;

@Repository("scoDao")
public class ScoDaoImpl  extends PageDao implements ScoDao {

    @Override
    public void addSco(Sco sco) {
        String sql = "INSERT INTO luss_scorm_sco(sco_id,scorm_id,user_id,title,type,tree_parent_id,tree_id,url,last_visit,study_state) " +
                "VALUES(:scoId, :scormId, :userId, :title, :type, :treeParentId,:treeId,:url,:lastVisit,:studyState)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(sco));
    }
}
