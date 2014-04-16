package com.genghis.sls.admin.web;

/**
 * 类的描述信息
 *
 * @author qinw
 * @version 1.0.1
 */

import com.genghis.core.page.entity.Page;
import com.genghis.core.page.entity.PageParameter;
import com.genghis.sls.security.entity.Permission;
import com.genghis.sls.security.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.security.GeneralSecurityException;

@Controller
@RequestMapping("/admin/permission/")
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    @RequestMapping(value = "listAllPermissionDo", method = {RequestMethod.GET})
    public String listAllPermissionDo() {
        return "admin/permission/listAllPermissionDo";
    }

    @RequestMapping(value = "listAllPermission", method = RequestMethod.POST)
    @ResponseBody
    public Page listAllPermission(PageParameter pageParameter, Permission permission) {
        return permissionService.listAllPermission(pageParameter, permission);
    }

    @RequestMapping(value = "checkRepeatPermissionToken", method = {RequestMethod.POST})
    @ResponseBody
    public boolean checkRepeatPermissionToken(Permission permission) {
        return permissionService.checkRepeatPermissionToken(permission.getPermissionToken(), permission.getOldPermissionToken());
    }

    @RequestMapping(value = "addPermissionDo", method = {RequestMethod.GET})
    public String addPermissionDo() {
        return "admin/permission/addPermissionDo";
    }

    @RequestMapping(value = "addPermission", method = {RequestMethod.POST})
    @ResponseBody
    public void addPermission(Permission permission) {
        permissionService.addPermission(permission);
    }

    @RequestMapping(value = "editPermissionDo", method = {RequestMethod.GET, RequestMethod.POST})
    public String editPermissionDo(HttpServletRequest request, @RequestParam("id") String id) throws GeneralSecurityException {
        Permission permission = permissionService.findPermissionById(id);
        request.setAttribute("permission", permission);
        return "admin/permission/editPermissionDo";
    }

    @RequestMapping(value = "editPermission", method = RequestMethod.POST)
    @ResponseBody
    public void editPermission(Permission permission) throws GeneralSecurityException {
        permissionService.editPermission(permission);
    }

    @RequestMapping(value = "delPermissionDo", method = {RequestMethod.DELETE})
    @ResponseBody
    public void delPermissionDo(@RequestParam("id") String id) throws GeneralSecurityException {
        Permission permission = permissionService.findPermissionById(id);
        permissionService.delPermissionDo(permission);
    }
}
