package com.sls.scorm.entity;

import com.sls.util.DictConstant;

public class Sco {
    private int scoId;
    private int scormId;
    private int userId;
    private String title;
    private String type;
    private String treeParentId;
    private String treeId;
    private String url;
    private int lastVisit;
    private int studyState;
    private String showStudyState;

    public Sco() {
    }

    public Sco(String title, String type, String treeParentId, String treeId, String url) {
        this.userId = DictConstant.VOID_VALUE;
        this.lastVisit = DictConstant.VOID_VALUE;
        this.studyState = DictConstant.STUDY_STATE_0;
        this.title = title;
        this.type = type;
        this.treeParentId = treeParentId;
        this.treeId = treeId;
        this.url = url;
    }

    public int getScoId() {
        return scoId;
    }

    public void setScoId(int scoId) {
        this.scoId = scoId;
    }

    public int getScormId() {
        return scormId;
    }

    public void setScormId(int scormId) {
        this.scormId = scormId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTreeParentId() {
        return treeParentId;
    }

    public void setTreeParentId(String treeParentId) {
        this.treeParentId = treeParentId;
    }

    public String getTreeId() {
        return treeId;
    }

    public void setTreeId(String treeId) {
        this.treeId = treeId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getStudyState() {
        return studyState;
    }

    public void setStudyState(int studyState) {
        this.studyState = studyState;
    }

    public int getLastVisit() {
        return lastVisit;
    }

    public void setLastVisit(int lastVisit) {
        this.lastVisit = lastVisit;
    }

    public String getShowStudyState() {
        return showStudyState;
    }

    public void setShowStudyState(String showStudyState) {
        this.showStudyState = showStudyState;
    }
}
