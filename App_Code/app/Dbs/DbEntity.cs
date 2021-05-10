using System;
using System.Reflection;

using app.Dbs.Interface;
using app.Dbs;
using app.Util;
namespace app.Dbs
{
    public class DbEntity : Db
    {
        protected Model _model;
        public DbEntity(string name , Model model) : base(name)
        {
            _model = model;
        }
        
        public override string getPk()
        {
            return _model.getPk();
        }
        
        public Model findModel()
        {
            PDO pdo = new PDO();
            ResultSet resultSet = pdo.query(builder.buildSelect());
            _model.setAttr(resultSet);
            return _model;
        }
        
        public Model choneModel()
        {
            Type type = _model.GetType();
            object o = Activator.CreateInstance(type);
            return (Model)o;
        }
        
    }
}



