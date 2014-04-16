package com.genghis.ptas.security.dao;

import com.genghis.ptas.security.entity.UserRole;

import java.util.List;

/**
 *
 * @author gaoxinyu
 * @version 1.0.1
 */
public interface UserRoleDao {
    int createUserRole(String[] usernames, String roleName);

    int addUserRole(UserRole userRole);

    int editRoleByUserId(UserRole userRole);

    int deleteUserRoleByUserId(String userId);

    int deleteUserRoleByRoleId(String roleId);

    List<String> findAllRoleNamesByUserId(int userId);

    UserRole findUserRoleByUserId (String userId);
}
