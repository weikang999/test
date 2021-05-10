<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<%@ Import Namespace="app.Common" %>
<%@ Import Namespace="app.Dbs.Collects" %>
<html>
<head>
    <title>管理员用户管理</title>
    <link rel="stylesheet" href="css.css" type="text/css">
</head>
<body>
<form action="Admin.aspx?a=insert" method="post" name="f1" onsubmit="return checkform();">
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF"
           style="border-collapse:collapse">
        <tr>
            <td width="200">用户名：</td>
            <td><input name="username" type="text" id="username" onblur='checkform()'/> <label id='clabelusername'></label>
                *
            </td>
        </tr>
        <tr>
            <td width="200">密码：</td>
            <td><input name="pwd" type="password" id="pwd" onblur='checkform()'/><label id='clabelpwd'></label>
                *
            </td>
        </tr>
        <tr>
            <td width="200">确认密码：</td>
            <td><input name="pwd2" type="password" id="pwd2" onblur='checkform()'/> <label id='clabelpwd2'></label>
                *
            </td>
        </tr>
        <tr>
            <td width="200">&nbsp;</td>
            <td><input name="Submit" type="submit" value="提交"/>
                <input name="Submit2" type="reset" value="重置"/></td>
        </tr>
    </table>
</form>

    <%
        string where = " 1=1 ";
        string order = Req.get("order", "id");
        string sort = Req.get("sort", "asc");
        Collect<Hashtable> list = Db.name("allusers").@where(where).order(order, sort).page(12);
        
         %>

<p>已有管理员列表：</p>
<table width="100%" class="table table-list">
    <tr>
        <td bgcolor="A4B6D7">序号</td>
        <td bgcolor="A4B6D7">用户名</td>
        <td bgcolor="A4B6D7">密码</td>
        <td bgcolor="A4B6D7">权限</td>
        <td bgcolor="A4B6D7">添加时间</td>
        <td bgcolor="A4B6D7">操作</td>
    </tr>
    <%
        int i = 0;
        foreach (Hashtable map in list) {
            i++;
    %>
    <tr>
        <td><%=i %>
        </td>
        <td><%=map["username"] %>
        </td>
        <td><%=map["pwd"] %>
        </td>
        <td><%=map["cx"] %>
        </td>
        <td><%=map["addtime"] %>
        </td>
        <td><a href="Admin.aspx?a=delete&id=<%=map["id"] %>" onClick="return confirm('真的要删除？')">删除</a></td>
    </tr>
    <%}%>
</table>

<%=list.reader()%>
<script src='js/ajax.js' type="text/javascript"></script>
<script type="text/javascript">

    function checkform() {
        var usernameobj = document.getElementById("username");
        if (usernameobj.value == "") {
            document.getElementById("clabelusername").innerHTML = "&nbsp;&nbsp;<font color=red>请输入用户名</font>";
            return false;
        } else {
            document.getElementById("clabelusername").innerHTML = "  ";
        }

        var usernameobj = document.getElementById("username");
        if (usernameobj.value != "") {
            var ajax = new AJAX();
            ajax.post("action.ashx?a=checkno&table=allusers&col=username&username=" + usernameobj.value + "&checktype=insert&ttime=<%=Info.getDateStr()%>")
            var msg = ajax.getValue();
            if (msg.indexOf('false') > -1) {
                document.getElementById("clabelusername").innerHTML = "&nbsp;&nbsp;<font color=red>用户名已存在</font>";
                return false;
            } else {
                document.getElementById("clabelusername").innerHTML = "  ";
            }
        }
        var pwdobj = document.getElementById("pwd");
        if (pwdobj.value == "") {
            document.getElementById("clabelpwd").innerHTML = "&nbsp;&nbsp;<font color=red>请输入密码</font>";
            return false;
        } else {
            document.getElementById("clabelpwd").innerHTML = "  ";
        }

        var pwd2obj = document.getElementById("pwd2");
        if (pwd2obj.value == "") {
            document.getElementById("clabelpwd2").innerHTML = "&nbsp;&nbsp;<font color=red>请再次输入密码</font>";
            return false;
        } else {
            document.getElementById("clabelpwd2").innerHTML = "  ";
        }

        if (pwd2obj.value != pwdobj.value) {
            document.getElementById("clabelpwd2").innerHTML = "&nbsp;&nbsp;<font color=red>两次密码输入不一致</font>";
            return false;
        } else {
            document.getElementById("clabelpwd2").innerHTML = "  ";
        }


        return true;
    }

    popheight = 450;
</script>


</body>
</html>