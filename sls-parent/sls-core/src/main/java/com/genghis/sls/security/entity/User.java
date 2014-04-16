package com.genghis.sls.security.entity;

/**
 * @author gaoxinyu
 * @version 1.0.1
 */
public class User {

    private int id;
    private String loginName;
    private String userName;
    private String password;
    private int departmentId;
    private String showDepartmentId;

    private int roleId;
    private String showRoleId;
    private Boolean checked = false;

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getShowDepartmentId() {
        return showDepartmentId;
    }

    public void setShowDepartmentId(String showDepartmentId) {
        this.showDepartmentId = showDepartmentId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getShowRoleId() {
        return showRoleId;
    }

    public void setShowRoleId(String showRoleId) {
        this.showRoleId = showRoleId;
    }

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }
}
