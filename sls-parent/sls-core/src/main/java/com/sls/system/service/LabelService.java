package com.sls.system.service;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.system.entity.Label;

import javax.servlet.http.HttpServletRequest;

public interface LabelService {
    void getAllUserLabel(HttpServletRequest request);

    void editUserLabelList(String myLabelList);

    void getLabelsByUserId(HttpServletRequest request);

    void getAllLabel(HttpServletRequest request);

    void editScormLabelList(String scormLabelList,int scormId);

    Page<Label> getAllLabelPageList(PageParameter pageParameter, Label label);
}
