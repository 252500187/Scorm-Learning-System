package com.sls.admin.dao;

import com.sls.admin.entity.UserRole;

import java.util.List;

public interface UserRoleDao {

    int addUserRole(UserRole userRole);

    int editRoleByUserId(UserRole userRole);

    int deleteUserRoleByUserId(String userId);
}
