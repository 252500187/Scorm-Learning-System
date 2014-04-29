package com.sls.admin.service;

import com.sls.admin.entity.User;

import java.util.List;

public interface AccountService {

    User findUserByLoginName(String username);

    List<String> getRolesByLoginName(String loginName);
}
