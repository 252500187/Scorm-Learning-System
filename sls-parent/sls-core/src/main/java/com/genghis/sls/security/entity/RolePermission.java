/*
* RolePermission.java
* Created on  2014-2-22 下午12:51
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-2-22        chenl     初始版本
*
*/
package com.genghis.sls.security.entity;

/**
 * 类的描述信息
 *
 * @author chenl
 * @version 1.0.1
 */
public class RolePermission {
    private int roleId;
    private int permissionId;

    public RolePermission() {
    }

    public RolePermission(int permissionId, int roleId) {
        this.permissionId = permissionId;
        this.roleId = roleId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(int permissionId) {
        this.permissionId = permissionId;
    }
}
