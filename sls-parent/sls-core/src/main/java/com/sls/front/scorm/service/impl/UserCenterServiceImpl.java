package com.sls.front.scorm.service.impl;

import com.sls.front.scorm.service.UserCenterService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

@Transactional
@Service("userCenterService")
public class UserCenterServiceImpl implements UserCenterService {
    @Override
    public void toUserCenter(HttpServletRequest request) {
         //todo 传递个人中心需要的数据
    }
}
