package com.sls.user.service.impl;

import com.sls.scorm.dao.ScormDao;
import com.sls.scorm.entity.Scorm;
import com.sls.system.service.DictService;
import com.sls.user.dao.UserDao;
import com.sls.user.dao.UserQuestionDao;
import com.sls.user.entity.User;
import com.sls.user.entity.UserQuestion;
import com.sls.user.service.UserCenterService;
import com.sls.util.DictConstant;
import com.sls.util.LoginUserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Transactional
@Service("userCenterService")
public class UserCenterServiceImpl implements UserCenterService {
    @Autowired
    private UserDao userDao;

    @Autowired
    private ScormDao scormDao;

    @Autowired
    private DictService dictService;

    @Autowired
    private UserQuestionDao userQuestionDao;

    @Override
    public void toUserCenter(HttpServletRequest request) {
        User user = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName()).get(0);
        user.setLevelName(userDao.findUserLevelNameByScore(user.getScore()).getLevelName());
        request.setAttribute("user", user);
    }

    @Override
    public void selectModule(HttpServletRequest request, int module) {
        String centerUrl = new String();
        switch (module) {
            case 1:
                centerUrl = "user/center/userCenterInfo";
                break;
            case 2:
                centerUrl = "user/center/userInfoDo";
                break;
            case 3:
                centerUrl = "user/center/registerScormDo";
                break;
            case 4:
                centerUrl = "user/center/collectScormDo";
                break;
            case 5:
                centerUrl = "user/center/myUpScormsDo";
                break;
            case 6:
                centerUrl = "user/center/upScormDo";
                break;
            case 7:
                centerUrl = "user/center/evaluateScormDo";
                break;
            case 8:
                centerUrl = "user/center/userAttentionDo";
                break;
            case 9:
                centerUrl = "user/center/askQuestionsDo";
                break;
            case 10:
                centerUrl = "user/center/askUserQuestionsDo";
                break;
            case 11:
                centerUrl = "user/center/addNote";
                break;
            case 12:
                centerUrl = "user/center/scormNotesDo";
        }
        request.setAttribute("centerUrl", centerUrl);
    }

    @Override
    public void toUserInfo(HttpServletRequest request) {
        User user = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName()).get(0);
        user.setLevelName(userDao.findUserLevelNameByScore(user.getScore()).getLevelName());
        request.setAttribute("user", user);
    }

    @Override
    public void getAllRegisterScormInfo(HttpServletRequest request) {
        int userId = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        List<Scorm> scormList = scormDao.getAllRegisterScormInfoByUserId(userId);
        request.setAttribute("allScorm", scormList);
    }

    @Override
    public void getAllCollectScormInfo(HttpServletRequest request) {
        int userId = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        List<Scorm> scormList = scormDao.getAllCollectScormInfoByUserId(userId);
        request.setAttribute("allScorm", scormList);
    }

    @Override
    public void getAllUpScormInfo(HttpServletRequest request) {
        int userId = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        List<Scorm> scormList = scormDao.getAllUpScormInfoByUserId(userId);
        for (Scorm oneScorm : scormList) {
            oneScorm.setShowInUse(dictService.changeDictCodeToValue(oneScorm.getInUse(), DictConstant.SCORM_STATE));
        }
        request.setAttribute("allScorm", scormList);
    }

    @Override
    public void getAskQuestions(HttpServletRequest request) {
        int userId = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        request.setAttribute("questions", userQuestionDao.getAskQuestionsByAskUserId(userId));
    }

    @Override
    public void getUserQuestions(HttpServletRequest request) {
        int userId = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        request.setAttribute("questions", userQuestionDao.getUserQuestionsByAskUserId(userId));
    }

    @Override
    public void getQuestionInfoAsk(HttpServletRequest request, HttpSession session, int questionId) {
        UserQuestion userQuestion = userQuestionDao.getQuestionInfoByQuestionId(questionId);
        User user = userDao.findUserAllInfoById(userQuestion.getAnswerUserId());
        userQuestion.setUserName(user.getUserName());
        request.setAttribute("question", userQuestion);
        //todo 下面这句有bug
        //取消新的回答及更新新的回答数目
        userQuestionDao.cancelNewAnswerByQuestionId(questionId);
        session.setAttribute("answerNum", userQuestionDao.getNewAnswerNumByUserId(userQuestion.getAskUserId()));
    }

    @Override
    public void changeQuestionAskContent(UserQuestion userQuestion) {
        int userId = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        UserQuestion oldUserQuestion = userQuestionDao.getQuestionInfoByQuestionId(userQuestion.getQuestionId());
        if (oldUserQuestion.getAskUserId() == userId) {
            userQuestionDao.changeQuestionAskContentByQuestionId(userQuestion);
            userQuestionDao.setNewAskByQuestionId(userQuestion.getQuestionId());
        }
    }

    @Override
    public void getQuestionInfoAnswer(HttpServletRequest request, HttpSession session, int questionId) {
        UserQuestion userQuestion = userQuestionDao.getQuestionInfoByQuestionId(questionId);
        User user = userDao.findUserAllInfoById(userQuestion.getAskUserId());
        userQuestion.setUserName(user.getUserName());
        request.setAttribute("question", userQuestion);
        //todo 下面这句有bug
        //取消新的提问及更新新的提问数目
        userQuestionDao.cancelNewAskByQuestionId(questionId);
        session.setAttribute("questionNum", userQuestionDao.getNewQuestionNumByUserId(userQuestion.getAnswerUserId()));
    }

    @Override
    public void changeQuestionAnswerContent(UserQuestion userQuestion) {
        int userId = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
        UserQuestion oldUserQuestion = userQuestionDao.getQuestionInfoByQuestionId(userQuestion.getQuestionId());
        if (oldUserQuestion.getAnswerUserId() == userId) {
            userQuestionDao.changeQuestionAnswerContentByQuestionId(userQuestion);
            userQuestionDao.setNewAnswerByQuestionId(userQuestion.getQuestionId());
        }
    }
}
