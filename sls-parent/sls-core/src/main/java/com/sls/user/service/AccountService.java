package com.sls.user.service;

import com.sls.user.entity.User;

import java.util.List;

public interface AccountService {

    List<User> findUserByLoginName(String username);

    String getRoleAuthorityByLoginName(String loginName);
}
