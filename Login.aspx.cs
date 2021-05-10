using app.Dbs;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : AppContent
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if( Request["ac"] != null )
        {
            string username = Request.Form["username"];
            string password = Request.Form["pwd"];
            string cx       = Request.Form["cx"];
            authLoginUser(Request["ac"].Equals("adminlogin") , username , password , cx );
        }
    }

    protected void authLoginUser(bool isAdmin, string username, string pwd, string cx)
    {
        if (string.IsNullOrEmpty(username))
        {
            showMessage("账号不允许为空");
        }

        if (string.IsNullOrEmpty(pwd))
        {
            showError("密码不允许为空");
        }

        if (string.IsNullOrEmpty(cx))
        {
            showError("请选择登录类型");
        }

        object random = Session["random"];
        string pagerandom = Request.Form["pagerandom"];
        string captch = Request.Params["captch"];
        if (!string.IsNullOrEmpty(captch))
        {
            if (string.IsNullOrEmpty(pagerandom))
            {
                showError("请填写验证码");
            }
            if (!pagerandom.Equals(random))
            {
                showError("验证码不正确");
            }
        }

        Db db = new Db();
        bool issh = false;
        bool iscx = false;
        string usernameField = "username";

        if(cx.Equals("管理员"))
        {
                        usernameField = "username";
            db.setName("administrators").@where("username", username).@where("pwd", pwd);
                                }
        if(cx.Equals("学生"))
        {
                        usernameField = "username";
            db.setName("student").@where("username", username).@where("pwd", pwd);
                                }
        if(cx.Equals("教师"))
        {
                        usernameField = "username";
            db.setName("teacher").@where("username", username).@where("pwd", pwd);
                                }

        Hashtable data = db.find();
        if (data.Count == 0)
        {
            showError("帐号或密码错误");
        }
        if (issh && !data["issh"].Equals("是"))
        {
            showError("帐号审核中，请联系管理员审核");
        }

        Session.Clear();
        Session["username"] = data[usernameField];
        Session["cx"] = iscx ? data["cx"] : cx;
        Session["login"] = cx;
        foreach (var key in data.Keys)
        {
            string k = (string)key;
            Session[k] = data[key];
        }
        if (isAdmin)
        {
            showSuccess("登录成功", "main.aspx");
        }
        var referer = Request.Params["referer"] != null ? Request.Params["referer"] : "./";
        showSuccess("登录成功", referer);
    }

}