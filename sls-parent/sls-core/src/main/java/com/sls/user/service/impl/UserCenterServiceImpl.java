package com.sls.user.service.impl;

import com.sls.scorm.dao.ScormDao;
import com.sls.scorm.entity.Scorm;
import com.sls.system.service.DictService;
import com.sls.user.dao.UserDao;
import com.sls.user.entity.User;
import com.sls.user.service.UserCenterService;
import com.sls.util.DictConstant;
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

    @Autowired
    private ScormDao scormDao;

    @Autowired
    private DictService dictService;

    @Override
    public void toUserCenter(HttpServletRequest request) {
        List<User> userList = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName());
        User user = userList.get(0);
        user.setLevelName(userDao.findUserLevelNameByScore(user.getScore()).getLevelName());
        request.setAttribute("user", user);
    }

    @Override
    public void toUserInfo(HttpServletRequest request) {
        List<User> userList = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName());
        User user = userList.get(0);
        user.setLevelName(userDao.findUserLevelNameByScore(user.getScore()).getLevelName());
        request.setAttribute("user", user);

    }

    @Override
    public void getAllRegisterScormInfo(HttpServletRequest request) {
        List<User> userList = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName());
        User user = userList.get(0);
        List<Scorm> scormList = scormDao.getAllRegisterScormInfoByUserId(user.getUserId());
//        todo
//        for(Scorm oneScorm : scormList) {
//            oneScorm.setCompleteDate(oneScorm.getCompleteDate().substring(0,9));
//        }
        request.setAttribute("allScorm", scormList);
    }

    @Override
    public void getAllCollectScormInfo(HttpServletRequest request) {
        List<User> userList = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName());
        User user = userList.get(0);
        List<Scorm> scormList = scormDao.getAllCollectScormInfoByUserId(user.getUserId());
        request.setAttribute("allScorm", scormList);
    }

    @Override
    public void cancelCollect(String scormId) {
        List<User> userList = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName());
        User user = userList.get(0);
        userDao.cancelCollectByUserIdAndScormId(user.getUserId(),scormId);
    }

    @Override
    public void getAllUpScormInfo(HttpServletRequest request) {
        List<User> userList = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName());
        User user = userList.get(0);
        List<Scorm> scormList = scormDao.getAllUpScormInfoByUserId(user.getUserId());

        for(Scorm oneScorm : scormList) {
            oneScorm.setShowInUse(dictService.changeDictCodeToValue(oneScorm.getInUse(),DictConstant.SCORM_STATE));
        }
        request.setAttribute("allScorm", scormList);
    }
}
