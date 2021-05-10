using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Util;
using app.Dbs;
using System.Collections;


public partial class Result_add : AppContent
{
    protected Hashtable readMap = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["f"] != null){
            handler();
            return;
        }
        var id = Req.get("id");
        readMap = Db.name("subject").find(id);
    }

    protected void handler()
    {
        var post = getRequestForm();

                post["addtime"] = Info.getDateStr();
                var charuid = Db.name("result").insert(post);
            showSuccess("保存成功" , Req.get("referer").Equals("") ? Request.Headers["referer"] : Req.get("referer"));

    }

}