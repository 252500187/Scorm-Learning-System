package com.sls.scorm.dao;

import com.sls.scorm.entity.ScormSummarize;

public interface SummarizeDao {
    void changeSummarizeScoreByUserIdAndScormId(ScormSummarize scormSummarize);
}
