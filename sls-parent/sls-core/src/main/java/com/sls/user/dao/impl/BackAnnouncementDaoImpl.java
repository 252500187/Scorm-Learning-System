package com.sls.user.dao.impl;

import com.core.page.dao.PageDao;
import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.user.dao.BackAnnouncementDao;
import com.sls.user.entity.BackAnnouncement;
import com.sls.user.entity.BackMessage;
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
}
