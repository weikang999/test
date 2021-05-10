﻿using System;
using System.Collections;
using System.Collections.Generic;


namespace app.Util
{
    public class StringUtil
    {
        public static string join(string str,object list)
        {
            string buffer = "";
            if (list is ICollection)
            {
                var i = 0;
                var coll = (ICollection) list;
                foreach (object o in coll)
                {
                    if (i > 0)
                    {
                        buffer += str;
                    }
                    buffer += o;
                    i++;
                }
            }else if (list is ICollection<object>)
            {
                var i = 0;
                var coll = (ICollection<object>) list;
                foreach (object o in coll)
                {
                    if (i > 0)
                    {
                        buffer += str;
                    }
                    buffer += o;
                    i++;
                }
            }
            else
            {
                buffer = string.Join(str , list);
            }
            
            
            return buffer;
        }
    }
}