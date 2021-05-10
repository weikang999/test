using System.Collections;

namespace app.Dbs.Collects
{
    public interface ICollect<T> : IList
    {
        string reader();
        Page readerPage();
    }
}