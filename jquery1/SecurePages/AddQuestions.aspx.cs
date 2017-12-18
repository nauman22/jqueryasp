using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Services;
using System.Text;

namespace jquery1.SecurePages
{
    public partial class AddQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((HttpContext.Current.Session["AdminId"] == null))
            {
                Response.Redirect("~/General_Pages/SignupAdmin.aspx");
            }
            else
            {
                int adminid = (Int32)HttpContext.Current.Session["AdminId"];
            //int adminid = 124;
            string adminname = HttpContext.Current.Session["AdminName"].ToString();
            //string adminname = "Nauman";
            string adminemail = HttpContext.Current.Session["AdminEmail"].ToString();
            //string adminemail = "naumaan22@email.com";
            int subuserid = (Int32)HttpContext.Current.Session["SubUserId"];
            string username = HttpContext.Current.Session["UserName"].ToString();
            string useremail = HttpContext.Current.Session["UserEmail"].ToString();
            int useradminid = (Int32)HttpContext.Current.Session["UserAdminId"];
            }
            


        }
        //Insert Subject Name into Database
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string InsertSubject(string subjectName)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("InsertSubject", con))
                {
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    //Int32 AdminId = 124;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SubjectName", subjectName);
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    con.Open();
                    int SubjectId = (Int32)cmd.ExecuteScalar();
                    con.Close();
                    HttpContext.Current.Session["SubjectId"] = SubjectId;
                    if (SubjectId >= 1)
                    {
                        msg = "true";
                    }
                    else
                    {
                        msg = "false";
                    }
                }
            }
            return msg;
        }


        //Insert ShortQuestion into Database
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string Insert_ShortQuestions(int SubId, int TestId, string QuestionText, string AnswerText, string ExpText, string ReferenceText, int points)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_ShortQuestions", con))
                {
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                   // Int32 AdminId = 124;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubId);
                    cmd.Parameters.AddWithValue("@TestId", TestId);
                    cmd.Parameters.AddWithValue("@QuestionText", HttpUtility.HtmlEncode(QuestionText));
                    cmd.Parameters.AddWithValue("@AnswerText", HttpUtility.HtmlEncode(AnswerText));
                    cmd.Parameters.AddWithValue("@ExplanationText", HttpUtility.HtmlEncode(ExpText));
                    cmd.Parameters.AddWithValue("@ReferenceText", HttpUtility.HtmlEncode(ReferenceText));
                    cmd.Parameters.AddWithValue("@Points", points);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    msg = "true";
                    con.Close();

                }
            }
            return msg;
        }

        // Insert LongQuestion into Database
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string Insert_LongQuestions(int SubId, int TestId, string QuestionText, string AnswerText, string ExpText, string ReferenceText, int points)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_LongQuestions", con))
                {
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                   // Int32 AdminId = 124;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubId);
                    cmd.Parameters.AddWithValue("@TestId", TestId);
                    cmd.Parameters.AddWithValue("@QuestionText", HttpUtility.HtmlEncode(QuestionText));
                    cmd.Parameters.AddWithValue("@AnswerText", HttpUtility.HtmlEncode(AnswerText));
                    cmd.Parameters.AddWithValue("@ExplanationText", HttpUtility.HtmlEncode(ExpText));
                    cmd.Parameters.AddWithValue("@ReferenceText", HttpUtility.HtmlEncode(ReferenceText));
                    cmd.Parameters.AddWithValue("@Points", points);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    msg = "true";
                    con.Close();

                }
            }
            return msg;
        }

        // Update_SubjectName  Delete_SubjectName Replace_SubjectName
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string Update_SubjectName(string SubjectName, int SubjectId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Update_SubjectName", con))
                {
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SubjectName", SubjectName);
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            return msg;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string Delete_SubjectName(int SubjectId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete_SubjectName", con))
                {
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            return msg;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string Replace_Subject(int OlSubjectId, int NewSubjectId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Replace_SubjectName", con))
                {
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@OldSubjectId", OlSubjectId);
                    cmd.Parameters.AddWithValue("@NewSubjectId", NewSubjectId);
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            return msg;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string Delete_Subject_Settings(int SubjectId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete_Subject_Settings", con))
                {
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            return msg;
        }


        // Insert into database Test Name only
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string InsertTestName(string TestName)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("InsertTestName", con))
                {
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    Int32 SubjectId = (Int32)HttpContext.Current.Session["SubjectId"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TestName", TestName);
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    con.Open();
                    int TestId = (Int32)cmd.ExecuteScalar();
                    con.Close();
                    HttpContext.Current.Session["TestId"] = TestId;
                    if (TestId >= 1)
                    {
                        msg = "true";
                    }
                    else
                    {
                        msg = "false";
                    }
                }
            }
            return msg;
        }

        // Dropdown for Subject Name.
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<ddlSubject> LoadddlSubject()
        {
            return LoadddlSubject1();
        }
        public static List<ddlSubject> LoadddlSubject1()                      //this method is a static type and list<property> is return.  
        {
            Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
           // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ddlSubject> SubjectInformation = new List<ddlSubject>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ddlSubjectName", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                    // this is a output parameters.  

                    //parameter.Direction = ParameterDirection.Output;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {

                        ds = new DataSet();
                        da.Fill(ds);    //Fill the dataset. 
                        try
                        {
                            if (ds != null)
                            {
                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        foreach (DataRow dr in ds.Tables[0].Rows)
                                        {
                                            SubjectInformation.Add(new ddlSubject()
                                            {
                                                SubjectId = Convert.ToInt32(dr["SubjectId"]),
                                                SubjectName = dr["SubjectName"].ToString()
                                            });
                                        }

                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {

                        }
                    }
                    return SubjectInformation;
                }
            }
        }

        // Dropdown for User Details
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<ddlLoadUsers> LoadddlUsers()
        {
            return LoadddlUser();
        }
        public static List<ddlLoadUsers> LoadddlUser()
        {
            Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
           // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ddlLoadUsers> UsersInformation = new List<ddlLoadUsers>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ddlUserDetails", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                    // this is a output parameters.  

                    //parameter.Direction = ParameterDirection.Output;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {

                        ds = new DataSet();
                        da.Fill(ds);    //Fill the dataset. 
                        try
                        {
                            if (ds != null)
                            {
                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        foreach (DataRow dr in ds.Tables[0].Rows)
                                        {
                                            UsersInformation.Add(new ddlLoadUsers()
                                            {
                                                UserId = Convert.ToInt32(dr["SubUserId"]),
                                                UserName = dr["UserName"].ToString(),
                                                UserEmail = dr["UserEmail"].ToString()
                                            });
                                        }

                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {

                        }
                    }
                    return UsersInformation;
                }
            }
        }

        // Show Mcqs

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<ShowMcqs> ShowMcqs(int McqsId)
        {
            return LoadMcqs(McqsId);
        }
        //this method is a static type and list<property> is return.
        public static List<ShowMcqs> LoadMcqs(int mcqsId)
        {
            Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            Int32 SubjectId = (Int32)HttpContext.Current.Session["SubjectId"];
            Int32 TestId = (Int32)HttpContext.Current.Session["TestId"];
            Int32 McqsQuestionId = (Int32)HttpContext.Current.Session["McqsQuestionInformationId"];
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowMcqs> ShowMcqsInfo = new List<ShowMcqs>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("Show_AdminInserted_Mcqs", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    con.Open();
                     cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@TestId", TestId);
                    cmd.Parameters.AddWithValue("@McqsQuestionId", mcqsId);
                    SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                    // this is a output parameters.  
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            bool op1 = (bool)dr["op1"];
                            bool op2 = (bool)dr["op2"];
                            bool op3 = (bool)dr["op3"];
                            bool op4 = (bool)dr["op4"];
                            bool op5 = (bool)dr["op5"];
                            bool op6 = (bool)dr["op6"];
                            bool op7 = (bool)dr["op7"];
                            bool op8 = (bool)dr["op8"];
                            string Option1Text;
                            bool Option1Correct;
                            string Option2Text;
                            bool Option2Correct;
                            string Option3Text;
                            bool Option3Correct;
                            string Option4Text;
                            bool Option4Correct;
                            string Option5Text;
                            bool Option5Correct;
                            string Option6Text;
                            bool Option6Correct;
                            string Option7Text;
                            bool Option7Correct;
                            string Option8Text;
                            bool Option8Correct;
                            if (op1 == true)
                            {
                                Option1Text = HttpUtility.HtmlDecode(dr["Option1Text"].ToString());
                                Option1Correct = (bool)dr["Option1Correct"];
                            }
                            else
                            {
                                Option1Text = null;
                                Option1Correct = false;
                            }
                            if (op2 == true)
                            {
                                Option2Text = HttpUtility.HtmlDecode(dr["Option2Text"].ToString());
                                Option2Correct = (bool)dr["Option2Correct"];
                            }
                            else
                            {
                                Option2Text = null;
                                Option2Correct = false;
                            }
                            if (op3 == true)
                            {
                                Option3Text = HttpUtility.HtmlDecode(dr["Option3Text"].ToString());
                                Option3Correct = (bool)dr["Option3Correct"];
                            }
                            else
                            {
                                Option3Text = null;
                                Option3Correct = false;
                            }
                            if (op4 == true)
                            {
                                Option4Text = HttpUtility.HtmlDecode(dr["Option4Text"].ToString());
                                Option4Correct = (bool)dr["Option4Correct"];
                            }
                            else
                            {
                                Option4Text = null;
                                Option4Correct = false;
                            }
                            if (op5 == true)
                            {
                                Option5Text = HttpUtility.HtmlDecode(dr["Option5Text"].ToString());
                                Option5Correct = (bool)dr["Option5Correct"];
                            }
                            else
                            {
                                Option5Text = null;
                                Option5Correct = false;
                            }
                            if (op6 == true)
                            {
                                Option6Text = HttpUtility.HtmlDecode(dr["Option6Text"].ToString());
                                Option6Correct = (bool)dr["Option6Correct"];
                            }
                            else
                            {
                                Option6Text = null;
                                Option6Correct = false;
                            }
                            if (op7 == true)
                            {
                                Option7Text = HttpUtility.HtmlDecode(dr["Option7Text"].ToString());
                                Option7Correct = (bool)dr["Option7Correct"];
                            }
                            else
                            {
                                Option7Text = null;
                                Option7Correct = false;
                            }
                            if (op8 == true)
                            {
                                Option8Text = HttpUtility.HtmlDecode(dr["Option8Text"].ToString());
                                Option8Correct = (bool)dr["Option8Correct"];
                            }
                            else
                            {
                                Option8Text = null;
                                Option8Correct = false;
                            }
                            ShowMcqsInfo.Add(new ShowMcqs()
                                                        {
                                                            AdminId = Convert.ToInt32(dr["0"]),
                                                            AdminName = dr["1"].ToString(),
                                                            AdminEmail = dr["2"].ToString(),
                                                            SubjectName = dr["SubjectName"].ToString(),
                                                            TestName = dr["TestName"].ToString(),
                                                            QuestionText = HttpUtility.HtmlDecode(dr["QuestionText"].ToString()),
                                                            ExplanationText = HttpUtility.HtmlDecode(dr["Explanation"].ToString()),
                                                            Reference = HttpUtility.HtmlDecode(dr["Reference"].ToString()),
                                                            Points = Convert.ToInt32(dr["Points"]),
                                                            op1 = op1,
                                                            op2 = op2,
                                                            op3 = op3,
                                                            op4 = op4,
                                                            op5 = op5,
                                                            op6 = op6,
                                                            op7 = op7,
                                                            op8 = op8,
                                                            Option1Text = Option1Text,
                                                            Option1Correct = Option1Correct,
                                                            Option2Text = Option2Text,
                                                            Option2Correct = Option2Correct,
                                                            Option3Text = Option3Text,
                                                            Option3Correct = Option3Correct,
                                                            Option4Text = Option4Text,
                                                            Option4Correct = Option4Correct,
                                                            Option5Text = Option5Text,
                                                            Option5Correct = Option5Correct,
                                                            Option6Text = Option6Text,
                                                            Option6Correct = Option6Correct,
                                                            Option7Text = Option7Text,
                                                            Option7Correct = Option7Correct,
                                                            Option8Correct = Option8Correct,
                                                            Option8Text = Option8Text


                                                        });

                        }
                    }
                    //parameter.Direction = ParameterDirection.Output;

                    //using (SqlDataReader dr = new SqlDataReader())
                    //{
                    //    dr = cmd.ExecuteReader();
                    //    ds = new DataSet();
                    //    da.Fill(ds);    //Fill the dataset. 
                    //    try
                    //    {
                    //        if (ds != null)
                    //        {
                    //            if (ds.Tables.Count > 0)
                    //            {
                    //                if (ds.Tables[0].Rows.Count > 0)
                    //                {
                    //                    foreach (DataRow dr in ds.Tables[0].Rows)
                    //                    {
                    //                        ShowMcqsInfo.Add(new ShowMcqs()
                    //                        {
                    //                            AdminId = Convert.ToInt32(dr["0"]),
                    //                            AdminName = dr["1"].ToString(),
                    //                            AdminEmail = dr["2"].ToString(),
                    //                            SubjectName = dr["3"].ToString(),
                    //                            TestName = dr["4"].ToString(),
                    //                            QuestionText = dr["5"].ToString(),
                    //                            Option1Text = dr["Option1Text"].ToString(),
                    //                            Option1Correct = (bool)dr["Option1Correct"],
                    //                            Option2Text = dr["Option2Text"].ToString(),
                    //                            Option2Correct = (bool)dr["Option2Correct"],
                    //                            Option3Text = dr["Option3Text"].ToString(),
                    //                            Option3Correct = (bool)dr["Option3Correct"],
                    //                            Option4Text = dr["Option4Text"].ToString(),
                    //                            Option4Correct = (bool)dr["Option4Correct"],
                    //                            Option5Text = dr["Option5Text"].ToString(),
                    //                            Option5Correct = (bool)dr["Option5Correct"],
                    //                            Option6Text = dr["Option6Text"].ToString(),
                    //                            Option6Correct = (bool)dr["Option6Correct"],
                    //                            Option7Text = dr["Option7Text"].ToString(),
                    //                            Option7Correct = (bool)dr["Option7Correct"],
                    //                            Option8Correct = (bool)dr["Option8Correct"],
                    //                            Option8Text = dr["Option8Text"].ToString(),
                    //                            ExplanationText = dr["Explanation"].ToString(),
                    //                            Reference = dr["ReferenceText"].ToString(),
                    //                            Points = dr["Points"].ToString(),
                    //                        });
                    //                    }

                    //                }
                    //            }
                    //        }
                    //    }
                    //    catch (Exception ex)
                    //    {

                    //    }
                    //}

                    return ShowMcqsInfo;
                }
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string DateTimes()
        {
            return DateTime.Now.ToShortTimeString();
        }

        // load test
        [System.Web.Services.WebMethod]
        public static List<ddlTest> LoadddlTest()
        {
            return LoadddlTest1();
        }
        //this method is a static type and list<property> is return. 
        public static List<ddlTest> LoadddlTest1()
        {
             Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
           // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ddlTest> SubjectInformation = new List<ddlTest>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ddlTestName", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 

                    // this is a output parameters.  

                    //parameter.Direction = ParameterDirection.Output;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {

                        ds = new DataSet();
                        da.Fill(ds);    //Fill the dataset. 
                        try
                        {
                            if (ds != null)
                            {
                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        foreach (DataRow dr in ds.Tables[0].Rows)
                                        {
                                            SubjectInformation.Add(new ddlTest()
                                            {
                                                TestId = Convert.ToInt32(dr["TestId"]),
                                                TestName = dr["TestName"].ToString()
                                            });
                                        }

                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {

                        }
                    }

                    return SubjectInformation;
                }
            }
        }

        // SaveMcqsQuestion
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string McqsQuestion_Insert(string SubjectId, string TestId, string QuestionText, string points, int SaveStatus)
        {

            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                if ((SaveStatus == 0) || (SaveStatus == 2))
                {
                    using (SqlCommand cmd = new SqlCommand("[tblMcqsQuestionInformation_Insert]", con))
                    {
                        Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                        //Int32 AdminId = 124;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@AdminId", AdminId);
                        cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                        cmd.Parameters.AddWithValue("@TestId", TestId); //@QuestionText
                        cmd.Parameters.AddWithValue("@QuestionText", HttpUtility.HtmlEncode(QuestionText));
                        cmd.Parameters.AddWithValue("@Points", points);
                        con.Open();
                        int mcqsQuestionInformationId = (Int32)cmd.ExecuteScalar();
                        con.Close();
                        HttpContext.Current.Session["McqsQuestionInformationId"] = mcqsQuestionInformationId;
                        if (mcqsQuestionInformationId >= 1)
                        {
                            msg = "true";
                        }
                        else
                        {
                            msg = "false";
                        }
                    }
                }
                else if (SaveStatus == 1)
                {
                    using (SqlCommand cmd = new SqlCommand("[tblMcqsQuestionInformation_Update]", con))
                    {
                        Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                        //Int32 AdminId = 124;
                        Int32 McqsQuestionInformationId = (Int32)HttpContext.Current.Session["McqsQuestionInformationId"];
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@McqsQuestionInformationId", McqsQuestionInformationId);
                        cmd.Parameters.AddWithValue("@AdminId", AdminId);
                        cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                        cmd.Parameters.AddWithValue("@TestId", TestId); //@QuestionText
                        cmd.Parameters.AddWithValue("@QuestionText", HttpUtility.HtmlEncode(QuestionText));
                        cmd.Parameters.AddWithValue("@Points", points);
                        con.Open();
                        int i = cmd.ExecuteNonQuery();
                        con.Close();
                        if (i == 1)
                        {
                            msg = "true";
                        }
                        else
                        {
                            msg = "false";
                        }
                    }
                }

            }
            return msg;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string Mcqs_Options_Insert(string txtOption1
                                                , string txtOption2, string txtOption3, string txtOption4
                                                , string txtOption5, string txtOption6, string txtOption7
                                                , string txtOption8, string chkOption1, string chkOption2
                                                , string chkOption3, string chkOption4, string chkOption5
                                                , string chkOption6, string chkOption7, string chkOption8)
        {

            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {

                {
                    using (SqlCommand cmd = new SqlCommand("AllOption_Insert", con))
                    {

                        Int32 McqsQuestionInformationId = (Int32)HttpContext.Current.Session["McqsQuestionInformationId"];
                        cmd.CommandType = CommandType.StoredProcedure;
                        //cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                        //cmd.Parameters.AddWithValue("@TestId", TestId);
                        cmd.Parameters.AddWithValue("@McqsQuestionInformationId", McqsQuestionInformationId);

                        // option text box.
                        cmd.Parameters.AddWithValue("@Option1Text", HttpUtility.HtmlEncode(txtOption1));
                        cmd.Parameters.AddWithValue("@Option2Text", HttpUtility.HtmlEncode(txtOption2));
                        cmd.Parameters.AddWithValue("@Option3Text", HttpUtility.HtmlEncode(txtOption3));
                        cmd.Parameters.AddWithValue("@Option4Text", HttpUtility.HtmlEncode(txtOption4));
                        cmd.Parameters.AddWithValue("@Option5Text", HttpUtility.HtmlEncode(txtOption5));
                        cmd.Parameters.AddWithValue("@Option6Text", HttpUtility.HtmlEncode(txtOption6));
                        cmd.Parameters.AddWithValue("@Option7Text", HttpUtility.HtmlEncode(txtOption7));
                        cmd.Parameters.AddWithValue("@Option8Text", HttpUtility.HtmlEncode(txtOption8));
                        //option check box
                        cmd.Parameters.AddWithValue("@Option1Correct", chkOption1);
                        cmd.Parameters.AddWithValue("@Option2Correct", chkOption2);
                        cmd.Parameters.AddWithValue("@Option3Correct", chkOption3);
                        cmd.Parameters.AddWithValue("@Option4Correct", chkOption4);
                        cmd.Parameters.AddWithValue("@Option5Correct", chkOption5);
                        cmd.Parameters.AddWithValue("@Option6Correct", chkOption6);
                        cmd.Parameters.AddWithValue("@Option7Correct", chkOption7);
                        cmd.Parameters.AddWithValue("@Option8Correct", chkOption8);

                        con.Open();
                        int i = (Int32)cmd.ExecuteScalar();
                        con.Close();
                        if (i >= 1)
                        {
                            msg = "true";
                        }
                        else
                        {
                            msg = "false";
                        }
                    }
                }
            }
            return msg;
        }

        // SaveMcqsQuestion_Reference
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string McqsQuestionReference_Insert(string SubjectId, string TestId, string ReferenceText)
        {
            int McqsQuestionInformationId = (Int32)HttpContext.Current.Session["McqsQuestionInformationId"];
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {

                {
                    using (SqlCommand cmd = new SqlCommand("tblReference_insert", con))
                    {
                        Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                       // Int32 AdminId = 124;

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@AdminId", AdminId);
                        cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                        cmd.Parameters.AddWithValue("@TestId", TestId); //@QuestionText
                        cmd.Parameters.AddWithValue("@ReferenceText", HttpUtility.HtmlEncode(ReferenceText));
                        cmd.Parameters.AddWithValue("@McqsQuestionInformationId", McqsQuestionInformationId);
                        con.Open();
                        int ReferenceId = (Int32)cmd.ExecuteScalar();
                        con.Close();
                        HttpContext.Current.Session["ReferenceId"] = ReferenceId;
                        if (ReferenceId >= 1)
                        {
                            msg = "true";
                        }
                        else
                        {
                            msg = "false";
                        }
                    }
                }
            }
            return msg;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string McqsQuestionExplanation_Insert(string SubjectId, string TestId, string ExplanationText)
        {
            int McqsQuestionInformationId = (Int32)HttpContext.Current.Session["McqsQuestionInformationId"];
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {

                {
                    using (SqlCommand cmd = new SqlCommand("tblExplanation_insert", con))
                    {
                        Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                       // Int32 AdminId = 124;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@AdminId", AdminId);
                        cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                        cmd.Parameters.AddWithValue("@TestId", TestId); //@QuestionText
                        cmd.Parameters.AddWithValue("@ExplanationText", HttpUtility.HtmlEncode(ExplanationText));
                        cmd.Parameters.AddWithValue("@McqsQuestionInformationId", McqsQuestionInformationId);
                        con.Open();
                        int ExplanationId = (Int32)cmd.ExecuteScalar();
                        con.Close();
                        HttpContext.Current.Session["ExplanationId"] = ExplanationId;
                        if (ExplanationId >= 1)
                        {
                            msg = "true";
                        }
                        else
                        {
                            msg = "false";
                        }
                    }
                }
            }
            return msg;
        }

        // Edit Mcqs
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static int Edit_Mcqs(string SubjectId, string TestId, string QuestionId, string QuestionText, string points, string txtOption1
                                                , string txtOption2, string txtOption3, string txtOption4
                                                , string txtOption5, string txtOption6, string txtOption7
                                                , string txtOption8, string chkOption1, string chkOption2
                                                , string chkOption3, string chkOption4, string chkOption5
                                                , string chkOption6, string chkOption7, string chkOption8
                                                , string ReferenceText, string ExplanationText)
        {

            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {

                {
                    using (SqlCommand cmd = new SqlCommand("Edit_Mcqs", con))
                    {
                        Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@AdminId", AdminId);
                        cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                        cmd.Parameters.AddWithValue("@TestId", TestId);
                        cmd.Parameters.AddWithValue("@QuestionId", QuestionId);
                        cmd.Parameters.AddWithValue("@QuestionText", HttpUtility.HtmlEncode(QuestionText));
                        cmd.Parameters.AddWithValue("@Points", points);
                        // option text box.
                        cmd.Parameters.AddWithValue("@Option1", HttpUtility.HtmlEncode(txtOption1));
                        cmd.Parameters.AddWithValue("@Option2", HttpUtility.HtmlEncode(txtOption2));
                        cmd.Parameters.AddWithValue("@Option3", HttpUtility.HtmlEncode(txtOption3));
                        cmd.Parameters.AddWithValue("@Option4", HttpUtility.HtmlEncode(txtOption4));
                        cmd.Parameters.AddWithValue("@Option5", HttpUtility.HtmlEncode(txtOption5));
                        cmd.Parameters.AddWithValue("@Option6", HttpUtility.HtmlEncode(txtOption6));
                        cmd.Parameters.AddWithValue("@Option7", HttpUtility.HtmlEncode(txtOption7));
                        cmd.Parameters.AddWithValue("@Option8", HttpUtility.HtmlEncode(txtOption8));
                        //option check box
                        cmd.Parameters.AddWithValue("@chkOption1", chkOption1);
                        cmd.Parameters.AddWithValue("@chkOption2", chkOption2);
                        cmd.Parameters.AddWithValue("@chkOption3", chkOption3);
                        cmd.Parameters.AddWithValue("@chkOption4", chkOption4);
                        cmd.Parameters.AddWithValue("@chkOption5", chkOption5);
                        cmd.Parameters.AddWithValue("@chkOption6", chkOption6);
                        cmd.Parameters.AddWithValue("@chkOption7", chkOption7);
                        cmd.Parameters.AddWithValue("@chkOption8", chkOption8);
                        cmd.Parameters.AddWithValue("@Reference", HttpUtility.HtmlEncode(ExplanationText));
                        cmd.Parameters.AddWithValue("@Explanation", HttpUtility.HtmlEncode(ReferenceText));

                        con.Open();
                        cmd.ExecuteNonQuery();
                        int i = 1;
                        con.Close();

                        return i;
                    }
                }
            }



        }


        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string tblSubUser_Insert(int UserRoleId, string UserName, string UserEmail, string UserPassword,
                                               string UserParrentEmail, string UserParentName, string UserRollNo, string UserFirstName, string UserLastName
                                               , string UserDepartment, string UserRegion, string TelephoneNo, string UserDOB, int UserGroup
                                               , string UserImage, string UserCountry, string UserCity, int UserGender, bool UserCertificateDesignCustomize
                                               , bool UserResultCardDesignCustomize, bool EmailResultToUser, string TermsAndConditionsForUsers
                                                , bool UserPracticeMode, bool UserRandomizeQuestions, int TotalAttemptsForUsers
                                                , bool EmailTestResultToAdmin, bool AllResult, string UserTestStartDateTime, string UserTestEndDateTime
                                                )
        {

            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                DateTime? NullableDateTime = null;
                using (SqlCommand cmd = new SqlCommand("[tblSubUser_Insert]", con))
                {
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@UserRoldId", UserRoleId);
                    cmd.Parameters.AddWithValue("@UserName", UserName);
                    cmd.Parameters.AddWithValue("@UserEmail", UserEmail);
                    cmd.Parameters.AddWithValue("@UserPassword", UserPassword);
                    cmd.Parameters.AddWithValue("@UserParrentEmail", UserParrentEmail);
                    cmd.Parameters.AddWithValue("@UserParrentName", UserParentName);
                    cmd.Parameters.AddWithValue("@UserRollNo", UserRollNo);
                    cmd.Parameters.AddWithValue("@UserFirstName", UserFirstName);
                    cmd.Parameters.AddWithValue("@UserLastName", UserLastName);
                    cmd.Parameters.AddWithValue("@UserDepartment", UserDepartment);
                    cmd.Parameters.AddWithValue("@UserRegion", UserRegion);
                    cmd.Parameters.AddWithValue("@UserTelephoneNo", TelephoneNo);
                    if (UserDOB == "")
                    {
                        cmd.Parameters.AddWithValue("@UserDOB", "");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@UserDOB", UserDOB);
                    }
                    cmd.Parameters.AddWithValue("@UserGroup", UserGroup);

                    cmd.Parameters.AddWithValue("@UserImage", UserImage);
                    cmd.Parameters.AddWithValue("@UserCountry", UserCountry);
                    cmd.Parameters.AddWithValue("@UserCity", UserCity);
                    cmd.Parameters.AddWithValue("@UserGender", UserGender);
                    if (UserCertificateDesignCustomize == false)
                    {
                        cmd.Parameters.AddWithValue("@UserCertificateDesignCustomize", ""); //UserCertificateDesignCustomize);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@UserCertificateDesignCustomize", UserCertificateDesignCustomize); //UserCertificateDesignCustomize);
                    }
                    if (UserResultCardDesignCustomize == false)
                    {
                        cmd.Parameters.AddWithValue("@UserResultCardDesignCustomize", ""); //UserResultCardDesignCustomize);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@UserResultCardDesignCustomize", UserResultCardDesignCustomize); //UserResultCardDesignCustomize);
                    }
                    if (EmailResultToUser == false)
                    {
                        cmd.Parameters.AddWithValue("@EmailResultToUser", ""); //EmailResultToUser);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@EmailResultToUser", EmailResultToUser); //EmailResultToUser);
                    }

                    cmd.Parameters.AddWithValue("@TermsAndConditionsForUsers", HttpUtility.HtmlEncode(TermsAndConditionsForUsers));//TermsAndConditionsForUsers);
                    if (UserPracticeMode == false)
                    {
                        cmd.Parameters.AddWithValue("@UserPracticeMode", "");//UserPracticeMode);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@UserPracticeMode", UserPracticeMode);//UserPracticeMode);
                    }
                    if (UserRandomizeQuestions == false)
                    {
                        cmd.Parameters.AddWithValue("@UserRandomizeQuestions", "");// UserRandomizeQuestions);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@UserRandomizeQuestions", UserRandomizeQuestions);// UserRandomizeQuestions);
                    }
                    cmd.Parameters.AddWithValue("@TotalAttemptsForUsers", "");
                    if (EmailTestResultToAdmin == false)
                    {
                        cmd.Parameters.AddWithValue("@EmailTestResultToAdmin", ""); //EmailTestResultToAdmin);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@EmailTestResultToAdmin", EmailTestResultToAdmin); //EmailTestResultToAdmin);
                    }
                    if (AllResult == false)
                    {
                        cmd.Parameters.AddWithValue("@AllResult", "");// AllResult);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@AllResult", AllResult);// AllResult);
                    }
                    if (UserTestStartDateTime == "")
                    {
                        cmd.Parameters.AddWithValue("@UserTestStartDateTime", "");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@UserTestStartDateTime", UserTestStartDateTime);
                    }
                    if (UserTestEndDateTime == "")
                    {
                        cmd.Parameters.AddWithValue("@UserTestEndDateTime", "");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@UserTestEndDateTime", UserTestEndDateTime);
                    }
                    //@UserCertificateDesignCustomize bit,
                    con.Open();
                    //cmd.ExecuteNonQuery();
                    Int32 status = (Int32)cmd.ExecuteScalar();
                    con.Close();
                    // HttpContext.Current.Session["McqsQuestionInformationId"] = mcqsQuestionInformationId;
                    if (status >= 1)
                    {
                        msg = "true";
                    }
                    else
                    {
                        msg = "false";
                    }
                }
            }
            return msg;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string InsertUserGroupName(string UserGroupName)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_UserGroupName", con))
                {
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                   // Int32 AdminId = 124;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@UserGroupName", UserGroupName);
                    con.Open();
                    int status = (Int32)cmd.ExecuteScalar();
                    con.Close();
                    if (status >= 1)
                    {
                        msg = "true";
                    }
                    else
                    {
                        msg = "false";
                    }
                }
            }
            return msg;
        }

        [System.Web.Services.WebMethod]
        public static List<ddlUserGroups> LoadddlUserGroup()
        {
            return LoadddlUserrGroups();
        }
        public static List<ddlUserGroups> LoadddlUserrGroups()                      //this method is a static type and list<property> is return.  
        {
            Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
          //  Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ddlUserGroups> ddlUserGroupInformation = new List<ddlUserGroups>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ddlUserGroupNames", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                    // this is a output parameters.  

                    //parameter.Direction = ParameterDirection.Output;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {

                        ds = new DataSet();
                        da.Fill(ds);    //Fill the dataset. 
                        try
                        {
                            if (ds != null)
                            {
                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        foreach (DataRow dr in ds.Tables[0].Rows)
                                        {
                                            ddlUserGroupInformation.Add(new ddlUserGroups()
                                            {
                                                UserGroupId = Convert.ToInt32(dr["UserGroupId"]),
                                                UserGroupName = dr["UserGroupName"].ToString()
                                            });
                                        }

                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {

                        }
                    }

                    return ddlUserGroupInformation;
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static List<Dashboard_UsersMcqs> Dashboard_UsersMcqs()
        {
            return Dashboard_UsersMcqs1();
        }
        public static List<Dashboard_UsersMcqs> Dashboard_UsersMcqs1()
        {
            Int32 useradminid = (Int32)HttpContext.Current.Session["UserAdminId"];

             Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<Dashboard_UsersMcqs> Dashboard_UsersMcqs = new List<Dashboard_UsersMcqs>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select * from View_Users_Mcqs_Information Where AdminId = '" + useradminid + "'", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    //SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                    // this is a output parameters.  
                    //parameter.Direction = ParameterDirection.Output;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        ds = new DataSet();
                        da.Fill(ds);    //Fill the dataset. 
                        try
                        {
                            if (ds != null)
                            {
                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        foreach (DataRow dr in ds.Tables[0].Rows)
                                        {
                                            Dashboard_UsersMcqs.Add(new Dashboard_UsersMcqs()
                                            {
                                                SubjectId = Convert.ToInt32(dr["SubjectId"]),
                                                SubjectName = (dr["SubjectName"].ToString()),
                                                TestId = Convert.ToInt32(dr["TestId"]),
                                                TestName = (dr["TestName"].ToString()),
                                                TestStartingDate = (dr["TestStartDateTime"].ToString()),
                                                TestEndingDate = (dr["TestEndDateTime"].ToString()),
                                                TestStatus = Convert.ToBoolean(dr["TestStatus"]),
                                                UserTestTimingId = Convert.ToInt32(dr["UserTestTimingId"])
                                            });
                                        }

                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {

                        }
                    }

                    return Dashboard_UsersMcqs;
                }
            }
        }




        [System.Web.Services.WebMethod]
        public static List<OnLoad> OnLoad()
        {
            return OnLoad1();
        }
        public static List<OnLoad> OnLoad1()
        {
             int adminid = (Int32)HttpContext.Current.Session["AdminId"];
           // Int32 adminid = 124;
            string adminname = HttpContext.Current.Session["AdminName"].ToString();
            string adminemail = HttpContext.Current.Session["AdminEmail"].ToString();
            int subuserid = (Int32)HttpContext.Current.Session["SubUserId"];
            string username = HttpContext.Current.Session["UserName"].ToString();
            string useremail = HttpContext.Current.Session["UserEmail"].ToString();
            int useradminid = (Int32)HttpContext.Current.Session["UserAdminId"];
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<OnLoad> Onload = new List<OnLoad>();  //create a reference of List<Property>.  
            Onload.Add(new OnLoad()
               {
                   SubUserAdminId = useradminid,
                   AdminId = adminid,
                   UserId = subuserid
               });
            return Onload;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string Insert_Test_With_All_Options(int ddlSubjectId, string TestName, string TestDescription, bool TestStatus, bool PractiseSession, int PassingPercentage, string TestImage, string TestInstructions, string TestStartDateTime, string TestDueDateTime, int TestAttempts, string TestExtendedDateTime, bool TestAlwaysOpen)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_Test_With_All_Options", con))
                {
                   Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                   // Int32 AdminId = 124;
                    Int32 SubjectId = ddlSubjectId;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TestName", TestName);
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@TestDescription", TestDescription);
                    cmd.Parameters.AddWithValue("@TestStatus", TestStatus);
                    cmd.Parameters.AddWithValue("@TestPracticeSession", PractiseSession);
                    cmd.Parameters.AddWithValue("@TestPassingPercentage", PassingPercentage);
                    cmd.Parameters.AddWithValue("@TestImage", TestImage);
                    cmd.Parameters.AddWithValue("@TestInstructions", TestInstructions);
                    DateTime? myDate;
                    if (TestStartDateTime == "")
                    {
                        myDate = null;
                        cmd.Parameters.AddWithValue("@TestStartTiming", "");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@TestStartTiming", DateTime.Parse(TestStartDateTime));
                    }
                    if (TestDueDateTime == "")
                    {
                        myDate = null;
                        cmd.Parameters.AddWithValue("@TestDueTiming", "");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@TestDueTiming", DateTime.Parse(TestDueDateTime));
                    }

                    cmd.Parameters.AddWithValue("@TestAttempts", TestAttempts);
                    if (TestExtendedDateTime == "")
                    {
                        myDate = null;
                        cmd.Parameters.AddWithValue("@TestExtendedDateTime", "");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@TestExtendedDateTime", DateTime.Parse(TestExtendedDateTime));
                    }

                    cmd.Parameters.AddWithValue("@TestAlwaysOpen", TestAlwaysOpen);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    msg = "1";
                    con.Close();
                }
            }
            return msg;
        }

        [System.Web.Services.WebMethod]
        public static void ddlTestSettings_GetSelectedTestId(int SubjectId, int TestId)
        {
            HttpContext.Current.Session["For_LoadTest_Settings_ddlSubjectId"] = SubjectId;
            HttpContext.Current.Session["For_LoadTest_Settings_ddlTestId"] = TestId;
        }

        [System.Web.Services.WebMethod]
        public static void ddlUserDetails_GetSelectedUserId(int UserId)
        {
            HttpContext.Current.Session["For_Load_Edit_UserDetails_ddlEditUserId"] = UserId;

        }





        [System.Web.Services.WebMethod]
        public static string Update_Test_With_All_Options(int ddlSubjectId, string TestName, string TestDescription, bool TestStatus, bool TestPracticeSession, int TestPassingPercentage, string TestImage, string TestInstructions, string TestStartTiming, string TestDueTiming, int TestAttempts, string TestExtendedDateTime, bool TestAlwaysOpen, int TestId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Update_Test_With_All_Options", con))
                {
                    DateTime? datetime;
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                   // Int32 AdminId = 124;
                    Int32 SubjectId = ddlSubjectId;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TestName", TestName);
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                   // cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@TestDescription", TestDescription);
                    cmd.Parameters.AddWithValue("@TestStatus", TestStatus);
                    cmd.Parameters.AddWithValue("@TestPracticeSession", TestPracticeSession);
                    cmd.Parameters.AddWithValue("@TestPassingPercentage", TestPassingPercentage);
                    cmd.Parameters.AddWithValue("@TestImage", TestImage);
                    cmd.Parameters.AddWithValue("@TestInstructions", TestInstructions);
                    if (TestStartTiming == "")
                    {
                        datetime = null;
                        cmd.Parameters.AddWithValue("@TestStartTiming", "");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@TestStartTiming", DateTime.Parse(TestStartTiming));
                    }
                    if (TestDueTiming == "")
                    {
                        datetime = null;
                        cmd.Parameters.AddWithValue("@TestDueTiming", "");
                    }
                    else
                    {

                        cmd.Parameters.AddWithValue("@TestDueTiming", TestDueTiming);
                    }
                    cmd.Parameters.AddWithValue("@TestAttempts", TestAttempts);
                    if (TestExtendedDateTime == "")
                    {
                        datetime = null;
                        cmd.Parameters.AddWithValue("@TestExtendedDateTime", "");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@TestExtendedDateTime", DateTime.Parse(TestExtendedDateTime));
                    }

                    cmd.Parameters.AddWithValue("@TestAlwaysOpen", TestAlwaysOpen);
                    cmd.Parameters.AddWithValue("@TestId", TestId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    msg = "1";
                    con.Close();
                }
            }
            return msg;
        }

        [System.Web.Services.WebMethod]
        public static List<LoadTestSettings> Load_Test_Setting(int subjectId)
        {
            return Load_Test_Settings(subjectId);
        }
        public static List<LoadTestSettings> Load_Test_Settings(int subId)
        {
            Int32 useradminid = (Int32)HttpContext.Current.Session["UserAdminId"];
            Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
           // Int32 AdminId = 124;
            Int32 TestId = (Int32)HttpContext.Current.Session["For_LoadTest_Settings_ddlTestId"];
            Int32 SubjectId = subId;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<LoadTestSettings> Load_Test_Settings = new List<LoadTestSettings>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Select * from View_LoadTestSettings where AdminId = '" + AdminId + "' and SubjectId = '" + SubjectId + "'", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    //SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                    // this is a output parameters.  
                    //parameter.Direction = ParameterDirection.Output;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        ds = new DataSet();
                        da.Fill(ds);    //Fill the dataset. 
                        try
                        {
                            if (ds != null)
                            {
                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        foreach (DataRow dr in ds.Tables[0].Rows)
                                        {
                                            Load_Test_Settings.Add(new LoadTestSettings()
                                            {
                                                TestName = dr["TestName"].ToString(),
                                                TestDescription = (dr["TestDescription"].ToString()),
                                                TestStatus = Convert.ToBoolean(dr["TestStatus"]),
                                                TestPractiseSession = Convert.ToBoolean(dr["TestPracticeSession"]),
                                                TestPassingPercentage = Convert.ToInt32(dr["TestPassingPercentage"]),
                                                TestImage = (dr["TestImage"].ToString()),
                                                TestInstructions = (dr["TestInstructions"].ToString()),
                                                TestStartTiming = dr["TestStartDateTime"].ToString(),
                                                TestDueTiming = dr["TestEndDateTime"].ToString(),
                                                TestAlwaysOpen = Convert.ToBoolean(dr["TestAlwaysOpen"]),
                                                TestAttempts = Convert.ToInt32(dr["TestAttempts"]),
                                                TestExtendableDateTime = dr["TestExtendedDateTime"].ToString()
                                            });
                                        }

                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {

                        }
                    }

                    return Load_Test_Settings;
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static string Delete_Test(int TestId, int ddlSubjectId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete_Test", con))
                {
                     Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                  //  Int32 AdminId = 124;
                    Int32 SubjectId = ddlSubjectId;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@TestId", TestId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    msg = "1";
                    con.Close();
                }
            }
            return msg;
        }

        [System.Web.Services.WebMethod]
        public static string Merge_Test(int TestId, int ddlSubjectId, int ddlNewSubjectId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Merge_Test", con))
                {
                      Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    //Int32 AdminId = 124;
                    Int32 SubjectId = ddlSubjectId;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@OldSubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@NewSubjectId", ddlNewSubjectId);
                    cmd.Parameters.AddWithValue("@OldTestId", TestId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    msg = "1";
                    con.Close();
                }
            }
            return msg;
        }

        // load users
        [System.Web.Services.WebMethod]
        public static List<UsersDetail> UserDetail()
        {
            return UsersDetail();
        }
        public static List<UsersDetail> UsersDetail()
        {
             Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
           // Int32 AdminId = 124;
            Int32 UserId = (Int32)HttpContext.Current.Session["For_Load_Edit_UserDetails_ddlEditUserId"];
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<UsersDetail> Load_UsersDetail = new List<UsersDetail>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select * from View_ShowUserDetail Where AdminId = '" + AdminId + "' and subUserId = '" + UserId + "'", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    //SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                    // this is a output parameters.  
                    //parameter.Direction = ParameterDirection.Output;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        ds = new DataSet();
                        da.Fill(ds);    //Fill the dataset. 
                        try
                        {
                            if (ds != null)
                            {
                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        foreach (DataRow dr in ds.Tables[0].Rows)
                                        {
                                            Load_UsersDetail.Add(new UsersDetail()
                                            {
                                                UserId = Convert.ToInt32(dr["SubUserId"]),
                                                UserEmail = (dr["UserEmail"].ToString()),
                                                UserName = (dr["UserName"].ToString()),
                                                UserPassword = (dr["UserPassword"].ToString()),
                                                UserParrentName = (dr["ParrentName"].ToString()),
                                                UserParrentEmail = (dr["ParrentEmail"].ToString()),
                                                UserRollNo = (dr["UserRollNo"].ToString()),
                                                UserFirstName = (dr["UserFirstName"].ToString()),
                                                UserLastName = (dr["UserLastName"].ToString()),
                                                UserDepartment = (dr["UserDepartment"].ToString()),
                                                UserRegion = (dr["UserRegion"].ToString()),
                                                UserPhoneNo = (dr["UserTelephoneNo"].ToString()),
                                                UserDateOfBirth = (dr["UserDOB"].ToString()),
                                                //UserGender = Int32.Parse(dr["UserGender"].ToString()),
                                                UserCity = (dr["UserCity"].ToString()),
                                                UserPicture = (dr["UserImage"].ToString()),
                                                UserCountry = (dr["UserCountry"].ToString()),
                                                UserTestStartDateTime = (dr["TestStartDateTime"].ToString()),
                                                UserTestDueDateTime = (dr["TestEndDateTime"].ToString()),
                                                UserExtendedDateTime = (dr["TestExtendedDateTime"].ToString()),
                                                //UserTestAlwaysOpen = bool.Parse(dr["TestAlwaysOpen"].ToString()),
                                                // EmailResultToUser = bool.Parse(dr["EmailResultToUser"].ToString()),
                                                //UserPracticeMode = bool.Parse(dr["UserPracticeMode"].ToString()),
                                                //UserRandomizeQuestions = bool.Parse(dr["RandomizeQuestions"].ToString()),
                                                // EmailUserTestResultToAdmin = bool.Parse(dr["EmailTestResultToAdmin"].ToString()),
                                                UserTotalAttempts = Int32.Parse(dr["TotalAttemptsForUsers"].ToString()),
                                                UserRole = Int32.Parse(dr["UserRoleId"].ToString()),
                                                // UserSeeOthersResult = bool.Parse(dr["AllResult"].ToString()),
                                                // UserCustomizeCertificateDesign = bool.Parse(dr["CertificateDesignCustomize"].ToString()),
                                                // UserCustomizeResultCardDesign = bool.Parse(dr["ResultCardDesignCustomize"].ToString()),
                                                UserTermsAndConditions = (dr["TermsAndConditionsForUsers"].ToString()),
                                            });
                                        }

                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {

                        }
                    }

                    return Load_UsersDetail;
                }
            }
        }


        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<ShowMcqsQuestionOnly> LoadMcqsQuestions(int SubId, int TestId)
        {
            return LoadMcqsQuestion(SubId, TestId);
        }

        //this method is a static type and list<property> is return.
        public static List<ShowMcqsQuestionOnly> LoadMcqsQuestion(int SubjectId, int Testid)
        {
            Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowMcqsQuestionOnly> ShowMcqsInfo = new List<ShowMcqsQuestionOnly>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ShowMcqsQuestionOnly", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@TestId", Testid);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            ShowMcqsInfo.Add(new ShowMcqsQuestionOnly()
                                                        {
                                                            McqsQuestion = HttpUtility.HtmlDecode(dr["QuestionText"].ToString()),
                                                            McqsQuestionId = Convert.ToInt32(dr["McqsQuestionInformationId"].ToString())
                                                        });
                        }
                    }
                    return ShowMcqsInfo;
                }
            }
        }


        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<ShowShortQuestionOnly> LoadShortQuestions(int SubId, int TestId)
        {
            return LoadShortQuestion(SubId, TestId);
        }

        //this method is a static type and list<property> is return.
        public static List<ShowShortQuestionOnly> LoadShortQuestion(int SubjectId, int Testid)
        {
            Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
           // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowShortQuestionOnly> ShowMcqsInfo = new List<ShowShortQuestionOnly>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ShowShortQuestionOnly", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@TestId", Testid);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            ShowMcqsInfo.Add(new ShowShortQuestionOnly()
                            {
                                ShortQuestion = HttpUtility.HtmlDecode(dr["ShortQuestionText"].ToString()),
                                ShortQuestionId = Convert.ToInt32(dr["ShortQuestionId"].ToString())
                            });
                        }
                    }
                    return ShowMcqsInfo;
                }
            }
        }

        // This Method 
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<ShowLongQuestionOnly> LoadLongQuestions(int SubId, int TestId)
        {
            return LoadLongQuestion(SubId, TestId);
        }

        //this method is a static type and list<property> is return.
        public static List<ShowLongQuestionOnly> LoadLongQuestion(int SubjectId, int Testid)
        {
           Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
          //  Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowLongQuestionOnly> ShowMcqsInfo = new List<ShowLongQuestionOnly>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ShowLongQuestionOnly", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@TestId", Testid);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            ShowMcqsInfo.Add(new ShowLongQuestionOnly()
                            {
                                LongQuestion = HttpUtility.HtmlDecode(dr["LongQuestionText"].ToString()),
                                LongQuestionId = Convert.ToInt32(dr["LongQuestionId"].ToString())
                            });
                        }
                    }
                    return ShowMcqsInfo;
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static List<ddlTest> LoadddlTestForSpecificSub(int SubId)
        {
            return LoadddlTestForSpecificSubj(SubId);
        }
        //this method is a static type and list<property> is return. 
        public static List<ddlTest> LoadddlTestForSpecificSubj(int subid)
        {
             Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
           // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ddlTest> SubjectInformation = new List<ddlTest>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ddlTestNameForSpecificSubj", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                    SqlParameter parameter1 = cmd.Parameters.Add("@SubId", subid);
                    // this is a output parameters.  

                    //parameter.Direction = ParameterDirection.Output;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {

                        ds = new DataSet();
                        da.Fill(ds);    //Fill the dataset. 
                        try
                        {
                            if (ds != null)
                            {
                                if (ds.Tables.Count > 0)
                                {
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        foreach (DataRow dr in ds.Tables[0].Rows)
                                        {
                                            SubjectInformation.Add(new ddlTest()
                                            {
                                                TestId = Convert.ToInt32(dr["TestId"]),
                                                TestName = dr["TestName"].ToString()
                                            });
                                        }

                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {

                        }
                    }

                    return SubjectInformation;
                }
            }
        }

        // delete mcqs Question
        [System.Web.Services.WebMethod]
        public static string Delet_McqsQuestion(int TestId, int SubjectId, int QuestionId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete_Mcqs_Question", con))
                {
                      Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                  //  Int32 AdminId = 124;

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@TestId", TestId);
                    cmd.Parameters.AddWithValue("@McqsQuestionInformationId", QuestionId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    msg = "1";
                    con.Close();
                }
            }
            return msg;
        }

        // delete Short Questions
        [System.Web.Services.WebMethod]
        public static string Delet_ShortQuestion(int TestId, int SubjectId, int QuestionId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete_Short_Question", con))
                {
                      Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                  //  Int32 AdminId = 124;

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@TestId", TestId);
                    cmd.Parameters.AddWithValue("@ShortQuestionId", QuestionId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    msg = "1";
                    con.Close();
                }
            }
            return msg;
        }

        // delete Long Questions
        [System.Web.Services.WebMethod]
        public static string Delet_LongQuestion(int TestId, int SubjectId, int QuestionId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete_Long_Question", con))
                {
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                   // Int32 AdminId = 124;

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@TestId", TestId);
                    cmd.Parameters.AddWithValue("@LongQuestionId", QuestionId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    msg = "1";
                    con.Close();
                }
            }
            return msg;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<ShowShortQuestion> LoadShortQuestionsWithAllOptions(int shortQuestionId)
        {
            return LoadShortQuestionWithAllOption(shortQuestionId);
        }

        //this method is a static type and list<property> is return.
        public static List<ShowShortQuestion> LoadShortQuestionWithAllOption(int shortqId)
        {
            Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
           // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowShortQuestion> ShowShortInfo = new List<ShowShortQuestion>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ShowShortQuestions", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@ShortQuestionId", shortqId);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            ShowShortInfo.Add(new ShowShortQuestion()
                            {
                                ShortQuestionText = HttpUtility.HtmlDecode(dr["ShortQuestionText"].ToString()),
                                ShortQuestionAnswer = HttpUtility.HtmlDecode(dr["ShortQuestionAnswer"].ToString()),
                                ShortQuestionExplanationText = HttpUtility.HtmlDecode(dr["ShortLongQuestionExplanationText"].ToString()),
                                ShortQuestionExplanationReference = HttpUtility.HtmlDecode(dr["ShortLongQuestionExplanationReference"].ToString()),
                                ShortQuestionPoints = Convert.ToInt32(dr["ShortQuestionPoints"].ToString())
                            });
                        }
                    }
                    return ShowShortInfo;
                }
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<ShowShortQuestion> LoadLongQuestionWithAllOption(int LongQuestionId)
        {
            return LoadLongQuestionWithAllOptions(LongQuestionId);
        }

        //this method is a static type and list<property> is return.
        public static List<ShowShortQuestion> LoadLongQuestionWithAllOptions(int LongqId)
        {
            Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowShortQuestion> ShowLongInfo = new List<ShowShortQuestion>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ShowLongQuestions", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@LongQuestionId", LongqId);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            ShowLongInfo.Add(new ShowShortQuestion()
                            {
                                LongQuestionText = HttpUtility.HtmlDecode(dr["LongQuestionText"].ToString()),
                                LongQuestionAnswer = HttpUtility.HtmlDecode(dr["LongQuestionAnswer"].ToString()),
                                LongQuestionExplanationText = HttpUtility.HtmlDecode(dr["LongQuestionExplanationText"].ToString()),
                                LongQuestionExplanationReference = HttpUtility.HtmlDecode(dr["LongQuestionExplanationReference"].ToString()),
                                LongQuestionPoints = Convert.ToInt32(dr["LongQuestionPoints"].ToString())
                            });
                        }
                    }
                    return ShowLongInfo;
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static string Update_ShortQuestion_WithAllOptions(int TestId, int SubjectId, int ShortQuestionId, string QuestionText, string AnswerText, string ExplanationText, string ReferenceText, int Points)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Edit_ShortQuestions", con))
                {
                    DateTime? datetime;
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TestId", TestId);
                    cmd.Parameters.AddWithValue("@ShortQuestionId", ShortQuestionId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@QuestionText", QuestionText);
                    cmd.Parameters.AddWithValue("@AnswerText", AnswerText);
                    cmd.Parameters.AddWithValue("@ExplanationText", ExplanationText);
                    cmd.Parameters.AddWithValue("@ReferenceText", ReferenceText);
                    cmd.Parameters.AddWithValue("@Points", Points);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    msg = "1";
                    con.Close();
                }
            }
            return msg;
        }

        // for update long questions 
        [System.Web.Services.WebMethod]
        public static string Update_LongQuestion_WithAllOptions(int TestId, int SubjectId, int LongQuestionId, string QuestionText, string AnswerText, string ExplanationText, string ReferenceText, int Points)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Edit_LongQuestions", con))
                {
                    
                    Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TestId", TestId);
                    cmd.Parameters.AddWithValue("@LongQuestionId", LongQuestionId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@QuestionText", QuestionText);
                    cmd.Parameters.AddWithValue("@AnswerText", AnswerText);
                    cmd.Parameters.AddWithValue("@ExplanationText", ExplanationText);
                    cmd.Parameters.AddWithValue("@ReferenceText", ReferenceText);
                    cmd.Parameters.AddWithValue("@Points", Points);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    msg = "1";
                    con.Close();
                }
            }
            return msg;
        }

        // Show Test
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<ShowShortQuestionOnly> LoadTests(int SubId, int TestId)
        {
            return LoadTest(SubId, TestId);
        }

        //this method is a static type and list<property> is return.
        public static List<ShowShortQuestionOnly> LoadTest(int SubjectId, int Testid)
        {
            Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowShortQuestionOnly> ShowMcqsInfo = new List<ShowShortQuestionOnly>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ShowShortQuestionOnly", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@TestId", Testid);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            ShowMcqsInfo.Add(new ShowShortQuestionOnly()
                            {
                                ShortQuestion = HttpUtility.HtmlDecode(dr["ShortQuestionText"].ToString()),
                                ShortQuestionId = Convert.ToInt32(dr["ShortQuestionId"].ToString())
                            });
                        }
                    }
                    return ShowMcqsInfo;
                }
            }
        }


        // show mcqs for Users 
        //[System.Web.Services.WebMethod(EnableSession = true)]
        //public static List<ShowMcqs> ShowMcqsForUsers(int AdminId, int TestId)
        //{
        //    return LoadMcqsForUser(McqsId);
        //}
        ////this method is a static type and list<property> is return.
        //public static List<ShowMcqs> LoadMcqsForUser(int mcqsId)
        //{
        //    //Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
        //    //Int32 SubjectId = (Int32)HttpContext.Current.Session["SubjectId"];
        //    //Int32 TestId = (Int32)HttpContext.Current.Session["TestId"];
        //    //Int32 McqsQuestionId = (Int32)HttpContext.Current.Session["McqsQuestionInformationId"];
        //    string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
        //    List<ShowMcqs> ShowMcqsInfo = new List<ShowMcqs>();  //create a reference of List<Property>.  
        //    DataSet ds;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {

        //        using (SqlCommand cmd = new SqlCommand("Show_AdminInserted_Mcqs", con)) //GetCountryRecords is a Stored Procedure.  
        //        {
        //            // con.Open();
        //            // cmd.Connection = con;
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            //cmd.Parameters.AddWithValue("@AdminId", AdminId);
        //            //cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
        //            //cmd.Parameters.AddWithValue("@TestId", TestId);
        //            cmd.Parameters.AddWithValue("@McqsQuestionId", mcqsId);
        //            //SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
        //            // this is a output parameters.  
        //            con.Open();
        //            using (SqlDataReader dr = cmd.ExecuteReader())
        //            {
        //                while (dr.Read())
        //                {
        //                    bool op1 = (bool)dr["op1"];
        //                    bool op2 = (bool)dr["op2"];
        //                    bool op3 = (bool)dr["op3"];
        //                    bool op4 = (bool)dr["op4"];
        //                    bool op5 = (bool)dr["op5"];
        //                    bool op6 = (bool)dr["op6"];
        //                    bool op7 = (bool)dr["op7"];
        //                    bool op8 = (bool)dr["op8"];
        //                    string Option1Text;
        //                    bool Option1Correct;
        //                    string Option2Text;
        //                    bool Option2Correct;
        //                    string Option3Text;
        //                    bool Option3Correct;
        //                    string Option4Text;
        //                    bool Option4Correct;
        //                    string Option5Text;
        //                    bool Option5Correct;
        //                    string Option6Text;
        //                    bool Option6Correct;
        //                    string Option7Text;
        //                    bool Option7Correct;
        //                    string Option8Text;
        //                    bool Option8Correct;
        //                    if (op1 == true)
        //                    {
        //                        Option1Text = HttpUtility.HtmlDecode(dr["Option1Text"].ToString());
        //                        Option1Correct = (bool)dr["Option1Correct"];
        //                    }
        //                    else
        //                    {
        //                        Option1Text = null;
        //                        Option1Correct = false;
        //                    }
        //                    if (op2 == true)
        //                    {
        //                        Option2Text = HttpUtility.HtmlDecode(dr["Option2Text"].ToString());
        //                        Option2Correct = (bool)dr["Option2Correct"];
        //                    }
        //                    else
        //                    {
        //                        Option2Text = null;
        //                        Option2Correct = false;
        //                    }
        //                    if (op3 == true)
        //                    {
        //                        Option3Text = HttpUtility.HtmlDecode(dr["Option3Text"].ToString());
        //                        Option3Correct = (bool)dr["Option3Correct"];
        //                    }
        //                    else
        //                    {
        //                        Option3Text = null;
        //                        Option3Correct = false;
        //                    }
        //                    if (op4 == true)
        //                    {
        //                        Option4Text = HttpUtility.HtmlDecode(dr["Option4Text"].ToString());
        //                        Option4Correct = (bool)dr["Option4Correct"];
        //                    }
        //                    else
        //                    {
        //                        Option4Text = null;
        //                        Option4Correct = false;
        //                    }
        //                    if (op5 == true)
        //                    {
        //                        Option5Text = HttpUtility.HtmlDecode(dr["Option5Text"].ToString());
        //                        Option5Correct = (bool)dr["Option5Correct"];
        //                    }
        //                    else
        //                    {
        //                        Option5Text = null;
        //                        Option5Correct = false;
        //                    }
        //                    if (op6 == true)
        //                    {
        //                        Option6Text = HttpUtility.HtmlDecode(dr["Option6Text"].ToString());
        //                        Option6Correct = (bool)dr["Option6Correct"];
        //                    }
        //                    else
        //                    {
        //                        Option6Text = null;
        //                        Option6Correct = false;
        //                    }
        //                    if (op7 == true)
        //                    {
        //                        Option7Text = HttpUtility.HtmlDecode(dr["Option7Text"].ToString());
        //                        Option7Correct = (bool)dr["Option7Correct"];
        //                    }
        //                    else
        //                    {
        //                        Option7Text = null;
        //                        Option7Correct = false;
        //                    }
        //                    if (op8 == true)
        //                    {
        //                        Option8Text = HttpUtility.HtmlDecode(dr["Option8Text"].ToString());
        //                        Option8Correct = (bool)dr["Option8Correct"];
        //                    }
        //                    else
        //                    {
        //                        Option8Text = null;
        //                        Option8Correct = false;
        //                    }
        //                    ShowMcqsInfo.Add(new ShowMcqs()
        //                    {
        //                        //AdminId = Convert.ToInt32(dr["0"]),
        //                        //AdminName = dr["1"].ToString(),
        //                        //AdminEmail = dr["2"].ToString(),
        //                        SubjectName = dr["SubjectName"].ToString(),
        //                        TestName = dr["TestName"].ToString(),
        //                        QuestionText = HttpUtility.HtmlDecode(dr["QuestionText"].ToString()),
        //                        ExplanationText = HttpUtility.HtmlDecode(dr["Explanation"].ToString()),
        //                        Reference = HttpUtility.HtmlDecode(dr["Reference"].ToString()),
        //                        Points = Convert.ToInt32(dr["Points"]),
        //                        op1 = op1,
        //                        op2 = op2,
        //                        op3 = op3,
        //                        op4 = op4,
        //                        op5 = op5,
        //                        op6 = op6,
        //                        op7 = op7,
        //                        op8 = op8,
        //                        Option1Text = Option1Text,
        //                        Option1Correct = Option1Correct,
        //                        Option2Text = Option2Text,
        //                        Option2Correct = Option2Correct,
        //                        Option3Text = Option3Text,
        //                        Option3Correct = Option3Correct,
        //                        Option4Text = Option4Text,
        //                        Option4Correct = Option4Correct,
        //                        Option5Text = Option5Text,
        //                        Option5Correct = Option5Correct,
        //                        Option6Text = Option6Text,
        //                        Option6Correct = Option6Correct,
        //                        Option7Text = Option7Text,
        //                        Option7Correct = Option7Correct,
        //                        Option8Correct = Option8Correct,
        //                        Option8Text = Option8Text


        //                    });

        //                }
        //            }
        //            //parameter.Direction = ParameterDirection.Output;

        //            //using (SqlDataReader dr = new SqlDataReader())
        //            //{
        //            //    dr = cmd.ExecuteReader();
        //            //    ds = new DataSet();
        //            //    da.Fill(ds);    //Fill the dataset. 
        //            //    try
        //            //    {
        //            //        if (ds != null)
        //            //        {
        //            //            if (ds.Tables.Count > 0)
        //            //            {
        //            //                if (ds.Tables[0].Rows.Count > 0)
        //            //                {
        //            //                    foreach (DataRow dr in ds.Tables[0].Rows)
        //            //                    {
        //            //                        ShowMcqsInfo.Add(new ShowMcqs()
        //            //                        {
        //            //                            AdminId = Convert.ToInt32(dr["0"]),
        //            //                            AdminName = dr["1"].ToString(),
        //            //                            AdminEmail = dr["2"].ToString(),
        //            //                            SubjectName = dr["3"].ToString(),
        //            //                            TestName = dr["4"].ToString(),
        //            //                            QuestionText = dr["5"].ToString(),
        //            //                            Option1Text = dr["Option1Text"].ToString(),
        //            //                            Option1Correct = (bool)dr["Option1Correct"],
        //            //                            Option2Text = dr["Option2Text"].ToString(),
        //            //                            Option2Correct = (bool)dr["Option2Correct"],
        //            //                            Option3Text = dr["Option3Text"].ToString(),
        //            //                            Option3Correct = (bool)dr["Option3Correct"],
        //            //                            Option4Text = dr["Option4Text"].ToString(),
        //            //                            Option4Correct = (bool)dr["Option4Correct"],
        //            //                            Option5Text = dr["Option5Text"].ToString(),
        //            //                            Option5Correct = (bool)dr["Option5Correct"],
        //            //                            Option6Text = dr["Option6Text"].ToString(),
        //            //                            Option6Correct = (bool)dr["Option6Correct"],
        //            //                            Option7Text = dr["Option7Text"].ToString(),
        //            //                            Option7Correct = (bool)dr["Option7Correct"],
        //            //                            Option8Correct = (bool)dr["Option8Correct"],
        //            //                            Option8Text = dr["Option8Text"].ToString(),
        //            //                            ExplanationText = dr["Explanation"].ToString(),
        //            //                            Reference = dr["ReferenceText"].ToString(),
        //            //                            Points = dr["Points"].ToString(),
        //            //                        });
        //            //                    }

        //            //                }
        //            //            }
        //            //        }
        //            //    }
        //            //    catch (Exception ex)
        //            //    {

        //            //    }
        //            //}

        //            return ShowMcqsInfo;
        //        }
        //    }
        //}
    }
}