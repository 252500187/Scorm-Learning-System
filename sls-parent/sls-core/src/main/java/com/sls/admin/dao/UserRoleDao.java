package com.sls.admin.dao;

import com.sls.admin.entity.UserRole;

public interface UserRoleDao {

    int addUserRole(UserRole userRole);

    int editRoleByUserId(UserRole userRole);

    int deleteUserRoleByUserId(String userId);
}
