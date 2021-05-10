<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shoucangjilu_list2.aspx.cs" Inherits="Shoucangjilu_list2" %>

<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>我的收藏</title>
    <link rel="stylesheet" href="css.css" type="text/css">
</head>

<body>

    <form id="form1" runat="server">

<p>我的收藏：</p>

<table width="100%" class="table table-hover table-border">
    <thead>
    <tr>
        <td width="25" bgcolor="#CCFFFF">序号</td>
        <td width="790" bgcolor='#CCFFFF'>标题</td>
        <td width="135" align="center" bgcolor="#CCFFFF">收藏时间</td>
        <td width="75" align="center" bgcolor="#CCFFFF">操作</td>
    </tr>
    </thead>
    <tbody>
   <%
       string where = " 1=1 ";
       Collect<Hashtable> list = Db.name("shoucangjilu").@where("username", Session["username"]).@where(where).order("id", "desc").page(12);
       
       foreach (var map in list)
      {
   %>
    <tr>
        <td width="25">
            <%= map["id"] %>
        </td>
        <td>
            <%= map["biaoti"]%>
        </td>
        <td width="135" align="center">
            <%= map["addtime"]%>
        </td>
        <td width="75" align="center">
            <a href="shoucangjilu.ashx?a=delete&id=<%= map["id"] %>"
                                         onclick="return confirm('真的要删除？')">删除</a>

            <a href="<%= map["biao"] %>detail.aspx?id=<%=map["xwid"]%>" target="_blank">详细</a>
        </td>
    </tr>
        <% } %>
    </tbody>
</table>

<%=list.reader()%>


    </form>

</body>
</html>
