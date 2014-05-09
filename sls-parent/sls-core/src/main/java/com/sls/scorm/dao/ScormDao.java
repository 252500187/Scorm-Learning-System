package com.sls.scorm.dao;

import com.sls.scorm.entity.ScoInfo;
import com.sls.scorm.entity.Scorm;
import com.sls.scorm.entity.ScormSummarize;

import java.util.List;

public interface ScormDao {

    int addScorm(Scorm scorm);

    void addScormSummarize(ScormSummarize scormSummarize);

    void addVisitSum(int scormId);

    Scorm findScormInfoByScormId(int scormId);

    List<ScormSummarize> getAllCommentsByScormId(int scormId);

    boolean checkNotHasCollected(int scormId, int userId);

    boolean checkNotHasRegister(int scormId, int userId);
}
