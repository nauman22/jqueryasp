using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jquery1
{
    public class UsersDetail
    {
        public int UserId { get; set; }
        public string UserEmail { get; set; }
        public string UserName { get; set; }
        public string UserPassword { get; set; }
        public string UserParrentName { get; set; }
        public string UserParrentEmail { get; set; }
        public string UserRollNo { get; set; }
        public string UserFirstName { get; set; }
        public string UserLastName { get; set; }
        public string UserDepartment { get; set; }
        public string UserRegion { get; set; }
        public string UserPhoneNo { get; set; }
        public string UserDateOfBirth { get; set; }
        public int UserGender { get; set; }
        public string UserCity { get; set; }
        public string UserPicture { get; set; }
        public string UserCountry { get; set; }
        public string UserTestStartDateTime { get; set; }
        public string UserTestDueDateTime { get; set; }
        public string UserExtendedDateTime { get; set; }
        public bool EmailResultToUser { get; set; }
        public bool UserPracticeMode { get; set; }
        public bool UserRandomizeQuestions { get; set; }
        public bool EmailUserTestResultToAdmin { get; set; }
        public int UserTotalAttempts { get; set; }
        public int UserRole { get; set; }
        public bool UserSeeOthersResult { get; set; }
        public bool UserCustomizeCertificateDesign { get; set; }
        public bool UserCustomizeResultCardDesign { get; set; }
        public string UserTermsAndConditions { get; set; }
        public bool UserTestAlwaysOpen { get; set; }
        public string selectedsub { get; set; }
        public string selectedtest { get; set; }

    }
}