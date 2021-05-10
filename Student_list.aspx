<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_list.aspx.cs" Inherits="Student_list" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>

<div style="padding: 10px">




<div class="panel panel-default">
    <div class="panel-heading">
        <span class="module-name">
            学生        </span>
        <span>列表</span>
    </div>
    <div class="panel-body">
        <div class="pa10 bg-warning">
            <form class="form-inline" action="?"><!-- form 标签开始 -->
    <div class="form-group">
    
    <i class="glyphicon glyphicon-search"></i>
                </div><div class="form-group">
    用户名
    <input type="text" class="form-control" style="" name="username" value="<%= Request["username"] %>"/></div><div class="form-group">
    姓名
    <input type="text" class="form-control" style="" name="name" value="<%= Request["name"] %>"/></div><div class="form-group">
    性别
    <select class="form-control class_sex1" data-value="<%= Request["sex"] %>" id="sex" name="sex"><option value="">请选择</option><option value="man">man</option><option value="woman">woman</option></select><script>
$(".class_sex1").val($(".class_sex1").attr("data-value"))</script></div><div class="form-group">
    手机号
    <input type="text" class="form-control" style="" name="phonenumber" value="<%= Request["phonenumber"] %>"/></div><div class="form-group">
    身份证号
    <input type="text" class="form-control" style="" name="idnumbe" value="<%= Request["idnumbe"] %>"/></div><select class="form-control" name="order" id="orderby"><option value="id">按发布时间</option></select><select class="form-control" name="sort" id="sort"><option value="desc">倒序</option><option value="asc">升序</option></select><script>$("#orderby").val("<%= orderby %>");$("#sort").val("<%= sort %>");</script><button type="submit" class="btn btn-default">
    搜索</button><!--form标签结束--></form></div>



        

                    <div class="">
                <table width="100%" border="1" class="table table-list table-bordered table-hover"><thead><tr align="center"><th width="60" data-field="item">序号</th>
                        <th> 用户名 </th>
<th> 密码 </th>
<th> 姓名 </th>
<th> 性别 </th>
<th> 手机号 </th>
<th> 出生日期 </th>
<th> 邮箱 </th>
<th> 身份证号 </th>
<th> 地址 </th>
                                                                        <th width="180" data-field="addtime">添加时间</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr></thead><tbody>
                    <% 
                int i=0;
                foreach(Hashtable map in list) 
 { 

                i++;
                 %>
                    <tr id="<%= map["id"] %>" pid=""><td width="30" align="center">
                            <label>
                                                                <%= i %>
                            </label>
                        </td>
                        <td> <%= map["username"] %> </td>
<td> <%= map["pwd"] %> </td>
<td> <%= map["name"] %> </td>
<td> <%= map["sex"] %> </td>
<td> <%= map["phonenumber"] %> </td>
<td> <%= map["birth"] %> </td>
<td> <%= map["email"] %> </td>
<td> <%= map["idnumbe"] %> </td>
<td> <%= map["addr"] %> </td>
                                                                        <td align="center"><%= map["addtime"] %></td>
                        <td align="center">
                            
                                                                                    <a href="Student_updt.aspx?id=<%= map["id"] %>">修改</a>
                            <a href="?a=delete&id=<%= map["id"] %>" onclick="return confirm('真的要删除？')">删除</a>
                            <!--qiatnalijne-->
                        </td>
                    </tr>
                    <% } %>
                    </tbody></table></div>
            
        <%= list.reader() %>
        


    </div>



</div>








</div>
<% Server.Execute("Foot.aspx"); %>
