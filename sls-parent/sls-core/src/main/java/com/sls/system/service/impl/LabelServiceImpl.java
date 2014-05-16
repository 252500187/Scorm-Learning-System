package com.sls.system.service.impl;

import com.sls.system.dao.LabelDao;
import com.sls.system.service.DictService;
import com.sls.system.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service("tagService")
public class LabelServiceImpl implements LabelService {

    @Autowired
    private LabelDao labelDao;

    @Override
    public void getAllUserLabel(HttpServletRequest request) {
        request.setAttribute("labelList", labelDao.getAllUserLabel());
    }
}
