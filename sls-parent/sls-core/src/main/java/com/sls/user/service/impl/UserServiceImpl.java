package com.sls.user.service.impl;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.system.service.DictService;
import com.sls.user.dao.RoleDao;
import com.sls.user.dao.UserDao;
import com.sls.user.dao.UserRoleDao;
import com.sls.user.entity.Role;
import com.sls.user.entity.User;
import com.sls.user.entity.UserRole;
import com.sls.user.service.UserService;
import com.sls.util.DateUtil;
import com.sls.util.DictConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        return userDao.findUserPageList(pageParameter, user);
    }

    @Override
    public User findUserAllInfoById(int id) {
        User user = userDao.findUserAllInfoById(id);
        return user;
    }

    @Override
    public List<User> findUserByLoginName(String loginName) {
        return userDao.findUserByLoginName(loginName);
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
        roleDao.findRoleByAuthority(DictConstant.ROLE_AUTHORITY_USER);
        user.setRoleId(roleDao.findRoleByAuthority(DictConstant.ROLE_AUTHORITY_USER).getRoleId());
        user.setRegisterDate(DateUtil.getCurrentTimestamp().toString().substring(0, 16));
        user.setScore(DictConstant.SCORE_0);
        user.setLevelName(userDao.findUserLevelNameByScore(user.getScore()).getLevelName());

        int id = userDao.addUser(user);
        user.setUserId(id);
        userDao.addUserInfo(user);
        UserRole userRole = new UserRole();
        userRole.setRoleId(user.getRoleId());
        userRole.setUserId(id);
        userRoleDao.addUserRole(userRole);
    }

    @Override
    public void editUser(User user) {
        UserRole userRole = new UserRole();
        userRole.setRoleId(user.getRoleId());
        userRole.setUserId(user.getUserId());
        userRoleDao.editRoleByUserId(userRole);
        userDao.editUser(user);
    }

    @Override
    public void delUsers(String userIds[]) {
        for (String userId : userIds) {
            userDao.delUser(Integer.parseInt(userId));
            userRoleDao.deleteUserRoleByUserId(userId);
        }
    }
}