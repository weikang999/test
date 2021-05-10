<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Subject_detail.aspx.cs" Inherits="Subject_detail" %>
<%@ Import Namespace="app.Dbs" %>
<%@ Import Namespace="app.Util" %>
<%@ Import Namespace="fastJSON" %>

<% Server.Execute("Head.aspx"); %>

<link rel="stylesheet" href="js/layer/theme/default/layer.css">
<script src="js/layer/layer.js"></script>

<div style="padding: 10px">


    <style>
    .admin-detail {
        display: flex;
        flex-wrap: wrap;
    }
    .admin-detail .detail {
        width: 50%;
        padding: 5px;
        display: flex;
        margin-bottom: 10px;
        border-bottom: 1px solid #DEDEDE;
    }
    .admin-detail .detail .detail-title {
        width: 120px;
        text-align: right;
    }
    .admin-detail .detail .detail-content {
        flex-grow: 1;
    }
    .admin-detail .detail.detail-editor {
        width: 100%;
        flex-wrap: wrap;
    }
    .admin-detail .detail.detail-editor .detail-title {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        background: #9a0606;
        color: #ffffff;
        text-align: left;
    }
    .admin-detail .detail.detail-editor .detail-content{
        padding: 10px;
    }

</style>
    <div class="panel panel-default">
        <div class="panel-heading">
            在线考试
        </div>
        <div class="panel-body">

            <div class="admin-detail clearfix">
                <div class="detail detail-text">
                    <div class="detail-title">
                        科目编号：
                    </div>
                    <div class="detail-content">
                        <%= map["courseId"] %>
                    </div>
                </div>
                <div class="detail detail-longtext">
                    <div class="detail-title">
                        科目名称：
                    </div>
                    <div class="detail-content">
                        <%= map["coursename"] %>
                    </div>
                </div>
                <div class="detail detail-textuser">
                    <div class="detail-title">
                        发布人：
                    </div>
                    <div class="detail-content">
                        <%= map["publisher"] %>
                    </div>
                </div>
            </div>


            <div style="clear: both;height: 30px"></div>
            <style>
                    #zhangjielianxi {
                        padding: 20px;
                        background: #f2f2f2;
                    }
                    #zhangjielianxi div {
                        padding: 20px;
                    }
                    #zhangjielianxi div h3 {
                        margin-bottom: 8px;
                    }
                </style>
            <form action="javascript:;" onsubmit="submitZhangjie()" class="clearfix">
                <div class="clearfix" style="">
                    <%
                        List<Hashtable> wenda = Dao.select("SELECT * FROM questionInfo WHERE subjectid='" + map["id"] + "' ORDER BY id asc");
                    %>
                    <div id="zhangjielianxi">

                    </div>
                    <div style="margin-top: 10px; text-align: left; padding-left: 50px">

                    </div>
                </div>
                <div class="button-list">
                    <div class="">
                        <button onclick="history.go(-1);" type="button" class="btn btn-default">返回</button>
                        <button onclick="window.print()" type="button" class="btn btn-default">打印本页</button>
                        <input type="reset" name="Submit2" value="重置" class="btn btn-default"/>
                        <button class="btn btn-primary" type="submit">提交考试</button>
                    </div>
                </div>
            </form>

            <div id="div"
                 style="position: fixed;bottom: 0px;padding: 10px;background: #f2f2f2; color: red; text-align: center;">
            </div>

            <script>
                    var starttime = new Date().getTime() / 1000 ;

                    (function () {
                        var fenshu = 5; // 分钟数
                        var key = "stopTime<%= Request["id"] %>";
                        var stopTime = sessionStorage.getItem(key);
                        if (stopTime && new Date().getTime() > stopTime) {
                            stopTime = (new Date().getTime()) + 60 * fenshu * 1000;
                        }
                        stopTime = stopTime || (new Date().getTime()) + 60 * 20 * 1000;
                        sessionStorage.setItem(key, stopTime);
                        stopTime = new Date(Math.floor(stopTime));

                        function clock() {
                            if (new Date().getTime() > stopTime) {
                                submitZhangjie();
                                return;
                            }
                            var today = new Date(),//当前时间
                                h = today.getHours(),
                                m = today.getMinutes(),
                                s = today.getSeconds();
                            var stopH = stopTime.getHours(),
                                stopM = stopTime.getMinutes(),
                                stopS = stopTime.getSeconds();
                            var shenyu = stopTime.getTime() - today.getTime(),//倒计时毫秒数
                                shengyuD = parseInt(shenyu / (60 * 60 * 24 * 1000)),//转换为天
                                D = parseInt(shenyu) - parseInt(shengyuD * 60 * 60 * 24 * 1000),//除去天的毫秒数
                                shengyuH = parseInt(D / (60 * 60 * 1000)),//除去天的毫秒数转换成小时
                                H = D - shengyuH * 60 * 60 * 1000,//除去天、小时的毫秒数
                                shengyuM = parseInt(H / (60 * 1000)),//除去天的毫秒数转换成分钟
                                M = H - shengyuM * 60 * 1000;//除去天、小时、分的毫秒数
                            var S = parseInt((shenyu - shengyuD * 60 * 60 * 24 * 1000 - shengyuH * 60 * 60 * 1000 - shengyuM * 60 * 1000) / 1000)//除去天、小时、分的毫秒数转化为秒
                            document.getElementById("div").innerHTML = (shengyuH + "小时" + shengyuM + "分" + S + "秒" + "<br>");
                            // setTimeout("clock()",500);
                            setTimeout(clock, 500);
                        }
                        $(clock);
                    })();
                </script>
            <% if (wenda.Count > 0)
               { %>
                <script>
                            (function () {
                                var json = <%= JSON.ToJSON(wenda) %>;
                                var result = "";
                                var j = 1;
                                $.each(json, function () {
                                    result += '<div data-j="' + j + '" data-type="' + this.type + '" class="zhangjie-list" style="margin-bottom: 10px; padding: 10px; background: #fff">' +
                                        '<h5 data-question="' + this.question + '">第' + j + '题：' + this.question + '</h5>' +
                                        '<div>';
                                    if (this.type == '单选题' || this.type == '判断题') {
                                        var answer = JSON.parse(this.answer);
                                        $.each(answer, function () {
                                            result += '<label><input type="radio" name="answer' + j + '" data-point="' + this.point + '" data-title="' + this.zimu + '、' + this.title + '" value="' + this.zimu + '"  /> ' + this.zimu + ' ' + this.title + ' </label> ';
                                        });
                                    }else if (this.type == '多选题') {
                                         var answer = JSON.parse(this.answer);
                                         $.each(answer, function () {
                                             result += '<label><input type="checkbox" name="answer' + j + '" data-point="' + this.point + '" data-title="' + this.zimu + '、' + this.title + '" value="' + this.zimu + '" /> ' + this.zimu + ' ' + this.title + ' </label> ';
                                         });
                                     } 
                                    
                                   
                                    result += '</div>';
                                    result += '</div>';
                                    j++;
                                });
                                $('#zhangjielianxi').html(result);
                            })();
                        
                            function submitZhangjie() {
                                var result = [];
                                var isOk = true;
                                $('#zhangjielianxi>.zhangjie-list').each(function () {
                                    if (!isOk) return;
                                    var obj = {};
                                    var that = $(this);
                                    obj.question = $(this).find('h5').attr("data-question");
                                    var j = that.attr("data-j");
                                    var type = that.attr("data-type");
                                    obj.type = type;
                                    
                                    //var res = that.find('[name="answer'+j+'"]');
                                    if (type == "单选题" || type == '判断题') {
                                        var radio = that.find('[name="answer' + j + '"]:checked');
                                        if (radio.length == 0) {
                                            alert('请选择【' + obj.question + '】的题目答案');
                                            isOk = false;
                                            return;
                                        }
                                        obj.answer = radio.attr('data-title');
                                        obj.score = radio.attr('data-point');
                                        obj.letter = radio.val();
                                    } else if (type == "多选题") {
                                        var checkbox = that.find('[name="answer' + j + '"]:checked');
                                        if (checkbox.length == 0) {
                                            alert('请选择【' + obj.question + '】的题目答案');
                                            isOk = false;
                                            return;
                                        }
                                        var score = 0;
                                        var answer = [];
                                        var letter = [];
                                        checkbox.each(function () {
                                            answer.push($(this).attr('data-title'));
                                            score += Math.floor($(this).attr('data-point'));
                                            letter.push(this.value);
                                            //obj.score = radio.attr('data-point');
                                        });
                                        obj.answer = answer.join(",");
                                        obj.score = score;
                                        obj.letter = letter.join(",");
                                    } else {
                                        answer = that.find('[name="answer' + j + '"]').val();
                                        obj.score = -1;
                                    }
                                    result.push(obj);
                                });
                                if (!isOk) {
                                    return false;
                                }
                                var index = layer.load(0, {
                                    shade: [0.5, '#000'] //0.1透明度的白色背景
                                });
                                $.post("result_insert.ashx?a=insert", {
                                    JSON: JSON.stringify(result),
                                    kechengxinxiid:<%= Request["id"] %>
                                }, function (res) {
                                    layer.close(index);
                                    if (res.code == 0) {
                                        layer.alert("提交成功", function () {
                                            location.href = 'testresult_detail.aspx?id=' + res.data;
                                        });
                                    } else {
                                        layer.alert(res.msg);
                                    }
                                }, 'json');
                                return false;
                            }
                        
                        </script>
            <% } %>
            
            
        </div>
    </div>


</div>
<% Server.Execute("Foot.aspx"); %>