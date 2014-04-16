package com.genghis.sls.security.entity;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
public class Role {
    private int id;
    private String roleName;
    private String description;

    public Role() {
    }

    public Role(int id, String description, String roleName) {
        this.id = id;
        this.description = description;
        this.roleName = roleName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
