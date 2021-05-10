using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

using app.Dbs.Interface;
using app.Dbs.Result;
using System.Diagnostics;

namespace app.Dbs.Connection
{
    public class SqlServer : Dbs.Interface.Connection
    {
        private string connStr;
        private bool disposed = false;
        protected SqlConnection _connection = null;

        public SqlServer( string connStr )
        {
            this.connStr = connStr;
            _connection = new SqlConnection(connStr);
        }

        ~SqlServer()
        {
            Dispose(false);
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected void Dispose(bool disposing)
        {
            if (disposed == false)
            {
                disposed = true;
                System.Diagnostics.Debug.WriteLine("close Connect");
                _connection.Close();
                _connection.Dispose();
            }

        }

        public SqlConnection GetConnection()
        {
            try
            {
                if (_connection.State == ConnectionState.Closed)
                {
                    _connection.Open();
                }
            }
            catch (SqlException ex)
            {
                Trace.WriteLine("连接数据库失败");
                Trace.WriteLine(ex);
            }
            return _connection;
        }

        public long insert_id()
        {
            SqlConnection connection = GetConnection();
            SqlCommand cmd = new SqlCommand("SELECT @@IDENTITY as ID" , connection);
            object reader = cmd.ExecuteScalar();
            long last_id = Convert.ToInt64(reader);
            return last_id;
        }

        public ResultSet query(string sql)
        {
            try
            {
                Trace.WriteLine(sql);
                SqlConnection connection = GetConnection();
                SqlCommand cmd = new SqlCommand(sql, connection);
                SqlDataReader reader = cmd.ExecuteReader();
                SqlServerResultSet resultSet = new SqlServerResultSet(reader);
                return resultSet;
            }catch(Exception ex){
                Trace.WriteLine(ex.Message);
                Trace.WriteLine(ex.StackTrace);
            }
            return new SqlServerResultSet(null);
        }

        protected long _affected_rows = 0;

        public bool execute(string sql)
        {
            try
            {
                Trace.WriteLine(sql);
                SqlConnection connection = GetConnection();
                SqlCommand cmd = new SqlCommand(sql , connection);
                _affected_rows = cmd.ExecuteNonQuery();
                return _affected_rows > 0;
            }catch(Exception ex){
                Trace.WriteLine(ex.Message);
                Trace.WriteLine(ex.StackTrace);
                return false;
            }

            return false;

        }

        public long execute(string sql, bool insertId)
        {
            try
            {
                Trace.WriteLine(sql);
                SqlConnection connection = GetConnection();
                string cmdSql = sql + ";\r\n SELECT @@IDENTITY as ID";
                SqlCommand cmd = new SqlCommand(cmdSql, connection);
                return Convert.ToInt64(cmd.ExecuteScalar().ToString());
            }
            catch (Exception ex)
            {
                Trace.WriteLine(ex.Message);
                Trace.WriteLine(ex.StackTrace);
                return -1;
            }
            return -1;
        }
        
        public long lastInsertID()
        {
            return insert_id();
        }
        
        public long affected_rows()
        {
            return _affected_rows;
        }
    }
}