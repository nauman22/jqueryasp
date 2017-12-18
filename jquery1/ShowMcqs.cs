using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jquery1
{
    public class ShowMcqs
    {
        public int AdminId { get; set; }
        public string AdminName { get; set; }
        public string AdminEmail { get; set; }
        public string SubjectName { get; set; }
        public string TestName { get; set; }
        public string QuestionText { get; set; }
        public int Points { get; set; }
        public string Option1Text { get; set; }
        public bool Option1Correct { get; set; }
        public string Option2Text { get; set; }
        public bool Option2Correct { get; set; }
        public string Option3Text { get; set; }
        public bool Option3Correct { get; set; }
        public string Option4Text { get; set; }
        public bool Option4Correct { get; set; }
        public string Option5Text { get; set; }
        public bool Option5Correct { get; set; }
        public string Option6Text { get; set; }
        public bool Option6Correct { get; set; }
        public string Option7Text { get; set; }
        public bool Option7Correct { get; set; }
        public string Option8Text { get; set; }
        public bool Option8Correct { get; set; }
        public string ExplanationText { get; set; }
        public string Reference { get; set; }
        public bool op1 { get; set; }
        public bool op2 { get; set; }
        public bool op3 { get; set; }
        public bool op4 { get; set; }
        public bool op5 { get; set; }
        public bool op6 { get; set; }
        public bool op7 { get; set; }
        public bool op8 { get; set; }
        public int McqsQuestionId { get; set; }
        public int Option1Id { get; set; }
        public int Option2Id { get; set; }
        public int Option3Id { get; set; }
        public int Option4Id { get; set; }
        public int Option5Id { get; set; }
        public int Option6Id { get; set; }
        public int Option7Id { get; set; }
        public int Option8Id { get; set; }
        public int userselectedoption { get; set; }
        public int Isusercorrect { get; set; }
        public int IsuserAttempt { get; set; }
        public int isExplained { get; set; }
        public string exp_check_staff_name { get; set; }
        public string exp_check_staff_pic { get; set; }
        public string exp_check_staff_qual { get; set; }
        public string exp_check_staff_acc { get; set; }
        public int staff_exp_id { get; set; }
        public int pagecount { get; set; }
        public string edate { get; set; }
        public int TestId { get; set; }
        public int SecId { get; set; }
        public int SecMergeTestId { get; set; }
        public int isNegativeMarks { get; set; }
        public int SpecMarks { get; set; }
 
    }
}