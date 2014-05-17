package com.sls.user.dao;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.entity.Scorm;
import com.sls.user.entity.User;
import com.sls.user.entity.UserLevel;

import java.util.List;

public interface UserDao {

    Page<User> findUserPageList(PageParameter pageParameter, User user);

    User findUserAllInfoById(int id);

    List<User> findInUseUserByLoginName(String loginName);

    Boolean checkRepeatLoginName(String loginName);

    Boolean checkRepeatUserName(String userName);

    int addUser(User user);

    void editUser(User user);

    void upUserPhoto(User user);

    int delUser(int id);

    void addUserInfo(User user);

    UserLevel findUserLevelNameByScore(int score);

    int findUploadScormNumByUserId(int userId);

    void editUseState(User user);
}
