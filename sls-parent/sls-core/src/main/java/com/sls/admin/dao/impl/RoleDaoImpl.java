/*
* RoleDaoImpl.java
* Created on  2013-9-26 下午10:03
* 版本       修改时间          作者      修改内容
* V1.0.1    2013-9-26       gaoxinyu    初始版本
*
*/
package com.sls.admin.dao.impl;

import com.core.page.dao.PageDao;
import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.dao.RoleDao;
import com.sls.admin.entity.Role;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 角色dao实现
 *
 * @author gaoxinyu
 * @version 1.0.1
 */

@Repository("roleDao")
public class RoleDaoImpl extends PageDao implements RoleDao {

    private StringBuilder getRoleSql() {
        String roleSql = "SELECT * FROM sys_role where 1=1 ";
        return new StringBuilder(roleSql);
    }

    @Override
    public Page<Role> findRolePageList(PageParameter pageParameter, Role role) {
        StringBuilder sql = getRoleSql();
        if (!role.getRoleName().equals("")) {
            sql.append(" AND role_name like '%").append(role.getRoleName().trim()).append("%'");
        }
        return queryForPage(pageParameter, sql.toString(), new BeanPropertySqlParameterSource(role), new BeanPropertyRowMapper<Role>(Role.class));
    }

    @Override
    public Role findRoleByRoleName(String roleName) {
        StringBuilder sql = getRoleSql();
        sql.append(" AND role_name=?");
        return getJdbcTemplate().queryForObject(sql.toString(), new BeanPropertyRowMapper<Role>(Role.class), roleName);
    }
}
