package com.sls.user.dao;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.user.entity.BackAnnouncement;

import java.util.List;
public interface BackAnnouncementDao {
    Page<BackAnnouncement> getAnnouncementPageList(PageParameter pageParameter, BackAnnouncement backAnnouncement);

    void addBackAnnouncement(BackAnnouncement backAnnouncement);
}
