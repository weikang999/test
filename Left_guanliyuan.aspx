<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left_guanliyuan.aspx.cs" Inherits="Left_guanliyuan" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages0" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>账号管理</span>
    </a>
    <div id="pages0" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Administrators_add.aspx" target="main" class="sidebar-link text-muted pl-lg-5">管理员账号添加</a>
            </li>
            <li class="sidebar-list-item">
                <a href="Administrators_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">管理员账号管理</a>
            </li>
            <li class="sidebar-list-item">
                <a href="ChangePassword.aspx" target="main" class="sidebar-link text-muted pl-lg-5">密码修改</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages1" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>学生管理</span>
    </a>
    <div id="pages1" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Student_add.aspx" target="main" class="sidebar-link text-muted pl-lg-5">学生添加</a>
            </li>
            <li class="sidebar-list-item">
                <a href="Student_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">学生查询</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages2" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>教师管理</span>
    </a>
    <div id="pages2" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Teacher_add.aspx" target="main" class="sidebar-link text-muted pl-lg-5">教师添加</a>
            </li>
            <li class="sidebar-list-item">
                <a href="Teacher_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">教师查询</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages3" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>科目管理</span>
    </a>
    <div id="pages3" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Subject_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">科目查询</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages4" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>题库管理</span>
    </a>
    <div id="pages4" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="QuestionInfo_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">题库查询</a>
            </li>
        </ul>
    </div>
</li>
<li class="sidebar-list-item">
    <a href="javascript:;" data-toggle="collapse" data-target="#pages5" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted">
        <span>考试结果管理</span>
    </a>
    <div id="pages5" class="collapse">
        <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
            <li class="sidebar-list-item">
                <a href="Result_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">结果查询</a>
            </li>
            <li class="sidebar-list-item">
                <a href="Testresult_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">考试结果查询</a>
            </li>
            <li class="sidebar-list-item">
                <a href="Wrongtopic_list.aspx" target="main" class="sidebar-link text-muted pl-lg-5">错题查询</a>
            </li>
        </ul>
    </div>
</li>