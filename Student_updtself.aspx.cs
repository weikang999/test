using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Util;
using app.Dbs;
using System.Collections;


public partial class Student_updtself : AppContent
{
    protected Hashtable mmm = null;
    protected int updtself = 1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["f"] != null){
            handler();
            return;
        }
        var id = Session["id"];
        mmm = Db.name("student").find(id);
    }

    protected void handler()
    {
        var post = getRequestForm();

                Db.name("student").update(post);
        var charuid = post["id"];
            showSuccess("保存成功" , "Student_updtself.aspx");

    }

}