package com.sls.system.service.impl;

import com.sls.system.dao.LabelDao;
import com.sls.system.entity.Label;
import com.sls.system.service.DictService;
import com.sls.system.service.LabelService;
import com.sls.user.dao.UserDao;
import com.sls.util.LoginUserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service("tagService")
public class LabelServiceImpl implements LabelService {

    @Autowired
    private LabelDao labelDao;

    @Autowired
    private UserDao userDao;

    @Override
    public void getAllUserLabel(HttpServletRequest request) {
        request.setAttribute("labelList", labelDao.getAllUserLabel());
    }

    private int getUserId() {
        return userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName()).get(0).getUserId();
    }

    @Override
    public void editMyLabelList(String myLabelList) {
        int userId = getUserId();
        Label label = new Label();
        label.setUserId(userId);
        labelDao.delAllUserLabelsByUserId(userId);
        String labelIdList[] = myLabelList.split(",");
        for (String labelId : labelIdList) {
            label.setLabelId(Integer.parseInt(labelId));
            labelDao.addUserLabel(label);
        }
    }
}
