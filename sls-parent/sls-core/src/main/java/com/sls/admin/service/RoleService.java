package com.sls.admin.service;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.entity.Role;

import java.util.List;

public interface RoleService {

    Page<Role> findRolePageList(PageParameter pageParameter, Role role);

}
