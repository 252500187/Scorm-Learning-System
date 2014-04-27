package com.sls.admin.service.impl;

import com.sls.admin.dao.RolePermissionDao;
import com.sls.admin.dao.UserDao;
import com.sls.admin.dao.UserRoleDao;
import com.sls.admin.entity.User;
import com.sls.admin.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRoleDao userRoleDao;

    @Autowired
    private RolePermissionDao rolePermissionDao;

    @Override
    public User findUserByLoginName(String username) {
        return userDao.findUserByLoginName(username);
    }

    @Override
    public List<String> getRolesByLoginName(String loginName) {
        User user = userDao.findUserByLoginName(loginName);
        return userRoleDao.findAllRoleNamesByUserId(user.getId());
    }
}
