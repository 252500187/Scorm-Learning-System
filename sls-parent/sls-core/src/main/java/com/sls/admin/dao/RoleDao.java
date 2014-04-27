/*
* RoleDao.java
* Created on  2013-9-26 下午10:03
* 版本       修改时间          作者      修改内容
* V1.0.1    2013-9-26        gaoxinyu    初始版本
*
*/
package com.sls.admin.dao;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.entity.Role;

import java.util.List;

/**
 * 角色dao接口
 *
 * @author gaoxinyu
 * @version 1.0.1
 */

public interface RoleDao {

    Page<Role> findRolePageList(PageParameter pageParameter, Role role);

    List<Role> findAllRole();

    int addRole(Role role);

    void editRole(Role role);

    int delRole(int id);

    Role findRoleById(int id);

    Role findRoleByRoleName(String roleName);

    Boolean checkRepeatRoleName(String roleName);

    Role findRoleByUserId(int userId);
}
