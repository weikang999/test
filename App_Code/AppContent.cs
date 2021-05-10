using app.Util;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.SessionState;

/// <summary>
/// AppContent 的摘要说明
/// </summary>
abstract public class AppContent : System.Web.UI.Page
{
    public bool checkLogin()
    {
        return Session["username"] != null && !Session["username"].Equals("");
    }


    virtual public void showMessage(string message , string uri = "history.go(-1)")
    {
        Response.Clear();
        Response.Write("<script>");
        Response.Write("alert('"+message+"');");
        if (uri.Equals("history.go(-1)"))
        {
            Response.Write(uri);
        }
        else 
        {
            Response.Write("location.href='"+uri+"'");
        }
        Response.Write("</script>");
        Response.End();
    }

    virtual public void showSuccess(string message , string uri = "")
    {
        if (uri == null || uri.Equals(""))
        {
            uri = Request.Headers["referer"];
        }
        showMessage(message, uri);
    }

    virtual public void showError(string message)
    {
        showMessage(message);
    }


    protected Hashtable getRequestForm()
    {
        Hashtable table = new Hashtable();
        setTable(table, Request.QueryString);
        setTable(table, Request.Form);
        return table;
    }

    private void setTable(Hashtable table, NameValueCollection form)
    {
        for (int i = 0; i < form.Count; i++)
        {
            var name = form.GetKey(i);
            var value = form.GetValues(i);
            table.Add(name, StringUtil.join(",", value));
        }
    }

    protected void InvokeAction()
    {
        if (Request["a"] != null)
        {
            string action = Request["a"];
            Type obj = this.GetType();
            MethodInfo method = obj.GetMethod(action);
            if (method != null)
            {
                object result = null;
                try
                {
                    result = method.Invoke(this, null);
                }
                catch (TargetInvocationException ex)
                {
                    Console.WriteLine(ex.GetBaseException().Message);
                    return;
                }


                if (result != null)
                {
                    Response.Write(result);
                }
                Response.End();
            }
            
        }
    }

}