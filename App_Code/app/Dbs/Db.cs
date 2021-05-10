using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using app.Dbs.Builder;
using app.Dbs.Collects;
using app.Dbs.Interface;
using app.Util;

namespace app.Dbs
{
    public class Db
    {
        protected string mName = "";
        protected Hashtable mOption;
        protected Hashtable mData;
        protected Builders builder;
        protected string pk = "id";
        //protected SqlConnection conn = null;

        public Db()
        {
            mOption = new Hashtable();
            mData = new Hashtable();
            builder = Builders.make(this);
        }
        
        public Db(string table) : this()
        {
            setName(table);
            //this.mName = table;
        }
        
        ~Db()
        {
            //conn.Close();
        }
        
        public static Db name(string table)
        {
            return new Db(table);
        }


        public Db where(string name)
        {
            Hashtable list = new Hashtable();
            list.Add("where", name);
            getOptionArrayList("where").Add(list);
            return this;
        }
        
        public Db where(string name, object value)
        {
            return where(name, null, value, null);
        }

        public Db where(string name, string eq, object value)
        {
            return where(name, eq, value, null);
        }
        
        public Db where(string name, string eq, object value, string connect)
        {
            Hashtable list = new Hashtable();
            list["name"] = name;
            list.Add("exp", eq == null ? "=" : eq);
            list.Add("value", value == null ? "" : value);
            list.Add("connect", connect == null ? "and" : connect);

            getOptionArrayList("where").Add(list);
            return this;
        }
        
        public Db whereIn(string field , string inArray)
        {
            string[] arr = inArray.Split(',');
            return where(field , "in" , arr);
        }

        public Db whereIn(string field , string[] inArray)
        {
            return where(field , "in" , inArray);
        }

        public Db whereIn(string field , int[] inArray)
        {
            return where(field , "in" , inArray);
        }

        public Db whereInNot(string field , string inArray)
        {
            string[] arr = inArray.Split(',');
            return where(field , "not in" , arr);
        }

        public Db whereBetween(string field , string inArray)
        {
            string[] arr = inArray.Split(',');
            return where(field , "between" , arr);
        }
        
        public Db whereBetween(string field , string start , string end)
        {
            return where(field , "between" , "'"+start+"' AND '"+end+"'");
        }
        
        public Db whereBetweenNot(string field , string inArray)
        {
            string[] arr = inArray.Split(',');
            return where(field , "not between" , arr);
        }

        public Db whereBetweenNot(string field , string start , string end)
        {
            return where(field , "not between" , "'"+start+"' AND '"+end+"'");
        }
        
        
        public Db inc(string field, double step = 1)
        {
            if (step < 1) step = 1;
            ArrayList list = new ArrayList();
            list.Add("inc");
            list.Add(step);
            mData.Add(field, list);
            return this;
        }

        public Db dec(string field, double step = 1)
        {
            if (step < 1) step = 1;
            ArrayList list = new ArrayList();
            list.Add("dec");
            list.Add(step);
            mData.Add(field, list);
            return this;
        }

        public bool setInc(string field, object step)
        {
            return inc(field, double.Parse(step.ToString())).update();
        }
        
        public bool setDec(string field, object step)
        {
            return dec(field, double.Parse(step.ToString())).update();
        }
        
        public bool setField(string field, object step)
        {
            mData[field] = step;
            return update();
        }
        
        public Db data(Hashtable data)
        {
            foreach (var item in data.Keys)
            {
                mData[item] = data[item];
            }

            return this;
        }

        public Db data(String name, object value)
        {
            mData.Add(name, value);
            return this;
        }

        public bool update()
        {
            return update(null);
        }

        public bool update(Hashtable updateData)
        {
            if (updateData != null)
            {
                data(updateData);
                //HashtableUtil.extend(true, mData, updateData);
            }
            ArrayList where = getOptionArrayList("where");
            if (where.Count == 0)
            {
                string pk = getPk();
                if (!mData.ContainsKey(pk))
                {
                    return false;
                }
                this.where(pk,mData[pk]);
            }
            string sql = builder.buildUpdate();
            return executeUpdate(sql);
        }
        
        public Collect<Hashtable> page(int pagesize )
        {
            Db c = new Db(getName());
            HashtableUtil.extend(true , c.mOption , mOption);
            
            // 总长度
            long count = c.count();
            Collect<Hashtable> result = new Collect<Hashtable>( count , pagesize);
            this.limit(result.firstRow , result.listRows);
            builder.setPage(true);
            selectCollect(result);
            builder.setPage(false);
            return result;
        }
        
