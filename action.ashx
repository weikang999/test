<%@ WebHandler Language="C#" Class="action" %>

using System;
using System.Web;
using System.Web.SessionState;
using app.Common;
using app.Util;
using app.Dbs;
using System.Collections.Generic;
using fastJSON;

public class action : ActionBase
{
    override public void processInit(HttpContext context)
    {
        
    }

    public object table()
    {
        string table = Request["table"];
        string id = Request["id"];
        System.Collections.Hashtable map = Db.name(table).@where("id", id).find();
        return map;
    }

    public object checkno()
    {
        string table = Req.get("table");
        string col = Req.get("col");
        string value = Req.get(col);
        string checktype = Req.get("checktype");
        //string valuecopy = "";

        string result = "";
        if (checktype.Equals("insert"))
        {
            result = Db.name(table).@where(col, value).count() > 0 ? "false" : "true";
        }
        else if (checktype.Equals("update"))
        {
            string id = Request.Params.Get("id") == null ? "" : Request.Params.Get("id");
            result = Db.name(table).@where(col, value).@where("id", "neq", id).count() > 0 ? "false" : "true";
        }
        return result;
    }
    
    public object selectUpdateSearch()
    {
        var table = Request["table"];
        Db query = Db.name(table);
        Dictionary<string, object> where = (Dictionary<string, object>)fastJSON.JSON.Parse(Request["where"]);
        foreach (string key in where.Keys)
        {
            object value = where[key];
            if (value is List<object>)
            {
                var exp = (List<object>)value;
                query.@where(key, exp[0].ToString(), exp[1]);
            }
            else if (value is Dictionary<string, object>)
            {
                var exp = (Dictionary<string, object>)value;
                query.@where(key, exp["exp"].ToString(), exp["value"]);
            }
            else
            {
                query.@where(key, value);
            }
        }


        List<System.Collections.Hashtable> list = query.order("id desc").limit(50).@select();

        return JSON.ToJSON( list);
    }

    public void logout()
    {
        Session.Remove("id");
        Session.Remove("username");
        Session.Remove("cx");
        Session.Clear();
        showMessage("退出成功" , "./");
    }
    
    
}