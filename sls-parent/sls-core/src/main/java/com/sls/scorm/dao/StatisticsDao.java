package com.sls.scorm.dao;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.entity.Scorm;

public interface StatisticsDao {
    Page<Scorm> findScormPageList(PageParameter pageParameter, Scorm scorm);
}
