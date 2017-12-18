using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jquery1.Executeable_App
{
    public partial class cs101 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string testid = "1261";
            int name = 2;
            LoadMcqsQuestions(testid,name);

        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<ShowMcqs> LoadMcqsQuestions(string TestId, int name)
        {
            return LoadMcqsQuestionAll(TestId, name);
        }

        //this method is a static type and list<property> is return.
        public static  List<ShowMcqs> LoadMcqsQuestionAll(string TestId, int name)
        {
            //Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //Int32 AdminId = 124;

            string sp_Name;
            if (name == 1)
            {
                sp_Name = "sp_For_HomePage_Mcqs_New";
            }
            else
            {
                sp_Name = "sp_For_HomePage_Mcqs_New_Test";
            }

            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowMcqs> ShowMcqsInfo = new List<ShowMcqs>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(sp_Name, con)) //GetCountryRecords is a Stored Procedure.  
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TestId", TestId);
                    cmd.CommandTimeout = 100 * 1000;
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            int i = 0;
                            bool op1;
                            bool op2;
                            bool op3;
                            bool op4;
                            bool op5;
                            bool op6;
                            bool op7;
                            bool op8;

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
                            string exptxt = "";
                            string reftxt = "";
                            while (dr.Read())
                            {
                                i++;
                                exptxt = "";
                                reftxt = "";
                                op1 = (bool)dr["Option1"];
                                op2 = (bool)dr["Option2"];
                                op3 = (bool)dr["Option3"];
                                op4 = (bool)dr["Option4"];
                                op5 = (bool)dr["Option5"];
                                op6 = (bool)dr["Option6"];
                                op7 = (bool)dr["Option7"];
                                op8 = (bool)dr["Option8"];

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
                                if (name == 1)
                                {
                                    if (dr["Exptext"] != "")
                                    {
                                        exptxt = HttpUtility.HtmlDecode(dr["Exptext"].ToString());
                                    }
                                    if (dr["Reftext"] != "")
                                    {
                                        reftxt = HttpUtility.HtmlDecode(dr["Reftext"].ToString());
                                    }
                                }
                                else
                                {
                                    exptxt = "";
                                    reftxt = "";
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
                                    ExplanationText = exptxt,
                                    Reference = reftxt,
                                    // Question belong to which subject and test
                                    SubjectName = HttpUtility.HtmlDecode(dr["SubjectName"].ToString()),
                                    TestName = HttpUtility.HtmlDecode(dr["TestName"].ToString()),
                                    McqsQuestionId = Convert.ToInt32(dr["McqsQuestionInformationId"])
                                    //  McqsQuestionId = Convert.ToInt32(dr["McqsQuestionInformationId"].ToString())
                                });
                                if (i == 101)
                                    break;
                            }
                        }

                    }
                    return ShowMcqsInfo;
                }
            }
        }
    }
}