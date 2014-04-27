package com.sls.admin.dao;

import com.sls.admin.entity.UserRole;

import java.util.List;

/**
 *
 * @author gaoxinyu
 * @version 1.0.1
 */
public interface UserRoleDao {

    int addUserRole(UserRole userRole);

    int editRoleByUserId(UserRole userRole);

    int deleteUserRoleByUserId(String userId);

    List<String> findAllRoleNamesByUserId(int userId);
}
