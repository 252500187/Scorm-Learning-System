package com.sls.user.dao.impl;

import com.core.page.dao.PageDao;
import com.sls.user.dao.UserQuestionDao;
import com.sls.user.entity.UserQuestion;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userQuestionDao")
public class UserQuestionDaoImpl extends PageDao implements UserQuestionDao {

    @Override
    public List<UserQuestion> getUserAnsWerQuestionsByAnswerUserId(int answerUserId) {
        String sql = "SELECT * FROM us_user_question WHERE answer_user_id=? AND answer_content!=''";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<UserQuestion>(UserQuestion.class), answerUserId);
    }

    @Override
    public List<UserQuestion> findNoAnswerQuestions(int answerUserId, int askUserId) {
        String sql = "SELECT * FROM us_user_question WHERE answer_user_id=? AND ask_user_id=? AND answer_content=''";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<UserQuestion>(UserQuestion.class), answerUserId, askUserId);
    }

    @Override
    public void addUserQuestion(UserQuestion userQuestion) {
        String sql = "INSERT INTO us_user_question(question_id, answer_user_id, ask_user_id,ask_date,ask_content,answer_content,new_ask,new_answer) VALUES(:questionId, :answerUserId, :askUserId,:askDate,:askContent,:answerContent,:newAsk,:newAnswer)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(userQuestion));
    }
}
