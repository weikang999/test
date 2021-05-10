using System;


using System.Collections.Generic;
using System.Collections;
using System.Data;
using app.Dbs.Interface;
using app.Util;



namespace app.Dbs.Builder
{
    public class Builders
    {
        protected string selectSql =
            "SELECT%DISTINCT% %FIELD% FROM %TABLE%%FORCE%%JOIN%%WHERE%%GROUP%%HAVING%%ORDER%%LIMIT% %LOCK%";

        protected string updateSql = "UPDATE %TABLE% SET %SET%%JOIN%%WHERE% %LOCK%";
        protected string insertSql = "%INSERT% INTO %TABLE% (%FIELD%) VALUES (%DATA%)";
        protected string deleteSql = "DELETE FROM %TABLE%%JOIN%%WHERE%%ORDER%%LIMIT% %LOCK%";
        protected Db db;
        private bool _isPage = false;

        public Builders(Db db)
        {
            this.db = db;
        }

        public static Builders make(Db db)
        {
            Builders builder = null;
            string type = PDO.getPdoType();

            if (type == "sqlserver")
            {
                builder = new SqlServer(db);
            }
                        return builder;
        }

        virtual protected string getSelectSql()
        {
            return selectSql;
        }

        virtual public string buildSelect()
        {
            string sql = getSelectSql();

            return sql.Replace("%DISTINCT%", parseDistinct())
                    .Replace("%FIELD%", parseField())
                    .Replace("%TABLE%", parseTable())
                    .Replace("%FORCE%", parseForce())
                    .Replace("%JOIN%", parseJoin())
                    .Replace("%WHERE%", parseWhere())
                    .Replace("%HAVING%", parseHaving())
                    .Replace("%GROUP%", parseGroup())
                    .Replace("%ORDER%", parseOrder())
                    .Replace("%LIMIT%", parseLimit())
                    .Replace("%LOCK%", parseLock())
                ;
        }

        virtual public string parseIfNull(string func, string str)
        {
            return "IFNULL(" + func + " , " + str + ")";
        }

        virtual public string buildInsert(bool replace)
        {
            Hashtable data = db.getData();
            if (data.Count == 0)
            {
                return "";
            }

            // 没数据不允许插入
            Hashtable formatData = parseData(data, true);
            // 经过格式化的数据
            ICollection fields = formatData.Keys;
            ICollection values = formatData.Values;

            //insertSql = "%INSERT% INTO %TABLE% (%FIELD%) VALUES (%DATA%)";
            return insertSql.Replace("%INSERT%", replace ? "REPLACE" : "INSERT")
                    .Replace("%TABLE%", parseTable())
                    .Replace("%FIELD%", StringUtil.join(" , ", fields))
                    .Replace("%DATA%", StringUtil.join(" , ", values))
                ;
        }

        virtual public string buildDelete()
        {
            //protected String deleteSql = "DELETE FROM %TABLE%%JOIN%%WHERE%%ORDER%%LIMIT% %LOCK%";

            return deleteSql.Replace("%TABLE%", parseTable())
                    .Replace("%JOIN%", parseJoin())
                    .Replace("%WHERE%", parseWhere())
                    .Replace("%ORDER%", parseOrder())
                    .Replace("%LIMIT%", parseLimit())
                    .Replace("%LOCK%", parseLock())
                ;
        }

        virtual public string buildUpdate()
        {
            Db query = db;
            Hashtable data = db.getData();
            if (data.Count == 0)
            {
                return "";
            }

            Hashtable formatData = parseData(data, false);
            ArrayList sets = new ArrayList();
            foreach (var key in formatData.Keys)
            {
                string val = formatData[key].ToString();
                sets.Add(key + "=" + val);
            }

            //protected String updateSql = "UPDATE %TABLE% SET %SET%%JOIN%%WHERE%%ORDER%%LIMIT% %LOCK%";
            return updateSql.Replace("%TABLE%", parseTable())
                    .Replace("%SET%", StringUtil.join(" , ", sets))
                    .Replace("%JOIN%", parseJoin())
                    .Replace("%WHERE%", parseWhere())
                    .Replace("%LOCK%", parseLock())
                ;
        }

        virtual protected string getFieldDefault(string type)
        {
            string t = type.ToUpper();
            if (t == "DATE")
            {
                return "'0000-00-00'";
            }
            else if (t == "DATETIME")
            {
                return "'0000-00-00 00:00:00'";
            }
            else if (t.Equals("TIME"))
            {
                return "'00:00:00'";
            }
            else if (t.Equals("TIMESTAMP"))
            {
                return "'" + Info.getDateStr() + "'";
            }
            else if (t.Equals("FLOAT") || t.Equals("DOUBLE") || t.Equals("DECIMAL") || t.IndexOf("INT") != -1)
            {
                return "0";
            }

            return "''";
        }

