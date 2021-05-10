using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using app.Util;
using app.Dbs;

public partial class Testresult_detail : AppContent
{
    protected Hashtable map = null;

    
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Req.get("id");
        map = Db.name("testresult").find(id);

        }


}