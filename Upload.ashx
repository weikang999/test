<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;
using System.IO;
using System.Collections.Generic;
using app.Util;
public class Upload : ActionBase {
    
    public object upload()
    {
        var Server = _context.Server;
        string savePath = ("upload/" + Info.date("yyyyMM") + "/");
        if (!Directory.Exists(Server.MapPath(savePath)))
        {
            Directory.CreateDirectory(Server.MapPath(savePath));
        }

        List<string> list = new List<string>();

        foreach (string file in Request.Files.Keys)
        {
            HttpPostedFile ff = Request.Files.Get(file);
            if (ff != null && ff.ContentLength != 0)
            {
                string filename = ff.FileName;
                string extension = System.IO.Path.GetExtension(filename);
                TimeSpan ts = DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0);
                string newFile = Convert.ToInt64(ts.TotalMilliseconds).ToString() + Info.randomNumber(5).ToString() + extension;

                ff.SaveAs(Server.MapPath(savePath + newFile));
                list.Add(savePath + newFile);
            }
        }

        if (list.Count == 0)
        {
            showError("没有找到上传文件");
        }
        Session["uploadFile"] = fastJSON.JSON.ToJSON(list);
        
        StringWriter write = new StringWriter();
        Server.Execute("UploadRe.aspx", write , true);
        return write.ToString();
    }

    public object umeditor()
    {
        var Server = _context.Server;
        string savePath = ("upload/" + Info.date("yyyyMM") + "/");
        if (!Directory.Exists(Server.MapPath(savePath)))
        {
            Directory.CreateDirectory(Server.MapPath(savePath));
        }
        
        HttpPostedFile ff = Request.Files.Get("upfile");
        if (ff != null && ff.ContentLength != 0)
        {
            string filename = ff.FileName;
            string extension = System.IO.Path.GetExtension(filename);
            TimeSpan ts = DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            string newFile = Convert.ToInt64(ts.TotalMilliseconds).ToString() + Info.randomNumber(5).ToString() + extension;

            ff.SaveAs(Server.MapPath(savePath + newFile));
            //list.Add(savePath + newFile);
            Dictionary<string, object> msg = new Dictionary<string, object>();
            
            msg.Add("name" , ff.FileName);
            msg.Add("originalName" , ff.FileName);
            msg.Add("size" , ff.ContentLength);
            msg.Add("state" , "success");
            msg.Add("type" , ff.ContentType);
            msg.Add("url", savePath + newFile);
            return msg;
        }
        
        showError("没有找到上传文件");
        return "";
    }
    
}