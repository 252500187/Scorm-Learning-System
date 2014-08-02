package com.sls.scorm.dao;

import com.sls.scorm.entity.PublicDiscusses;

import java.util.List;

public interface PublicDiscussesDao {

    void addPublicDiscusses(PublicDiscusses publicDiscusses);

    List<PublicDiscusses> getInlineDiscussesByPublicIdAndTime(String lastTime, int publicId, int userId);
}
