using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Security.Policy;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Routing;
using app.Util;
using app.Dbs.Collects;

namespace app.Dbs
{
    public class Collect<T> : List<T> , ICollect<T>
    {
        
        protected long count = 0;
        protected int page = -1;
        protected int pageCount = 0;
        public int firstRow = 0;
        public int listRows = 15;
        protected string urlRule = "";
        protected Page p;
        public int rollPage = 2; // 两边页码数量
        
        
        public Collect(long count, int pagesize) : this(count , pagesize , -1)
        {
            
        }
        
        public Collect(long count, int pagesize, int page) : base( Convert.ToInt32( count))
        {
            this.listRows = pagesize;
            this.count = count;
            this.page = page == -1 ? Req.getInt("page" , 1) : page;

            getPageMessage();
            //readerPage();
        }

        protected void getPageMessage()
        {
            this.pageCount = count == 0 ? 0 : Convert.ToInt32( Math.Ceiling( Convert.ToDouble( count) / Convert.ToDouble(listRows)));
            firstRow = listRows*(page-1);
        }

        virtual public string reader()
        {
            string buffer = "";
            string urlRule = getUrlRule();
            Uri url = new Uri(urlRule);
            HttpRequest request = HttpContext.Current.Request;
            buffer += "<form action=\""+url+"\" method=\"get\"><div class=\"pages\">";
            if (request.QueryString.Count > 0)
            {
                NameValueCollection values = request.QueryString;
                foreach (string key in values.AllKeys)
                {
                    if (key != "page")
                    {
                        buffer += "<input type=\"hidden\" name=\""+key+"\" value=\""+values[key]+"\" />";
                    }
                }
            }


            buffer += "<span>共" + (this.count) + ("条")+"&nbsp;";
            buffer += this.page + "/" + (this.pageCount) + "页</span>";
            buffer += getFirstPage();
            buffer += getPrevPage();
            buffer += getCenterPage();
            buffer += getNextPage();
            buffer += getLastPage();
            buffer += getSelect();

            buffer += ("</div></form>");
            return buffer;
        }

        virtual protected string getFirstPage()
        {
            string buffer = "<a href=\""+this.getUrlPath(1)+"\">第一页</a>";
            return buffer;
        }

        virtual protected string getPrevPage()
        {
            string buffer = "";
            if (page > 1)
            {
                var p = this.page - 1;
                buffer += ("<a href=\"") + (getUrlPath(p)) + ("\">上一页</a>");
            }
            return buffer;
        }

        virtual public Page readerPage()
        {
            if (p != null)
            {
                return p;
            }
            p = new Page();
            p.currentPage = page;
            p.pageCount = pageCount;
            p.totalCount = count;
            p.pageSize = listRows;
            p.isPrev = page > 1;
            p.isNext = page < pageCount;
            p.prevPage = page > 1 ? page - 1 : 1;
            p.nextPage = page < pageCount ? page + 1 : pageCount;


            List<int> list= new List<int>();
            if (rollPage > 0)
            {
                int show_nums = rollPage * 2 + 1;
                int i=0;
                if(pageCount <= show_nums){
                    for(i = 1;i<=pageCount;i++){
                        list.Add(i);
                    }
                }else if(page < (1+rollPage)){
                    for(i = 1;i<=show_nums;i++){
                        list.Add(i);
                    }
                }else if(page >= (pageCount - rollPage)){
                    for(i = pageCount - show_nums ; i <= pageCount ; i++){
                        list.Add(i);
                    }
                }else{
                    int start_page = page - rollPage;
                    int end_page = page + rollPage;
                    for(i = start_page ; i<=end_page ; i++){
                        list.Add(i);
                    }
                }
            }
            p.pageNumber = list;
            return p;
        }

        virtual protected string getCenterPage()
        {
            int rollPage = 2;
            int show_nums = rollPage * 2 +1;
            int i=0;
            List<int> list= new List<int>();

            if(pageCount <= show_nums){
                for(i = 1;i<=pageCount;i++){
                    list.Add(i);
                }
            }else if(page < (1+rollPage)){
                for(i = 1;i<=show_nums;i++){
                    list.Add(i);
                }
            }else if(page >= (pageCount - rollPage)){
                for(i = pageCount - show_nums ; i <= pageCount ; i++){
                    list.Add(i);
                }
            }else{
                int start_page = page - rollPage;
                int end_page = page + rollPage;
                for(i = start_page ; i<=end_page ; i++){
                    list.Add(i);
                }
            }

            string buffer = "";
            foreach (var j in list)
            {
                if(j == page){
                    buffer += ("<a href=\"javascript:;\" class=\"active\">"+j+"</a>");
                }else{
                    buffer += ("<a href=\"") + (this.getUrlPath(j)) + ("\">"+j+"</a>");
                }
            }
            return buffer;
        }

        virtual public string getNextPage()
        {
            string buffer = "";
            if (this.page < this.pageCount)
            {
                buffer += ("<a href=\"") + (getUrlPath(this.page + 1)) + ("\">下一页</a>");
            }
            return buffer;
        }

        virtual public string getLastPage()
        {
            string buffer = ("<a href=\"")+(this.getUrlPath(this.pageCount)) + ("\">尾页</a>");
            return buffer;
        }

        virtual protected string getSelect( )
        {
            string buffer = ("<select name=\"page\" onchange=\"this.form.submit()\">");
            for(int i=1;i<=pageCount;i++){
                buffer += ("<option value='"+i+"'"+(page==i?" selected":"")+">"+i+"</option>");
            }
            buffer += ("</select>");
            return buffer;
        }


        virtual public string getUrlPath(int p)
        {
            return this.urlRule.Replace("{page}", p.ToString());
        }



        virtual public string getUrlRule()
        {
            if (!urlRule.Equals(""))
            {
                return urlRule;
            }
            HttpRequest request = HttpContext.Current.Request;
            string uri = request.Url.AbsoluteUri;
            Regex regex = new Regex(@"page=([0-9]+)");
            Match match = regex.Match(uri);
            if (match.Success)
            {
                uri = regex.Replace(uri, "page={page}");
            }
            else
            {
                this.page = 1;
                uri += (uri.IndexOf("?") >= 0 ? "&" : "?") + "page={page}";
            }
            urlRule = uri;
            return urlRule;
        }
        
    }
}