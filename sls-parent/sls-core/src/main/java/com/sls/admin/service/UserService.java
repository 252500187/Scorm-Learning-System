package com.sls.admin.service;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.entity.User;

/**
 * 类的描述信息
 *
 * @author chenl
 * @version 1.0.1
 */
public interface UserService {

    Page<User> findUserPageList(PageParameter pageParameter, User user);

    User findUserAllInfoById(int id);

    User findUserByLoginName(String loginName);

    Boolean checkRepeatLoginName(String loginName, String oldName);

    Boolean checkRepeatUserName(String userName, String oldName);

    void addUser(User user);

    void editUser(User user);

    void delUsers(String userIds[]);
}
