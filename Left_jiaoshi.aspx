<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left_jiaoshi.aspx.cs" Inherits="Left_jiaoshi" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages0" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>科目管理</span>
    </a>
    <div id="pages0" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Subject_add.aspx" target="main" class="sidebar-link text-muted pl-lg-5">考试科目添加</a>
            </li>
            <li class="sidebar-list-item">
                <a href="Subject_list_publisher.aspx" target="main" class="sidebar-link text-muted pl-lg-5">考试科目查询</a>
            </li>
            <li class="sidebar-list-item">
                <a href="QuestionInfo_list_publisher.aspx" target="main" class="sidebar-link text-muted pl-lg-5">题库查询</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages1" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>结果管理</span>
    </a>
    <div id="pages1" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Result_list_publisher.aspx" target="main" class="sidebar-link text-muted pl-lg-5">结果查询</a>
            </li>
            <li class="sidebar-list-item">
                <a href="wrongtopic_list_publisher.aspx" target="main" class="sidebar-link text-muted pl-lg-5">错题查询</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages2" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>考试成绩管理</span>
    </a>
    <div id="pages2" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Testresult_list_publisher.aspx" target="main" class="sidebar-link text-muted pl-lg-5">考试成绩查询</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages3" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>个人中心</span>
    </a>
    <div id="pages3" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Teacher_updtself.aspx" target="main" class="sidebar-link text-muted pl-lg-5">修改个人资料</a>
            </li>
            <li class="sidebar-list-item">
                <a href="ChangePassword.aspx" target="main" class="sidebar-link text-muted pl-lg-5">修改密码</a>
            </li>
        </ul>
    </div>
</li>