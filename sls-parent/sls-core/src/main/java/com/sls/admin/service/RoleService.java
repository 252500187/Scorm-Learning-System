package com.sls.admin.service;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.entity.Role;

public interface RoleService {

    Page<Role> findRolePageList(PageParameter pageParameter, Role role);

}
