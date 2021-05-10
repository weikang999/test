<%@ WebHandler Language="C#" Class="Sh" %>

using System;
using System.Web;
using app.Util;
using app.Dbs;

public class Sh : ActionBase
{
    public override void processInit(HttpContext context) {
        string yuan = Request["yuan"];
        string id = Request["id"];
        string tablename = Request["tablename"];
        string value = yuan.Equals("是") ? "否" : "是";
        Db.name(tablename).@where("id", id).setField("issh", value);
        Redirect(Request.Headers["referer"]);
    }
}