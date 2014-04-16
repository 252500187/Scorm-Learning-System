/*
* UserPermission.java
* Created on  2014-3-14 上午9:40
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-3-14        chenl     初始版本
*
*/
package com.genghis.sls.security.entity;

/**
 * 类的描述信息
 *
 * @author chenl
 * @version 1.0.1
 */
public class UserPermission {
    private int userId;
    private int permissionId;

    public UserPermission() {
    }

    public UserPermission(int userId, int permissionId) {
        this.userId = userId;
        this.permissionId = permissionId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(int permissionId) {
        this.permissionId = permissionId;
    }
}
