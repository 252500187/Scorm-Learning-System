<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="navbar" style="margin-bottom: 0">
<div class="navbar-inner">
<div class="container" style="width: auto;">
<ul class="nav" role="navigation">
<shiro:hasPermission name="system">
    <li class="dropdown">
        <a href="#" id="drop6" role="button" class="dropdown-toggle" data-toggle="dropdown">系统设置<b
                class="caret"></b></a>
        <ul class="dropdown-menu" role="menu" aria-labelledby="drop6">
            <shiro:hasPermission name="system_user">
                <li role="presentation"><a role="menuitem" tabindex="-1"
                                           onclick="addTab('用户管理','admin/user/listAllUserDo')">用户管理</a>
                </li>
            </shiro:hasPermission>
            <shiro:hasPermission name="system_role">
                <li role="presentation"><a role="menuitem" tabindex="-1"
                                           onclick="addTab('角色管理','admin/role/listAllRoleDo')">角色管理</a>
                </li>
            </shiro:hasPermission>
            <shiro:hasPermission name="system_permission">
                <li role="presentation"><a role="menuitem" tabindex="-1"
                                           onclick="addTab('权限管理','admin/permission/listAllPermissionDo')">权限管理</a>
                </li>
            </shiro:hasPermission>
            <shiro:hasPermission name="system_dict">
                <li role="presentation"><a role="menuitem" tabindex="-1"
                                           onclick="addTab('字典管理','system/dict/listAllDictDefineDo')">字典管理</a>
                </li>
            </shiro:hasPermission>
        </ul>
    </li>
</shiro:hasPermission>
</ul>
</div>
</div>
</div>
