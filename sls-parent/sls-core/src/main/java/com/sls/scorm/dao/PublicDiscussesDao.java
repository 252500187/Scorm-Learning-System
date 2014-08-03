package com.sls.scorm.dao;

import com.sls.scorm.entity.PublicDiscusses;

import java.util.List;

public interface PublicDiscussesDao {

    void addPublicDiscusses(PublicDiscusses publicDiscusses);

    List<PublicDiscusses> getInlineDiscussesByPublicIdAndDiscussId(PublicDiscusses publicDiscusses);

    List<PublicDiscusses> getPublicDiscussesByPublicIdAndNowTime(int publicId, String nowTime);
}
