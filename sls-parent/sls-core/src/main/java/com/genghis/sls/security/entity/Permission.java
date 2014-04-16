package com.genghis.sls.security.entity;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
public class Permission {

    private int id;
    private String permissionToken;
    private String description;
    private String oldPermissionToken;

    public Permission() {
    }

    public Permission(int id, String permissionToken, String description, String oldPermissionToken) {
        this.id = id;
        this.permissionToken = permissionToken;
        this.description = description;
        this.oldPermissionToken = oldPermissionToken;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPermissionToken() {
        return permissionToken;
    }

    public void setPermissionToken(String permissionToken) {
        this.permissionToken = permissionToken;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOldPermissionToken() {
        return oldPermissionToken;
    }

    public void setOldPermissionToken(String oldPermissionToken) {
        this.oldPermissionToken = oldPermissionToken;
    }
}
