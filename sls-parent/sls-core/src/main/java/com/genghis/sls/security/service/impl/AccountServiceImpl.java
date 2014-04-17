package com.genghis.sls.security.service.impl;

import com.genghis.sls.security.dao.RolePermissionDao;
import com.genghis.sls.security.dao.UserDao;
import com.genghis.sls.security.dao.UserRoleDao;
import com.genghis.sls.security.entity.User;
import com.genghis.sls.security.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
