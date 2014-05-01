package com.sls.admin;

import com.core.autocomplete.service.AutoCompleteService;
import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.entity.Role;
import com.sls.admin.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.security.GeneralSecurityException;

/**
 * 用户组类
 *
 * @author chenl
 * @version 1.0.1
 */

@Controller
@Transactional
@RequestMapping("/admin/role/")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private AutoCompleteService autoCompleteService;

    @RequestMapping(value = "listAllRoleDo", method = {RequestMethod.GET, RequestMethod.POST})
    public String listAllRoleDo() {
        return "scormadmin/role/listAllRoleDo";
    }

    @RequestMapping(value = "listAllRole", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Page<Role> listAllRole(PageParameter pageParameter, Role role) {
        return roleService.findRolePageList(pageParameter, role);
    }
}