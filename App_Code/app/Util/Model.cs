using System;
using System.Collections;
using System.Reflection;

using app.Common.Attributes;
using app.Dbs;
using app.Dbs.Interface;

namespace app.Util
{
    abstract public class Model : Hashtable
    {
        public DbEntity db;
        
        public Model()
        {
            string name = getName();
            db = new DbEntity(name , this);
        }
        
        virtual public string getPk()
        {
            return "id";
        }
        
        virtual public string getName()
        {
            return TableAttrbute.GetTableName(this.GetType());
        }
        
        virtual public void setAttr(string name, string value)
        {
            this[name] = value;
        }
        
        virtual public void setAttr(ResultSet resultSet)
        {
            int columnCount = resultSet.columnCount();
            for (int i = 0; i < columnCount; i++)
            {
                string columnName=resultSet.columnName(i);
                string columnValue = resultSet.getSting(i);
                setAttr(columnName , columnValue);
            }
        }
        
        
    }
}