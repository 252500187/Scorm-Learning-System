package com.sls.scorm.dao;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.entity.Scorm;

import java.util.List;

public interface ScormDao {

    int addScorm(Scorm scorm);

    void addVisitSum(int scormId);

    Scorm findScormInfoByScormId(int scormId);

    boolean checkNotHasRegister(int scormId, int userId);

    void changeTotalTimeByScormId(int scormId, String totalTime);

    Page<Scorm> listNotAuditScormPageList(PageParameter pageParameter, Scorm scorm);

    Page<Scorm> listAuditScormPageList(PageParameter pageParameter, Scorm scorm);

    void changeScormInUse(int scormId, int isUse);

    void changeScormRecommend(int scormId, int recommend);

    void changScormCompleteWayByScormId(int scormId, int completeWay);

    void updateScormScoreByScormId(int scormId);

    List<Scorm> getAllRegisterScormInfoByUserId(int userId);

    List<Scorm> getAllCollectScormInfoByUserId(int userId);

    List<Scorm> getAllUpScormInfoByUserId(int userId);

    List<Scorm> indexFindTopScormByFieldName(String fieldName, int num);

    List<Scorm> findRecommendScormByUserLabel(int userId);

    List<Scorm> findRegisterScormByUserId(int userId);

    List<Scorm> queryScormByFieldName(String info, String fieldName);

    List<Scorm> queryScormByLabelName(String info);

    String findCompleteRateByScormId(int scormId);

    List<Scorm> findLatestScorms(int i);
}
