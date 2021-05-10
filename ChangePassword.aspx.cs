using app.Dbs;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : AdminContent
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = Session["username"].ToString();
        string cx = Session["login"].ToString();
        string oldPassword = Request["ymm"];
        string newPwd = Request["xmm1"];
        string newPwd2 = Request["xmm2"];

        if ( !newPwd.Equals(newPwd2) ) {
            showError("两次密码不一致");
        }

        else if (cx.Equals("管理员"))
        {
                        Hashtable row = Db.name("administrators").@where("username" , username).@where("pwd" , oldPassword).find();
            if ( row.Count == 0 )
            {
                showError("原密码错误");
            }
                        row["pwd"] = newPwd;
            Db.name("administrators").update(row);
        }
        else if (cx.Equals("学生"))
        {
                        Hashtable row = Db.name("student").@where("username" , username).@where("pwd" , oldPassword).find();
            if ( row.Count == 0 )
            {
                showError("原密码错误");
            }
                        row["pwd"] = newPwd;
            Db.name("student").update(row);
        }
        else if (cx.Equals("教师"))
        {
                        Hashtable row = Db.name("teacher").@where("username" , username).@where("pwd" , oldPassword).find();
            if ( row.Count == 0 )
            {
                showError("原密码错误");
            }
                        row["pwd"] = newPwd;
            Db.name("teacher").update(row);
        }

        showSuccess("修改密码成功", "./ChangePassword.aspx");
    }
}


