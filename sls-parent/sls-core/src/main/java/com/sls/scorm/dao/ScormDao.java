package com.sls.scorm.dao;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.entity.ScoInfo;
import com.sls.scorm.entity.Scorm;
import com.sls.scorm.entity.ScormSummarize;
import com.sls.scorm.entity.StudyNote;

import java.util.List;

public interface ScormDao {

    int addScorm(Scorm scorm);

    void addScormSummarize(ScormSummarize scormSummarize);

    void addVisitSum(int scormId);

    Scorm findScormInfoByScormId(int scormId);

    List<ScormSummarize> getAllCommentsByScormId(int scormId);

    boolean checkNotHasCollected(int scormId, int userId);

    boolean checkNotHasRegister(int scormId, int userId);

    void addCollectScorm(Scorm scorm);

    List<Scorm> findCollectScormByScormIdAndUserId(int scormId, int userId);

    int addStudyNote(StudyNote studyNote);

    List<StudyNote> getAllStudyNotesByScormIdAndUserId(StudyNote studyNote);

    void changeTotalTimeByScormId(int scormId, String totalTime);

    Page<Scorm> listNotAuditScormPageList(PageParameter pageParameter, Scorm scorm);

    Page<Scorm> listAuditScormPageList(PageParameter pageParameter, Scorm scorm);

    void changeScormInUse(int scormId, int isUse);

    void changeScormRecommend(int scormId, int recommend);

    ScormSummarize findScormSummarizeByUserIdAndScormId(int userId, int scormId);

    void changeCompleteInfoByScormIdAndUserId(ScormSummarize scormSummarize);

    boolean getCompleteInfo(int scormId, int userId);

    void changScormCompleteWayByScormId(int scormId, int completeWay);
}