        protected void selectCollect(Collect<Hashtable> collect)
        {
            if (collect == null)
            {
                throw new NullReferenceException("collect 列不能为Null");
            }
            string sql = builder.buildSelect();
            
            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            while (resultSet.hasNext())
            {
                collect.Add(resultSet.fetch());
            }
            resultSet.Dispose();
            pdo.Dispose();
        }
        
        public bool executeUpdate(string sql)
        {
            bool res = false;
            PDO pdo = new PDO();
            try
            {
                res = pdo.execute(sql);
            }
            catch (Exception e)
            {
                string message = e.Message;
                Console.WriteLine("SQL execute Error");
                Console.WriteLine("Message:" + message);
                //e.printStackTrace();
            }
            finally
            {
                pdo.Dispose();
            }

            return res;
        }
        
        public long insert(Hashtable insertData)
        {
            return insert(insertData, false);
        }
        
        
        public long executeInsert(string sql)
        {
            PDO pdo = new PDO();
            long lastID = -1;
            try
            {
                System.Diagnostics.Debug.WriteLine(sql);
                lastID = pdo.execute(sql, true);
            }
            catch (Exception e)
            {
                string message = e.Message;
                Console.WriteLine("SQL execute Error");
                Console.WriteLine("Message:" + message);
            }
            finally
            {
                pdo.Dispose();
            }
            return lastID;
        }

        public long insert(Hashtable insertData, bool replace)
        {
            if (insertData != null)
            {
                data(insertData);
            }

            string sql = builder.buildInsert(replace);
            return executeInsert(sql);
        }

        public Db setName(string name)
        {
            mName = name;
            return this;
        }

        public String getName()
        {
            return mName;
        }

        public Db setAttribute(String name, Object value)
        {
            getOptionHashtables("data").Add(name, value);
            return this;
        }

        public Object getAttribute(String name)
        {
            return getOptionHashtables("data")[name];
        }

        public Db field()
        {
            return field("*");
        }

        public Db field(string field)
        {
            getOptionArrayList("field").Add(field);
            return this;
        }
        
        public Db table(string nTable)
        {
            getOptionArrayList("table").Add(nTable);
            return this;
        }
        
        public Db table(string nTable, string alias)
        {
            getOptionArrayList("table").Add(nTable + " " + alias);
            return this;
        }
        
        public Db limit(int nLimit)
        {
            //getOptionHashMap("limit").put("limit" , String.valueOf(nLimit));
            return limit((nLimit).ToString());
        }
        
        public Db limit(int offset, int nLimit)
        {
            return limit((offset).ToString(), (nLimit).ToString());
        }
        
        public Db locks(bool lo )
        {
            return this.locks (lo ? " FOR UPDATE " : "");
        }
        
        public Db locks(string lo)
        {
            getOption().Add("lock",  lo);
            return this;
        }
        
        public Db limit(string nLimit)
        {
            if (nLimit.IndexOf(",") != -1)
            {
                String[] list = nLimit.Split(',');
                return limit(list[0], list[1]);
            }
            getOptionHashtables("limit").Add("limit", nLimit);
            return this;
        }
        
        public Db limit(string offset, string nLimit)
        {
            Hashtable map = getOptionHashtables("limit");
            map.Add("limit", nLimit);
            map.Add("offset", offset);
            return this;
        }
        
        public Hashtable find(object id)
        {
            where(pk, id);
            return find();
        }
        
        public Hashtable find()
        {
            //limit(1);
            string sql = builder.buildSelect();
            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            Hashtable hashtable = null;
            if (resultSet.hasNext())
            {
                hashtable = resultSet.fetch();
            }
            else
            {
                hashtable = new Hashtable();
            }
            resultSet.Dispose();
            pdo.Dispose();
            return  hashtable;
        }
        
        protected double total(string f, string func)
        {
            string ifnull = builder.parseIfNull(func + "(" + f + ")", "0");
            string field = ifnull + " count";
            if (mOption.ContainsKey("field"))
            {
                getOptionArrayList("field").Clear();
            }
            
            getOptionArrayList("field").Add(field);
            Hashtable data = find();
            if (data.ContainsKey("count"))
            {
                string count = data["count"].ToString();
                return double.Parse(count);
            }
            return 0;
        }
        
        public double sum(string field)
        {
            return total(field, "SUM");
        }

        public double avg(string field)
        {
            return total(field, "AVG");
        }

        public double max(string field)
        {
            return total(field, "MAX");
        }

        public double min(string field)
        {
            return total(field, "MIN");
        }

        public long count()
        {
            return count(null);
        }

