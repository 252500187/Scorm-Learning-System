package com.sls.system.service;

import javax.servlet.http.HttpServletRequest;

public interface LabelService {
    void getAllUserLabel(HttpServletRequest request);

    void editMyLabelList(String myLabelList);

    void getLabelsByUserId(HttpServletRequest request);
}
