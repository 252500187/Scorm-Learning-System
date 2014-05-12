package com.sls.scorm.service;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.entity.Scorm;

public interface StatisticsService {

    Page<Scorm> findScormPageList(PageParameter pageParameter, Scorm scorm);
}
