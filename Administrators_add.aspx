<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administrators_add.aspx.cs" Inherits="Administrators_add" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px">



<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->
<div class="panel panel-default">
        <div class="panel-heading">
            添加管理员:
        </div>
        <div class="panel-body">
            <form action="Administrators_add.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">帐号<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="请填写帐号" remote="action.ashx?a=checkno&checktype=insert&table=administrators&col=username" data-msg-remote="内容重复了" id="username" name="username" value=""/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">密码<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            <input type="password" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="请填写密码" id="pwd" name="pwd" value=""/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            <button type="submit" class="btn btn-primary" name="Submit">
    提交</button><button type="reset" class="btn btn-default" name="Submit2">
    重置</button></div>
    </div>
</div><!--form标签结束--></form></div>
    </div>
<!-- container定宽，并剧中结束 --></div>
<script>
    $(function () {
        $('#form1').validate();
    });
</script></div>
<% Server.Execute("Foot.aspx"); %>
