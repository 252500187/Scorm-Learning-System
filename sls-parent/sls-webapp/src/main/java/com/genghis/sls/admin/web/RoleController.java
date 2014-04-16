package com.genghis.sls.admin.web;

import com.genghis.core.autocomplete.service.AutoCompleteService;
import com.genghis.core.page.entity.Page;
import com.genghis.core.page.entity.PageParameter;
import com.genghis.sls.security.entity.MenuPerm;
import com.genghis.sls.security.entity.Permission;
import com.genghis.sls.security.entity.Role;
import com.genghis.sls.security.service.PermissionService;
import com.genghis.sls.security.service.RolePermissionService;
import com.genghis.sls.security.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.security.GeneralSecurityException;
import java.util.List;

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
    private PermissionService permissionService;

    @Autowired
    private RolePermissionService rolePermissionService;

    @Autowired
    private AutoCompleteService autoCompleteService;

    @RequestMapping(value = "listAllRoleDo", method = {RequestMethod.GET, RequestMethod.POST})
    public String listAllRoleDo() {
        return "admin/role/listAllRoleDo";
    }

    @RequestMapping(value = "listAllRole", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Page<Role> listAllRole(PageParameter pageParameter, Role role) {
        return roleService.findRolePageList(pageParameter, role);
    }

    @RequestMapping(value = "addRoleDo", method = {RequestMethod.GET})
    public String addRoleDo(HttpServletRequest request) {
        List<MenuPerm> menuPermList = permissionService.getMenuPermTree();
        request.setAttribute("menuPermList", menuPermList);
        return "admin/role/addRoleDo";
    }

    @RequestMapping(value = "addRole", method = {RequestMethod.POST})
    @ResponseBody
    public void addRole(Role role, @RequestParam("permissionTokens") String permissionTokens) {
        roleService.checkRepeatRoleName(role.getRoleName(), "");
        int roleId = roleService.addRole(role);
        rolePermissionService.addRolePermissions(roleId, permissionTokens);
        autoCompleteService.initAutoComplete();
    }

    @RequestMapping(value = "editRoleDo", method = {RequestMethod.GET})
    public String editRoleDo(HttpServletRequest request, @RequestParam("id") int id) {
        Role role = roleService.findRoleById(id);
        List<MenuPerm> menuPermList = permissionService.getMenuPermTree();
        List<Permission> choosedPerms = rolePermissionService.findChoosedPermsByRoleId(id);
        String permissionTokenValue = roleService.getPermissionTokenValue(choosedPerms);
        roleService.setHasChecked(menuPermList, choosedPerms);
        request.setAttribute("role", role);
        request.setAttribute("menuPermList", menuPermList);
        request.setAttribute("choosedPerms", choosedPerms);
        request.setAttribute("permissionTokenValue", permissionTokenValue);
        return "admin/role/editRoleDo";
    }

    @RequestMapping(value = "checkRepeatRoleName", method = {RequestMethod.POST})
    @ResponseBody
    public boolean checkRepeatRoleName(Role role, @RequestParam("primaryRoleName") String primaryRoleName) {
        return roleService.checkRepeatRoleName(role.getRoleName(), primaryRoleName);
    }

    @RequestMapping(value = "editRole", method = {RequestMethod.POST})
    @ResponseBody
    public void editRole(Role role, @RequestParam("permissionTokens") String permissionTokens) throws GeneralSecurityException {
        roleService.editRole(role, permissionTokens);
        autoCompleteService.initAutoComplete();
    }

    @RequestMapping(value = "delRoleDo", method = {RequestMethod.DELETE})
    @ResponseBody
    public void delRoleDo(@RequestParam("id") int id) throws GeneralSecurityException {
        Role role = roleService.findRoleById(id);
        roleService.delRoleDo(role);
        autoCompleteService.initAutoComplete();
    }
}
