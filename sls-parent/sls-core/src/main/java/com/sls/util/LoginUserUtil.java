package com.sls.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 * 获取登录用户信息
 *
 * @author chenl
 * @version 1.0.1
 */

public class LoginUserUtil {

    private LoginUserUtil() {
    }

    public static String findLoginUserName() {
        Subject currentUser = SecurityUtils.getSubject();
        return currentUser.getPrincipal() == null ? "" : (String) currentUser.getPrincipal();
    }
}
