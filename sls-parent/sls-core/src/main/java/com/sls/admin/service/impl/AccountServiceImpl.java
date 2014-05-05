package com.sls.admin.service.impl;

import com.sls.admin.dao.UserDao;
import com.sls.admin.entity.User;
import com.sls.admin.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> findUserByLoginName(String loginName) {
        return userDao.findUserByLoginName(loginName);
    }

    @Override
    public String getRoleAuthorityByLoginName(String loginName) {
        return userDao.findUserByLoginName(loginName).get(0).getAuthority();
    }
}
