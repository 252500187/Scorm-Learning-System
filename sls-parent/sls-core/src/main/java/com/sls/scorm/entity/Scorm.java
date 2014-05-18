package com.sls.scorm.entity;

import com.sls.util.DateUtil;
import com.sls.util.DictConstant;

public class Scorm {
    private int scormId;
    private String scormName;
    private int registerSum;
    private int recommendLevel;
    private String showRecommendLevel;
    private String imgPath;
    private String description;
    private String uploadDate;
    private int uploadUserId;
    private String showUploadUserId;
    private int inUse;
    private String totalTime;
    private String score;
    private int completeWay;
    private String completeDate;
    private String collectDate;

    private int userId;

    public Scorm() {
        registerSum = 0;
        recommendLevel = DictConstant.RECOMMEND_0;
        uploadDate = DateUtil.getCurrentTimestamp().toString().substring(0, 16);
        inUse = DictConstant.NO_USE;
        totalTime = "";
        score = "";
        completeWay=DictConstant.VOID_VALUE;
    }

    public int getScormId() {
        return scormId;
    }

    public void setScormId(int scormId) {
        this.scormId = scormId;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public int getUploadUserId() {
        return uploadUserId;
    }

    public void setUploadUserId(int uploadUserId) {
        this.uploadUserId = uploadUserId;
    }

    public int getInUse() {
        return inUse;
    }

    public void setInUse(int inUse) {
        this.inUse = inUse;
    }

    public int getRecommendLevel() {
        return recommendLevel;
    }

    public void setRecommendLevel(int recommendLevel) {
        this.recommendLevel = recommendLevel;
    }

    public String getScormName() {
        return scormName;
    }

    public void setScormName(String scormName) {
        this.scormName = scormName;
    }

    public int getRegisterSum() {
        return registerSum;
    }

    public void setRegisterSum(int registerSum) {
        this.registerSum = registerSum;
    }

    public String getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(String uploadDate) {
        this.uploadDate = uploadDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(String totalTime) {
        this.totalTime = totalTime;
    }

    public String getShowUploadUserId() {
        return showUploadUserId;
    }

    public void setShowUploadUserId(String showUploadUserId) {
        this.showUploadUserId = showUploadUserId;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getShowRecommendLevel() {
        return showRecommendLevel;
    }

    public void setShowRecommendLevel(String showRecommendLevel) {
        this.showRecommendLevel = showRecommendLevel;
    }

    public int getCompleteWay() {
        return completeWay;
    }

    public void setCompleteWay(int completeWay) {
        this.completeWay = completeWay;
    }

    public String getCompleteDate() {
        return completeDate;
    }

    public void setCompleteDate(String completeDate) {
        this.completeDate = completeDate;
    }

    public String getCollectDate() {
        return collectDate;
    }

    public void setCollectDate(String collectDate) {
        this.collectDate = collectDate;
    }
}
