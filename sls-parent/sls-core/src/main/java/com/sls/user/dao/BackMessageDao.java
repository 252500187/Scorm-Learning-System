package com.sls.user.dao;

import com.sls.user.entity.BackMessage;

import java.util.List;

public interface BackMessageDao {

    void addBackMessage(BackMessage backMessage);

    List<BackMessage> getNewMessageByUserId(int userId);

    void cancelMessageByMessageId(int messageId);
}
