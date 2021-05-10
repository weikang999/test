<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuestionInfo_updt.aspx.cs" Inherits="QuestionInfo_updt" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>

<% Server.Execute("Head.aspx"); %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px">



<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->
<div class="panel panel-default">
        <div class="panel-heading">
            编辑题库:
        </div>
        <div class="panel-body">
            <form action="QuestionInfo_updt.aspx?f=f" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    <div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">科目编号</label>
        <div class="col-sm-8">
            
                                                    <%= mmm["courseId"] %><input type="hidden" id="courseId" name="courseId" value="<%= Info.html(mmm["courseId"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">科目名称</label>
        <div class="col-sm-8">
            
                                                    <%= mmm["coursename"] %><input type="hidden" id="coursename" name="coursename" value="<%= Info.html(mmm["coursename"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">发布人</label>
        <div class="col-sm-8">
            
                                                    <%= mmm["publisher"] %><input type="hidden" id="publisher" name="publisher" value="<%= Info.html(mmm["publisher"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">试题题目<span style="color: red;">*</span></label>
        <div class="col-sm-8">
            <input type="text" class="form-control" style="width:250px;" data-rule-required="true" data-msg-required="请填写试题题目" id="question" name="question" value="<%= Info.html(mmm["question"]) %>"/></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">类型</label>
        <div class="col-sm-8">
            <select class="form-control class_type4" data-value="<%= Info.html(mmm["type"]) %>" id="type" name="type" style="width:250px"><option value="单选题">单选题</option><option value="多选题">多选题</option></select><script>
$(".class_type4").val($(".class_type4").attr("data-value"))</script></div>
    </div>
</div><div class="form-group">
    <div class="row">
        <label style="width: 120px;min-height:18px;text-align: right" class="col-sm-2">答案</label>
        <div class="col-sm-8">
            <div id="TypeFieldabc">
                    <div style="border: 1px solid #ededed; border-radius: 5px; padding: 10px; background: #F2F2F2;">
                        <table class="table table-hover"><thead><tr><th width="80"> </th>
                                <th>答案</th>
                                <!--<th width="80">跳转序号</th>-->
                                <th width="60">得分</th>
                            </tr></thead><tbody id="field_box"></tbody></table></div>
                    <button type="button" class="btn btn-default btn-sm" id="add_btn">增加答案</button>
                </div>
                <input type="hidden" id="answer" name="answer"/><script>
    function selectType(obj)
    {
        var v = $(obj).val();
        if(v=='单选题' || v=='多选题'){
            $('#TypeFieldabc').show();
        }else{
            $('#TypeFieldabc').hide();
        }
    }
    
    function updateZimu()
    {
        var zimu = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        var index = $("#field_box").find("tr").each(function(index){
            $(this).find('td:eq(0)').find('input').val(zimu.substr(index,1));
        });
    }
    
    function addFieldItem(wx){
        wx=wx||{};
        var str = [];
        str.push('<tr><td align="center" valign="middle">');
        str.push('<input type="text" readonly="readonly" style="width: 40px;" data-id="zimu" class="form-control" value="" />');
        str.push('</td><td>');
        str.push('<input type="text" style="width:100%" onblur="updateData()" data-id="title" class="form-control" value="'+(wx.title||'')+'" />');
        str.push('</td><td>');
        
        str.push('<input type="number" step="1" style="width: 60px;" onblur="updateData()" data-id="point" class="form-control" value="'+(wx.point||'0')+'" />');
        str.push('</td><td>');
        
        str.push('<button onclick="delItem(this);" type="button" class="btn btn-default">删除</button>');
        str.push('</td></tr>');
        var html = str.join('');
        $('#field_box').append(html);
        updateZimu();
    }
    
    function delItem(obj){
        if(confirm('此操作将不可恢复，您确定删除？')){
            $(obj).parent().parent().remove();
        }
        updateZimu();
    }
    $(function(){
        var __fields = <%= mmm["answer"] %>;
        if(__fields.length>0){
            $.each(__fields , function(){
                addFieldItem(this);
            });
        }else{
            addFieldItem();
        }
    });

    function updateData()
    {
        var result = [];
        $('#field_box').find('tr').each(function () {
            var obj = {};
            $(this).find('[data-id]').each(function () {
                if($(this).attr('type') == 'checkbox') {
                    obj[$(this).attr('data-id')] = $(this).attr('checked')
                }else{
                    obj[$(this).attr('data-id')] = $.trim($(this).val());
                }
            });
            if(obj.title != '' && obj.point != ''){
                result.push(obj);
            }
        });
        $('#answer').val(JSON.stringify(result));
    }
    
    $('#TypeFieldabc').on('input,checkbox' , 'blur,change' , function (e) {
        console.log(e);
    })
    
    $('#add_btn').click(addFieldItem);
    $('#form1').submit(function () {
        updateData();
        return true;
    })

</script></div>
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
