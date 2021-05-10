<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_updt.aspx.cs" Inherits="Student_updt" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>
<script src="js/jquery.validate.js"></script>
<script src="js/datepicker/WdatePicker.js"></script>

<div style="padding: 10px">



<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->
<div class="panel panel-default">
        <div class="panel-heading">
            编辑学生:
        </div>
        <div class="panel-body">
            <form action="Student_updt.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">用户名<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="请填写用户名" remote="action.ashx?a=checkno&checktype=update&id=<%= mmm["id"] %>&table=student&col=username" data-msg-remote="内容重复了" id="username" name="username" value="<%= Info.html(mmm["username"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">姓名<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" data-rule-required="true" data-msg-required="请填写姓名" id="name" name="name" value="<%= Info.html(mmm["name"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">性别</label>
        <div class="col-sm-8">
            <select class="form-control class_sex4" data-value="<%= Info.html(mmm["sex"]) %>" id="sex" name="sex" style="width:250px"><option value="man">man</option><option value="woman">woman</option></select><script>
$(".class_sex4").val($(".class_sex4").attr("data-value"))</script></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">手机号</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" phone="true" data-msg-phone="请输入正确手机号码" id="phonenumber" name="phonenumber" value="<%= Info.html(mmm["phonenumber"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">出生日期</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" style="width:120px;" id="birth" name="birth" readonly="readonly" value="<%= Info.html(mmm["birth"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">邮箱</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" email="true" data-msg-email="请输入有效邮件地址" id="email" name="email" value="<%= Info.html(mmm["email"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">身份证号</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:150px;" idcard="true" data-msg-email="请输入有效身份证号码" id="idnumbe" name="idnumbe" value="<%= Info.html(mmm["idnumbe"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">地址</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:250px;" id="addr" name="addr" value="<%= Info.html(mmm["addr"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2"> </label>
        <div class="col-sm-8">
            <input name="id" value="<%= mmm["id"] %>" type="hidden"/><input name="referer" value="<%= Request.Headers["referer"] %>" type="hidden"/><input name="updtself" value="<%= updtself %>" type="hidden"/><button type="submit" class="btn btn-primary" name="Submit">
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
