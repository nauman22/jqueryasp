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
using jquery1;

namespace jquery1.SecurePages
{
    public partial class design : Index
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string testid = Request.QueryString["testid"];
            string Mode   = Request.QueryString["Mode"];
            int name = 1;
            if (testid != null)
            {
                Response.Write("Test id is ");
                Response.Write(testid);
                HttpContext.Current.Session["testid"] = testid;
                HttpContext.Current.Session["Mode"] = Mode;
              
                if(Mode=="0")
                {
                    name = 2;
                }
                else
                {
                    name = 1;
                }

                //LoadMcqsQuestions(testid, name);
            }
            int subuserid = (Int32)HttpContext.Current.Session["SubUserId"];
            string username = HttpContext.Current.Session["UserName"].ToString();
            string useremail = HttpContext.Current.Session["UserEmail"].ToString();
            int useradminid = (Int32)HttpContext.Current.Session["UserAdminId"];
        }
        //Getmcqs_Detail
        [System.Web.Services.WebMethod]
        public static List<McqsDetail> Getmcqs_Detail(int QNo)
        {
            return Getmcqs_Details(QNo);
        }
        public static List<McqsDetail> Getmcqs_Details(int QuestioNo)
        {
            Int32 useradminid = (Int32)HttpContext.Current.Session["UserAdminId"];
            Int64 testid = Convert.ToInt32(HttpContext.Current.Session["testid"]);
            Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            int subuserid = (Int32)HttpContext.Current.Session["SubUserId"];
           // Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<McqsDetail> Dashboard_UsersMcqsDetail = new List<McqsDetail>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string myquery;
                if (QuestioNo == 0)
                {
                    myquery = "select count(QuestionsId) as TotalQuestions , SUM(Points) as totalNumbers, UserEmail,UserImage  from View_Final_ShowMcqs_Question_8Options_Reference_Explanation where subuserId = " + subuserid + " and TestId = " + testid + "Group by UserEmail,UserImage";
                    using (SqlCommand cmd = new SqlCommand(myquery, con)) // '" + useradminid + "'" GetCountryRecords is a Stored Procedure.  
                    {
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.Text;
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
                                                Dashboard_UsersMcqsDetail.Add(new McqsDetail()
                                                {
                                                    TotalQuestion = Convert.ToInt32(dr["TotalQuestions"]),
                                                    TotalPoints = Convert.ToInt32(dr["totalNumbers"]),
                                                    UserEmail = dr["UserEmail"].ToString(),
                                                    UserImage = dr["UserImage"].ToString()
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
                     
                        // con.Close();
                    }
                   
                }


            }
            return Dashboard_UsersMcqsDetail;
        }


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
            Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //Int32 AdminId = 124;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<Dashboard_UsersMcqs> Dashboard_UsersMcqs = new List<Dashboard_UsersMcqs>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string selectQuery ;
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
                    selectQuery = "select * from View_Final_ShowMcqs_Question_8Options_Reference_Explanation  where AdminId = " + useradminid + " and TestId = " + testid + "  and QuestionsId = " + QuestioNo ;
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
    }
}