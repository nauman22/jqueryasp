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
using System.Web.Script.Services;
using System.Security.Cryptography;
using System.IO;
using System.Web.Script.Serialization;

namespace jquery1.acme_free
{

    public partial class myindex : System.Web.UI.Page
    {

       // public static int AdminId = 0;
        public string hidden1 { get; set; }
        public string userrole { get; set; }

        protected void Page_Init(object sender, EventArgs e)
        {
            hidden1 = HttpUtility.UrlDecode(Request.QueryString["adminid"]);
            userrole = HttpUtility.UrlDecode(Request.QueryString["userR"]);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {


                
                
                HttpCookie myCookieget = HttpContext.Current.Request.Cookies["myCookie"];
                if (myCookieget == null)
                {
                    if ((HttpUtility.UrlDecode(Request.QueryString["adminid"]) != string.Empty) || (HttpUtility.UrlDecode(Request.QueryString["adminid"]) != "0"))
                    {
                        string adminid =(HttpUtility.UrlDecode(Request.QueryString["adminid"]));
                        
                        HttpCookie myCookie = new HttpCookie("myCookie");
                        myCookie.Values.Add("AdminId", adminid.ToString());
                        myCookie.Expires = DateTime.Now.AddMonths(12);
                        Response.Cookies.Add(myCookie);
                    }
                    else
                    {
                        Response.Redirect("~/General_Pages/SignupAdmin.aspx");
                        // int adminid = (Int32)HttpContext.Current.Session["AdminId"];
                        //int adminid = 124;
                        // string adminname = HttpContext.Current.Session["AdminName"].ToString();
                        //string adminname = "Nauman";
                        // string adminemail = HttpContext.Current.Session["AdminEmail"].ToString();
                        //string adminemail = "naumaan22@email.com";
                        //int subuserid = (Int32)HttpContext.Current.Session["SubUserId"];
                        //string username = HttpContext.Current.Session["UserName"].ToString();
                        //string useremail = HttpContext.Current.Session["UserEmail"].ToString();
                        //int useradminid = (Int32)HttpContext.Current.Session["UserAdminId"];




                    }
                    //No cookie found or cookie expired.
                    //Handle the situation here, Redirect the user or simply return;
                }
                //else

                ////ok - cookie is found.
                ////Gracefully check if the cookie has the key-value as expected.
                //if (!string.IsNullOrEmpty(myCookieget.Values["AdminId"]))
                //{
                //    string adminid = (HttpUtility.UrlDecode(Request.QueryString["adminid"]));
                //    myCookieget.Values.Add("AdminId", adminid.ToString());
                //    myCookieget.Expires = DateTime.Now.AddMonths(12);
                //    Response.Cookies.Add(myCookieget);
                //   // AdminId = Convert.ToInt32(myCookieget.Values["AdminId"].ToString());
                //    //Yes userId is found. Mission accomplished.
                //}

            }






        }

        

        public static string Decrypt(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            if(cipherText == null || cipherText == "" )
            {
                HttpContext.Current.Response.Redirect("~/default.aspx");
            }
            cipherText = cipherText.Replace(" ", "+");
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }

        //Getmcqs_Detail
        //[System.Web.Services.WebMethod]
        //public static List<McqsDetail> Getmcqs_Detail(int QNo)
        //{
        //    return Getmcqs_Details(QNo);
        //}
        //public static List<McqsDetail> Getmcqs_Details(int QuestioNo)
        //{
        //    //Int32 useradminid = (Int32)HttpContext.Current.Session["UserAdminId"];
        //    //Int64 testid = Convert.ToInt32(HttpContext.Current.Session["testid"]);
        //    // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
        //    //int subuserid = (Int32)HttpContext.Current.Session["SubUserId"];
        //    // // Int32 AdminId = 124;
        //    string adminid = (HttpUtility.UrlDecode(HttpContext.Current.Request.QueryString["adminid"]));
        //    string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
        //    List<McqsDetail> Dashboard_UsersMcqsDetail = new List<McqsDetail>();  //create a reference of List<Property>.  
        //    DataSet ds;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        string myquery;
        //        if (QuestioNo == 0)
        //        {
        //            myquery = "select count(QuestionsId) as TotalQuestions , SUM(Points) as totalNumbers, UserEmail,UserImage  from View_Final_ShowMcqs_Question_8Options_Reference_Explanation where subuserId = " + subuserid + " and TestId = " + testid + "Group by UserEmail,UserImage";
        //            using (SqlCommand cmd = new SqlCommand(myquery, con)) // '" + useradminid + "'" GetCountryRecords is a Stored Procedure.  
        //            {
        //                con.Open();
        //                cmd.Connection = con;
        //                cmd.CommandType = CommandType.Text;
        //                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        //                {
        //                    ds = new DataSet();
        //                    da.Fill(ds);    //Fill the dataset. 
        //                    try
        //                    {
        //                        if (ds != null)
        //                        {
        //                            if (ds.Tables.Count > 0)
        //                            {
        //                                if (ds.Tables[0].Rows.Count > 0)
        //                                {
        //                                    foreach (DataRow dr in ds.Tables[0].Rows)
        //                                    {
        //                                        Dashboard_UsersMcqsDetail.Add(new McqsDetail()
        //                                        {
        //                                            TotalQuestion = Convert.ToInt32(dr["TotalQuestions"]),
        //                                            TotalPoints = Convert.ToInt32(dr["totalNumbers"]),
        //                                            UserEmail = dr["UserEmail"].ToString(),
        //                                            UserImage = dr["UserImage"].ToString()
        //                                        });
        //                                    }

        //                                }
        //                            }
        //                        }
        //                    }
        //                    catch (Exception ex)
        //                    {

        //                    }
        //                }

        //                // con.Close();
        //            }

        //        }


        //    }
        //    return Dashboard_UsersMcqsDetail;
        //}


