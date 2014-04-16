/*
* PermissionDao.java
* Created on  2014-3-14 下午3:18
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-3-14       gaoxinyu    初始版本
*
*/
package com.genghis.sls.security.dao;

import com.genghis.core.page.entity.Page;
import com.genghis.core.page.entity.PageParameter;
import com.genghis.sls.security.entity.Permission;

/**
 * 类的描述信息
 *
 * @author qinw
 * @version 1.0.1
 */
public interface PermissionDao {

    Page<Permission> listAllPermission(PageParameter pageParameter, Permission permission);

    Boolean checkRepeatPermToken(String permissionToken);

    int addPermission(Permission permission);

    void editPermission(Permission permission);

    void delPermissionDo(int id);

    Permission findPermissionById(String id);

    Permission findPermissionByPermissionToken(String permissionToken);
}
