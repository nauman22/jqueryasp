using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;

namespace jquery1
{
    /// <summary>
    /// Summary description for myservice
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class myservice : System.Web.Services.WebService
    {

        [WebMethod]
        public void getallmcq(int pageNumber, int pageSize)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ShowMcqs> ShowMcqsInfo = new List<ShowMcqs>();  //create a reference of List<Property>.  
            DataSet ds;
            string sp_Name = "";
            sp_Name = "spgetallmcqs";
            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd = new SqlCommand(sp_Name, con)) //GetCountryRecords is a Stored Procedure.  
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PageNumber", pageNumber);
                    cmd.Parameters.AddWithValue("@PageSize", pageSize);
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
                            int op1id;
                            int op2id;
                            int op3id;
                            int op4id;
                            int op5id;
                            int op6id;
                            int op7id;
                            int op8id;
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
                            string exp_check_staff_name = "";
                            string exp_check_staff_qual = "";
                            string exp_check_staff_pic = "";
                            string exp_check_staff_acc = "";
                            int isExplained = 0;

                            while (dr.Read())
                            {
                                i++;
                                exptxt = "";
                                reftxt = "";
                                exp_check_staff_name = "";
                                op1 = (bool)dr["Option1"];
                                op2 = (bool)dr["Option2"];
                                op3 = (bool)dr["Option3"];
                                op4 = (bool)dr["Option4"];
                                op5 = (bool)dr["Option5"];
                                op6 = (bool)dr["Option6"];
                                op7 = (bool)dr["Option7"];
                                op8 = (bool)dr["Option8"];
                                //if (name == 1)
                                //{
                                //    exp_check_staff_name = DBNull.Value.Equals(dr["exp_check_staff_name"]) ? "" : dr["exp_check_staff_name"].ToString();

                                //    if (exp_check_staff_name != "")
                                //    {
                                //        exp_check_staff_name = HttpUtility.HtmlDecode(dr["exp_check_staff_name"].ToString());
                                //        exp_check_staff_qual = HttpUtility.HtmlDecode(dr["exp_check_staff_qual"].ToString());
                                //        exp_check_staff_pic = HttpUtility.HtmlDecode(dr["exp_check_staff_pic"].ToString());
                                //        exp_check_staff_acc = (dr["exp_check_staff_acc"].ToString());
                                //        isExplained = 1;
                                //    }
                                //    else
                                //    {
                                //        exp_check_staff_name = "";
                                //        exp_check_staff_qual = "";
                                //        exp_check_staff_pic = "";
                                //        exp_check_staff_acc = "";
                                //        isExplained = 0;
                                //    }
                                //}
                                //else
                                //{
                                    exp_check_staff_name = "";
                                    exp_check_staff_qual = "";
                                    exp_check_staff_pic = "";
                                    exp_check_staff_acc = "";
                                    isExplained = 0;
                               // }


                                if (op1 == true)
                                {
                                    Option1Text = HttpUtility.HtmlDecode(dr["Option1Text"].ToString());
                                    Option1Correct = (bool)dr["Option1Correct"];
                                    op1id = Convert.ToInt32(dr["Option1Id"].ToString());
                                }
                                else
                                {
                                    Option1Text = null;
                                    Option1Correct = false;
                                    op1id = 0;
                                }
                                if (op2 == true)
                                {
                                    Option2Text = HttpUtility.HtmlDecode(dr["Option2Text"].ToString());
                                    Option2Correct = (bool)dr["Option2Correct"];
                                    op2id = Convert.ToInt32(dr["Option2Id"].ToString());
                                }
                                else
                                {
                                    Option2Text = null;
                                    Option2Correct = false;
                                    op2id = 0;
                                }
                                if (op3 == true)
                                {
                                    Option3Text = HttpUtility.HtmlDecode(dr["Option3Text"].ToString());
                                    Option3Correct = (bool)dr["Option3Correct"];
                                    op3id = Convert.ToInt32(dr["Option3Id"].ToString());
                                }
                                else
                                {
                                    Option3Text = null;
                                    Option3Correct = false;
                                    op3id = 0;
                                }
                                if (op4 == true)
                                {
                                    Option4Text = HttpUtility.HtmlDecode(dr["Option4Text"].ToString());
                                    Option4Correct = (bool)dr["Option4Correct"];
                                    op4id = Convert.ToInt32(dr["Option4Id"].ToString());
                                }
                                else
                                {
                                    Option4Text = null;
                                    Option4Correct = false;
                                    op4id = 0;
                                }
                                if (op5 == true)
                                {
                                    Option5Text = HttpUtility.HtmlDecode(dr["Option5Text"].ToString());
                                    Option5Correct = (bool)dr["Option5Correct"];
                                    op5id = Convert.ToInt32(dr["Option5Id"].ToString());
                                }
                                else
                                {
                                    Option5Text = null;
                                    Option5Correct = false;
                                    op5id = 0;
                                }
                                if (op6 == true)
                                {
                                    Option6Text = HttpUtility.HtmlDecode(dr["Option6Text"].ToString());
                                    Option6Correct = (bool)dr["Option6Correct"];
                                    op6id = Convert.ToInt32(dr["Option6Id"].ToString());
                                }
                                else
                                {
                                    Option6Text = null;
                                    Option6Correct = false;
                                    op6id = 0;
                                }
                                if (op7 == true)
                                {
                                    Option7Text = HttpUtility.HtmlDecode(dr["Option7Text"].ToString());
                                    Option7Correct = (bool)dr["Option7Correct"];
                                    op7id = Convert.ToInt32(dr["Option7Id"].ToString());
                                    //op7id
                                }
                                else
                                {
                                    Option7Text = null;
                                    Option7Correct = false;
                                    op7id = 0;
                                }
                                if (op8 == true)
                                {
                                    Option8Text = HttpUtility.HtmlDecode(dr["Option8Text"].ToString());
                                    Option8Correct = (bool)dr["Option8Correct"];
                                    op8id = Convert.ToInt32(dr["Option8Id"].ToString());
                                }
                                else
                                {
                                    Option8Text = null;
                                    Option8Correct = false;
                                    op8id = 0;
                                }
                                //if (name == 1)
                                //{
                                //    if (dr["Exptext"] != "")
                                //    {
                                //        exptxt = HttpUtility.HtmlDecode(dr["Exptext"].ToString());
                                //    }
                                //    if (dr["Reftext"] != "")
                                //    {
                                //        reftxt = HttpUtility.HtmlDecode(dr["Reftext"].ToString());
                                //    }
                                //}
                                //else
                                //{
                                    exptxt = "";
                                    reftxt = "";
                               // }

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
                                    McqsQuestionId = Convert.ToInt32(dr["McqsQuestionInformationId"]),
                                    Option1Id = op1id,
                                    Option2Id = op2id,
                                    Option3Id = op3id,
                                    Option4Id = op4id,
                                    Option5Id = op5id,
                                    Option6Id = op6id,
                                    Option7Id = op7id,
                                    Option8Id = op8id,
                                    userselectedoption = 0,
                                    Isusercorrect = 0,
                                    IsuserAttempt = 0,
                                    exp_check_staff_name = exp_check_staff_name,
                                    exp_check_staff_qual = exp_check_staff_qual,
                                    exp_check_staff_acc = exp_check_staff_acc,
                                    exp_check_staff_pic = exp_check_staff_pic,
                                    isExplained = isExplained

                                    //  McqsQuestionId = Convert.ToInt32(dr["McqsQuestionInformationId"].ToString())
                                });
                                //if (i == 101)
                                //    break;
                            }
                        }
                        JavaScriptSerializer js = new JavaScriptSerializer();
                        Context.Response.Write(js.Serialize(ShowMcqsInfo));
                    }
                }
            }

                    
        }
    }
}
