package com.sls.util;

/**
 * 公共常量
 *
 * @author chenl
 * @version 1.0.1
 */

public class DictConstant {
    private DictConstant() {
    }

    //空值
    public static final int VOID_VALUE = -1;


    // 上传Scorm的地址
    public static final String TOP_SCORM_FILE_NAME = "scorms";
    // SCORM解压到的文件夹名
    public static final String SCORM_FILE_NAME = "scorm";
    // SCORM对应的图片名
    public static final String SCORM_IMG = "logo.jpg";
    // SCORM对应的课件名
    public static final String SCORM_NAME = "scorm.zip";
    // SCORM课件XML名
    public static final String IMSMANIFEST = "imsmanifest.xml";


    // 管理员角色,shiro配置权限，写死，必须为admin和user
    public static final String ADMIN = "admin";
    // 用户角色
    public static final String USER = "user";

    //角色是否屏蔽 0 未屏蔽
    public static final String NO_SHIELD = "0";
    // 1 屏蔽
    public static final String SHIELD = "1";
}