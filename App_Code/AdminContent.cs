using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// AdminContent 的摘要说明
/// </summary>
public class AdminContent : AppContent
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        object username = Session["username"];
        if (username == null || username.Equals(""))
        {
            showError("尚未登录");
        }

    }
    
}