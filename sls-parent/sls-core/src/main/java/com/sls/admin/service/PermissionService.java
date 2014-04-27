/*
* PermissionService.java
* Created on  2014-3-14 下午3:14
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-3-14       gaoxinyu    初始版本
*
*/
package com.sls.admin.service;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.entity.MenuPerm;
import com.sls.admin.entity.Permission;

import java.util.List;

/**
 * 类的描述信息
 *
 * @author qinw
 * @version 1.0.1
 */
public interface PermissionService {

    List<MenuPerm> getMenuPermTree();

    Page<Permission> listAllPermission(PageParameter pageParameter, Permission permission);

    int addPermission(Permission permission);

    void editPermission(Permission permission);

    void delPermissionDo(Permission permission);

    Permission findPermissionById(String id);

    Permission findPermissionByPermissionToken(String permissionToken);
}
