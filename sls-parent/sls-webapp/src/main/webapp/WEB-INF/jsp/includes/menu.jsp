<%@ page contentType="text/html;charset=UTF-8" %>
<div class="navbar" style="margin-bottom: 0">
    <div class="navbar-inner">
        <div class="container" style="width: auto;">
            <ul class="nav" role="navigation">
                <li class="dropdown">
                    <a href="#" id="drop6" role="button" class="dropdown-toggle" data-toggle="dropdown">系统设置<b
                            class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop6">
                        <li role="presentation"><a role="menuitem" tabindex="-1"
                                                   onclick="addTab('用户管理','admin/user/listAllUserDo')">用户管理</a>
                        </li>
                        <li role="presentation"><a role="menuitem" tabindex="-1"
                                                   onclick="addTab('角色管理','admin/role/listAllRoleDo')">角色管理</a>
                        </li>
                        <li role="presentation"><a role="menuitem" tabindex="-1"
                                                   onclick="addTab('字典管理','system/dict/listAllDictDefineDo')">字典管理</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a role="menuitem" tabindex="-1"
                       onclick="addTab('角色管理','admin/user/UP')">测试</a>
                </li>
            </ul>
        </div>
    </div>
</div>
