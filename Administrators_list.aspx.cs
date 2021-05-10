using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Util;
using app.Dbs;

public partial class Administrators_list : AppContent
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
                if(!Req.get("username").Equals("")) {
            where += " AND username LIKE '%"+Req.get("username")+"%' ";
        }
        return where;
    }

    public object getList()
    {
        where   =  getWhere();
        orderby =  Req.get("order" , "id");
        sort    =  Req.get("sort" , "desc");

                        var     query = Db.name("administrators").@where(where).order(orderby,sort);
        list    = query.page(12);

        
        return fastJSON.JSON.ToJSON(list);
    }

    // GET administrators_list.aspx?a=delete
    // 删除数据
    public void delete()
    {
        string id = Request["id"];
        string sql = "DELETE FROM administrators WHERE id='"+id+"'";
        var dmap = Db.name("administrators").find(id);
                Dao.execute(sql);
                showSuccess("删除成功");
    }

    
    }
