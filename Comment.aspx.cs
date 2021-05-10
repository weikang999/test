using app.Dbs;
using app.Util;
using System;
using System.Collections;


public partial class Comment : AppContent
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!checkLogin())
        {
            showMessage("尚未登录");
        }
        InvokeAction();
    }


    public void insert()
    {
        Hashtable hashtable = getRequestForm();
        hashtable["addtime"] = Info.getDateStr();
        Db.name("pinglun").insert(hashtable);
        showSuccess("评论成功");
    }
}
