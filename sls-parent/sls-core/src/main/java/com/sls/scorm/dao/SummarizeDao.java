package com.sls.scorm.dao;

import com.sls.scorm.entity.ScormSummarize;

import java.util.List;

public interface SummarizeDao {

    void addScormSummarize(ScormSummarize scormSummarize);

    boolean isCompleteScorm(int scormId, int userId);

    void changeSummarizeScoreByUserIdAndScormId(ScormSummarize scormSummarize);

    void changeCompleteInfoByScormIdAndUserId(ScormSummarize scormSummarize);

    ScormSummarize findScormSummarizeByUserIdAndScormId(int userId, int scormId);

    List<ScormSummarize> getAllCommentsByScormId(int scormId);

    void discussScorm(ScormSummarize scormSummarize);
}
