package com.sls.scorm.service.impl;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.dao.StatisticsDao;
import com.sls.scorm.entity.Scorm;
import com.sls.scorm.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("statisticsService")
public class StatisticsServiceImpl implements StatisticsService {
    @Autowired
    private StatisticsDao statisticsDao;

    @Override
    public Page<Scorm> findScormPageList(PageParameter pageParameter, Scorm scorm) {
        return statisticsDao.findScormPageList(pageParameter, scorm);
    }
}
