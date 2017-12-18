using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jquery1
{
    public class ddlUserGroups
    {
        public int UserGroupId { get; set; }
        public string UserGroupName { get; set; }
    }
    public class UserReportedMcqs 
    {
        public int ReportId { get; set; }
        public string ReporterName { get; set; }
       
        public string ReporterEmail { get; set; }
        public int Report_McqsId { get; set; }
        public string Report_OptionText { get; set; }
        public int Report_Type { get; set; }
        public DateTime ReportTime { get; set; }
        public int ReportAction { get; set; }
        public int subid { get; set; }

        public int testid { get; set; }
        public string SubName { get; set; }

        public string TestName { get; set; }
        public string mcqstext { get; set; }


       
    
    }
}