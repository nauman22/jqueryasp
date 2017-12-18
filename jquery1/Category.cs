using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jquery1
{
    public class Category
    {
        public int CatId { get; set; }
        public string CatName { get; set; }
        public int AdminId { get; set; }
        public bool CatDeletebit { get; set; }
    }
}