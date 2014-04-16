package com.genghis.ptas.security.service;

import com.genghis.core.page.entity.Page;
import com.genghis.core.page.entity.PageParameter;
import com.genghis.ptas.security.entity.User;

import java.util.List;

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
