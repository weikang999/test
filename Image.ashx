<%@ WebHandler Language="C#" Class="Image" %>

using System;
using System.Web;
using app.Util;
using System.Web.SessionState;

public class Image : IHttpHandler, IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "image/gif";

        Captch captch = new Captch();
        string code = captch.GetRandomCode(4);
        context.Session["random"] = code;

        byte[] bytes = captch.GetVCode(code);

        context.Response.BinaryWrite(bytes);
        context.Response.End();
        
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}