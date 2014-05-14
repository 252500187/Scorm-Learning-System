package com.sls.system.service.impl;

import com.sls.system.dao.TagDao;
import com.sls.system.service.DictService;
import com.sls.system.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("tagService")
public class TagServiceImpl implements TagService {

    @Autowired
    private TagDao tagDao;

    @Autowired
    private DictService dictService;
}
