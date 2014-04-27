/*
* PermissionServiceImpl.java
* Created on  2014-3-14 下午3:15
* 版本       修改时间          作者      修改内容
* V1.0.1    2014-3-14       gaoxinyu    初始版本
*
*/
package com.sls.admin.service.impl;

import com.core.page.entity.Page;
import com.core.page.entity.PageParameter;
import com.sls.admin.dao.PermissionDao;
import com.sls.admin.entity.MenuPerm;
import com.sls.admin.entity.Permission;
import com.sls.admin.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 类的描述信息
 *
 * @author qinw
 * @version 1.0.1
 */
@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionDao permissionDao;

    public List<MenuPerm> getMenuPermTree() {
        List<MenuPerm> menuPermList = new ArrayList<MenuPerm>();
        menuPermList.add(new MenuPerm(1, "", "权限选择", -1));

        menuPermList.add(new MenuPerm(2, "vote", "投票管理", 1));
        menuPermList.add(new MenuPerm(8, "vote_candidate", "候选人组管理", 2));
        menuPermList.add(new MenuPerm(9, "vote_judges", "评委组管理", 2));
        menuPermList.add(new MenuPerm(10, "vote_edit", "投票编辑", 2));
        menuPermList.add(new MenuPerm(11, "vote_current", "当轮结果", 2));
        menuPermList.add(new MenuPerm(12, "vote_result", "投票结果", 2));

        menuPermList.add(new MenuPerm(3, "sort", "排序管理", 1));
        menuPermList.add(new MenuPerm(13, "sort_edit", "排序编辑", 3));
        menuPermList.add(new MenuPerm(14, "sort_result", "排序结果", 3));

        menuPermList.add(new MenuPerm(4, "rule", "规则管理", 1));
        menuPermList.add(new MenuPerm(15, "rule_performance", "业绩审核规则", 4));
        menuPermList.add(new MenuPerm(16, "rule_qualify", "资格审核规则", 4));
        menuPermList.add(new MenuPerm(17, "rule_paper", "论文审核规则", 4));

        menuPermList.add(new MenuPerm(5, "information", "信息管理", 1));
        menuPermList.add(new MenuPerm(18, "information_staff", "人员信息管理", 5));
        menuPermList.add(new MenuPerm(19, "information_apply", "申报信息管理", 5));

        menuPermList.add(new MenuPerm(6, "publicity", "公示信息", 1));
        menuPermList.add(new MenuPerm(20, "publicity_qualify", "资格公示信息", 6));
        menuPermList.add(new MenuPerm(21, "publicity_final", "终审公示信息", 6));
        menuPermList.add(new MenuPerm(22, "publicity_result", "评定公示信息", 6));

        menuPermList.add(new MenuPerm(7, "system", "系统设置", 1));
        menuPermList.add(new MenuPerm(23, "system_user", "用户管理", 7));
        menuPermList.add(new MenuPerm(24, "system_role", "角色管理", 7));
        menuPermList.add(new MenuPerm(25, "system_permission", "权限管理", 7));
        menuPermList.add(new MenuPerm(26, "system_dict", "字典管理", 7));

        menuPermList.add(new MenuPerm(27, "staff_base", "基本信息", 1));

        menuPermList.add(new MenuPerm(28, "staff_apply", "申报信息", 1));
        menuPermList.add(new MenuPerm(29, "staff_apply_current", "当前申报", 28));
        menuPermList.add(new MenuPerm(30, "staff_apply_history", "历史申报", 28));

        menuPermList.add(new MenuPerm(31, "qualify", "资格管理", 1));
        menuPermList.add(new MenuPerm(32, "qualify_audit", "资格审核", 31));
        menuPermList.add(new MenuPerm(33, "qualify_pay", "交费管理", 31));
        menuPermList.add(new MenuPerm(34, "qualify_publicity", "资格公示", 31));

        menuPermList.add(new MenuPerm(35, "audit_college", "学院审核", 1));

        menuPermList.add(new MenuPerm(36, "audit_lesson", "课时审核", 1));
        menuPermList.add(new MenuPerm(37, "audit_international", "国际交流审核", 36));
        menuPermList.add(new MenuPerm(38, "audit_postgraduate", "研究生审核", 36));
        menuPermList.add(new MenuPerm(39, "audit_undergraduate", "本科生审核", 36));
        menuPermList.add(new MenuPerm(40, "audit_quality", "质量监控", 36));

        menuPermList.add(new MenuPerm(41, "audit_senate", "教务处综审", 1));

        menuPermList.add(new MenuPerm(42, "audit_school", "校级审核", 1));
        menuPermList.add(new MenuPerm(43, "audit_personnel", "人事处审核", 42));
        menuPermList.add(new MenuPerm(44, "audit_research", "科研处审核", 42));
        menuPermList.add(new MenuPerm(45, "audit_education", "高教所审核", 42));
        menuPermList.add(new MenuPerm(46, "audit_sports", "体育审核", 42));

        menuPermList.add(new MenuPerm(47, "audit_final", "最终审核", 1));

        menuPermList.add(new MenuPerm(48, "final_publicity", "终审公示", 1));
        return menuPermList;
    }

    @Override
    public Page<Permission> listAllPermission(PageParameter pageParameter, Permission permission) {
        return permissionDao.listAllPermission(pageParameter, permission);
    }

    @Override
    public int addPermission(Permission permission) {
        return permissionDao.addPermission(permission);
    }

    @Override
    public void editPermission(Permission permission) {
        permissionDao.editPermission(permission);
    }

    @Override
    public void delPermissionDo(Permission permission) {
        permissionDao.delPermissionDo(permission.getId());
    }

    @Override
    public Permission findPermissionById(String id) {
        return permissionDao.findPermissionById(id);
    }

    @Override
    public Permission findPermissionByPermissionToken(String permissionToken) {
        return permissionDao.findPermissionByPermissionToken(permissionToken);
    }
}
