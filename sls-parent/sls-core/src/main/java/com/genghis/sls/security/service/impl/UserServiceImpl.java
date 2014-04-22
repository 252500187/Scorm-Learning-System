/*
* UserManager.java
* Created on  2013-10-21 上午7:44
* 版本       修改时间          作者      修改内容
* V1.0.1    2013-10-21       gaoxinyu    初始版本
*
*/
package com.genghis.sls.security.service.impl;

import com.genghis.core.page.entity.Page;
import com.genghis.core.page.entity.PageParameter;
import com.genghis.sls.constant.DictConstant;
import com.genghis.sls.security.dao.UserDao;
import com.genghis.sls.security.dao.UserRoleDao;
import com.genghis.sls.security.entity.User;
import com.genghis.sls.security.entity.UserRole;
import com.genghis.sls.security.service.UserService;
import com.genghis.sls.system.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private DictService dictService;

    @Autowired
    private UserRoleDao userRoleDao;

    @Override
    public Page<User> findUserPageList(PageParameter pageParameter, User user) {
        Page<User> users = userDao.findUserPageList(pageParameter, user);
        return users;
    }

    @Override
    public User findUserAllInfoById(int id) {
        User user = userDao.findUserAllInfoById(id);
        return user;
    }

    @Override
    public User findUserByLoginName(String loginName) {
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
        userRole.setUserId(user.getId());
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