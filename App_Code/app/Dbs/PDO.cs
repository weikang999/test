using System;
using System.Configuration;
using app.Util;
using app.Dbs.Interface;

namespace app.Dbs
{
    /**
     * 统一数据库管理器,其他数据库只需要实现，相应接口就能实现连接，以后会加入进去，分别实现，mysql、Order、sqllite
     */
    public class PDO : Interface.Connection
    {
        protected Interface.Connection _connection;
        private static string defConnStr = "DefaultConnection";

        private bool disposed = false;
        public PDO() : this(defConnStr)
        {
            
        }
        
        ~PDO()
        {
            Req.Response.Output.WriteLine("close pdo");
            Dispose(false);
        }
        
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        
        protected void Dispose(bool disposing)
        {
            if (!disposed)
            {
                disposed = true;
                _connection.Dispose();
            }
        }
        
        public PDO(string name)
        {
            var data = ConfigurationManager.ConnectionStrings[name];
            var providerName = data.ProviderName;
            var connectionString = data.ConnectionString;
            
            if (providerName.Equals("System.Data.SqlClient"))
            {
                // sql server
                _connection = new Connection.SqlServer(connectionString);
            }
                    }

        public static string getPdoType()
        {
            var data = ConfigurationManager.ConnectionStrings[defConnStr];
            var providerName = data.ProviderName;
            var connectionString = data.ConnectionString;

            if (providerName.Equals("System.Data.SqlClient"))
            {
                // sql server
                return "sqlserver";
            }
            else if (providerName.Equals("MySql.Data.MySqlClient"))
            {
                return "mysql";
            }
            return "";
        }
        
        public static void setConnection(string connName)
        {
            defConnStr = connName;
        }
        
        
        public Interface.Connection Connection
        {
            get { return _connection; }
            set { _connection = value; }
        }
        
        public ResultSet query(string sql)
        {
            Console.WriteLine(sql);
            return Connection.query(sql);
        }
        
        public bool execute(string sql)
        {
            Console.WriteLine(sql);
            return Connection.execute(sql);
        }
        
        public long execute(string sql, bool insertId)
        {
            Console.WriteLine(sql);
            return Connection.execute(sql, insertId);
        }
        
        public long lastInsertID()
        {
            return Connection.lastInsertID();
        }
        
        public long affected_rows()
        {
            return Connection.affected_rows();
        }
    }
}