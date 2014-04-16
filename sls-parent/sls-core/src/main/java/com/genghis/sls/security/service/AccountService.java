package com.genghis.sls.security.service;

import com.genghis.sls.security.entity.User;

import java.util.List;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
public interface AccountService {

    User findUserByLoginName(String username);

    List<String> getRolesByLoginName(String loginName);

    List<String> getPermTokensByLoginName(String loginName);
}
