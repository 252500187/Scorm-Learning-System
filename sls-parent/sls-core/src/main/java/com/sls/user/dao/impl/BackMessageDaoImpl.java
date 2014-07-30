package com.sls.user.dao.impl;

import com.core.page.dao.PageDao;
import com.sls.user.dao.BackMessageDao;
import com.sls.user.entity.BackMessage;
import com.sls.util.DictConstant;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("backMessageDao")
public class BackMessageDaoImpl extends PageDao implements BackMessageDao {

    @Override
    public void addBackMessage(BackMessage backMessage) {
        String sql = "INSERT INTO us_back_message(message_id, admin_id, user_id,content,state) VALUES(:messageId, :adminId, :userId,:content,:state)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(backMessage));
    }

    @Override
    public List<BackMessage> getNewMessageByUserId(int userId) {
        String sql = "SELECT * FROM us_back_message WHERE user_id=? AND state=?";
        return getJdbcTemplate().query(sql, new BeanPropertyRowMapper<BackMessage>(BackMessage.class), userId, DictConstant.IN_USE);
    }

    @Override
    public void cancelMessageByMessageId(int messageId) {
        String sql = "UPDATE us_back_message SET state=? WHERE message_id=?";
        getJdbcTemplate().update(sql, DictConstant.NO_USE, messageId);
    }
}