        virtual protected string getFieldValue(string type, string value)
        {
            string t = type.ToUpper();
            if (value == null || value.Equals(""))
            {
                // 等于空值，就写入默认值
                return getFieldDefault(type);
            }

            if (t.Equals("FLOAT") || t.Equals("DOUBLE") || t.Equals("DECIMAL") || t.IndexOf("INT") != -1)
            {
                return value;
            }

            return formatString(value);
        }


        virtual protected string getTableFind(string name)
        {
            return "SELECT * FROM " + name + " WHERE 1=1 LIMIT 1";
        }

        virtual protected Hashtable parseData(Hashtable data, bool isInsert)
        {
            Hashtable result = new Hashtable();
            // 分析数据
            try
            {
                var sql = getTableFind(parseTable());
                PDO pdo = new PDO();
                ResultSet resultSet = pdo.query(sql);
                int length = resultSet.columnCount();
                for (int i = 0; i < length; i++)
                {
                    string col = resultSet.columnName(i);
                    string type = resultSet.columnType(i);
                    if (col.ToLower().Equals("id"))
                    {
                        continue;
                    }
                    if (data.ContainsKey(col))
                    {
                        object content = data[col];
                        if (content is ArrayList)
                        {
                            ArrayList var = (ArrayList) content;
                            if (var[0].Equals("inc") || var[0].Equals("dec"))
                            {
                                string fuhao = var[0].Equals("inc") ? "+" : "-";
                                result.Add(col, col + fuhao + var[1]);
                            }
                        }
                        else
                        {
                            result.Add(col, getFieldValue(type, content.ToString()));
                        }
                    }
                    else
                    {
                        if (isInsert)
                        {
                            result.Add(col, getFieldDefault(type));
                        }
                    }
                }
                resultSet.Dispose();
                pdo.Dispose();
                /*
                DataSet dataSet = Connect.getDataSet(sql);
                DataColumnCollection columns = dataSet.Tables[0].Columns;
                for (int i = 0; i < columns.Count; i++)
                {
                    DataColumn column = columns[i];
                    string col = column.ColumnName;
                    string type = column.DataType.ToString();
                    if (col.ToLower().Equals("id"))
                    {
                        continue;
                    }
                    if (data.ContainsKey(col))
                    {
                        object content = data[col];
                        if (content is ArrayList)
                        {
                            ArrayList var = (ArrayList) content;
                            if (var[0].Equals("inc") || var[0].Equals("dec"))
                            {
                                string fuhao = var[0].Equals("inc") ? "+" : "-";
                                result.Add(col, col + fuhao + var[1]);
                            }
                        }
                        else
                        {
                            result.Add(col, getFieldValue(type, content.ToString()));
                        }
                    }
                    else
                    {
                        if (isInsert)
                        {
                            result.Add(col, getFieldDefault(type));
                        }
                    }
                }*/
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

            return result;
        }
        
        
        

        virtual protected string parseLock()
        {
            string lo = (string) db.getOption()["lock"];
            if (lo == null)
            {
                return "";
            }

            return lo;
        }

        virtual protected String parseLimit()
        {
            Hashtable limit = (Hashtable) db.getOption()["limit"];
            if (limit == null || limit.Count == 0)
            {
                return "";
            }

            object offset = limit["offset"];
            object pagesize = limit["limit"];
            if (offset == null)
            {
                return " LIMIT " + pagesize + " ";
            }

            return " LIMIT " + offset + "," + pagesize + " ";
        }

        virtual protected String parseField()
        {
            ArrayList list = (ArrayList) db.getOption()["field"];
            if (list == null || list.Count == 0)
            {
                return "*";
            }

            return StringUtil.join(",", list);
        }

        virtual protected string parseForce()
        {
            ArrayList list = (ArrayList) db.getOption()["force"];
            if (list == null || list.Count == 0)
            {
                return "";
            }

            return string.Format(" FORCE INDEX ( %s ) ", StringUtil.join(",", list));
        }

        virtual protected string parseDistinct()
        {
            if (db.getOption().ContainsKey("distinct"))
            {
                return " DISTINCT ";
            }

            return "";
        }

        virtual protected string parseHaving()
        {
            if (db.getOption().ContainsKey("having"))
            {
                return " HAVING " + db.getOption()["having"];
            }

            return "";
        }

        virtual protected string getOptionValue(String key)
        {
            String val = (String) db.getOption()[key];
            if (val == null)
            {
                return "";
            }

            return val + " ";
        }

        virtual public string parseTable()
        {
            string name = db.getName();
            ArrayList list = (ArrayList) db.getOption()["table"];
            if (list == null || list.Count == 0)
            {
                return name + " " + getOptionValue("alias");
            }

            return StringUtil.join(",", list) + " ";
        }

        virtual public string parseJoin()
        {
            ArrayList list = (ArrayList) db.getOption()["join"];
            if (list == null || list.Count == 0)
            {
                return "";
            }
            
            return " " + StringUtil.join(" ", list) + " ";
        }

        virtual public string parseGroup()
        {
            ArrayList orderList = (ArrayList) db.getOption()["group"];
            if (orderList == null || orderList.Count == 0)
            {
                return "";
            }
            string buffer = " GROUP BY ";
            buffer += StringUtil.join(",", orderList) + " ";
            return buffer;
        }

        virtual public String parseOrder()
        {
            ArrayList orderList = (ArrayList) db.getOption()["order"];
            if (orderList == null || orderList.Count == 0)
            {
                return "";
            }
            string buffer = " ORDER BY ";
            buffer += StringUtil.join(",", orderList) + " ";
            return buffer;
        }
        
        virtual public String parseWhere()
        {
            ArrayList whereList = (ArrayList) db.getOption()["where"];
            if (whereList == null || whereList.Count == 0)
            {
                return "";
            }
            
            string buffer = " WHERE ";
            
            for (int i = 0; i < whereList.Count; i++)
            {
                Hashtable map = (Hashtable) whereList[i];
                if (i != 0)
                {
                    // 每一个的连接符
                    buffer +=" ";
                    buffer += (map["connect"] == null ? " AND " : map["connect"]);
                    buffer += (" ");
                }
                
                string where = (string) map["where"];
                if (where != null)
                {
                    buffer  += (" ") + (where) + (" ");
                }
                else
                {
                    string key = (string) map["name"];
                    string exp = (string) map["exp"];
                    object val = map["value"];
                    
                    if (-1 != key.IndexOf("|"))
                    {
                        string[] keys = key.Split('|');
                        buffer += ("(");
                        for (int j = 0; j < keys.Length; j++)
                        {
                            if (j != 0)
                            {
                                buffer += (" OR ");
                            }
                            buffer += parseWhereItem( keys[j], exp, val);
                        }

                        buffer += (")");
                    }
                    else
                    {
                        buffer += parseWhereItem( key, exp, val);
                    }
                }
            }
            return buffer;
        }

        virtual protected string formatString(object val)
        {
            var str = Convert.ToString(val);
            return "'" + str.Replace("'", "\\'") + "'";
        }
        
        virtual protected string parseWhereItem( string key, string exp, object val)
        {
            string buffer = "";
            List<string> exps = new List<string>("eq,neq,lt,elt,gt,egt".Split(','));
            int index = exps.IndexOf(exp);
            string[] exps2 = "=,!=,<,<=,>,=>".Split(',');
            if (index != -1)
            {
                exp = exps2[index];
            }
            
            exp = exp.ToLower().Trim();
            if (exp.Equals("in") || exp.Equals("not in"))
            {
                ArrayList inArrayList = getParseWhereValueArray(val);
                
                buffer += (" ");
                buffer += (key);
                buffer += (" " + exp + "(" + StringUtil.join(",", inArrayList) + ") ");
            }
            else if (exp.Equals("between") || exp.Equals("not between"))
            {
                buffer += (" ") + (key) + (" ") + (exp) + (" ");
                if (val is string){
                    buffer += (val);
                }else{
                    ArrayList str = getParseWhereValueArray(val);
                    buffer += formatString(str[0]) + (" AND ") + formatString(str[1]);
                }
            }
            else
            {
                buffer += (" " + key);
                buffer += (" " + exp + " ");
                buffer += (formatString(val));
                buffer += (" ");
            }

            return buffer;
        }


        virtual protected ArrayList getParseWhereValueArray(object val)
        {
            ArrayList inArrayList = new ArrayList();
            if (val is string || val is string[]){
                string[] inList = val is string ? ((string) val).Split(',') : (string[]) val;
                for (int i = 0; i < inList.Length; i++)
                {
                    inArrayList.Add(formatString(inList[i]));
                }
            }else if (val is ICollection)
             {
                 var v = val as ICollection;
                 foreach (var n in v)
                 {
                     inArrayList.Add(formatString(n));
                 }
             }else if (val is ArrayList) {
                for (int i = 0; i < ((ArrayList) val).Count; i++)
                {
                    inArrayList.Add(formatString(((ArrayList) val)[i]));
                }
            }else if (val is int[]) {
                for (int i = 0; i < ((int[]) val).Length; i++)
                {
                    inArrayList.Add(((int[]) val)[i]);
                }
            }else if (val is float[]) {
                for (int i = 0; i < ((float[]) val).Length; i++)
                {
                    inArrayList.Add(((float[]) val)[i]);
                }
            }else if (val is double[]) {
                for (int i = 0; i < ((double[]) val).Length; i++)
                {
                    inArrayList.Add(((double[]) val)[i]);
                }
            }else if (val is long[]) {
                for (int i = 0; i < ((long[]) val).Length; i++)
                {
                    inArrayList.Add(((long[]) val)[i]);
                }
            }
            return inArrayList;
        }
        
        virtual public bool isPage()
        {
            return this._isPage;
        }

        virtual public void setPage(bool page)
        {
            _isPage = page;
        }
    }
}