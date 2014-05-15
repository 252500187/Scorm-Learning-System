package com.sls.user.service.impl;

import com.sls.scorm.entity.Scorm;
import com.sls.user.dao.UserDao;
import com.sls.user.entity.User;
import com.sls.user.service.UserCenterService;
import com.sls.util.LoginUserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Transactional
@Service("userCenterService")
public class UserCenterServiceImpl implements UserCenterService {
    @Autowired
    private UserDao userDao;

    @Override
    public void toUserCenter(HttpServletRequest request) {
        List<User> userList = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName());
        User user = userList.get(0);
        user.setLevelName(userDao.findUserLevelNameByScore(user.getScore()).getLevelName());
        request.setAttribute("user",user);
    }

    @Override
    public void toUserInfo(HttpServletRequest request) {
        List<User> userList = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName());
        User user = userList.get(0);
        user.setLevelName(userDao.findUserLevelNameByScore(user.getScore()).getLevelName());
        request.setAttribute("user",user);

    }

    @Override
    public void getAllRegisterScormInfo(HttpServletRequest request) {
        List<User> userList = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName());
        User user = userList.get(0);
        List<Scorm> scormList = userDao.getAllRegisterScormInfoByUserId(user.getUserId());
        request.setAttribute("allScorm",scormList);
    }
}
