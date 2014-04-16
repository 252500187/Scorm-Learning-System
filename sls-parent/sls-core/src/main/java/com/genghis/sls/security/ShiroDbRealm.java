package com.genghis.sls.security;

import com.genghis.sls.security.entity.User;
import com.genghis.sls.security.service.AccountService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/*
 * Created with IntelliJ IDEA.
 * User: xulixin
 * Date: 13-7-9
 * Time: 下午8:03
 * To change this template use File | Settings | File Templates.
 */
public class ShiroDbRealm extends AuthorizingRealm {

    private AccountService accountService;

    @Autowired
    public void setAccountService(AccountService accountService) {
        this.accountService = accountService;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String loginName = (String) getAvailablePrincipal(principals);
        if (loginName != null) {
            List<String> roles = accountService.getRolesByLoginName(loginName);
            List<String> permTokens = accountService.getPermTokensByLoginName(loginName);
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            if (roles != null) {
                info.addRoles(roles);
            }
            if (permTokens != null) {
                info.addStringPermissions(permTokens);
            }
            return info;
        }
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
            throws AuthenticationException {

        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        String loginName = token.getUsername();

        if (loginName != null && !"".equals(loginName)) {
            User user = accountService.findUserByLoginName(loginName);
            if (user != null) {
                return new SimpleAuthenticationInfo(user.getLoginName(), user.getPassword(), getName());
            }
        }
        return null;
    }

}
