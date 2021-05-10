using System;


namespace app.Util
{
    public class HttpException : Exception
    {
        public HttpException(string data) : base(data)
        {
            
        }
    }
}