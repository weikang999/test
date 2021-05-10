using System.Collections;
using System.Collections.Generic;
using app.Dbs.Interface;

namespace app.Dbs
{
    public class Dao
    {
        static public Hashtable find(string sql)
        {
            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            Hashtable result = resultSet.hasNext() ? resultSet.fetch() : new Hashtable();
            resultSet.Dispose();
            pdo.Dispose();
            return result;
        }
        
        static public List<Hashtable> select(string sql)
        {
            List<Hashtable> list = new List<Hashtable>();
            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            while (resultSet.hasNext())
            {
                list.Add(resultSet.fetch());
            }
            resultSet.Dispose();
            pdo.Dispose();
            return list;
        }

        static public bool execute(string sql)
        {
            PDO pdo = new PDO();
            bool res = pdo.execute(sql);
            pdo.Dispose();
            return res;
        }
        
    }
}