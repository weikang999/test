<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sy.aspx.cs" Inherits="Sy" %>


<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<html>
<head>
    <title>自动在线多选题MCQ系统</title>
    <LINK href="images/style.css" type=text/css rel=stylesheet>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">
        <!--
        body, td, th {
            font-size: 12px;
        }
        -->
    </style>
</head>
<BODY leftMargin=5 topMargin=5 rightMargin=5>
<table width="100%" height="210" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#D9E9FF"
       style="border-collapse:collapse">
    <TBODY>
    <TR align="center" bgColor=#ffffff>
        <td colspan="4" bgColor=#CADCEA><strong>系统基本信息</strong></td>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD width="14%" align="left" valign="bottom">当前用户：</TD>
        <TD width="37%" align="left" valign="bottom"><font class="t4"><%=Session["username"]%>
        </font></TD>
        <TD width="9%" align="left" valign="bottom">您的权限：</TD>
        <TD width="40%" align="left" valign="bottom"><font class="t4"><%=Session["cx"]%>
        </font></TD>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD height="38" align="left" valign="bottom">当前日期：</TD>
        <TD align="left" valign="bottom"><%=Info.date("yyyy-MM-dd")%></TD>
        <TD align="left" valign="bottom">您的IP：</TD>
        <TD align="left" valign="bottom"><%=Request.UserHostAddress %>
        </TD>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD align="left" valign="bottom">浏览器版本：</TD>
        <TD align="left" valign="bottom"><font class="t41"><%=Request.UserAgent%>
        </font></TD>
        <TD align="left" valign="bottom">操作系统：</TD>
        <TD align="left" valign="bottom"><font class="t41"><%=Environment.OSVersion%>
        </font></TD>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD height="43" align="left" valign="bottom">服务器端口：</TD>
        <TD align="left" valign="bottom"><font class="t41"><%=Request.UserHostName%>
        </font></TD>
        <TD align="left" valign="bottom">开发日期：</TD>
        <TD align="left" valign="bottom"><%=Info.date("yyyy-MM-dd")%></TD>
    </TR>
    </TBODY>
</TABLE>
<p>&nbsp;</p>
<table width="100%" height="193" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#D9E9FF"
       style="border-collapse:collapse">
    <TBODY>
    <TR
            align="center" bgColor=#ffffff>
        <td colspan="2" bgColor=#CADCEA><strong>自动在线多选题MCQ系统</strong></td>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD width="10%" align="left">系统作者：</TD>
        <TD width="41%" align="left"><font class="t4">xxxxxx</font></TD>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD align="left">指导老师：</TD>
        <TD align="left">xxxxxxx</TD>
    </TR>
    <TR align="center"
        bgColor=#ffffff>
        <TD align="left">联系方式：</TD>
        <TD align="left"><font class="t41">xxxxxxxxxxxxxxx</font></TD>
    </TR>
    </TBODY>
</TABLE>
<p>&nbsp;</p>
<P align=right>&nbsp;</P>
</BODY>
</html>




