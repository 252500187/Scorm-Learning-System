package com.sls.login.service.impl;

import com.sls.scorm.dao.ScormDao;
import com.sls.system.dao.LabelDao;
import com.sls.user.dao.RoleDao;
import com.sls.user.dao.UserAttentionDao;
import com.sls.user.dao.UserDao;
import com.sls.user.entity.User;
import com.sls.login.service.LoginService;
import com.sls.user.entity.UserAttention;
import com.sls.util.DictConstant;
import com.sls.util.LoginUserUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Transactional
@Service("loginService")
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private ScormDao scormDao;

    @Autowired
    private LabelDao labelDao;

    @Autowired
    private UserAttentionDao userAttentionDao;

    public String toIndex(HttpServletRequest request, HttpSession session) {
        String loginName = LoginUserUtil.getLoginName();
        List<User> user = userDao.findInUseUserByLoginName(loginName);
        if (user.size() > 0) {
            session.setAttribute("userId", user.get(0).getUserId());
            session.setAttribute("userName", user.get(0).getUserName());
            session.setAttribute("userImg", user.get(0).getImgUrl());
            if (user.get(0).getRoleId() == roleDao.findRoleByAuthority(DictConstant.ROLE_AUTHORITY_ADMIN).getRoleId()) {
                return "/scormadmin/index";
            }
            setLoginIndexInfo(session, user.get(0).getUserId());
        }
        setIndexInfo(request, session);
        return "/scormfront/index";
    }

    public ModelAndView loginResult(HttpServletRequest request, User user, HttpSession session) {
        ModelAndView modelView = new ModelAndView();
        Subject currentUser = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(), user.getPassword());
        token.setRememberMe(true);
        try {
            currentUser.login(token);
        } catch (Exception e) {
            request.setAttribute("loginResult", "false");
            modelView.addObject("message", "密码错误！");
            modelView.setViewName("/scormfront/login");
        }
        if (currentUser.isAuthenticated()) {
            List<User> userList = userDao.findInUseUserByLoginName(LoginUserUtil.getLoginName());
            session.setAttribute("userId", userList.get(0).getUserId());
            session.setAttribute("userName", userList.get(0).getUserName());
            session.setAttribute("userImg", userList.get(0).getImgUrl());
            modelView.setViewName("/scormadmin/index");
            if (userList.get(0).getRoleId() == roleDao.findRoleByAuthority(DictConstant.ROLE_AUTHORITY_USER).getRoleId()) {
                setLoginIndexInfo(session, userList.get(0).getUserId());
                setIndexInfo(request, session);
                modelView.setViewName("/scormfront/index");
            }
        } else {
            request.setAttribute("loginResult", "false");
            modelView.addObject("message", "密码错误！");
            modelView.setViewName("/scormfront/login");
        }
        return modelView;
    }

    public void setIndexInfo(HttpServletRequest request, HttpSession session) {
        session.setAttribute("labels", labelDao.getAllLabel());
        request.setAttribute("scormSum", scormDao.indexFindTopScormByFieldName("register_sum", 8));
        request.setAttribute("scormScore", scormDao.indexFindTopScormByFieldName("score", 8));
        request.setAttribute("scormTime", scormDao.indexFindTopScormByFieldName("total_time", 8));
        request.setAttribute("scormLevel", scormDao.indexFindTopScormByFieldName("recommend_level", 8));
        request.setAttribute("latestScorms", scormDao.findLatestScorms(10));
        request.setAttribute("recommendIndexScorms", scormDao.findRecommendIndexScorms());
    }

    public void setLoginIndexInfo(HttpSession session, int userId) {
        List<UserAttention> userAttentionList = userAttentionDao.getAttentionUsersByUserId(userId);
        int messageNum = 0;
        for (UserAttention userAttention : userAttentionList) {
            messageNum += userAttention.getNewMessage();
        }
        session.setAttribute("attentionUsers", userAttentionList);
        session.setAttribute("messageNum", messageNum);
    }
}
