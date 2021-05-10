using System;
using System.Web;

namespace app.Util
{
    public class Req
    {
        public static HttpRequest Request
        {
            get
            {
                return HttpContext.Current.Request;
            }
        }
        
        public static HttpResponse Response
        {
            get { return HttpContext.Current.Response; }
        }

        public static HttpServerUtility Server
        {
            get { return HttpContext.Current.Server; }
        }
        
        public static string get(string name, string def = "")
        {
            string value = Request[name];
            return value == null ? def : value;
        }
        
        public static int getInt(string name, int def = 0)
        {
            string value = Request[name];
            return string.IsNullOrEmpty(value) ? def : int.Parse( value );
        }
        
        public static double getDouble(string name, double def = 0.0f)
        {
            string value = Request[name];
            return string.IsNullOrEmpty(value) ? def : int.Parse( value );
        }
    }
}