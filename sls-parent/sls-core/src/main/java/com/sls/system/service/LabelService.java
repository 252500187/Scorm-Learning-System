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

    boolean checkRepeatLabelName(String labelName, String oldLabelName);

    void addLabel(Label label);

    void findLabelById(String labelId, HttpServletRequest request);

    void editLabel(Label label);

    void delLabel(String labelId);
}
