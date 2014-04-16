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

    @Override
    public List<String> getPermTokensByLoginName(String loginName) {
        User user = userDao.findUserByLoginName(loginName);
        List<String> roleNameList = userRoleDao.findAllRoleNamesByUserId(user.getId());
        String[] roleNames = roleNameList.toArray(new String[roleNameList.size()]);
        List<String> rolePermTokens = rolePermissionDao.findAllPermTokensByAnyRoleNames(roleNames);
        Map<String, String> map = new HashMap<String, String>();
        for (String permToken : rolePermTokens) {
            map.put(permToken, permToken);
        }

        List<String> userPermTokensList = userDao.findAllPermTokensByUserId(user.getId());
        String[] userPermTokens = userPermTokensList.toArray(new String[userPermTokensList.size()]);
        for (String permToken : userPermTokens) {
            if (!map.containsKey(permToken)) {
                map.put(permToken, permToken);
            }
        }
        return new ArrayList<String>(map.keySet());
    }
}
