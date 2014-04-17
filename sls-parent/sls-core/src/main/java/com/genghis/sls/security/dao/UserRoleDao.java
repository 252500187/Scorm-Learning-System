package com.genghis.sls.security.dao;

import com.genghis.sls.security.entity.UserRole;

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
