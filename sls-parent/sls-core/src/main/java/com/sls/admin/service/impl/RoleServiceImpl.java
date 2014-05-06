package com.sls.admin.service.impl;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.dao.RoleDao;
import com.sls.admin.entity.Role;
import com.sls.admin.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public Page<Role> findRolePageList(PageParameter pageParameter, Role role) {
        return roleDao.findRolePageList(pageParameter, role);
    }

}
