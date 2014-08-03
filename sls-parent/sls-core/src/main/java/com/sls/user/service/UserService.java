package com.sls.user.service;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.entity.PublicDiscusses;
import com.sls.scorm.entity.ScormSummarize;
import com.sls.user.entity.BackMessage;
import com.sls.user.entity.User;
import com.sls.user.entity.UserQuestion;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public interface UserService {

    Page<User> listUserPageList(PageParameter pageParameter, User user);

    User getUserAllInfoById(int id);

    List<User> getUserByLoginName(String loginName);

    Boolean checkRepeatLoginName(String loginName, String oldName);

    Boolean checkRepeatUserName(String userName, String oldName);

    void addUser(User user);

    void editUser(HttpSession session, HttpServletRequest request, User user);

    void upHeadImg(HttpSession session, HttpServletRequest request, String upImg) throws ServletException, IOException;

    boolean checkRepeatLoginName(String loginName);

    void shieldUser(int userId);

    void getUserNextLevelNameByScore(HttpServletRequest request);

    void getPieCharts(HttpServletRequest request);

    Page<ScormSummarize> getDiscussPageList(PageParameter pageParameter, ScormSummarize scormSummarize);

    void shieldDiscuss(int userId, int scormId);

    void adminIndexStatisticInfo(HttpServletRequest request);

    void getUserOperate(int userInfoId, HttpServletRequest request);

    void userAttentionDeal(int userAttentionId);

    void clearAllNewMessage(int attentionUserId, HttpSession session);

    List<UserQuestion> getUserAnsWerQuestionsByUserId(int userId);

    Boolean addUserQuestion(int answerUserId, String questionDescribe);

    List<User> getNumRecommendUsers(int num);

    void sendUserMessage(BackMessage backMessage);

    void sendMessage(String content, String userIds);

    void cancelMessageByMessageId(int messageId);

    Page<BackMessage> getMessagePageList(PageParameter pageParameter, BackMessage backMessage);

    List<User> getAllInUseUsers();

    void delMessage(int messageId);

    BackMessage getMessageInfo(int messageId);

    void transMessage(int messageId, String userIds);

    void changePassword(String password);

    boolean checkOldPassword(String password);

    void sendDiscuss(PublicDiscusses publicDiscusses);

    List<PublicDiscusses> getPublicDiscusses(PublicDiscusses publicDiscusses);

    Page<PublicDiscusses> listAllPublicDiscuss(PageParameter pageParameter, PublicDiscusses publicDiscusses);

    void delDiscuss(int discussId);
}
