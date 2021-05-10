using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Dbs;
using app.Util;

public partial class Admin : AdminContent
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InvokeAction();
    }
    
    public void insert()
    {
        var post = getRequestForm();
        post["addtime"] = Info.getDateStr();
        post["cx"] = "普通管理员";
        Db.name("allusers").insert(post);
        showSuccess("添加成功" , Request.Headers["referer"]);
    }
    
    public void delete()
    {
        string id = Request["id"];
        string sql = "DELETE FROM allusers WHERE id='"+id+"'";
        app.Dbs.Dao.execute(sql);
        showSuccess("删除成功",Request.Headers["referer"]);
    }



}