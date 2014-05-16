package com.sls.scorm.dao.impl;

import com.core.page.dao.PageDao;
import com.sls.scorm.dao.SummarizeDao;
import com.sls.scorm.entity.ScormSummarize;
import org.springframework.stereotype.Repository;

@Repository("summarizeDao")
public class SummarizeDaoImpl extends PageDao implements SummarizeDao {

    @Override
    public void changeSummarizeScoreByUserIdAndScormId(ScormSummarize scormSummarize) {
        String sql = "UPDATE luss_scorm_summarize SET score=? WHERE user_id=? AND scorm_id=?";
        getJdbcTemplate().update(sql, scormSummarize.getScore(), scormSummarize.getUserId(), scormSummarize.getScormId());
    }
}
