package com.genghis.sls.security.entity;

/**
 * Created with IntelliJ IDEA.
 * User: qinw
 * Date: 13-11-9
 * Time: 下午1:44
 * To change this template use File | Settings | File Templates.
 */
public class UserRole {
    private int userId;
    private int roleId;

    public UserRole() {
    }

    public UserRole(int userId, int roleId) {
        this.userId = userId;
        this.roleId = roleId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}
