package com.sls.user.dao;

import com.sls.user.entity.UserQuestion;

import java.util.List;

public interface UserQuestionDao {

    List<UserQuestion> getUserAnsWerQuestionsByAnswerUserId(int answerUserId);

    List<UserQuestion> findNoAnswerQuestions(int answerUserId, int askUserId);

    void addUserQuestion(UserQuestion userQuestion);
}
