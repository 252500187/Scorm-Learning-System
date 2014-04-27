package com.sls.admin.entity;

/**
 * Created with IntelliJ IDEA.
 * User: runwiththewind
 * Date: 14-3-15
 * Time: 上午10:20
 * To change this template use File | Settings | File Templates.
 */
public class MenuPerm {

    private int id;
    private String permissionToken;
    private String menuName;
    private int parentId;
    private boolean checked=false;

    public MenuPerm() {
    }

    public MenuPerm(int id, String permissionToken, String menuName, int parentId) {
        this.id = id;
        this.permissionToken = permissionToken;
        this.menuName = menuName;
        this.parentId = parentId;
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

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }
}
