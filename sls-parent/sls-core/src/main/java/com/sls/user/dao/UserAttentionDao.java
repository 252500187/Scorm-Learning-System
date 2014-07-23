package com.sls.user.dao;

import com.sls.user.entity.UserAttention;

import java.util.List;

public interface UserAttentionDao {

    List<UserAttention> findAttention(int userId, int userAttentionId);

    void addUserAttention(UserAttention userAttention);

    void delUserAttention(UserAttention userAttention);
}
