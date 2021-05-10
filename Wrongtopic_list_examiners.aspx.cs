using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Util;
using app.Dbs;

public partial class Wrongtopic_list_examiners : AppContent
{
    // sql 查询条件
    protected string where = "";
    // sql 语句 order by 排序语句
    protected string orderby = "";
    // sql 语句 只有 desc 和 asc 两个选项，desc 从大到小排序，asc 从小到大排序
    protected string sort = "";
        protected Collect<Hashtable> list = null;
        
    protected void Page_Load(object sender, EventArgs e)
    {
                InvokeAction();
        getList();
    }

    public string getWhere()
    {
        string where = " 1=1 ";
                if(Req.getInt("subjectid")>0){
            where += " AND subjectid='"+Req.getInt("subjectid")+"' ";
        }
                if(!Req.get("courseId").Equals("")) {
            where += " AND courseId LIKE '%"+Req.get("courseId")+"%' ";
        }
        if(!Req.get("coursename").Equals("")) {
            where += " AND coursename LIKE '%"+Req.get("coursename")+"%' ";
        }
        if(!Req.get("question").Equals("")) {
            where += " AND question LIKE '%"+Req.get("question")+"%' ";
        }
        if(!Req.get("answer").Equals("")) {
            where += " AND answer LIKE '%"+Req.get("answer")+"%' ";
        }
        return where;
    }

    public object getList()
    {
        where   =  getWhere();
        orderby =  Req.get("order" , "id");
        sort    =  Req.get("sort" , "desc");

                            where += " AND examiners='"+Session["username"]+"' ";
                var     query = Db.name("wrongtopic").@where(where).order(orderby,sort);
        list    = query.page(12);

        
        return fastJSON.JSON.ToJSON(list);
    }

    // GET wrongtopic_list.aspx?a=delete
    // 删除数据
    public void delete()
    {
        string id = Request["id"];
        string sql = "DELETE FROM wrongtopic WHERE id='"+id+"'";
        var dmap = Db.name("wrongtopic").find(id);
                Dao.execute(sql);
                showSuccess("删除成功");
    }

    
    }