        public long count(string field)
        {
            if (field == null)
            {
                if (mOption.ContainsKey("alias"))
                {
                    field = "count(" + mOption["alias"] + ".id) count";
                }
                else
                {
                    field = "count(*) count";
                }
            }
            else
            {
                field = "count(" + field + ") count";
            }
            if (mOption.ContainsKey("field"))
            {
                mOption.Add("field", new ArrayList());
                //getOptionArrayList("field").clear();
            }
            if (mOption.ContainsKey("order"))
            {
                mOption.Remove("order");
            }
            getOptionArrayList("field").Add(field);
            Hashtable data = find();
            if (data.ContainsKey("count"))
            {
                return long.Parse((string) data["count"]);
            }
            return 0;
        }
        
        public bool delete(ArrayList ids)
        {
            where(getPk(), "in", ids);
            return delete();
        }
        
        public bool delete(int id)
        {
            where(getPk(), id);
            return delete();
        }

        public bool delete(string id)
        {
            if (id.IndexOf(",") != -1)
            {
                where(getPk(), "in", id);
            }
            else
            {
                where(getPk(), id);
            }

            return delete();
        }

        public bool delete()
        {
            if (!mOption.ContainsKey("where"))
            {
                return false;
            }
            string sql = this.builder.buildDelete();
            return executeUpdate(sql);
        }

        public List<string> column(string field)
        {
            List<string> result = new List<string>();

            string sql = builder.buildSelect();

            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            while (resultSet.hasNext())
            {
                Hashtable hashtable = resultSet.fetch();
                result.Add(hashtable[field].ToString());
            }
            resultSet.Dispose();
            pdo.Dispose();
            return result;
        }

        public Hashtable column(string field , string key)
        {
            Hashtable result = new Hashtable();

            string sql = builder.buildSelect();

            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            while (resultSet.hasNext())
            {
                Hashtable hashtable = resultSet.fetch();
                var k = hashtable[key];
                var v = hashtable[field];
                result[k] = v;
            }
            resultSet.Dispose();
            pdo.Dispose();
            return result;
        }

        public List<Hashtable> select()
        {
            List<Hashtable> result = new List<Hashtable>();
            string sql = builder.buildSelect();
            
            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(sql);
            while (resultSet.hasNext())
            {
                result.Add(resultSet.fetch());
            }
            resultSet.Dispose();
            pdo.Dispose();
            return result;
        }
        
        
        public string value(string name)
        {
            if(!mOption.ContainsKey("field")){
                field(name);
            }
            Hashtable data = find();
            if(data.Count == 0){
                return "";
            }
            return (string)data[name];
        }
        public Db group(string nGroup)
        {
            getOptionArrayList("group").Add(nGroup);
            return this;
        }
        public Db order(string nOrder)
        {
            getOptionArrayList("order").Add(nOrder);
            return this;
        }
        
        public Db order(string nOrder , string sort)
        {
            getOptionArrayList("order").Add(nOrder+" "+sort);
            return this;
        }
        
        public Db orderDesc(string field)
        {
            return order(field+" DESC");
        }
        public Db orderASC(string field)
        {
            return order(field+" ASC");
        }
        
        public Db joinInner(string table , string cond)
        {
            return join(table , cond , "INNER");
        }
        public Db joinRight(string table , string cond)
        {
            return join(table , cond , "RIGHT");
        }
        public Db joinLeft(string table , string cond)
        {
            return join(table , cond , "LEFT");
        }
        public Db join(string table , string cond , string type)
        {
            string buffer=(" ")+(type) + (" JOIN ") + (table) + (" ON ") + (cond);
            getOptionArrayList("join").Add(buffer);
            return this;
        }
        
        public Db alias(String name)
        {
            mOption.Add("alias" , name);
            return this;
        }
        
        protected ArrayList resultSetList = new ArrayList();
        
        
        virtual public string getPk()
        {
            return "id";
        }
        
        public void setPk(string pk)
        {
            this.pk = pk;
        }
        
        private Hashtable getOptionHashtables(string name)
        {
            if (!mOption.ContainsKey(name))                                                                            
            {
                mOption.Add(name, new Hashtable());
            }

            return (Hashtable) mOption[name];
        }

        private ArrayList getOptionArrayList(string name)
        {
            if (!mOption.ContainsKey(name))
            {
                mOption.Add(name, new ArrayList());
            }

            return (ArrayList) mOption[name];
        }


        public Hashtable getData()
        {
            return mData;
        }

        public Hashtable getOption()
        {
            return mOption;
        }
    }
}