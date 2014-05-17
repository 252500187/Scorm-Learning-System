package com.sls.system.service;

import javax.servlet.http.HttpServletRequest;

public interface LabelService {
    void getAllUserLabel(HttpServletRequest request);

    void editUserLabelList(String myLabelList);

    void getLabelsByUserId(HttpServletRequest request);

    void getAllLabel(HttpServletRequest request);

    void editScormLabelList(String scormLabelList,int scormId);
}
