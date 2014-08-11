package com.sls.user.entity;

public class BackAnnouncement {
    private int announcementId;
    private int adminId;
    private String date;
    private String announcementTheme;
    private String announcementContent;
    private int state;

    public int getAnnouncementId() {
        return announcementId;
    }

    public void setAnnouncementId(int announcementId) {
        this.announcementId = announcementId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getAnnouncementTheme() {
        return announcementTheme;
    }

    public void setAnnouncementTheme(String announcementTheme) {
        this.announcementTheme = announcementTheme;
    }

    public String getAnnouncementContent() {
        return announcementContent;
    }

    public void setAnnouncementContent(String announcementContent) {
        this.announcementContent = announcementContent;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

}
