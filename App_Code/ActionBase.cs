using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.SessionState;

/// <summary>
/// ActionBase 的摘要说明
/// </summary>
abstract public class ActionBase : AjaxAction ,IHttpHandler, IRequiresSessionState
{
    protected HttpContext _context = null;

    private void initContext(HttpContext context)
    {
        _context = context;
    }

    public bool IsReusable {
        get {
            return true;
        }
    }



    public override HttpRequest Request
    {
        get
        {
            if (_context != null)
            {
                return _context.Request;
            }
            throw new Exception("Context null init");
            //return null;
        }
    }

    public override HttpResponse Response
    {
        get
        {
            if (_context != null)
            {
                return _context.Response;
            }
            throw new Exception("Context null init");
            //return null;
        }
    }
    public override HttpSessionState Session
    {
        get
        {
            if (_context != null)
            {
                return _context.Session;
            }
            throw new Exception("Context null init");
            //return null;
        }
    }

    virtual public void ProcessRequest(HttpContext context)
    {
        initContext(context);
        try
        {
            processInit(context);
            string action = Request["a"];
            if (action != null)
            {
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
                        throw ex.GetBaseException();
                    }

                    if (result != null)
                    {
                        if (result is Hashtable || result is Dictionary<string, object>)
                        {
                            throw new ResponseResult(Response, result, ResultType.JSON);
                        }
                        else
                        {
                            throw new ResponseResult(Response, result, ResultType.BODY);
                        }
                    }
                }
                
            }
            
            
        }
        catch (ResponseResult res) 
        {
            string content = res.output();
            
            Response.Write(content);
            Response.End();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }
    }

    virtual public void processInit(HttpContext context) {}


    protected void Redirect(string uri)
    {
        Response.Redirect(uri);
    }



    public void showMessage(string message, string uri = "history.go(-1)")
    {
        StringBuilder str = new StringBuilder();

        str.Append("<script>");
        str.Append("alert('" + message + "');");
        if (uri.Equals("history.go(-1)"))
        {
            str.Append(uri);
        }
        else
        {
            str.Append("location.href='" + uri + "'");
        }
        str.Append("</script>");
        Response.Write(str.ToString());
        Response.End();
        //throw new ResponseResult(Response,str.ToString() ,ResultType.BODY );
    }

    public void showSuccess(string message, string uri = "")
    {
        if (uri == null || uri.Equals(""))
        {
            uri = Request.Headers["referer"];
        }
        showMessage(message, uri);
    }

    public void showError(string message)
    {
        showMessage(message);
    }

    public bool checkLogin()
    {
        return Session["username"] != null && !Session["username"].Equals("");
    }

}