package com.sls.user.service;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.user.entity.User;

import java.util.List;

public interface UserService {

    Page<User> findUserPageList(PageParameter pageParameter, User user);

    User findUserAllInfoById(int id);

    List<User> findUserByLoginName(String loginName);

    Boolean checkRepeatLoginName(String loginName, String oldName);

    Boolean checkRepeatUserName(String userName, String oldName);

    void addUser(User user);

    void editUser(User user);

    void delUsers(String userIds[]);
}
