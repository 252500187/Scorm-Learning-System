package com.sls.user.dao.impl;

import com.core.page.dao.PageDao;
import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.user.dao.BackAnnouncementDao;
import com.sls.user.entity.BackAnnouncement;
import com.sls.user.entity.BackMessage;
import com.sls.util.DictConstant;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.stereotype.Repository;


@Repository("backAnnouncementDao")
public class BackAnnouncementDaoImpl extends PageDao implements BackAnnouncementDao {
    @Override
    public Page<BackAnnouncement> getAnnouncementPageList(PageParameter pageParameter, BackAnnouncement backAnnouncement) {
        StringBuilder sql = new StringBuilder("SELECT * FROM us_back_announcement WHERE 1=1 ");
        if (!("").equals(backAnnouncement.getDate()) ){
            sql.append(" AND date like '%").append(backAnnouncement.getDate().trim()).append("%'");
        }
        if (!("").equals(backAnnouncement.getAnnouncementTheme())) {
            sql.append(" AND announcement_theme like '%").append(backAnnouncement.getAnnouncementTheme().trim()).append("%'");
        }
        return queryForPage(pageParameter, sql.toString(), new BeanPropertySqlParameterSource(backAnnouncement), new BeanPropertyRowMapper<BackAnnouncement>(BackAnnouncement.class));

    }

    @Override
    public void addBackAnnouncement(BackAnnouncement backAnnouncement) {
        String sql = "INSERT INTO us_back_announcement(admin_id, date, announcement_theme, announcement_content, state) VALUES( :adminId,:date,:announcementTheme,:announcementContent,:state)";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(backAnnouncement));
    }

    @Override
    public void delAnnouncementById(int announcementId) {
        String sql = "DELETE FROM us_back_announcement WHERE announcement_id=?";
        getJdbcTemplate().update(sql, announcementId);
    }

    @Override
    public BackAnnouncement getAnnouncementById(int announcementId) {
        String sql = "SELECT * FROM `us_back_announcement` WHERE announcement_id = ?";
        return getJdbcTemplate().queryForObject(sql, new BeanPropertyRowMapper<BackAnnouncement>(BackAnnouncement.class), announcementId);

    }

    @Override
    public void editAnnouncement(BackAnnouncement backAnnouncement) {
        String sql = "UPDATE us_back_announcement SET admin_id=:adminId, announcement_theme=:announcementTheme,announcement_content=:announcementContent WHERE announcement_id=:announcementId ";
        getNamedParameterJdbcTemplate().update(sql, new BeanPropertySqlParameterSource(backAnnouncement));
    }

    @Override
    public void setOtherAnnouncementNoUse() {
        String sql = "UPDATE `us_back_announcement` SET state = ? ";
        getJdbcTemplate().update(sql, DictConstant.NO_USE);
    }
}
