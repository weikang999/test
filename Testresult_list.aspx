<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Testresult_list.aspx.cs" Inherits="Testresult_list" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>

<div style="padding: 10px">


    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="module-name">
                考试成绩
            </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" action="?">
                    <!-- form 标签开始 -->
                    <div class="form-group">

                        <i class="glyphicon glyphicon-search"></i>
                    </div>
                    <div class="form-group">
                        科目编号
                        <input type="text" class="form-control" style="" name="courseId" value="<%= Request["courseId"] %>"/>
                    </div>
                    <div class="form-group">
                        科目名称
                        <input type="text" class="form-control" style="" name="coursename" value="<%= Request["coursename"] %>"/>
                    </div>
                    <div class="form-group">
                        考试人
                        <input type="text" class="form-control" style="" name="examiners" value="<%= Request["examiners"] %>"/>
                    </div>
                    <select class="form-control" name="order" id="orderby">
                        <option value="id">按发布时间</option>
                    </select>
                    <select class="form-control" name="sort" id="sort">
                        <option value="desc">倒序</option><option value="asc">升序</option>
                    </select><script>$("#orderby").val("<%= orderby %>");$("#sort").val("<%= sort %>");</script>
                    <button type="submit" class="btn btn-default">
                        搜索
                    </button><!--form标签结束-->
                </form>
            </div>


            <div class="">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th> 科目编号 </th>
                        <th> 科目名称 </th>
                        <th> 发布人 </th>
                        <th> 单选题得分 </th>
                        <th> 多选题得分 </th>
                        <th> 总得分 </th>
                        <th> 考试人 </th>
                        <th width="180" data-field="addtime">添加时间</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int i = 0;
                        foreach (Hashtable map in list)
                        {
                            i++;
                    %>
                        <tr id="<%= map["id"] %>" pid="">
                            <td width="30" align="center">
                                <label>
                                    <%= i %>
                                </label>
                            </td>
                            <td> <%= map["courseId"] %> </td>
                            <td> <%= map["coursename"] %> </td>
                            <td> <%= map["publisher"] %> </td>
                            <td> <%= map["MultipleChoiceScore"] %> </td>
                            <td> <%= map["MultipleChoiceQuestionScore"] %> </td>
                            <td> <%= map["TotalScore"] %> </td>
                            <td> <%= map["examiners"] %> </td>
                            <td align="center"><%= map["addtime"] %></td>
                            <td align="center">

                                <a href="Testresult_detail.aspx?id=<%= map["id"] %>">
                                    详细
                                </a>
                                <a href="Testresult_updt.aspx?id=<%= map["id"] %>">修改</a>
                                <a href="?a=delete&id=<%= map["id"] %>" onclick="return confirm('真的要删除？')">删除</a>
                                <!--qiatnalijne-->
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

            <%= list.reader() %>



        </div>


    </div>


</div>
<% Server.Execute("Foot.aspx"); %>