/*
* UserDao.java
* Created on  2013-9-26 下午10:03
* 版本       修改时间          作者      修改内容
* V1.0.1    2013-9-26        gaoxinyu    初始版本
*
*/
package com.genghis.sls.security.dao;

import com.genghis.core.page.entity.Page;
import com.genghis.core.page.entity.PageParameter;
import com.genghis.sls.security.entity.User;

import java.util.List;

/**
 * 角色dao接口
 *
 * @author gaoxinyu
 * @version 1.0.1
 */
public interface UserDao {

    Page<User> findUserPageList(PageParameter pageParameter, User user);

    User findUserAllInfoById(int id);

    User findUserByLoginName(String loginName);

    Boolean checkRepeatLoginName(String loginName);

    Boolean checkRepeatUserName(String userName);

    int addUser(User user);

    void editUser(User user);

    int delUser(int id);

    List<String> findAllPermTokensByUserId(int userId);
}