        // Get Mcqs Data 
        [System.Web.Services.WebMethod]
        public static List<Dashboard_UsersMcqs> Dashboard_UsersMcqs(int QNo)
        {
            return Dashboard_UsersMcqs1(QNo);
        }
        public static List<Dashboard_UsersMcqs> Dashboard_UsersMcqs1(int QuestioNo)
        {
            Int32 useradminid = (Int32)HttpContext.Current.Session["UserAdminId"];
            Int64 testid = Convert.ToInt32(HttpContext.Current.Session["testid"]);
            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //// Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<Dashboard_UsersMcqs> Dashboard_UsersMcqs = new List<Dashboard_UsersMcqs>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string selectQuery;
                if (QuestioNo == 0)
                {
                    selectQuery = "select top 1 * from View_Final_ShowMcqs_Question_8Options_Reference_Explanation where AdminId = " + useradminid + " and TestId = " + testid;
                }
                else if (QuestioNo == -2)
                {// for End Result
                    selectQuery = " select top 1 * from View_Final_ShowMcqs_Question_8Options_Reference_Explanation  where AdminId = " + useradminid + " and TestId = " + testid + " order by QuestionsId desc";
                }
                else
                {
                    selectQuery = "select * from View_Final_ShowMcqs_Question_8Options_Reference_Explanation  where AdminId = " + useradminid + " and TestId = " + testid + "  and QuestionsId = " + QuestioNo;
                }
                using (SqlCommand cmd = new SqlCommand(selectQuery, con)) // '" + useradminid + "'" GetCountryRecords is a Stored Procedure.  
                {
                    // con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    //SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                    // this is a output parameters.  
                    //parameter.Direction = ParameterDirection.Output;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        ds = new DataSet();
                        DataTable dt = new DataTable();

                        da.Fill(dt);    //Fill the dataset. 
                        try
                        {
                            if (dt != null)
                            {
                                if (dt.Rows.Count > 0)
                                {
                                    //if (dt.Rows.Count > 0)
                                    //{
                                    string QuestionText;
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

                                    foreach (DataRow dr in dt.Rows)
                                    {
                                        bool op1 = (bool)dr["Option1"];
                                        bool op2 = (bool)dr["Option2"];
                                        bool op3 = (bool)dr["Option3"];
                                        bool op4 = (bool)dr["Option4"];
                                        bool op5 = (bool)dr["Option5"];
                                        bool op6 = (bool)dr["Option6"];
                                        bool op7 = (bool)dr["Option7"];
                                        bool op8 = (bool)dr["Option8"];

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
                                            Option2Text = HttpUtility.HtmlDecode((dr["Option2Text"].ToString()));
                                            Option2Correct = (bool)dr["Option2Correct"];
                                        }
                                        else
                                        {
                                            Option2Text = null;
                                            Option2Correct = false;
                                        }
                                        if (op3 == true)
                                        {
                                            Option3Text = HttpUtility.HtmlDecode((dr["Option3Text"].ToString()));
                                            Option3Correct = (bool)dr["Option3Correct"];
                                        }
                                        else
                                        {
                                            Option3Text = null;
                                            Option3Correct = false;
                                        }
                                        if (op4 == true)
                                        {
                                            Option4Text = HttpUtility.HtmlDecode((dr["Option4Text"].ToString()));
                                            Option4Correct = (bool)dr["Option4Correct"];
                                        }
                                        else
                                        {
                                            Option4Text = null;
                                            Option4Correct = false;
                                        }
                                        if (op5 == true)
                                        {
                                            Option5Text = HttpUtility.HtmlDecode((dr["Option5Text"].ToString()));
                                            Option5Correct = (bool)dr["Option5Correct"];
                                        }
                                        else
                                        {
                                            Option5Text = null;
                                            Option5Correct = false;
                                        }
                                        if (op6 == true)
                                        {
                                            Option6Text = HttpUtility.HtmlDecode((dr["Option6Text"].ToString()));
                                            Option6Correct = (bool)dr["Option6Correct"];
                                        }
                                        else
                                        {
                                            Option6Text = null;
                                            Option6Correct = false;
                                        }
                                        if (op7 == true)
                                        {
                                            Option7Text = HttpUtility.HtmlDecode((dr["Option7Text"].ToString()));
                                            Option7Correct = (bool)dr["Option7Correct"];
                                        }
                                        else
                                        {
                                            Option7Text = null;
                                            Option7Correct = false;
                                        }
                                        if (op8 == true)
                                        {
                                            Option8Text = HttpUtility.HtmlDecode((dr["Option8Text"].ToString()));
                                            Option8Correct = (bool)dr["Option8Correct"];
                                        }
                                        else
                                        {
                                            Option8Text = null;
                                            Option8Correct = false;
                                        }
                                        Dashboard_UsersMcqs.Add(new Dashboard_UsersMcqs()
                                        {
                                            SubjectId = Convert.ToInt32(dr["SubjectId"]),
                                            SubjectName = (dr["SubjectName"].ToString()),
                                            TestId = Convert.ToInt32(dr["TestId"]),
                                            TestName = (dr["TestName"].ToString()),
                                            QuestionId = Convert.ToInt32(dr["QuestionsId"]),
                                            QuestionText = HttpUtility.HtmlDecode(dr["QuestionText"].ToString()),
                                            op1Text = Option1Text,
                                            op2Text = Option2Text,
                                            op3Text = Option3Text,
                                            op4Text = Option4Text,
                                            op5Text = Option5Text,
                                            op6Text = Option6Text,
                                            op7Text = Option7Text,
                                            op8Text = Option8Text,
                                            Op1Correct = Option1Correct,
                                            Op2Correct = Option2Correct,
                                            Op3Correct = Option3Correct,
                                            Op4Correct = Option4Correct,
                                            Op5Correct = Option5Correct,
                                            Op6Correct = Option6Correct,
                                            Op7Correct = Option7Correct,
                                            Op8Correct = Option8Correct,
                                            Points = Convert.ToInt32(dr["Points"].ToString()),
                                            Mode = Convert.ToInt32(HttpContext.Current.Session["Mode"])

                                            //  TestStatus = Convert.ToBoolean(dr["TestStatus"])

                                        });
                                    }

                                    //}
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



       [System.Web.Services.WebMethod(EnableSession = false)]
        public static string Loadbasics()
        {
            string allstring = "", name = "", totalmcqs = "", totalshorq = "", totallongq = "", totalsubj = "", totaltest = "", totalsubusers = "";

            if (HttpContext.Current.Session["AdminId"] != null)
            {
                //allstring += (HttpContext.Current.Session["totalmcqs"] ?? string.Empty).ToString()
                //     + "@" + (HttpContext.Current.Session["totalshortq"] ?? string.Empty).ToString()
                //      + "@" + (HttpContext.Current.Session["totallongq"] ?? string.Empty).ToString()
                //      + "@" + (HttpContext.Current.Session["totalsub"] ?? string.Empty).ToString()
                //      + "@" + (HttpContext.Current.Session["totaltest"] ?? string.Empty).ToString()
                //      + "@" + (HttpContext.Current.Session["totalsubuser"] ?? string.Empty).ToString();
            }
            else
            {
                //Response.Redirect("~/General_Pages/SignupAdmin.aspx");
                allstring = "";
                return allstring;
            }

            return allstring;
        }


       //Insert Cat Name into Database
       [System.Web.Services.WebMethod(EnableSession = false)]
       public static string InsertCatt(string txtCatName, string txtCatTagline, string Emyadminid, string txtCatPurpose, string txtCatDesc, string fuCatImg)
       {
           string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
           string msg = string.Empty;
           if (Emyadminid == null)
           {
               return msg = "false";

           }
           int AdminId = Convert.ToInt32(Decrypt(Emyadminid));
           using (SqlConnection con = new SqlConnection(constr))
           {
               using (SqlCommand cmd = new SqlCommand("InsertCat", con))
               {
                   //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                   //// Int32 AdminId = 124;
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Parameters.AddWithValue("@AdminId", AdminId);
                   cmd.Parameters.AddWithValue("@txtCatName", txtCatName);
                   cmd.Parameters.AddWithValue("@txtCatTagline", txtCatTagline);
                   cmd.Parameters.AddWithValue("@txtCatPurpose", txtCatPurpose);
                   cmd.Parameters.AddWithValue("@txtCatDesc", txtCatDesc);
                   cmd.Parameters.AddWithValue("@fuCatImg", fuCatImg);
                   con.Open();
                   int CatId = (Int32)cmd.ExecuteScalar();
                   con.Close();
                   //HttpContext.Current.Session["SubjectId"] = SubjectId;
                   if (CatId >= 1)
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


        //Insert Subject Name into Database
       [System.Web.Services.WebMethod(EnableSession = false)]
        public static string InsertSubject(string subjectName, string Emyadminid, int catid,string txtSubjectObjective
           ,string txtSubjectTestChapters,string txtSubjectExplanation,string txtSubjectReferenceBooks,string txtSubjectCode,string filename)
        {
           
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            if (catid == null)
            {
              return  msg = "false";
                
            }
            int AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("InsertSubject", con))
                {
                    //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    //// Int32 AdminId = 124;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectName", subjectName);
                    cmd.Parameters.AddWithValue("@txtSubjectObjective", txtSubjectObjective);
                    cmd.Parameters.AddWithValue("@txtSubjectTestChapters", txtSubjectTestChapters);
                    cmd.Parameters.AddWithValue("@txtSubjectExplanation", txtSubjectExplanation);
                    cmd.Parameters.AddWithValue("@txtSubjectReferenceBooks", txtSubjectReferenceBooks);
                    cmd.Parameters.AddWithValue("@txtSubjectCode", txtSubjectCode);
                    cmd.Parameters.AddWithValue("@filename", filename);
                    cmd.Parameters.AddWithValue("@catid", catid);
                    con.Open();
                    int SubjectId = (Int32)cmd.ExecuteScalar();
                    con.Close();
                    //HttpContext.Current.Session["SubjectId"] = SubjectId;
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


        // Insert Report Status 
          [System.Web.Services.WebMethod(EnableSession = false)]
       public static string InsertReportStatus(int ReportId, string Emyadminid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            int AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("InsertReportStatus", con))
                {
                    //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    //// Int32 AdminId = 124;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@ReportId", ReportId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    //HttpContext.Current.Session["SubjectId"] = SubjectId;
                    
                        msg = "true";
                    
                }
            }
            return msg;
        }

        //Insert ShortQuestion into Database
       [System.Web.Services.WebMethod(EnableSession = false)]
        public static string Insert_ShortQuestions(int SubId, int TestId, string QuestionText, string AnswerText, string ExpText, string ReferenceText, int points, string Emyadminid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_ShortQuestions", con))
                {
                    // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    // // Int32 AdminId = 124;
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
       [System.Web.Services.WebMethod(EnableSession = false)]
       public static string Insert_LongQuestions(int SubId, int TestId, string QuestionText, string AnswerText, string ExpText, string ReferenceText, int points, string Emyadminid, int LongQuestionId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_LongQuestions", con))
                {
                    //  // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    // // Int32 AdminId = 124;
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
      [System.Web.Services.WebMethod(EnableSession = false)]
       public static string Update_SubjectName(string SubjectName, int SubjectId, string Emyadminid,
          int catid, string txtEditNewSubjectObjective, string txtEditNewSubjectTestChapters, string txtEditNewSubjectExplanation,
          string txtEditNewSubjectReferenceBooks, string txtEditNewSubjectCode, string filename)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Update_Subjectdetail", con))
                {
                    //  // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@SubjectName", SubjectName);
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    cmd.Parameters.AddWithValue("@catid", catid);
                    cmd.Parameters.AddWithValue("@txtEditNewSubjectObjective", txtEditNewSubjectObjective);
                    cmd.Parameters.AddWithValue("@txtEditNewSubjectTestChapters", txtEditNewSubjectTestChapters);
                    cmd.Parameters.AddWithValue("@txtEditNewSubjectExplanation", txtEditNewSubjectExplanation);
                    cmd.Parameters.AddWithValue("@txtEditNewSubjectReferenceBooks", txtEditNewSubjectReferenceBooks);
                    cmd.Parameters.AddWithValue("@txtEditNewSubjectCode", txtEditNewSubjectCode);
                    cmd.Parameters.AddWithValue("@filename", filename);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    msg = "1";
                }
            }
            return msg;
        }
        
        [System.Web.Services.WebMethod(EnableSession = false)]
        public static string Delete_SubjectName(int SubjectId, string Emyadminid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete_SubjectName", con))
                {
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
                    // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    msg = "true";
                }
            }
            return msg;
        }

       [System.Web.Services.WebMethod(EnableSession = false)]
        public static string Replace_Subject(int OlSubjectId, int NewSubjectId, string Emyadminid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Replace_SubjectName", con))
                {
                    // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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

      [System.Web.Services.WebMethod(EnableSession = false)]
        public static string Delete_Subject_Settings(int SubjectId, string Emyadminid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete_Subject_Settings", con))
                {
                    // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
       [System.Web.Services.WebMethod(EnableSession = false)]
        public static string InsertTestName(string TestName, string Emyadminid, string SubjectId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("InsertTestName", con))
                {
                    // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                   // Int32 SubjectId = (Int32)HttpContext.Current.Session["SubjectId"];
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TestName", TestName);
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    con.Open();
                    int TestId = (Int32)cmd.ExecuteScalar();
                    con.Close();
                   // HttpContext.Current.Session["TestId"] = TestId;
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

       // Insert into database Multi Test Name only
       [System.Web.Services.WebMethod(EnableSession = false)]
       public static string InsertTestName_Multiple(string TestName, string MergeTestInstructions, int TestTotQ, int TestLevel, int TestInsertionSubId, string Emyadminid, string listData, string listSec, int isNegativeMarks, int SpecMarks)
       {
           HttpContext.Current.Server.ScriptTimeout = 900000;
           string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
           string msg = string.Empty;
           JavaScriptSerializer serializer = new JavaScriptSerializer();
           var deserializedResult = serializer.Deserialize<List<MergeTestClass>>(listData);
           var deserializedSec = serializer.Deserialize<List<MergeTestSec>>(listSec);
           //MergeTestClass view = serializer.Deserialize<MergeTestClass>(listData);
           DataTable dt = new DataTable();
           DataTable dt_Sec = new DataTable();
           //Add Columns
           dt.Columns.Add("SubId");
           dt.Columns.Add("TestId");
           dt.Columns.Add("SecId");
           dt.Columns.Add("TotalQ");


           dt_Sec.Columns.Add("MergeTestSecName");
           dt_Sec.Columns.Add("MergeTestSecDetail");
           dt_Sec.Columns.Add("MergeTestSecTotalQuestions");
           dt_Sec.Columns.Add("MergeTestSecPriority");

           //Add rows
           foreach (var i in deserializedResult)
           {
               dt.Rows.Add(i.SubId, i.TestId, i.SecId, i.TotalQ);
           }
           foreach (var i in deserializedSec)
           {
               dt_Sec.Rows.Add(i.MergeTestSecName, i.MergeTestSecDetail, i.MergeTestSecTotalQuestions, i.MergeTestSecPriority);
           }

           // return msg;
           using (SqlConnection con = new SqlConnection(constr))
           {
               using (SqlCommand cmd = new SqlCommand("Multi_InsertTestName", con))
               {

                   // return 'true';
                   // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                   // Int32 SubjectId = (Int32)HttpContext.Current.Session["SubjectId"];
                   Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Parameters.AddWithValue("@TestName", TestName);
                   cmd.Parameters.AddWithValue("@TestInstruction", HttpUtility.HtmlEncode(MergeTestInstructions).ToString());
                   cmd.Parameters.AddWithValue("@SubjectId", TestInsertionSubId);
                   cmd.Parameters.AddWithValue("@TestTotQ", TestTotQ);
                   cmd.Parameters.AddWithValue("@TestLevel", TestLevel);
                   cmd.Parameters.AddWithValue("@AdminId", AdminId);
                   SqlParameter tvparam = cmd.Parameters.AddWithValue("@List", dt);
                   tvparam.SqlDbType = SqlDbType.Structured;
                   SqlParameter tvparam1 = cmd.Parameters.AddWithValue("@ListSec", dt_Sec);
                   tvparam1.SqlDbType = SqlDbType.Structured;
                   cmd.Parameters.AddWithValue("@isNegativeMarks", isNegativeMarks);
                   cmd.Parameters.AddWithValue("@SpecMarks", SpecMarks); 
                   //cmd.Parameters.AddWithValue("@AllTestIds", Alltestids);
                   con.Open();
                   cmd.ExecuteNonQuery();
                   con.Close();
                   // HttpContext.Current.Session["TestId"] = TestId;

                   msg = "true";

               }
           }
           return msg;
       }


        //Insert Staff Name
       [System.Web.Services.WebMethod(EnableSession = false)]
       public static string Insert_Staff(string txtStaffName, string txtStaffQual, string txtStaffMob, string txtStaffjoiningDate)
       {
           string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
           string msg = string.Empty;
           using (SqlConnection con = new SqlConnection(constr))
           {
               using (SqlCommand cmd = new SqlCommand("InsertStaff", con))
               {
                   // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                   // Int32 SubjectId = (Int32)HttpContext.Current.Session["SubjectId"];
                   //Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
                   if(txtStaffjoiningDate == "")
                   {
                       txtStaffjoiningDate = DateTime.Now.ToString();
                   }
                   cmd.CommandType = CommandType.StoredProcedure;
                   cmd.Parameters.AddWithValue("@txtStaffName", txtStaffName);
                   cmd.Parameters.AddWithValue("@txtStaffQual", txtStaffQual);
                   cmd.Parameters.AddWithValue("@txtStaffMob", txtStaffMob);
                   cmd.Parameters.AddWithValue("@txtStaffjoiningDate", DateTime.Parse(txtStaffjoiningDate));
                   con.Open();
                   cmd.ExecuteNonQuery();
                   con.Close();
                   // HttpContext.Current.Session["TestId"] = TestId;

                   msg = "true";

               }
           }
           return msg;
       }

         // Dropdown for Category Name.
        [System.Web.Services.WebMethod(EnableSession = false)]
        public static List<ddlSubject> LoadddlCat(string dadminid)
        {
            return LoadddlCat_(dadminid);
        }
        [System.Web.Services.WebMethod(EnableSession = false)]
       // [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<ddlSubject> LoadddlCat_(string dadminid)                      //this method is a static type and list<property> is return.  
        {
            // HiddenField AdminId = ""; //(Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            string id = dadminid;
            string converted = Decrypt(id);
            HttpContext.Current.Server.ScriptTimeout = 90000;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ddlSubject> SubjectInformation = new List<ddlSubject>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ddlCatName", con)) //GetCountryRecords is a Stored Procedure.  
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter = cmd.Parameters.Add("@AdminId", converted);  //@count is Stored Procedure parameter and 
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
                                                SubjectId = Convert.ToInt32(dr["CatId"]),
                                                SubjectName = dr["Name"].ToString()
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
        [System.Web.Services.WebMethod(EnableSession = false)]
        // [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<Subject> LoadddlSubjectInfo(string Subid, string role)
        {
            // HiddenField AdminId = ""; //(Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            //string id = dadminid;
            //string converted = Decrypt(id);
            string rol_d = Decrypt(role);
            HttpContext.Current.Server.ScriptTimeout = 90000;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<Subject> SubjectInformation = new List<Subject>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("LoadSubjectInfo", con)) //GetCountryRecords is a Stored Procedure.  
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter = cmd.Parameters.Add("@subid", Subid);  //@count is Stored Procedure parameter and 
                  
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
                                            SubjectInformation.Add(new Subject()
                                            {
                                                SubId = DBNull.Value.Equals(dr["SubjectId"]) ? 0 : Convert.ToInt32(dr["SubjectId"]) ,
                                                SubjectName = DBNull.Value.Equals(dr["SubjectName"]) ? "NO NAME" : (dr["SubjectName"]).ToString(),
                                                SubjectObjective = DBNull.Value.Equals(dr["SubjectObjective"]) ? "" : (dr["SubjectObjective"]).ToString() ,
                                                SubjectExplanation =DBNull.Value.Equals(dr["SubjectExplanation"]) ? "" : (dr["SubjectExplanation"]).ToString() ,
                                                SubjectTestChapters = DBNull.Value.Equals(dr["SubjectTestChapters"]) ? "" : (dr["SubjectTestChapters"]).ToString(),
                                                SubjectImage = DBNull.Value.Equals(dr["SubjectImage"]) ? "" : (dr["SubjectImage"]).ToString(),
                                                SubjectCode =DBNull.Value.Equals(dr["SubjectCode"]) ? "" : (dr["SubjectCode"].ToString()),
                                                SubjectReferenceBooks = DBNull.Value.Equals(dr["SubjectReferenceBooks"]) ? "" : (dr["SubjectReferenceBooks"]).ToString(),
                                                catid =DBNull.Value.Equals(dr["CatId"]) ? 0 : Convert.ToInt32(dr["CatId"]) 
                                                
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


        // Dropdown for Subject Name.
        [System.Web.Services.WebMethod(EnableSession = false)]
        public static List<ddlSubject> LoadddlSubject(string dadminid, string role)
        {
            return LoadddlSubject1(dadminid,role);
        }
        [System.Web.Services.WebMethod(EnableSession = false)]
       // [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<ddlSubject> LoadddlSubject1(string dadminid, string role) 
        {
            // HiddenField AdminId = ""; //(Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            string id = dadminid;
            string converted = Decrypt(id);
            string rol_d = Decrypt(role);
            HttpContext.Current.Server.ScriptTimeout = 90000;
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
                    SqlParameter parameter = cmd.Parameters.Add("@AdminId", converted);  //@count is Stored Procedure parameter and 
                    SqlParameter param1 = cmd.Parameters.Add("@role", rol_d); 
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
      [System.Web.Services.WebMethod(EnableSession = false)]
        public static List<ddlLoadUsers> LoadddlUsers(string Emyadminid)
        {
            return LoadddlUser(Emyadminid);
        }
        public static List<ddlLoadUsers> LoadddlUser(string Emyadminid)
        {
            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ddlLoadUsers> UsersInformation = new List<ddlLoadUsers>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ddlUserDetails", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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


        // Dropdown for Staff Details
        [System.Web.Services.WebMethod(EnableSession = false)]
        public static List<ddlStaff> LoadddlStaffs()
        {
            return LoadddlStaff();
        }
        public static List<ddlStaff> LoadddlStaff()
        {
            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ddlStaff> UsersInformation = new List<ddlStaff>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ddlStaffDetails", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    //Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    // SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
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
                                            UsersInformation.Add(new ddlStaff()
                                            {
                                                StaffId = Convert.ToInt32(dr["Id"]),
                                                Name = dr["Name"].ToString()

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

       [System.Web.Services.WebMethod(EnableSession = false)]
        public static List<ShowMcqs> ShowMcqs(int McqsId)
        {
            return LoadMcqs(McqsId);
        }
        //this method is a static type and list<property> is return.
        public static List<ShowMcqs> LoadMcqs(int mcqsId)
        {
            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //Int32 SubjectId = (Int32)HttpContext.Current.Session["SubjectId"];
            // Int32 TestId = (Int32)HttpContext.Current.Session["TestId"];
            Int32 McqsQuestionId = mcqsId;//(Int32)HttpContext.Current.Session["McqsQuestionInformationId"];
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowMcqs> ShowMcqsInfo = new List<ShowMcqs>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("Show_AdminInserted_Mcqs", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    //con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 30 * 1000;
                    // cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    // cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                    // cmd.Parameters.AddWithValue("@TestId", TestId);
                    cmd.Parameters.AddWithValue("@McqsQuestionId", mcqsId);
                    // SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                    // this is a output parameters.  
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            bool op1 = DBNull.Value.Equals(dr["op1"])? false: (bool)dr["op1"];
                            bool op2 = DBNull.Value.Equals(dr["op2"])? false: (bool)dr["op2"];
                            bool op3 = DBNull.Value.Equals(dr["op3"]) ? false : (bool)dr["op2"];
                            bool op4 = DBNull.Value.Equals(dr["op4"]) ? false : (bool)dr["op2"];
                            bool op5 = DBNull.Value.Equals(dr["op5"]) ? false : (bool)dr["op2"];
                            bool op6 = DBNull.Value.Equals(dr["op6"]) ? false : (bool)dr["op2"];
                            bool op7 = DBNull.Value.Equals(dr["op7"]) ? false : (bool)dr["op2"];
                            bool op8 = DBNull.Value.Equals(dr["op8"]) ? false : (bool)dr["op2"];
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
                                // AdminId = Convert.ToInt32(dr["0"]),
                                // AdminName = dr["1"].ToString(),
                                // AdminEmail = dr["2"].ToString(),
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
                                Option8Text = Option8Text,
                                staff_exp_id = DBNull.Value.Equals(dr["staff_id_exp"]) ? 0 : Convert.ToInt32(dr["staff_id_exp"])


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

      [System.Web.Services.WebMethod(EnableSession = false)]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string DateTimes()
        {
            return DateTime.Now.ToShortTimeString();
        }

        // load test
       // [System.Web.Services.WebMethod]
        //[System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]

        //public static List<ddlTest> LoadddlTest()
        //{
        //    return LoadddlTest1();
        //}
        ////this method is a static type and list<property> is return. 
        //[System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //public static List<ddlTest> LoadddlTest1()
        //{
        //    // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
        //    // // Int32 AdminId = 124;
        //    HttpContext.Current.Server.ScriptTimeout = 90000;
        //    string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
        //    List<ddlTest> SubjectInformation = new List<ddlTest>();  //create a reference of List<Property>.  
        //    DataSet ds;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("ddlTestName", con)) //GetCountryRecords is a Stored Procedure.  
        //        {
        //            con.Open();
        //            cmd.Connection = con;
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 

        //            // this is a output parameters.  

        //            //parameter.Direction = ParameterDirection.Output;

        //            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        //            {

        //                ds = new DataSet();
        //                da.Fill(ds);    //Fill the dataset. 
        //                try
        //                {
        //                    if (ds != null)
        //                    {
        //                        if (ds.Tables.Count > 0)
        //                        {
        //                            if (ds.Tables[0].Rows.Count > 0)
        //                            {
        //                                foreach (DataRow dr in ds.Tables[0].Rows)
        //                                {
        //                                    SubjectInformation.Add(new ddlTest()
        //                                    {
        //                                        TestId = Convert.ToInt32(dr["TestId"]),
        //                                        TestName = dr["TestName"].ToString()
        //                                    });
        //                                }

        //                            }
        //                        }
        //                    }
        //                }
        //                catch (Exception ex)
        //                {

        //                }
        //            }

        //            return SubjectInformation;
        //        }
        //    }
        //}

        // SaveMcqsQuestion
       // [System.Web.Services.WebMethod(EnableSession = false)]
        //[System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //public static string McqsQuestion_Insert(string SubjectId, string TestId, string QuestionText, string points, int SaveStatus)
        //{

        //    string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
        //    string msg = string.Empty;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        if ((SaveStatus == 0) || (SaveStatus == 2))
        //        {
        //            using (SqlCommand cmd = new SqlCommand("[tblMcqsQuestionInformation_Insert]", con))
        //            {
        //                // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
        //                //// Int32 AdminId = 124;
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.Parameters.AddWithValue("@AdminId", AdminId);
        //                cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
        //                cmd.Parameters.AddWithValue("@TestId", TestId); //@QuestionText
        //                cmd.Parameters.AddWithValue("@QuestionText", HttpUtility.HtmlEncode(QuestionText));
        //                cmd.Parameters.AddWithValue("@Points", points);
        //                con.Open();
        //                int mcqsQuestionInformationId = (Int32)cmd.ExecuteScalar();
        //                con.Close();
        //                HttpContext.Current.Session["McqsQuestionInformationId"] = mcqsQuestionInformationId;
        //                if (mcqsQuestionInformationId >= 1)
        //                {
        //                    msg = "true";
        //                }
        //                else
        //                {
        //                    msg = "false";
        //                }
        //            }
        //        }
        //        else if (SaveStatus == 1)
        //        {
        //            using (SqlCommand cmd = new SqlCommand("[tblMcqsQuestionInformation_Update]", con))
        //            {
        //                //  // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
        //                //// Int32 AdminId = 124;
        //                Int32 McqsQuestionInformationId = (Int32)HttpContext.Current.Session["McqsQuestionInformationId"];
        //                cmd.CommandType = CommandType.StoredProcedure;

        //                cmd.Parameters.AddWithValue("@McqsQuestionInformationId", McqsQuestionInformationId);
        //                cmd.Parameters.AddWithValue("@AdminId", AdminId);
        //                cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
        //                cmd.Parameters.AddWithValue("@TestId", TestId); //@QuestionText
        //                cmd.Parameters.AddWithValue("@QuestionText", HttpUtility.HtmlEncode(QuestionText));
        //                cmd.Parameters.AddWithValue("@Points", points);
        //                con.Open();
        //                int i = cmd.ExecuteNonQuery();
        //                con.Close();
        //                if (i == 1)
        //                {
        //                    msg = "true";
        //                }
        //                else
        //                {
        //                    msg = "false";
        //                }
        //            }
        //        }

        //    }
        //    return msg;
        //}

       [System.Web.Services.WebMethod(EnableSession = false)]
       [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string Mcqs_Options_Insert(string SubjectId
            ,
            string TestId, string QuestionText,
                                                string points
            , string txtOption1
            , string txtOption2, string txtOption3, string txtOption4
            , string txtOption5, string txtOption6, string txtOption7
            , string txtOption8, string chkOption1, string chkOption2
            , string chkOption3, string chkOption4, string chkOption5
            , string chkOption6, string chkOption7, string chkOption8
                                                , string ExplanationText, int exp_staff_id
            , string ReferenceTexts, string Emyadminid

            )
        {
            HttpContext.Current.Server.ScriptTimeout = 3000;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {

                {
                    using (SqlCommand cmd = new SqlCommand("mcqs_AllOption_Insert_Ref_Exp", con))
                    {
                        //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                        // Int32 McqsQuestionInformationId = (Int32)HttpContext.Current.Session["McqsQuestionInformationId"];
                        cmd.CommandType = CommandType.StoredProcedure;
                        //cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                        //cmd.Parameters.AddWithValue("@TestId", TestId);
                        // cmd.Parameters.AddWithValue("@McqsQuestionInformationId", McqsQuestionInformationId);

                        // option text box.
                        Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
                        cmd.Parameters.AddWithValue("@AdminId", AdminId);
                        cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                        cmd.Parameters.AddWithValue("@TestId", TestId); //@QuestionText
                        cmd.Parameters.AddWithValue("@QuestionText", HttpUtility.HtmlEncode(QuestionText));
                        cmd.Parameters.AddWithValue("@Points", points);
                        cmd.Parameters.AddWithValue("@Option1Text", HttpUtility.HtmlEncode(txtOption1));
                        cmd.Parameters.AddWithValue("@Option1Correct", chkOption1);
                        cmd.Parameters.AddWithValue("@Option2Text", HttpUtility.HtmlEncode(txtOption2));
                        cmd.Parameters.AddWithValue("@Option2Correct", chkOption2);
                        cmd.Parameters.AddWithValue("@Option3Text", HttpUtility.HtmlEncode(txtOption3));
                        cmd.Parameters.AddWithValue("@Option3Correct", chkOption3);
                        cmd.Parameters.AddWithValue("@Option4Text", HttpUtility.HtmlEncode(txtOption4));
                        cmd.Parameters.AddWithValue("@Option4Correct", chkOption4);
                        cmd.Parameters.AddWithValue("@Option5Text", HttpUtility.HtmlEncode(txtOption5));
                        cmd.Parameters.AddWithValue("@Option5Correct", chkOption5);
                        cmd.Parameters.AddWithValue("@Option6Text", HttpUtility.HtmlEncode(txtOption6));
                        cmd.Parameters.AddWithValue("@Option6Correct", chkOption6);
                        cmd.Parameters.AddWithValue("@Option7Text", HttpUtility.HtmlEncode(txtOption7));
                        cmd.Parameters.AddWithValue("@Option7Correct", chkOption7);
                        cmd.Parameters.AddWithValue("@Option8Text", HttpUtility.HtmlEncode(txtOption8));
                        cmd.Parameters.AddWithValue("@Option8Correct", chkOption8);
                        cmd.Parameters.AddWithValue("@ExplanationText", HttpUtility.HtmlEncode(ExplanationText));
                        cmd.Parameters.AddWithValue("@ReferenceText", HttpUtility.HtmlEncode(ReferenceTexts));
                        cmd.Parameters.AddWithValue("@exp_staff_id", (exp_staff_id));
                        cmd.Parameters.Add("@Returnval", SqlDbType.Int).Direction = ParameterDirection.Output;
                        // cmd.Parameters.Add("@Returnval", SqlDbType.VarChar, 30);
                        //SqlParameter outPutParameter = new SqlParameter();
                        //outPutParameter.ParameterName = "@Returnval";
                        //outPutParameter.SqlDbType = System.Data.SqlDbType.Int;
                        //outPutParameter.Direction = System.Data.ParameterDirection.Output;
                        //cmd.Parameters.Add(outPutParameter);
                        //cmd.Parameters["@Returnval"].Direction = ParameterDirection.Output;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        // var result = returnParameter.Value;
                        int i = 0;//(Int32)cmd.ExecuteScalar();

                        i = Convert.ToInt32(cmd.Parameters["@Returnval"].Value);
                        con.Close();
                        if (i >= 1)
                        {
                            msg = i.ToString();
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
       // [System.Web.Services.WebMethod(EnableSession = false)]
        //public static string McqsQuestionReference_Insert(string SubjectId, string TestId, string ReferenceText)
        //{
        //    int McqsQuestionInformationId = (Int32)HttpContext.Current.Session["McqsQuestionInformationId"];
        //    string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
        //    string msg = string.Empty;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {

        //        {
        //            using (SqlCommand cmd = new SqlCommand("tblReference_insert", con))
        //            {
        //                //   // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
        //                // // Int32 AdminId = 124;

        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.Parameters.AddWithValue("@AdminId", AdminId);
        //                cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
        //                cmd.Parameters.AddWithValue("@TestId", TestId); //@QuestionText
        //                cmd.Parameters.AddWithValue("@ReferenceText", HttpUtility.HtmlEncode(ReferenceText));
        //                cmd.Parameters.AddWithValue("@McqsQuestionInformationId", McqsQuestionInformationId);
        //                con.Open();
        //                int ReferenceId = (Int32)cmd.ExecuteScalar();
        //                con.Close();
        //                HttpContext.Current.Session["ReferenceId"] = ReferenceId;
        //                if (ReferenceId >= 1)
        //                {
        //                    msg = "true";
        //                }
        //                else
        //                {
        //                    msg = "false";
        //                }
        //            }
        //        }
        //    }
        //    return msg;
        //}

        // contactus
       [System.Web.Services.WebMethod(EnableSession = false)]
        public static string contactus(string name, string email, string phone, string message)
        {

            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {

                {
                    using (SqlCommand cmd = new SqlCommand("contactus", con))
                    {
                        // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                        // // Int32 AdminId = 124;

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@phone", phone); //@QuestionText
                        cmd.Parameters.AddWithValue("@message", HttpUtility.HtmlEncode(message));

                        con.Open();
                        int ReferenceId = (Int32)cmd.ExecuteScalar();
                        con.Close();
                        // HttpContext.Current.Session["ReferenceId"] = ReferenceId;
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

      // [System.Web.Services.WebMethod(EnableSession = false)]
        //public static string McqsQuestionExplanation_Insert(string SubjectId, string TestId, string ExplanationText, string Emyadminid)
        //{
        //    int McqsQuestionInformationId = (Int32)HttpContext.Current.Session["McqsQuestionInformationId"];
        //    string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
        //    string msg = string.Empty;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {

        //        {
        //            using (SqlCommand cmd = new SqlCommand("tblExplanation_insert", con))
        //            {
        //                // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
        //                // // Int32 AdminId = 124;
        //                Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.Parameters.AddWithValue("@AdminId", AdminId);
        //                cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
        //                cmd.Parameters.AddWithValue("@TestId", TestId); //@QuestionText
        //                cmd.Parameters.AddWithValue("@ExplanationText", HttpUtility.HtmlEncode(ExplanationText));
        //                cmd.Parameters.AddWithValue("@McqsQuestionInformationId", McqsQuestionInformationId);
        //                con.Open();
        //                int ExplanationId = (Int32)cmd.ExecuteScalar();
        //                con.Close();
        //                HttpContext.Current.Session["ExplanationId"] = ExplanationId;
        //                if (ExplanationId >= 1)
        //                {
        //                    msg = "true";
        //                }
        //                else
        //                {
        //                    msg = "false";
        //                }
        //            }
        //        }
        //    }
        //    return msg;
        //}

        // Edit Mcqs
        [System.Web.Services.WebMethod(EnableSession = false)]
        public static int Edit_Mcqs(string SubjectId, string TestId, string QuestionId, string QuestionText, string points, string txtOption1
                                                , string txtOption2, string txtOption3, string txtOption4
                                                , string txtOption5, string txtOption6, string txtOption7
                                                , string txtOption8, string chkOption1, string chkOption2
                                                , string chkOption3, string chkOption4, string chkOption5
                                                , string chkOption6, string chkOption7, string chkOption8
                                                , string ReferenceText, string ExplanationText, int exp_staff_id, string Emyadminid)
        {

            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {

                {
                    using (SqlCommand cmd = new SqlCommand("Edit_Mcqs", con))
                    {
                        //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                         Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
                        cmd.Parameters.AddWithValue("@Reference", HttpUtility.HtmlEncode(ReferenceText));
                        cmd.Parameters.AddWithValue("@Explanation", HttpUtility.HtmlEncode(ExplanationText));
                        cmd.Parameters.AddWithValue("@exp_staff_id", (exp_staff_id));

                        con.Open();
                        cmd.ExecuteNonQuery();
                        int i = 1;
                        con.Close();

                        return i;
                    }
                }
            }



        }


        [System.Web.Services.WebMethod(EnableSession = false)]
        public static string tblSubUser_Insert(int UserRoleId, string UserName, string UserEmail, string UserPassword,
                                               string UserParrentEmail, string UserParentName, string UserRollNo, string UserFirstName, string UserLastName
                                               , string UserDepartment, string UserRegion, string TelephoneNo, string UserDOB, int UserGroup
                                               , string UserImage, string UserCountry, string UserCity, int UserGender, bool UserCertificateDesignCustomize
                                               , bool UserResultCardDesignCustomize, bool EmailResultToUser, string TermsAndConditionsForUsers
                                                , bool UserPracticeMode, bool UserRandomizeQuestions, int TotalAttemptsForUsers
                                                , bool EmailTestResultToAdmin, bool AllResult, string UserTestStartDateTime, string UserTestEndDateTime, string Emyadminid, string txtUserSelectedSubject, string txtUserSelectedTest
                                                )
        {

            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                DateTime? NullableDateTime = null;
                using (SqlCommand cmd = new SqlCommand("[tblSubUser_Insert]", con))
                {
                    //  // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                     Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
                    if (txtUserSelectedSubject == "" || txtUserSelectedTest == "")
                    {
                        return "false";
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@SelectedSub", txtUserSelectedSubject);
                        cmd.Parameters.AddWithValue("@SelectedTest", txtUserSelectedTest);
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
        public static string Update_userinfoPwd(string Emyadminid, string u_name, string u_email, string u_pawd, string u_uid,int isdelete) 
        {
            string msg = "";
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            //update_subUserinfopwd

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("update_subUserinfopwd", con))
                {
                    // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    // // Int32 AdminId = 124;
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@adminid", AdminId);
                    cmd.Parameters.AddWithValue("@subId", Convert.ToInt32(u_uid));
                    cmd.Parameters.AddWithValue("@username", u_name);
                    cmd.Parameters.AddWithValue("@useremail", u_email);
                    cmd.Parameters.AddWithValue("@userpwd", u_pawd);
                    cmd.Parameters.AddWithValue("@isDelete", isdelete);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                   
                    
                        msg = "1";
                    
                }
            }
            return msg;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string Update_Staffinfo(string u_name, string u_qual, string u_Mob, string u_uid, int isdelete)
        {
            string msg = "";
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            //update_subUserinfopwd

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("update_Staffinfo", con))
                {
                    // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    // // Int32 AdminId = 124;
                    //Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
                    cmd.CommandType = CommandType.StoredProcedure;
                  //  cmd.Parameters.AddWithValue("@adminid", AdminId);
                    cmd.Parameters.AddWithValue("@subId", Convert.ToInt32(u_uid));
                    cmd.Parameters.AddWithValue("@username", u_name);
                    cmd.Parameters.AddWithValue("@u_qual", u_qual);
                    cmd.Parameters.AddWithValue("@u_Mob", u_Mob);
                    cmd.Parameters.AddWithValue("@isDelete", isdelete);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();


                    msg = "1";

                }
            }
            return msg;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string Update_Categoryinfo(int u_uid)
        {
            string msg = "";
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            //update_subUserinfopwd

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DeleteCat", con))
                {
                    // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    // // Int32 AdminId = 124;
                    //Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
                    cmd.CommandType = CommandType.StoredProcedure;
                    //  cmd.Parameters.AddWithValue("@adminid", AdminId);
                    cmd.Parameters.AddWithValue("@catid", Convert.ToInt32(u_uid));
                   
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();


                    msg = "1";

                }
            }
            return msg;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string Update_Catinfo(string txtEditCatName, string txtEditCatTagline, string txtEditCatPurpose, string txtEditCatDes, string filename, int catid)
        {
            string msg = "";
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            //update_subUserinfopwd

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UpdateCat", con))
                {
                    //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    //// Int32 AdminId = 124;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", catid);
                    cmd.Parameters.AddWithValue("@txtCatName", txtEditCatName);
                    cmd.Parameters.AddWithValue("@txtCatTagline", txtEditCatTagline);
                    cmd.Parameters.AddWithValue("@txtCatPurpose", txtEditCatPurpose);
                    cmd.Parameters.AddWithValue("@txtCatDesc", txtEditCatDes);
                    cmd.Parameters.AddWithValue("@fuCatImg", filename);
                    con.Open();
                    int CatId = (Int32)cmd.ExecuteScalar();
                    con.Close();
                    //HttpContext.Current.Session["SubjectId"] = SubjectId;
                    if (CatId >= 1)
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
      
        [System.Web.Services.WebMethod(EnableSession = false)]
        public static string InsertUserGroupName(string UserGroupName,string Emyadminid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_UserGroupName", con))
                {
                    // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    // // Int32 AdminId = 124;
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
        public static List<ddlUserGroups> LoadddlUserGroup(string Emyadminid)
        {
            return LoadddlUserrGroups(Emyadminid);
        }
        public static List<ddlUserGroups> LoadddlUserrGroups(string Emyadminid)                      //this method is a static type and list<property> is return.  
        {
            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //  // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ddlUserGroups> ddlUserGroupInformation = new List<ddlUserGroups>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ddlUserGroupNames", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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



        // Show user reported mcqs 
        [System.Web.Services.WebMethod]
        public static List<UserReportedMcqs> LoadUserReportedMcqs(string Emyadminid)
        {
            return LoadUserReportedMcq(Emyadminid);
        }
        public static List<UserReportedMcqs> LoadUserReportedMcq(string Emyadminid)                      //this method is a static type and list<property> is return.  
        {
            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //  // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<UserReportedMcqs> ddlUserGroupInformation = new List<UserReportedMcqs>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select *,(select SubjectName  from tblSubjectInformation where SubjectId =r.subid) as SubName,(select TestName from tblTest where TestId = r.testid) as TestName,(select QuestionText from tblMcqQuestionInformation where McqsQuestionInformationId = r.Report_McqsId)as mcqstext from   tbl_User_Report r where ReportAction = 0", con)) //GetCountryRecords is a Stored Procedure.  
                {
                   // Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
                                            ddlUserGroupInformation.Add(new UserReportedMcqs()
                                            {
                                                ReportId = Convert.ToInt32(dr["ReportId"]),
                                                ReporterName = DBNull.Value.Equals(dr["ReporterName"]) ? "No Name" : dr["ReporterName"].ToString(),
                                                ReporterEmail = (DBNull.Value.Equals(dr["ReporterEmail"]) ? "No Email" : dr["ReporterEmail"].ToString()),
                                                Report_McqsId = Convert.ToInt32(dr["Report_McqsId"]),
                                                Report_OptionText = (DBNull.Value.Equals(dr["Report_OptionText"]) ? "No Option" : HttpUtility.HtmlDecode(dr["Report_OptionText"].ToString())),
                                                Report_Type = Convert.ToInt32(dr["Report_Type"]),
                                                ReportTime = (DBNull.Value.Equals(dr["ReportTime"]) ? DateTime.Now : Convert.ToDateTime(dr["ReportTime"])),
                                                SubName = (DBNull.Value.Equals(dr["TestName"]) ? "No Email" : dr["TestName"].ToString()),
                                                TestName = (DBNull.Value.Equals(dr["SubName"]) ? "No Email" : dr["SubName"].ToString()),
                                                mcqstext = (DBNull.Value.Equals(dr["mcqstext"]) ? "No Email" : HttpUtility.HtmlDecode(dr["mcqstext"].ToString())),
                                                subid = DBNull.Value.Equals(dr["subId"]) ? 0: Convert.ToInt32(dr["subId"]),
                                                testid = DBNull.Value.Equals(dr["TestId"]) ? 0: Convert.ToInt32(dr["TestId"]),
                                                ReportAction = Convert.ToInt32(dr["ReportAction"] )
                                                



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
        public static List<Dashboard_UsersMcqs> Dashboard_UsersMcqs(string Emyadminid)
        {
            return Dashboard_UsersMcqs1(Emyadminid);
        }
        public static List<Dashboard_UsersMcqs> Dashboard_UsersMcqs1(string Emyadminid)
        {
           // Int32 useradminid = (Int32)HttpContext.Current.Session["UserAdminId"];

            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //// Int32 AdminId = 124;
            Int32 useradminid = Convert.ToInt32(Decrypt(Emyadminid));
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

        // User Summary 
        [System.Web.Services.WebMethod]
        public static List<UserSummary> UserSummary(string Emyadminid)
        {
            return UserSummary_(Emyadminid);
        }
        public static List<UserSummary> UserSummary_(string Emyadminid)
        {
            // Int32 useradminid = (Int32)HttpContext.Current.Session["UserAdminId"];

            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //// Int32 AdminId = 124;
            Int32 useradminid = Convert.ToInt32(Decrypt(Emyadminid));
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<UserSummary> Dashboard_UsersMcqs = new List<UserSummary>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select"+
 "(select count(AdminId)  from tblSubUser where AdminId in (a.AdminId)) Total_Sub_Users ,"+
  "(select count(QuestionsId)  from tblMcqQuestionInformation where AdminId in (a.AdminId)) Total_Admin_Mcqs ,"+
 "  (select RoleName from tblUserRoles where UserRoleId = a.UserRoleId ) RoleName,"+
" * from tblAdminManager a ", con)) //GetCountryRecords is a Stored Procedure.  
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
                                            Dashboard_UsersMcqs.Add(new UserSummary()
                                            {
                                                AdminId = Encrypt((dr["AdminId"]).ToString()),
                                                AdminName = (DBNull.Value.Equals(dr["AdminName"]) ? "No Name" : dr["AdminName"].ToString()),
                                                AdminEmail = (DBNull.Value.Equals(dr["AdminEmail"]) ? "No Email" : dr["AdminEmail"].ToString()),
                                                AdminImage = (DBNull.Value.Equals(dr["AdminImage"]) ? "No Image" : dr["AdminImage"].ToString()),
                                                AdminPassword = (DBNull.Value.Equals(dr["AdminPassword"]) ? "No Password" : dr["AdminPassword"].ToString()),
                                                AdminSocialEmail = (DBNull.Value.Equals(dr["AdminSocialEmail"]) ? "No Email" : dr["AdminSocialEmail"].ToString()),
                                                AdminSocialNameAccess = (DBNull.Value.Equals(dr["AdminSocialNameAccess"]) ? "No Social Name" : dr["AdminSocialNameAccess"].ToString()),
                                                AdminDateOfBirth = (DBNull.Value.Equals(dr["AdminDateOfBirth"]) ? "No DOB" : dr["AdminDateOfBirth"].ToString()),
                                                AdminInstituteName = (DBNull.Value.Equals(dr["AdminInstituteName"]) ? "No Institute Name" : dr["AdminInstituteName"].ToString()),
                                                AdminInstituteAddress = (DBNull.Value.Equals(dr["AdminInstituteAddress"]) ? "No Institute Address" : dr["AdminInstituteAddress"].ToString()),
                                                AdminQualification = (DBNull.Value.Equals(dr["AdminQualification"]) ? "No Qualification" : dr["AdminQualification"].ToString()),
                                                AdminExperience = (DBNull.Value.Equals(dr["AdminExperience"]) ? "No Expreience" : dr["AdminExperience"].ToString()),
                                                AdminDesiganation = (DBNull.Value.Equals(dr["AdminDesiganation"]) ? "No Designation Alot" : dr["AdminDesiganation"].ToString()),
                                                RoleName = (DBNull.Value.Equals(dr["RoleName"]) ? "No Role" : dr["RoleName"].ToString()),
                                                Total_Admin_Mcqs = (DBNull.Value.Equals(dr["Total_Admin_Mcqs"]) ? 0 :Convert.ToInt16(dr["Total_Admin_Mcqs"])),
                                                Total_Sub_Users = (DBNull.Value.Equals(dr["Total_Sub_Users"]) ? 0 : Convert.ToInt16(dr["Total_Sub_Users"])),
                                                UserRoleId = (DBNull.Value.Equals(dr["UserRoleId"]) ? 0 : Convert.ToInt16(dr["UserRoleId"]))
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
        public static string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }
        // Show User inserted MCQS
        [System.Web.Services.WebMethod]
        public static List<UserAddedMcqs> UserAddedMcqs(string Emyadminid)
        {
            return UserAddedMcqs_(Emyadminid);
        }
        public static List<UserAddedMcqs> UserAddedMcqs_(string Emyadminid)
        {
            // Int32 useradminid = (Int32)HttpContext.Current.Session["UserAdminId"];

            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //// Int32 AdminId = 124;
            Int32 useradminid = Convert.ToInt32(Decrypt(Emyadminid));
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<UserAddedMcqs> Dashboard_UsersMcqs = new List<UserAddedMcqs>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ShowUserAddMcqs", con)) //GetCountryRecords is a Stored Procedure. where IsUserSubmited = 1 
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    
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
                                            Dashboard_UsersMcqs.Add(new UserAddedMcqs()
                                            {

                                                CatName = (DBNull.Value.Equals(dr["CatName"]) ? "No Name" : dr["CatName"].ToString()),
                                                SubjectName = (DBNull.Value.Equals(dr["SubName"]) ? "No Subject Name" : dr["SubName"].ToString()),
                                                TestName = (DBNull.Value.Equals(dr["testName"]) ? "No Test Name" : dr["testName"].ToString()),
                                                InsertedDate = (DBNull.Value.Equals(dr["QuestionInsertionDate"]) ? DateTime.Now : Convert.ToDateTime(dr["QuestionInsertionDate"])),
                                               // catId = (DBNull.Value.Equals(dr["Total_Admin_Mcqs"]) ? 0 : Convert.ToInt16(dr["Total_Admin_Mcqs"])),
                                                SubjectId = (DBNull.Value.Equals(dr["SubjectId"]) ? 0 : Convert.ToInt32(dr["SubjectId"])),
                                                TestId = (DBNull.Value.Equals(dr["TestId"]) ? 0 : Convert.ToInt32(dr["TestId"])),
                                                McqsId = (DBNull.Value.Equals(dr["McqsQuestionInformationId"]) ? 0 : Convert.ToInt32(dr["McqsQuestionInformationId"]))
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


        //[System.Web.Services.WebMethod]
        //public static List<OnLoad> OnLoad()
        //{
        //    return OnLoad1();
        //}
        //public static List<OnLoad> OnLoad1()
        //{
        //    int adminid = (Int32)HttpContext.Current.Session["AdminId"];
        //    // // Int32 AdminId = 124;
        //    string adminname = HttpContext.Current.Session["AdminName"].ToString();
        //    string adminemail = HttpContext.Current.Session["AdminEmail"].ToString();
        //    int subuserid = (Int32)HttpContext.Current.Session["SubUserId"];
        //    string username = HttpContext.Current.Session["UserName"].ToString();
        //    string useremail = HttpContext.Current.Session["UserEmail"].ToString();
        //    int useradminid = (Int32)HttpContext.Current.Session["UserAdminId"];
        //    string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
        //    List<OnLoad> Onload = new List<OnLoad>();  //create a reference of List<Property>.  
        //    Onload.Add(new OnLoad()
        //    {
        //        SubUserAdminId = useradminid,
        //        AdminId = adminid,
        //        UserId = subuserid
        //    });
        //    return Onload;
        //}

        [System.Web.Services.WebMethod(EnableSession = false)]
        public static string Insert_Test_With_All_Options(int ddlSubjectId, string TestName, string TestDescription, bool TestStatus, bool PractiseSession, int PassingPercentage, string TestImage, string TestInstructions, string TestStartDateTime, string TestDueDateTime, int TestAttempts, string TestExtendedDateTime, bool TestAlwaysOpen, string Emyadminid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_Test_With_All_Options", con))
                {
                    // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    // // Int32 AdminId = 124;
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
            HttpContext.Current.Session["For_Load_Edit_UserDetails_ddlEditUserId"] = UserId.ToString();

        }



        //int ddlSubjectId, string TestName, string TestDescription, bool TestStatus, bool TestPracticeSession, int TestPassingPercentage, string TestImage, string TestInstructions, string TestStartTiming, string TestDueTiming, int TestAttempts, string TestExtendedDateTime, bool TestAlwaysOpen, int TestId

        [System.Web.Services.WebMethod]
        public static string Update_Test_With_All_Options(int ddlSubjectId, string TestName, string TestDescription, bool TestStatus, bool TestPracticeSession, int TestPassingPercentage, string TestImage, string TestInstructions, string TestStartTiming, string TestDueTiming, int TestAttempts, string TestExtendedDateTime, bool TestAlwaysOpen, int TestId,string Emyadminid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Update_Test_With_All_Options", con))
                {
                    DateTime? datetime;
                    //  // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    // // Int32 AdminId = 124;
                    Int32 SubjectId = ddlSubjectId;
                  //  Int32 AdminId = Convert.ToInt32(Decrypt("dfd"));
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));

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
        public static List<LoadTestSettings> Load_Test_Setting(int subjectId, string Emyadminid)
        {
            return Load_Test_Settings(subjectId, Emyadminid);
        }
        public static List<LoadTestSettings> Load_Test_Settings(int subId, string Emyadminid)
        {
            Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
           // Int32 TestId = (Int32)HttpContext.Current.Session["For_LoadTest_Settings_ddlTestId"];
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
        public static string Delete_Test(int TestId, int ddlSubjectId, string Emyadminid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete_Test", con))
                {
                    //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    //  // Int32 AdminId = 124;
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
        public static string Merge_Test(int TestId, int ddlSubjectId, int ddlNewSubjectId, string Emyadminid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Merge_Test", con))
                {
                    //  // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    //// Int32 AdminId = 124;
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
        public static List<UsersDetail> UserDetail(string Emyadminid, string userid)
        {
            return UsersDetail(Emyadminid, userid);
        }
        public static List<UsersDetail> UsersDetail(string Emyadminid, string userid)
        {
            //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            //Int32 UserId = (Int32)HttpContext.Current.Session["For_Load_Edit_UserDetails_ddlEditUserId"];
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<UsersDetail> Load_UsersDetail = new List<UsersDetail>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sql = "";
                if (userid != "") 
                {
                    sql = "select * from View_ShowUserDetail Where AdminId = '" + AdminId + "' and subUserId = '" + userid + "'";
                //using (SqlCommand cmd = new SqlCommand("select * from View_ShowUserDetail Where AdminId = '" + AdminId + "' and subUserId = '" + userid + "'", con)) //GetCountryRecords is a Stored Procedure.  
                }
                else
                {
                    sql = "select * from View_ShowUserDetail Where AdminId = '" + AdminId + "'";
                }
               // 
                using (SqlCommand cmd = new SqlCommand(sql, con)) //GetCountryRecords is a Stored Procedure.  

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
                                                selectedsub = (dr["SelectedSub"].ToString()),
                                                selectedtest = (dr["SelectedTest"].ToString())
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

        // load Category
        [System.Web.Services.WebMethod]
        public static List<Categorylist> CatDetail(string Emyadminid, string userid)
        {
            return CateDetail(Emyadminid, userid);
        }
        public static List<Categorylist> CateDetail(string Emyadminid, string userid)
        {
            //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            //Int32 UserId = (Int32)HttpContext.Current.Session["For_Load_Edit_UserDetails_ddlEditUserId"];
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<Categorylist> Load_UsersDetail = new List<Categorylist>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("ShowAllCategory", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter = cmd.Parameters.Add("@userid", userid);  //@count is Stored Procedure parameter and 
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
                                            Load_UsersDetail.Add(new Categorylist()
                                            {
                                                catid = DBNull.Value.Equals(dr["Catid"]) ? 0 : Convert.ToInt32(dr["Catid"]),
                                                CatName = (DBNull.Value.Equals(dr["CatName"]) ? "" : (dr["CatName"]).ToString()),
                                                TotalSub = DBNull.Value.Equals(dr["TotalSubject"]) ? 0 : Convert.ToInt32(dr["TotalSubject"]),
                                                TotalTest = DBNull.Value.Equals(dr["TotalTest"]) ? 0 : Convert.ToInt32(dr["TotalTest"]),
                                                TotalMcqs = DBNull.Value.Equals(dr["totalmcqs"]) ? 0 : Convert.ToInt32(dr["totalmcqs"])
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

        [System.Web.Services.WebMethod]
        public static List<Categorylist> CategoryList(string userid)
        {
            return CategoryList_( userid);
        }
        public static List<Categorylist> CategoryList_( string userid)
        {
            //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
          //  Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            //Int32 UserId = (Int32)HttpContext.Current.Session["For_Load_Edit_UserDetails_ddlEditUserId"];
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<Categorylist> Load_UsersDetail = new List<Categorylist>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand("ShowAllCategory", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter = cmd.Parameters.Add("@userid", userid);  //@count is Stored Procedure parameter and 
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
                                            Load_UsersDetail.Add(new Categorylist()
                                            {
                                                catid = DBNull.Value.Equals(dr["Catid"]) ? 0 : Convert.ToInt32(dr["Catid"]),
                                                CatName = (DBNull.Value.Equals(dr["CatName"]) ? "" : (dr["CatName"]).ToString()),
                                                CatDesc = DBNull.Value.Equals(dr["CatDesc"]) ? "" : (dr["CatDesc"]).ToString(),
                                                CatImg = DBNull.Value.Equals(dr["CatImg"]) ? "" : (dr["CatImg"]).ToString(),
                                                Tagline = DBNull.Value.Equals(dr["Tagline"]) ? "" : (dr["Tagline"]).ToString(),
                                                CatPurpose = DBNull.Value.Equals(dr["CatPurpose"]) ? "" : (dr["CatPurpose"]).ToString()
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

        // load Staff
        [System.Web.Services.WebMethod]
        public static List<StaffDetail> StaffDetail(string id)
        {
            return StaffDetails(id);
        }
        public static List<StaffDetail> StaffDetails(string id)
        {
            //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            //Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            //Int32 UserId = (Int32)HttpContext.Current.Session["For_Load_Edit_UserDetails_ddlEditUserId"];
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<StaffDetail> Load_UsersDetail = new List<StaffDetail>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {

                // 
                using (SqlCommand cmd = new SqlCommand("ShowStaff", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter = cmd.Parameters.Add("@Id", id);  //@count is Stored Procedure parameter and 
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
                                            Load_UsersDetail.Add(new StaffDetail()
                                            {
                                                Name = (DBNull.Value.Equals(dr["Name"]) ? string.Empty : dr["Name"].ToString()),
                                                Qual = (DBNull.Value.Equals(dr["Qualification"]) ? string.Empty : dr["Qualification"].ToString()),
                                                picpath = (DBNull.Value.Equals(dr["PicPath"]) ? string.Empty : dr["PicPath"].ToString()),
                                                JoinDate = (DBNull.Value.Equals(dr["Joining_date"]) ? string.Empty : dr["Joining_date"].ToString()),
                                                isactive = (DBNull.Value.Equals(dr["isactive"]) ? 0 : Convert.ToInt32(dr["isactive"])),
                                                Mobno = (DBNull.Value.Equals(dr["MobileNo"]) ? string.Empty : dr["MobileNo"].ToString()),
                                                TotalMcqs = (DBNull.Value.Equals(dr["TotalMcqs_"]) ? 0 : Convert.ToInt32(dr["TotalMcqs_"])),
                                                TotalExp = (DBNull.Value.Equals(dr["TotalMcqsExp_"]) ? 0 : Convert.ToInt32(dr["TotalMcqsExp_"]))
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

        [System.Web.Services.WebMethod(EnableSession = false)]
        public static List<ShowMcqsQuestionOnly> LoadMcqsQuestions_(int SubId, int TestId, string Emyadminid , string role)
        {
            return LoadMcqsQuestion(SubId, TestId ,Emyadminid,role);
        }

        //this method is a static type and list<property> is return.
        public static List<ShowMcqsQuestionOnly> LoadMcqsQuestion(int SubjectId, int Testid ,string Emyadminid, string role)
        {
            //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //// Int32 AdminId = 124;
            Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            Int32 role_ = Convert.ToInt32(Decrypt(role));
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
                    cmd.Parameters.AddWithValue("@role", role_);
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

        [System.Web.Services.WebMethod(EnableSession = false)]
        public static List<ShowMcqs> LoadMcqsQuestions(string Emyadminid)
        {
            return LoadMcqsQuestionAll(Emyadminid);
        }

        //this method is a static type and list<property> is return.
        public static List<ShowMcqs> LoadMcqsQuestionAll(string Emyadminid)
        {
            //  // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //// Int32 AdminId = 124;
            Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowMcqs> ShowMcqsInfo = new List<ShowMcqs>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_For_Admin_Mcqs_New", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminId", AdminId);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        int i = 0;
                        while (dr.Read())
                        {
                            i++;
                            bool op1 = (bool)dr["Option1"];
                            bool op2 = (bool)dr["Option2"];
                            bool op3 = (bool)dr["Option3"];
                            bool op4 = (bool)dr["Option4"];
                            bool op5 = (bool)dr["Option5"];
                            bool op6 = (bool)dr["Option6"];
                            bool op7 = (bool)dr["Option7"];
                            bool op8 = (bool)dr["Option8"];
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
                                QuestionText = HttpUtility.HtmlDecode(dr["QuestionText"].ToString()),
                                Points = Convert.ToInt32(dr["Points"].ToString()),
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
                                Option8Text = Option8Text,
                                // Question belong to which subject and test
                                SubjectName = HttpUtility.HtmlDecode(dr["SubjectName"].ToString()),
                                TestName = HttpUtility.HtmlDecode(dr["TestName"].ToString())
                                //  McqsQuestionId = Convert.ToInt32(dr["McqsQuestionInformationId"].ToString())
                            });
                            if (i == 25)
                                break;
                        }
                    }
                   
                    return ShowMcqsInfo;
                }
            }
        }
        [System.Web.Services.WebMethod(EnableSession = false)]

        public static List<ShowShortQuestionOnly> LoadShortQuestions(int SubId, int TestId, string Emyadminid)
        {
            return LoadShortQuestion(SubId, TestId, Emyadminid);
        }

        //this method is a static type and list<property> is return.
        public static List<ShowShortQuestionOnly> LoadShortQuestion(int SubjectId, int Testid, string Emyadminid)
        {
            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowShortQuestionOnly> ShowMcqsInfo = new List<ShowShortQuestionOnly>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ShowShortQuestionOnly", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
        [System.Web.Services.WebMethod(EnableSession = false)]
        public static List<ShowLongQuestionOnly> LoadLongQuestions(int SubId, int TestId, string Emyadminid)
        {
            return LoadLongQuestion(SubId, TestId, Emyadminid);
        }

        //this method is a static type and list<property> is return.
        public static List<ShowLongQuestionOnly> LoadLongQuestion(int SubjectId, int Testid, string Emyadminid)
        {
            //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //  // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowLongQuestionOnly> ShowMcqsInfo = new List<ShowLongQuestionOnly>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ShowLongQuestionOnly", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
        public static List<ddlTest> LoadddlTestForSpecificSub(int SubId, string Emyadminid, string role)
        {
            return LoadddlTestForSpecificSubj(SubId, Emyadminid, role);
        }
        //this method is a static type and list<property> is return. 
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<ddlTest> LoadddlTestForSpecificSubj(int subid, string Emyadminid,string role)
        {
            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            Int32 rol_d = Convert.ToInt32(Decrypt(role));
            HttpContext.Current.Server.ScriptTimeout = 90000;
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
                    SqlParameter parameter2 = cmd.Parameters.Add("@role", rol_d);
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

        // Load Dashboard
        [System.Web.Services.WebMethod]
        public static List<dashboard_user> Load_userdashboard(string Emyadminid, string role)
        {
            return Load_userdashboard_(Emyadminid, role);
        }
        //this method is a static type and list<property> is return. 
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<dashboard_user> Load_userdashboard_(string Emyadminid, string role)
        {
            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            Int32 rol_d = Convert.ToInt32(Decrypt(role));
            HttpContext.Current.Server.ScriptTimeout = 90000;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<dashboard_user> SubjectInformation = new List<dashboard_user>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("userDashboard", con)) //GetCountryRecords is a Stored Procedure.  
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                    //SqlParameter parameter1 = cmd.Parameters.Add("@SubId", subid);
                    //SqlParameter parameter2 = cmd.Parameters.Add("@role", rol_d);
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
                                            SubjectInformation.Add(new dashboard_user()
                                            {
                                                today = Convert.ToInt32(dr["Today"]),
                                                yesterday = Convert.ToInt32(dr["Yesterday"]),
                                                thismonth = Convert.ToInt32(dr["ThisMonth"]),
                                                usersum = Convert.ToInt32(dr["TotalMcq"])
                                                
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

        // Load All test for Sign In user's
        [System.Web.Services.WebMethod]
        public static List<ddlTest> LoadddlTestForUser(string Emyadminid, string role)
        {
            return LoadddlTestForUsers(Emyadminid, role);
        }
        //this method is a static type and list<property> is return. 
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<ddlTest> LoadddlTestForUsers( string Emyadminid, string role)
        {
            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            Int32 rol_d = Convert.ToInt32(Decrypt(role));
            HttpContext.Current.Server.ScriptTimeout = 90000;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ddlTest> SubjectInformation = new List<ddlTest>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ddlTestNameForSignInUser", con)) //GetCountryRecords is a Stored Procedure.  
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                   // SqlParameter parameter1 = cmd.Parameters.Add("@SubId", subid);
                    SqlParameter parameter2 = cmd.Parameters.Add("@role", rol_d);
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
        public static string Delet_McqsQuestion(int TestId, int SubjectId, int QuestionId, string Emyadminid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete_Mcqs_Question", con))
                {
                    // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    //  // Int32 AdminId = 124;
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
        public static string Delet_ShortQuestion(int TestId, int SubjectId, int QuestionId, string Emyadminid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete_Short_Question", con))
                {
                    //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    //  // Int32 AdminId = 124;
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
        public static string Delet_LongQuestion(int TestId, int SubjectId, int QuestionId, string Emyadminid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Delete_Long_Question", con))
                {
                    // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    // // Int32 AdminId = 124;
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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

        [System.Web.Services.WebMethod(EnableSession = false)]
        public static List<ShowShortQuestion> LoadShortQuestionsWithAllOptions(int shortQuestionId, string Emyadminid)
        {
            return LoadShortQuestionWithAllOption(shortQuestionId, Emyadminid);
        }

        //this method is a static type and list<property> is return.
        public static List<ShowShortQuestion> LoadShortQuestionWithAllOption(int shortqId, string Emyadminid)
        {
            //  // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowShortQuestion> ShowShortInfo = new List<ShowShortQuestion>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ShowShortQuestions", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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

        [System.Web.Services.WebMethod(EnableSession = false)]
        public static List<ShowShortQuestion> LoadLongQuestionWithAllOption(int LongQuestionId, string Emyadminid)
        {
            return LoadLongQuestionWithAllOptions(LongQuestionId, Emyadminid);
        }

        //this method is a static type and list<property> is return.
        public static List<ShowShortQuestion> LoadLongQuestionWithAllOptions(int LongqId, string Emyadminid)
        {
            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //// Int32 AdminId = 124;
            Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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

       [System.Web.Services.WebMethod(EnableSession = false)]
                //public static string Update_ShortQuestion_WithAllOptions_(string SubjectId, string TestId, string QuestionText, string AnswerText, string ExplanationText, string ReferenceText, string Points, string ShortQuestionId)
        public static string Update_ShortQuestion_WithAllOptions_(string SubjectId, string TestId, string QuestionText, string AnswerText, string ExplanationText, string ReferenceText, string Points, string ShortQuestionId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Edit_ShortQuestions", con))
                {
                    DateTime? datetime;
                    // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
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
       public static string Update_LongQuestion_WithAllOptions(int SubId, int TestId, string QuestionText, string AnswerText, string ExpText, string ReferenceText, int points, string Emyadminid, int LongQuestionId)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Edit_LongQuestions", con))
                {

                    //  // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TestId", TestId);
                    cmd.Parameters.AddWithValue("@LongQuestionId", LongQuestionId);
                    cmd.Parameters.AddWithValue("@SubjectId", SubId);
                    cmd.Parameters.AddWithValue("@QuestionText", QuestionText);
                    cmd.Parameters.AddWithValue("@AnswerText", AnswerText);
                    cmd.Parameters.AddWithValue("@ExplanationText", ExpText);
                    cmd.Parameters.AddWithValue("@ReferenceText", ReferenceText);
                    cmd.Parameters.AddWithValue("@Points", points);
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
        public static List<ShowShortQuestionOnly> LoadTests(int SubId, int TestId,string Emyadminid)
        {
            return LoadTest(SubId, TestId, Emyadminid);
        }

        //this method is a static type and list<property> is return.
        public static List<ShowShortQuestionOnly> LoadTest(int SubjectId, int Testid, string Emyadminid)
        {
            // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowShortQuestionOnly> ShowMcqsInfo = new List<ShowShortQuestionOnly>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ShowShortQuestionOnly", con)) //GetCountryRecords is a Stored Procedure.  
                {
                    Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
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
       // [System.Web.Services.WebMethod(EnableSession = false)]
        //public static List<ShowMcqs> ShowMcqsForUsers(int AdminId, int TestId)
        //{
        //    return LoadMcqsForUser(McqsId);
        //}
        ////this method is a static type and list<property> is return.
        //public static List<ShowMcqs> LoadMcqsForUser(int mcqsId)
        //{
        //    //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
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

 public string ddltest { get; set; }

    }
}