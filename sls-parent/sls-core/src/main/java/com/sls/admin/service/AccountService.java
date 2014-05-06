package com.sls.admin.service;

import com.sls.admin.entity.User;

import java.util.List;

public interface AccountService {

    List<User> findUserByLoginName(String username);

    String getRoleAuthorityByLoginName(String loginName);
}
