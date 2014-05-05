package com.sls.admin.service.impl;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.dao.UserDao;
import com.sls.admin.dao.UserRoleDao;
import com.sls.admin.entity.User;
import com.sls.admin.entity.UserRole;
import com.sls.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRoleDao userRoleDao;

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
        int id = userDao.addUser(user);
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