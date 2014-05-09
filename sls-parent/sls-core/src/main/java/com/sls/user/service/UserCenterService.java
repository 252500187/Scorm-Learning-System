package com.sls.user.service;

import javax.servlet.http.HttpServletRequest;

public interface UserCenterService {
    void toUserCenter(HttpServletRequest request);

    void toUserInfo(HttpServletRequest request);

}
