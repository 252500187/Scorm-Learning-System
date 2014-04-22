package com.genghis.sls.system.service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: genghis4
 * Date: 14-4-22
 * Time: 下午8:16
 * To change this template use File | Settings | File Templates.
 */
public interface UpScormService {
    void upScorm(HttpServletRequest request, String upFile, String upImg) throws ServletException, IOException;
}
