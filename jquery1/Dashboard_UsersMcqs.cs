using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jquery1
{
    public class Dashboard_UsersMcqs
    {
        public string SubjectName { get; set; }
        public string TestName { get; set; }
        public bool TestStatus { get; set; }
        public string TestStartingDate { get; set; }
        public string TestEndingDate { get; set; }
        public int SubjectId { get; set; }
        public int TestId { get; set; }
        public int UserTestTimingId { get; set; }
        public int Points { get; set; }
        public int QuestionId { get; set; }
        public string QuestionText { get; set; }
        public string op1Text { get; set; }
        public string op2Text { get; set; }
        public string op3Text { get; set; }
        public string op4Text { get; set; }
        public string op5Text { get; set; }
        public string op6Text { get; set; }
        public string op7Text { get; set; }
        public string op8Text { get; set; }
        public bool Op1Correct { get; set; }
        public bool Op2Correct { get; set; }
        public bool Op3Correct { get; set; }
        public bool Op4Correct { get; set; }
        public bool Op5Correct { get; set; }
        public bool Op6Correct { get; set; }
        public bool Op7Correct { get; set; }
        public bool Op8Correct { get; set; }
        public int Mode { get; set; }
       
   

    }
    public class McqsDetail
    {
        public string SubjectName { get; set; }
        public int SubjectId { get; set; }
        public string TestName { get; set; }
        public int TestId { get; set; }
        public int AdminId { get; set; }
        public int TotalQuestion { get; set; }
        public int TotalPoints { get; set; }
        public string UserEmail { get; set; }
        public string UserImage { get; set; }
        
    }
    public class UserSummary
    {
        public string AdminId { get; set; }
        public string AdminName { get; set; }
        public string AdminEmail { get; set; }
        public string AdminImage { get; set; }
        public string AdminPassword { get; set; }
        public string AdminSocialEmail { get; set; }
        public string AdminSocialNameAccess { get; set; }
        public string AdminDateOfBirth { get; set; }
        public string AdminInstituteName { get; set; }
        public string AdminInstituteAddress { get; set; }
        public string AdminQualification { get; set; }
        public string AdminExperience { get; set; }
        public string AdminDesiganation { get; set; }
        public int UserRoleId { get; set; }
        public int Total_Sub_Users { get; set; }
        public int Total_Admin_Mcqs { get; set; }
        public string RoleName {get; set;}
       
    }
    public class UserAddedMcqs
    {
        public string CatName { get; set; }
        public Int32 catId { get; set; }
        public string SubjectName { get; set; }
        public Int32 SubjectId { get; set; }
        public string TestName { get; set; }
        public Int32 TestId { get; set; }
        public Int32 McqsId { get; set; }
        public DateTime InsertedDate { get; set; }
        
    }
    public class tblTyping_UserRecord
    {
        public Int32 Id { get; set; }
        public string Name{ get; set; }
        public string TimeTaken { get; set; }
        public string Duration{ get; set; }
        public int GrossSpeed { get; set; }
        public Int32 NetSpeed { get; set; }
        public string TestName { get; set; }
        public DateTime TestTakenDateTime { get; set; }
        public int Accuracy { get; set; }
        public int ErrorHits { get; set; }
        public int NetStrokes { get; set; }
        public int GrossStrokes { get; set; }
        public int ispic { get; set; }
      

    }
}