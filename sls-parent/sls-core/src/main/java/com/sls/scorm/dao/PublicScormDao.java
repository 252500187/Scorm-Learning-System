package com.sls.scorm.dao;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.scorm.entity.PublicScorm;

public interface PublicScormDao {

    Page<PublicScorm> listAllPublicScormPageList(PageParameter pageParameter, PublicScorm publicScorm);

    void delPublicScormByPublicId(int publicId);
}
