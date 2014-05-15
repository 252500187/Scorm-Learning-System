package com.sls.scorm.entity;

public class ScormSummarize {
    private int userId;
    private int scormId;
    private String score;
    private String discuss;
    private String discussDate;
    private String grade;
    private String completeDate;

    private String loginName;

    public ScormSummarize() {
        score = "";
        discuss = "";
        grade = "";
        discussDate = "";
        completeDate = "";
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getScormId() {
        return scormId;
    }

    public void setScormId(int scormId) {
        this.scormId = scormId;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getDiscuss() {
        return discuss;
    }

    public void setDiscuss(String discuss) {
        this.discuss = discuss;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getCompleteDate() {
        return completeDate;
    }

    public void setCompleteDate(String completeDate) {
        this.completeDate = completeDate;
    }

    public String getDiscussDate() {
        return discussDate;
    }

    public void setDiscussDate(String discussDate) {
        this.discussDate = discussDate;
    }
}
