<%@ page contentType="text/html;charset=UTF-8" %>
<div class="navbar" style="margin-bottom: 0">
    <div class="navbar-inner">
        <div class="container" style="width: auto;">
            <ul class="nav" role="navigation">
                <li class="dropdown">
                    <a href="#" id="drop6" role="button" class="dropdown-toggle" data-toggle="dropdown"
                       onclick=" addTab('用户管理','admin/admin/listAllUserDo')">用户管理</a>
                </li>
                <li class="dropdown">
                    <a href="#" id="drop7" role="button" class="dropdown-toggle" data-toggle="dropdown"
                       onclick=" addTab('角色管理','admin/role/listAllRoleDo')">角色管理</a>
                </li>
                <li class="dropdown">
                    <a href="#" id="drop8" role="button" class="dropdown-toggle" data-toggle="dropdown"
                       onclick=" addTab('字典管理','admin/dict/listAllDictDefineDo')">字典管理</a>
                </li>
                <li class="dropdown">
                    <a href="#" id="drop9" role="button" class="dropdown-toggle" data-toggle="dropdown"
                       onclick=" addTab('课件信息','admin/statistics/listAllScormInfoDo')">课件信息</a>
                </li>
            </ul>
        </div>
    </div>
</div>
