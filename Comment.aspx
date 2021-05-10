<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Comment.aspx.cs" Inherits="Comment" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>在线评论</title>
    <script type="">
        var index = parent.layer.getFrameIndex(window.name);
    </script>
    <style type="text/css">
        <!--
        body, td, th {
            font-size: 12px;
        }

        -->
    </style>
</head>

<body>

<script language="javascript"  type="text/javascript">
    function check() {
        if (document.form1.pinglunneirong.value == "") {
            alert("请输入评论内容");
            document.form1.pinglunneirong.focus();
            return false;
        }
        return true;
    }

</script>
<form action="Comment.aspx?a=insert" method="post" name="form1">
    <table width="100%" class="table table-insert">
        <tr style="display:none">
            <td>编号：</td>
            <td><input name='biaoid' type='text' id='biaoid' value='<%= Request["id"] %>' readonly="readonly"/>
                &nbsp;*
            </td>
        </tr>
        <tr>
            <td>评分：</td>
            <td><select name="pingfen" id="pingfen">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
            </td>
        </tr>
        <tr>
            <td>评论内容：</td>
            <td><textarea name='pinglunneirong' cols='50' rows='5' id='pinglunneirong'></textarea>
                &nbsp;*
            </td>
        </tr>
        <tr>
            <td>评论人：</td>
            <td><input name='pinglunren' type='text' id='pinglunren'
                       value="<%=Session["username"]%>"/>
                &nbsp;*
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <input name="biao" type="hidden" id="biao" value="<%=Request["biao"]%>"/>
                <input type="submit" name="Submit5" value="提交" onclick="return check();"/>
                <input type="reset" name="Submit22" value="重置"/>


            </td>
        </tr>

    </table>
</form>
</body>
</html>
