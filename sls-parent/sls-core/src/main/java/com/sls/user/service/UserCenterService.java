package com.sls.user.service;

import javax.servlet.http.HttpServletRequest;

public interface UserCenterService {
    void toUserCenter(HttpServletRequest request);

    void toUserInfo(HttpServletRequest request);

    void getAllRegisterScormInfo(HttpServletRequest request);

    void getAllCollectScormInfo(HttpServletRequest request);

    void cancelCollect(String scormId);

    void getAllUpScormInfo(HttpServletRequest request);
}
