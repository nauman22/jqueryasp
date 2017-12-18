using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jquery1
{
    public class LoadTestSettings
    {
        public string TestName { get; set; }
        public string TestDescription { get; set; }
        public bool TestStatus { get; set; }
        public bool TestPractiseSession { get; set; }
        public int TestPassingPercentage { get; set; }
        public string TestImage { get; set; }
        public string TestInstructions { get; set; }
        public string TestStartTiming { get; set; }
        public string TestDueTiming { get; set; }
        public int TestAttempts { get; set; }
        public string TestExtendableDateTime { get; set; }
        public bool TestAlwaysOpen { get; set; }

    }
}