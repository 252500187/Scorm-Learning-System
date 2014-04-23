package com.genghis.sls.system.service.impl;

import com.genghis.sls.system.service.UpScormService;
import com.genghis.sls.util.FileUp;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
@Transactional
@Service("upScormService")
public class UpScormServiceImpl implements UpScormService {
    @Override
    public void upScorm(HttpServletRequest request, String upFile, String upImg) throws ServletException, IOException {
        //上传Scorm课件和图片，返回图片和文件路径
        FileUp fileUp = new FileUp();
        String fileName = "iddate";//todo 用户ID和日期
        String path[] = fileUp.upScorm(request, fileName, upFile, upImg);
        String scormPath = path[0];
        String imgUsePath = path[1];
        request.setAttribute("jpg", imgUsePath);
        //解压ZIP
//        fileUp.unzip(scormPath,scormPath);
    }
}
