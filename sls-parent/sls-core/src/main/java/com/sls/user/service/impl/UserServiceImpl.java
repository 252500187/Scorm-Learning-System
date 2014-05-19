package com.sls.user.service.impl;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.system.service.DictService;
import com.sls.user.dao.RoleDao;
import com.sls.user.dao.UserDao;
import com.sls.user.dao.UserRoleDao;
import com.sls.user.entity.Role;
import com.sls.user.entity.User;
import com.sls.user.entity.UserLevel;
import com.sls.user.entity.UserRole;
import com.sls.user.service.UserService;
import com.sls.util.DateUtil;
import com.sls.util.DictConstant;
import com.sls.util.FileUp;
import com.sls.util.LoginUserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRoleDao userRoleDao;

    @Autowired
    private DictService dictService;

    @Override
    public Page<User> findUserPageList(PageParameter pageParameter, User user) {
        Page<User> userPage = userDao.findUserPageList(pageParameter, user);
        for (User user1 : userPage.getResultList()) {
            user1.setShowInUse(dictService.changeDictCodeToValue(user1.getInUse(), DictConstant.STATE));
            user1.setUpLoadScormNum(userDao.findUploadScormNumByUserId(user1.getUserId()));
        }
        return userPage;
    }

    @Override
    public User findUserAllInfoById(int id) {
        User user = userDao.findUserAllInfoById(id);
        return user;
    }

    @Override
    public List<User> findUserByLoginName(String loginName) {
        return userDao.findInUseUserByLoginName(loginName);
    }

    @Override
    public Boolean checkRepeatLoginName(String loginName, String oldName) {
        Boolean hasLoginName = userDao.checkRepeatLoginName(loginName);
        return !(hasLoginName && !oldName.equals(loginName));
    }

    @Override
    public Boolean checkRepeatUserName(String userName, String oldName) {
        Boolean hasLoginName = userDao.checkRepeatUserName(userName);
        return !(hasLoginName && !oldName.equals(userName));
    }

    @Override
    public void addUser(User user) {
        user.setInUse(DictConstant.IN_USE);
        user.setRoleId(roleDao.findRoleByAuthority(DictConstant.ROLE_AUTHORITY_USER).getRoleId());
        user.setRegisterDate(DateUtil.getCurrentTimestamp().toString().substring(0, 16));
        user.setUserName("懒人");
        user.setScore(DictConstant.SCORE_0);
        int id = userDao.addUser(user);
        user.setUserId(id);
        user.setImgUrl(DictConstant.DEFAULT_USER_PHOTO);
        userDao.addUserInfo(user);
        UserRole userRole = new UserRole();
        userRole.setRoleId(user.getRoleId());
        userRole.setUserId(id);
        userRoleDao.addUserRole(userRole);
    }

    @Override
    public void editUser(User user) {
        userDao.editUser(user);
    }

    @Override
    public void delUsers(String userIds[]) {
        for (String userId : userIds) {
            userDao.delUser(Integer.parseInt(userId));
            userRoleDao.deleteUserRoleByUserId(userId);
        }
    }

    @Override
    public void upHeadImg(HttpServletRequest request, String upImg) throws ServletException, IOException {
        FileUp fileUp = new FileUp();
        User user = new User();
        int userId = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        user.setUserId(userId);
        user.setImgUrl(fileUp.upImg(request, DictConstant.USER_PHOTO_NAME, "", userId + DictConstant.PHOTO_FORM, upImg));
        request.setAttribute("photoUrl", user.getImgUrl());
        userDao.upUserPhoto(user);
    }

    @Override
    public boolean checkRepeatLoginName(String loginName) {
        return !userDao.checkRepeatLoginName(loginName);
    }

    @Override
    public void shieldUser(int userId) {
        User user = userDao.findUserAllInfoById(userId);
        if (user.getInUse() == DictConstant.NO_USE) {
            user.setInUse(DictConstant.IN_USE);
        } else {
            user.setInUse(DictConstant.NO_USE);
        }
        userDao.editUseState(user);
    }

    @Override
    public void findUserNextLevelNameByScore(HttpServletRequest request) {
        User user = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName()).get(0);
        UserLevel nextUserLevel = userDao.findUserNextLevelNameByScore(user.getScore());
        user.setLevelName(nextUserLevel.getLevelName());
        request.setAttribute("user", user);
        request.setAttribute("nextLevelScore",Integer.parseInt(nextUserLevel.getScore()));
        UserLevel nowUserLevel = userDao.findUserLevelNameByScore(user.getScore());
        request.setAttribute("nowLevelScore",Integer.parseInt(nowUserLevel.getScore()));
    }
}