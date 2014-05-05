package com.sls.admin.dao;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.entity.Role;

import java.util.List;

public interface RoleDao {

    Page<Role> findRolePageList(PageParameter pageParameter, Role role);

    Role findRoleByAuthority(String authority);
}
