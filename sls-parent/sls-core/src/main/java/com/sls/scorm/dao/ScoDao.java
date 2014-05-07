package com.sls.scorm.dao;

import com.sls.scorm.entity.Sco;
import com.sls.scorm.entity.ScoInfo;

import java.util.List;

public interface ScoDao {
    int addSco(Sco sco);

    void addScoInfo(ScoInfo scoInfo);

    List<Sco> findScosByScormIdAndUserId(int scormId, int userId);
}
