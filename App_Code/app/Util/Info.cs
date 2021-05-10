using System;
using System.IO;
using System.Collections;
using System.Text;
using System.Web;
using app.Common;
using app.Dbs;
using System.Collections.Generic;
namespace app.Util
{
    public class Info
    {
        static public string dx(string leibie , int length)
        {
            Hashtable hashtable = Db.name("dx").@where("leibie", leibie).find();
            if (hashtable.Count > 0)
            {
                return subStr(hashtable["content"].ToString(), length);
            }
            return "";
        }

        static public string getDateStr()
        {
            return DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
        }
        
        static public string date(string format)
        {
            return DateTime.Now.ToString(format);
        }
        /**
         * 获取所有子集下的id
         * @param table 表名
         * @param pid   父级字段
         * @param value 获取的所有子集
         * @return
         */
        public static string getAllChild( string table , string pid , object value)
        {
            List<Hashtable> templists = Db.name(table).select();
            return StringUtil.join(",",getAllChild( table ,  pid , value , templists));
        }

        public static List<string> getAllChild( string table , string pid , object value , List<Hashtable> templists)
        {
            List<string> ret = null;
            List<Hashtable> lists = templists;
            List<string> result = new List<string>();

            String parentid = Convert.ToString(value);
            result.Add(parentid);
            foreach (Hashtable child in lists){
                if(child[pid].Equals(parentid))
                {
                    ret = getAllChild( table , pid , child["id"] , templists );
                    if(ret.Count > 0){
                        result.AddRange(ret);
                    }
                }
            }
            return result;
        }
        static public long time()
        {
            TimeSpan ts = DateTime.Now - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            return Convert.ToInt64(ts.TotalSeconds);
        }
        
        static public string date(string format, DateTime date)
        {
            return date.ToString(format);
        }
        
        static public string html(object str)
        {
            var st = str == null ? "" : str.ToString();
            return HttpUtility.HtmlEncode(str);
        }

        static public string images(object image)
        {
            var img = image.ToString().Split(',');
            return img[0];
        }

        public static string jsonEncode(object source)
        {
            return fastJSON.JSON.ToJSON(source);
        }
        
        public static Dictionary<string,object> jsonDecode(object source)
        {
            if (source == null)
            {
                return new Dictionary<string,object>();
            }

            return (Dictionary<string, object>)fastJSON.JSON.Parse(Convert.ToString(source));
        }

        public static string[] objectSplit(string exp,object source)
        {
            if (source == null)
            {
                return new string[] { };
            }
            string value = Convert.ToString(source);
            return value.Split(exp.ToCharArray());
        }
        
        public static string getTreeOption(string table , string pid , string name , object value)
        {
            List<string> items = new List<string>();
            string parentid = Convert.ToString(value);
            do {
                Hashtable mp = Db.name(table).find(parentid);
                if(mp.Count == 0){
                    break;
                }
                items.Add(mp[name].ToString());
                parentid = mp[pid].ToString();

            }while ( !parentid.Equals("") && !parentid.Equals("0") );

            items.Reverse(); // 翻转list

            return StringUtil.join(" ",items);
        }




        static public string address(object add)
        {
            var img = (Dictionary<string,object>)fastJSON.JSON.Parse(add.ToString());
            if (img.ContainsKey("address"))
            {
                return img["address"].ToString();
            }
            return "";
        }

        public static string substr(object source, int length) 
        {
            return subStr(source , length);
        }

        public static string subStr(object source, int length) 
        {
            string result = delHTMLTag(source.ToString());
            if(result.Length > length){
                result =  result.Substring(0, length) + "...";
            }
            return result;
        }
        
        
        public static string delHTMLTag(string htmlStr)
        {
            string strText = System.Text.RegularExpressions.Regex.Replace(htmlStr, "<[^>]+>", "");
            strText = System.Text.RegularExpressions.Regex.Replace(strText, "&[^;]+;", "");
            return strText;
        }
        
        public static string getID()
        {
            string rand = randomNumber(4);
            return Info.date("MMddhhmmss") + rand;
        }
        
        static public string randomNumber(int size)
        {
            Random rd = new Random();
            StringBuilder builder = new StringBuilder(size);
            for (int i = 0; i < size; i++)
            {
                builder.Append(rd.Next(0,9));
            }
            return builder.ToString();
        }
        
        static public string date(string format, long timeStamp)
        {
            DateTime dtStart = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));  
            long lTime = ((long)timeStamp * 10000000);
            TimeSpan toNow = new TimeSpan(lTime);
            DateTime targetDt = dtStart.Add(toNow);

            return date(format , targetDt);
        }
        
    }
}