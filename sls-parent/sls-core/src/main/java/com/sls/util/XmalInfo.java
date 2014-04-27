package com.sls.util;

/**
 * Created with IntelliJ IDEA.
 * User: bblll
 * Date: 14-4-25
 * Time: 下午9:41
 * To change this template use File | Settings | File Templates.
 */
public class XmalInfo {
    private String title;
    private String type;
    private String parentId;
    private String xmalId;
    private String url;


    public XmalInfo() {
        this.title = "";
        this.type = "";
        this.parentId = "";
        this.xmalId = "";
        this.url = "";
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getXmalId() {
        return xmalId;
    }

    public void setXmalId(String xmalId) {
        this.xmalId = xmalId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public XmalInfo(String title, String type, String parentId, String url, String xmalId) {
        this.title = title;
        this.type = type;
        this.parentId = parentId;
        this.url = url;
        this.xmalId = xmalId;
    }
}
