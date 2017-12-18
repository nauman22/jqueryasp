using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace jquery1
{
    /// <summary>
    /// Summary description for WebServiceFreemcqs
    /// </summary>
    [WebService(Namespace = "http://127.0.0.1/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebServiceFreemcqs : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void HelloWorld()
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            this.Context.Response.ContentType = "application/json; charset=utf-8";
            this.Context.Response.Write(serializer.Serialize(new { mytext = "Hello String :) " }));
            //return serializer.ToString();
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void LoadCategory()
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            this.Context.Response.ContentType = "application/json; charset=utf-8";
            this.Context.Response.Write(serializer.Serialize(new { category = LoadHomePagesAllsub1() }));
            return;
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void getTestInst(int TestId)
        {
            //List<GetTestInst>
            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            //Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            HttpContext.Current.Server.ScriptTimeout = 90000;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<GetTestInst> SubjectInformation = new List<GetTestInst>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("GetTestInst", con)) //GetCountryRecords is a Stored Procedure.  
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    // SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                    SqlParameter parameter1 = cmd.Parameters.Add("@TestId", TestId);
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
                                            SubjectInformation.Add(new GetTestInst()
                                            {
                                                SecPriority = DBNull.Value.Equals(dr["SecPriority"]) ? 0 : Convert.ToInt32(dr["SecPriority"]),
                                                SecTotalQ = DBNull.Value.Equals(dr["SecTotalQ"]) ? 0 : Convert.ToInt32(dr["SecTotalQ"]),
                                                SecName = DBNull.Value.Equals(dr["SecName"]) ? "" : dr["SecName"].ToString(),
                                                SecDetail = DBNull.Value.Equals(dr["SecDetail"]) ? "" : dr["SecDetail"].ToString(),
                                                TestPassingPercent = DBNull.Value.Equals(dr["TestPassingPercentage"]) ? 0 : Convert.ToInt32(dr["TestPassingPercentage"]),
                                                TestName = DBNull.Value.Equals(dr["TestName"]) ? "" : dr["TestName"].ToString(),
                                                isNegativeMarks = DBNull.Value.Equals(dr["isNegativeMarks"]) ? 0 : Convert.ToInt32(dr["isNegativeMarks"]),
                                                SpecMarks = DBNull.Value.Equals(dr["SpecMarks"]) ? 0 : Convert.ToInt32(dr["SpecMarks"]),
                                                TestInst = DBNull.Value.Equals(dr["TestInstructions"]) ? "" : HttpUtility.HtmlDecode(dr["TestInstructions"].ToString()),
                                                TestTotalQ = DBNull.Value.Equals(dr["TestTotalQuestions"]) ? 0 : Convert.ToInt32(dr["TestTotalQuestions"])
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

                    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                    this.Context.Response.ContentType = "application/json; charset=utf-8";
                    this.Context.Response.Write(serializer.Serialize(new { inst = SubjectInformation }));
                    return;

                }
            }
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<Categorylist> LoadHomePagesAllsub1()
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;


            //Int32 AdminId = 132;
            //if (HttpContext.Current.Session["AdminId"] != null)
            //{

            //    AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //}
            //else
            //{
            //    AdminId = 0;
            //    // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //}
            // string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<Categorylist> homeinfo = new List<Categorylist>();
            //List<ddlLoadUsers> UsersInformation = new List<ddlLoadUsers>();  //create a reference of List<Property>.  
            DataSet ds;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("ShowAllCategory", con)) //GetCountryRecords is a Stored Procedure.  
                    {

                        cmd.CommandTimeout = 100 * 1000;
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlParameter parameter = cmd.Parameters.Add("@userid", -1);  //@count is Stored Procedure parameter and 
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
                                                homeinfo.Add(new Categorylist()
                                                {
                                                    //SubjectName =DBNull.Value.Equals(dr["SubjectName"]) ? "" : dr["SubjectName"].ToString(),
                                                    // TestName =" ",
                                                    // AdminName =" ",

                                                    // TestId = Convert.ToInt32(dr["TestId"].ToString()),
                                                    // SubId = Convert.ToInt32(dr["SubjectId"].ToString()),//SubjectId
                                                    catid = Convert.ToInt32(dr["CatId"]),
                                                    CatName = DBNull.Value.Equals(dr["CatName"]) ? "" : dr["CatName"].ToString(),
                                                    TotalTest = Convert.ToInt32(dr["TotalTest"]),
                                                    TotalMcqs = Convert.ToInt32(dr["totalmcqs"]),
                                                    TotalSub = Convert.ToInt32(dr["TotalSubject"]),
                                                    CatDesc = DBNull.Value.Equals(dr["CatDesc"]) ? "" : dr["CatDesc"].ToString(),
                                                    CatPurpose = DBNull.Value.Equals(dr["CatPurpose"]) ? "" : dr["CatPurpose"].ToString(),
                                                    CatImg = DBNull.Value.Equals(dr["CatImg"]) ? "" : "http://www.freemcqs.com/CatImg/" + dr["CatImg"].ToString()

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

                        return homeinfo;

                    }


                }
            }
            catch (SqlException cs)
            {
                homeinfo.Add(new Categorylist()
               {
                   CatPurpose = "An error has occoured + " + cs.Message.ToString()
               });
                return homeinfo; //List<Categorylist>(false, new List<string> { "Error" });
            }
            finally
            {
            }

        }


        [System.Web.Services.WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void getSubjectList(int Catid)
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            this.Context.Response.ContentType = "application/json; charset=utf-8";
            this.Context.Response.Write(serializer.Serialize(new { subject = getSubjectListagainstCatid(Catid) }));
            return;
        }

        public static List<Subject> getSubjectListagainstCatid(int Catid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;


            Int32 AdminId = 132;
            if (HttpContext.Current.Session["AdminId"] != null)
            {

                AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            }
            else
            {
                AdminId = 0;
                // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            }
            // string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<Subject> homeinfo = new List<Subject>();
            //List<ddlLoadUsers> UsersInformation = new List<ddlLoadUsers>();  //create a reference of List<Property>.  
            DataSet ds;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("getSubjectListagainstCatid", con)) //GetCountryRecords is a Stored Procedure.  
                    {

                        cmd.CommandTimeout = 100 * 100000;
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlParameter parameter = cmd.Parameters.Add("@Catid", Catid);  //@count is Stored Procedure parameter and 
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
                                                homeinfo.Add(new Subject()
                                                {
                                                    SubjectName = DBNull.Value.Equals(dr["SubjectName"]) ? "" : dr["SubjectName"].ToString(),
                                                    SubjectObjective = DBNull.Value.Equals(dr["SubjectObjective"]) ? "" : dr["SubjectObjective"].ToString(),
                                                    SubjectTestChapters = DBNull.Value.Equals(dr["SubjectTestChapters"]) ? "" : dr["SubjectTestChapters"].ToString(),
                                                    SubjectImage = DBNull.Value.Equals(dr["SubjectImage"]) ? "" : dr["SubjectImage"].ToString(),
                                                    SubjectExplanation = DBNull.Value.Equals(dr["SubjectExplanation"]) ? "" : dr["SubjectExplanation"].ToString(),
                                                    SubjectReferenceBooks = DBNull.Value.Equals(dr["SubjectReferenceBooks"]) ? "" : dr["SubjectReferenceBooks"].ToString(),
                                                    TotalTest = DBNull.Value.Equals(dr["TotalTest"]) ? 0 : Convert.ToInt32(dr["TotalTest"]),
                                                    TotalMcqs = DBNull.Value.Equals(dr["TotalMcqs"]) ? 0 : Convert.ToInt32(dr["TotalMcqs"]),
                                                    SubId = DBNull.Value.Equals(dr["SubjectId"]) ? 0 : Convert.ToInt32(dr["SubjectId"]),
                                                    catid = DBNull.Value.Equals(dr["CatId"]) ? 0 : Convert.ToInt32(dr["CatId"]),
                                                    SubjectCode = DBNull.Value.Equals(dr["SubjectCode"]) ? "" : (dr["SubjectCode"].ToString())



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

                        return homeinfo;

                    }


                }
            }
            catch (SqlException cs)
            {
                return homeinfo;
                //return List<string>(false, new List<string> { "Error" });
            }
            finally
            {

            }

        }


        [System.Web.Services.WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void LoadHomePages(int subid)
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            this.Context.Response.ContentType = "application/json; charset=utf-8";
            this.Context.Response.Write(serializer.Serialize(new { test = LoadHomepage(subid) }));
            return;

        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void LoadMcqsQuestions(string TestId, int name, int pageIndex, int IsMultiple, string ClientTestInfo)
        {
            List<ShowMcqs> my = LoadMcqsQuestionAll(TestId, name, pageIndex, IsMultiple, ClientTestInfo);
            string n = "";
            if (name == 3)
            {
                n = i(my);

                //  System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                //this.Context.Response.ContentType = "application/json; charset=utf-8";
                // this.Context.Response.Write(serializer.Serialize(new { mcqs = n }));
                return;

            }
            else
            {
                System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                this.Context.Response.ContentType = "application/json; charset=utf-8";
                this.Context.Response.Write(serializer.Serialize(new { mcqs = my }));
                return;

            }


            // return LoadMcqsQuestionAll(TestId, name, pageIndex, IsMultiple, ClientTestInfo);
        }

        [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static List<ShowMcqs> LoadMcqsQuestionAll(string TestId, int name, int pageIndex, int IsMultiple, string ClientTestInfo)
        {
            //Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            //Int32 AdminId = 124;

            string sp_Name;
            if (name == 1)
            {
                sp_Name = "sp_For_HomePage_Mcqs_New";
            }
            else if (name == 3)
            {
                sp_Name = "sp_For_CreatePdf_test";
            }
            else
            {
                sp_Name = "sp_For_HomePage_Mcqs_New_Test";
            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            var deserializedResult = serializer.Deserialize<List<ClientTestInfo>>(ClientTestInfo);
            //var deserializedSec = serializer.Deserialize<List<ClientTestInfo>>(listSec);
            //MergeTestClass view = serializer.Deserialize<MergeTestClass>(listData);
            DataTable dt = new DataTable();
            // DataTable dt_Sec = new DataTable();
            //Add Columns
            dt.Columns.Add("TestId");
            dt.Columns.Add("McqsId");
            dt.Columns.Add("TotalQ");
            dt.Columns.Add("SecId");
            dt.Columns.Add("SecMergeTestId");



            //dt_Sec.Columns.Add("MergeTestSecName");
            //dt_Sec.Columns.Add("MergeTestSecDetail");
            //dt_Sec.Columns.Add("MergeTestSecTotalQuestions");
            //dt_Sec.Columns.Add("MergeTestSecPriority");

            //Add rows
            foreach (var i in deserializedResult)
            {
                dt.Rows.Add(i.TestId, i.McqsId, i.TotalQ, i.SecId, i.SecMergeTestId);
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
                    cmd.Parameters.AddWithValue("@isMultiple", IsMultiple);
                    SqlParameter tvparam = cmd.Parameters.AddWithValue("@List", dt);
                    tvparam.SqlDbType = SqlDbType.Structured;
                    cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
                    if (name == 3)
                    {
                        cmd.Parameters.AddWithValue("@PageSize", 1000);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@PageSize", 10);
                    }

                    cmd.Parameters.Add("@PageCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@retParam", SqlDbType.Int, 4).Direction = ParameterDirection.ReturnValue;
                    cmd.CommandTimeout = 100 * 1000;
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        //int retval = (int)cmd.Parameters["@retParam"].Value;

                        //  int outval = (int)cmd.Parameters["@PageCount"].Value;
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
                            int my;
                            while (dr.Read())
                            {
                                i++;
                                my = DBNull.Value.Equals(dr["TestId"]) ? 0 : Convert.ToInt32(dr["TestId"]);
                                string my2 = DBNull.Value.Equals(dr["Option1Text"]) ? "" : (dr["Option1Text"].ToString());
                                exptxt = "";
                                reftxt = "";
                                exp_check_staff_name = "";
                                op1 = DBNull.Value.Equals(dr["Option1"]) ? false : (bool)dr["Option1"];
                                op2 = DBNull.Value.Equals(dr["Option2"]) ? false : (bool)dr["Option2"];
                                op3 = DBNull.Value.Equals(dr["Option3"]) ? false : (bool)dr["Option3"];
                                op4 = DBNull.Value.Equals(dr["Option4"]) ? false : (bool)dr["Option4"];
                                op5 = DBNull.Value.Equals(dr["Option5"]) ? false : (bool)dr["Option5"];
                                op6 = DBNull.Value.Equals(dr["Option6"]) ? false : (bool)dr["Option6"];
                                op7 = DBNull.Value.Equals(dr["Option7"]) ? false : (bool)dr["Option7"];
                                op8 = DBNull.Value.Equals(dr["Option8"]) ? false : (bool)dr["Option8"];
                                if (name == 1)
                                {
                                    exp_check_staff_name = DBNull.Value.Equals(dr["exp_check_staff_name"]) ? "" : dr["exp_check_staff_name"].ToString();

                                    if (exp_check_staff_name != "")
                                    {
                                        exp_check_staff_name = DBNull.Value.Equals(dr["exp_check_staff_name"]) ? "" : HttpUtility.HtmlDecode(dr["exp_check_staff_name"].ToString());
                                        exp_check_staff_qual = DBNull.Value.Equals(dr["exp_check_staff_qual"]) ? "" : HttpUtility.HtmlDecode(dr["exp_check_staff_qual"].ToString());
                                        exp_check_staff_pic = DBNull.Value.Equals(dr["exp_check_staff_pic"]) ? "" : HttpUtility.HtmlDecode(dr["exp_check_staff_pic"].ToString());
                                        exp_check_staff_acc = (DBNull.Value.Equals(dr["exp_check_staff_acc"]) ? "" : HttpUtility.HtmlDecode(dr["exp_check_staff_acc"].ToString()));
                                        isExplained = 1;
                                    }
                                    else
                                    {
                                        exp_check_staff_name = "";
                                        exp_check_staff_qual = "";
                                        exp_check_staff_pic = "";
                                        exp_check_staff_acc = "";
                                        isExplained = 0;
                                    }
                                }
                                else
                                {
                                    exp_check_staff_name = "";
                                    exp_check_staff_qual = "";
                                    exp_check_staff_pic = "";
                                    exp_check_staff_acc = "";
                                    isExplained = 0;
                                }


                                if (op1 == true)
                                {
                                    Option1Text = DBNull.Value.Equals(dr["Option1Text"]) ? null : HttpUtility.HtmlDecode(dr["Option1Text"].ToString());
                                    Option1Correct = DBNull.Value.Equals(dr["Option1Correct"]) ? false : (bool)dr["Option1Correct"];
                                    op1id = DBNull.Value.Equals(dr["Option1Id"]) ? 0 : Convert.ToInt32(dr["Option1Id"]);
                                }
                                else
                                {
                                    Option1Text = null;
                                    Option1Correct = false;
                                    op1id = 0;
                                }
                                if (op2 == true)
                                {
                                    Option2Text = DBNull.Value.Equals(dr["Option2Text"]) ? null : HttpUtility.HtmlDecode(dr["Option2Text"].ToString());
                                    Option2Correct = DBNull.Value.Equals(dr["Option2Correct"]) ? false : (bool)dr["Option2Correct"];
                                    op2id = DBNull.Value.Equals(dr["Option2Id"]) ? 0 : Convert.ToInt32(dr["Option2Id"]);
                                }
                                else
                                {
                                    Option2Text = null;
                                    Option2Correct = false;
                                    op2id = 0;
                                }
                                if (op3 == true)
                                {
                                    Option3Text = DBNull.Value.Equals(dr["Option3Text"]) ? null : HttpUtility.HtmlDecode(dr["Option3Text"].ToString());
                                    Option3Correct = DBNull.Value.Equals(dr["Option3Correct"]) ? false : (bool)dr["Option3Correct"];
                                    op3id = DBNull.Value.Equals(dr["Option3Id"]) ? 0 : Convert.ToInt32(dr["Option3Id"]);
                                }
                                else
                                {
                                    Option3Text = null;
                                    Option3Correct = false;
                                    op3id = 0;
                                }
                                if (op4 == true)
                                {
                                    Option4Text = DBNull.Value.Equals(dr["Option4Text"]) ? null : HttpUtility.HtmlDecode(dr["Option4Text"].ToString());
                                    Option4Correct = DBNull.Value.Equals(dr["Option4Correct"]) ? false : (bool)dr["Option4Correct"];
                                    op4id = DBNull.Value.Equals(dr["Option4Id"]) ? 0 : Convert.ToInt32(dr["Option4Id"]);
                                }
                                else
                                {
                                    Option4Text = null;
                                    Option4Correct = false;
                                    op4id = 0;
                                }
                                if (op5 == true)
                                {
                                    Option5Text = DBNull.Value.Equals(dr["Option5Text"]) ? null : HttpUtility.HtmlDecode(dr["Option5Text"].ToString());
                                    Option5Correct = DBNull.Value.Equals(dr["Option5Correct"]) ? false : (bool)dr["Option5Correct"];
                                    op5id = DBNull.Value.Equals(dr["Option5Id"]) ? 0 : Convert.ToInt32(dr["Option5Id"]);
                                }
                                else
                                {
                                    Option5Text = null;
                                    Option5Correct = false;
                                    op5id = 0;
                                }
                                if (op6 == true)
                                {
                                    Option6Text = DBNull.Value.Equals(dr["Option6Text"]) ? null : HttpUtility.HtmlDecode(dr["Option6Text"].ToString());
                                    Option6Correct = DBNull.Value.Equals(dr["Option6Correct"]) ? false : (bool)dr["Option6Correct"];
                                    op6id = DBNull.Value.Equals(dr["Option6Id"]) ? 0 : Convert.ToInt32(dr["Option6Id"]);
                                }
                                else
                                {
                                    Option6Text = null;
                                    Option6Correct = false;
                                    op6id = 0;
                                }
                                if (op7 == true)
                                {
                                    Option7Text = DBNull.Value.Equals(dr["Option7Text"]) ? null : HttpUtility.HtmlDecode(dr["Option7Text"].ToString());
                                    Option7Correct = DBNull.Value.Equals(dr["Option7Correct"]) ? false : (bool)dr["Option7Correct"];
                                    op7id = DBNull.Value.Equals(dr["Option7Id"]) ? 0 : Convert.ToInt32(dr["Option7Id"]);
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
                                    Option8Text = DBNull.Value.Equals(dr["Option8Text"]) ? null : HttpUtility.HtmlDecode(dr["Option8Text"].ToString());
                                    Option8Correct = DBNull.Value.Equals(dr["Option8Correct"]) ? false : (bool)dr["Option8Correct"];
                                    op8id = DBNull.Value.Equals(dr["Option8Id"]) ? 0 : Convert.ToInt32(dr["Option8Id"]);
                                }
                                else
                                {
                                    Option8Text = null;
                                    Option8Correct = false;
                                    op8id = 0;
                                }
                                if (name == 1)
                                {
                                    if (dr["Exptext"] != "")
                                    {
                                        exptxt = DBNull.Value.Equals(dr["Exptext"]) ? "" : HttpUtility.HtmlDecode(dr["Exptext"].ToString());
                                    }
                                    else
                                    {
                                        exptxt = "";
                                    }
                                    if (dr["Reftext"] != "")
                                    {
                                        reftxt = DBNull.Value.Equals(dr["Reftext"]) ? "" : HttpUtility.HtmlDecode(dr["Reftext"].ToString());
                                    }
                                    else
                                    {
                                        reftxt = "";
                                    }
                                }
                                else
                                {
                                    exptxt = "";
                                    reftxt = "";
                                }

                                ShowMcqsInfo.Add(new ShowMcqs()
                                {
                                    QuestionText = DBNull.Value.Equals(dr["QuestionText"]) ? "" : HttpUtility.HtmlDecode(dr["QuestionText"].ToString()),
                                    Points = DBNull.Value.Equals(dr["Points"]) ? 1 : Convert.ToInt32(dr["Points"]),
                                    TestId = DBNull.Value.Equals(dr["TestId"]) ? 0 : Convert.ToInt32(dr["TestId"]),
                                    SecId = DBNull.Value.Equals(dr["SecId"]) ? 0 : Convert.ToInt32(dr["SecId"]),
                                    SecMergeTestId = DBNull.Value.Equals(dr["SecMergeTestId"]) ? 0 : Convert.ToInt32(dr["SecMergeTestId"]),
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
                                    SubjectName = DBNull.Value.Equals(dr["SubjectName"]) ? "" : HttpUtility.HtmlDecode(dr["SubjectName"].ToString()),
                                    TestName = DBNull.Value.Equals(dr["TestName"]) ? "" : HttpUtility.HtmlDecode(dr["TestName"].ToString()),
                                    McqsQuestionId = DBNull.Value.Equals(dr["McqsQuestionInformationId"]) ? 0 : Convert.ToInt32(dr["McqsQuestionInformationId"]),
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
                                    isExplained = isExplained,
                                    edate = DBNull.Value.Equals(dr["edate"]) ? "" : dr["edate"].ToString()

                                    //pagecount = Convert.ToInt32(dr["PageCount"])

                                    //  McqsQuestionId = Convert.ToInt32(dr["McqsQuestionInformationId"].ToString())
                                });
                                if (i == 101)
                                {
                                    break;
                                }
                            }
                        }

                    }

                    int v = DBNull.Value.Equals(cmd.Parameters["@PageCount"].Value) ? 0 : Convert.ToInt32(cmd.Parameters["@PageCount"].Value);
                    //ShowMcqs m = new ShowMcqs();
                    //m.pagecount = v;
                    ShowMcqsInfo.Add(new ShowMcqs() { pagecount = v });
                    //ShowMcqsInfo.Concat(IEnumerable<ShowMcqs>)
                    return ShowMcqsInfo;
                }
            }
        }

        [System.Web.Services.WebMethod(EnableSession = false)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<SaveGetResult> SaveGetResult(string Name, int TotScore, int obtainSc, int Percentage, int NegativeScore, int TestId)
        {
            // HiddenField AdminId = ""; //(Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            //  string id = dadminid;
            //string converted = //Decrypt(id);
            HttpContext.Current.Server.ScriptTimeout = 90000;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<SaveGetResult> SaveGetResult = new List<SaveGetResult>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SaveGetResult", con)) //GetCountryRecords is a Stored Procedure.  
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter parameter = cmd.Parameters.Add("@Name", Name);  //@count is Stored Procedure parameter  
                    SqlParameter parameter1 = cmd.Parameters.Add("@TotScore", TotScore);  //@count is Stored Procedure parameter  
                    SqlParameter parameter2 = cmd.Parameters.Add("@obtainSc", obtainSc);  //@count is Stored Procedure parameter  
                    SqlParameter parameter3 = cmd.Parameters.Add("@Percentage", Percentage);  //@count is Stored Procedure parameter  
                    SqlParameter parameter4 = cmd.Parameters.Add("@NegativeScore", NegativeScore);  //@count is Stored Procedure parameter  
                    SqlParameter parameter5 = cmd.Parameters.Add("@TestId", TestId);  //@count is Stored Procedure parameter  
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
                                            SaveGetResult.Add(new SaveGetResult()
                                            {
                                                Name = DBNull.Value.Equals(dr["Name"]) ? "" : dr["Name"].ToString(),
                                                TestId = DBNull.Value.Equals(dr["TestId"]) ? 0 : Convert.ToInt32(dr["TestId"]),
                                                TotScore = DBNull.Value.Equals(dr["TotalMarks"]) ? 0 : Convert.ToInt32(dr["TotalMarks"]),
                                                ObtainSc = DBNull.Value.Equals(dr["ObtainMarks"]) ? 0 : Convert.ToInt32(dr["ObtainMarks"]),
                                                Percent = DBNull.Value.Equals(dr["Percentage"]) ? 0 : Convert.ToInt32(dr["Percentage"]),
                                                NegativeMarks = DBNull.Value.Equals(dr["negativeMarks"]) ? 0 : Convert.ToInt32(dr["negativeMarks"]),
                                                Percentile = DBNull.Value.Equals(dr["per_rank"]) ? 0 : Convert.ToInt32(dr["per_rank"])
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
                    return SaveGetResult;
                }
            }
        }

        public static List<Test> LoadHomepage(int subid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // Int32 AdminId = 124;
            // string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<Test> homeinfo = new List<Test>();
            //List<ddlLoadUsers> UsersInformation = new List<ddlLoadUsers>();  //create a reference of List<Property>.  
            DataSet ds;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("HomePageTable_webservice", con)) //GetCountryRecords is a Stored Procedure.  
                    {

                        cmd.CommandTimeout = 100 * 100000;
                        con.Open();
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlParameter parameter = cmd.Parameters.Add("@subid", subid);  //@count is Stored Procedure parameter and 
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
                                                homeinfo.Add(new Test()
                                                {
                                                    Testid = DBNull.Value.Equals(dr["TestId"]) ? 0 : Convert.ToInt32(dr["TestId"]),
                                                    TestName = DBNull.Value.Equals(dr["TestName"]) ? "" : dr["TestName"].ToString(),
                                                    TestDesc = DBNull.Value.Equals(dr["TestDescription"]) ? "" : dr["TestDescription"].ToString(),
                                                    TestImage = DBNull.Value.Equals(dr["TestImage"]) ? "" : dr["TestImage"].ToString(),
                                                    TestPassingPercentage = DBNull.Value.Equals(dr["TestPassingPercentage"]) ? 50 : Convert.ToInt32(dr["TestPassingPercentage"]),
                                                    TestInstructions = DBNull.Value.Equals(dr["TestInstructions"]) ? "" : dr["TestInstructions"].ToString(),
                                                    TestAttempts = DBNull.Value.Equals(dr["TestAttempts"]) ? 0 : Convert.ToInt32(dr["TestAttempts"]),
                                                    Ismultiple = DBNull.Value.Equals(dr["Ismultiple"]) ? 0 : Convert.ToInt32(dr["Ismultiple"]),
                                                    TestTotalQuestions = DBNull.Value.Equals(dr["TestTotalQuestions"]) ? 0 : Convert.ToInt32(dr["TestTotalQuestions"]),
                                                    IsNegativeMarks = DBNull.Value.Equals(dr["isNegativeMarks"]) ? 0 : Convert.ToInt32(dr["isNegativeMarks"]),
                                                    SpecMarks = DBNull.Value.Equals(dr["SpecMarks"]) ? 0 : Convert.ToInt32(dr["SpecMarks"]),
                                                    TestType = DBNull.Value.Equals(dr["TestType"]) ? 0 : Convert.ToInt32(dr["TestType"]),
                                                    Totalmcqs = DBNull.Value.Equals(dr["TotalMcqs"]) ? 0 : Convert.ToInt32(dr["TotalMcqs"])

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
                        return homeinfo;

                    }


                }
            }
            catch (SqlException cs)
            {
                return homeinfo;
                //return List<string>(false, new List<string> { "Error" });
            }
            finally
            {

            }

        }

        public string i(List<ShowMcqs> data)
        {

            iTextSharp.text.Rectangle rec = new iTextSharp.text.Rectangle(PageSize.A4);
            // Page Size with Margins
            Document doc = new Document(rec, 36, 36, 36, 36);
            string path = Server.MapPath("/pdfs");
            string filename = path + "/Doc1"+DateTime.Now.Ticks.ToString()+".pdf";
            var output = new FileStream(filename, FileMode.Create);
           
            
            string watermark = "www.freemcqs.com";
            // Saving File Path
           // PdfWriter writer = PdfWriter.GetInstance(doc, output);
            PdfWriter writer = PdfWriter.GetInstance(doc, output);
            PdfWriterEvents writerEvent = new PdfWriterEvents(watermark);
            writer.PageEvent = writerEvent;
            doc.Open();
            doc.AddHeader("Header Text", "Hello I am Header");
            Font Heading = FontFactory.GetFont(FontFactory.HELVETICA, 16, Font.BOLDITALIC);
            Font titleFont = FontFactory.GetFont("Arial", 18);
            Font regularFont = FontFactory.GetFont("Arial", 8);
            Font regularFont_question = FontFactory.GetFont("Arial", 9);
            Font boldFont = FontFactory.GetFont("Arial", 8, Font.BOLD);
            Font titleFont_u = FontFactory.GetFont("Arial", 16, Font.UNDERLINE);
            Font footerFont = FontFactory.GetFont("Arial", 12);
            Paragraph title;
            Paragraph text;

            PdfPTable table = new PdfPTable(4);
            PdfPTable tblinfo = new PdfPTable(4);
            PdfPTable tbl_footer = new PdfPTable(4);

            tblinfo.TotalWidth = 550f;
            table.TotalWidth = 550f;
            tbl_footer.TotalWidth = 550f;
            //fix the absolute width of the table
            table.LockedWidth = true;
            //relative col widths in proportions - 1/3 and 2/3
            float[] widths = new float[] { 1f, 19f, 1f, 1f };
            float[] widths1 = new float[] { 5f, 5f, 5f, 7f };
            table.SetWidths(widths);
            tblinfo.SetWidths(widths1);
            tbl_footer.SetWidths(widths1);
            table.HorizontalAlignment = 0;
            tblinfo.HorizontalAlignment = 0;
            tbl_footer.HorizontalAlignment = 0;

            //leave a gap before and after the table
            table.SpacingBefore = 1f;
            table.SpacingAfter = 1f;
            tblinfo.SpacingBefore = 1f;
            tblinfo.SpacingAfter = 1f;
            tbl_footer.SpacingBefore = 1f;
            tbl_footer.SpacingAfter = 1f;
            //PdfPCell cell = new PdfPCell(new Phrase(""));
            //cell.Colspan = 3;
            //cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
            //table.AddCell(cell);
            PdfPCell cell = new PdfPCell(new Phrase("Question No.", regularFont));
            //cell.FixedHeight = 1f;



            title = new Paragraph("Freemcqs.com Helping Material, | " + DateTime.Now.ToString("dd-MMM-yyyy") + " | Freemcqs.com", titleFont_u);
            title.Alignment = Element.ALIGN_CENTER;
            
            doc.Add(title);

            //text = new Paragraph("Result Card No: "+"1234567",regularFont);
            //doc.Add(text);

            PdfPCell infocell = new PdfPCell(new Phrase("", titleFont));
            infocell.Colspan = 4;
            infocell.HorizontalAlignment = 1;
            infocell.PaddingLeft = 69f;
            infocell.Border = 0;
            infocell.FixedHeight = 24f;
           // infocell.PaddingBottom = 15f;

            tblinfo.AddCell(infocell);
            //infocell.HorizontalAlignment = 0;
            //infocell.PaddingLeft = 0f;

            //infocell = new PdfPCell(new Phrase("", regularFont));
            //infocell.Colspan = 2;
            //tblinfo.AddCell(infocell);
            int getmarks = 0;
            int totalmarks = 0;
            int serialno = 0;
            int head = 0;
            int attempted = 0;
            int totalq = data.Count;
            int totaluserattempt = data.AsEnumerable().Sum(o => o.IsuserAttempt);
            int obmarks = data.AsEnumerable().Sum(o => o.Isusercorrect);
            decimal percentage = ((decimal)obmarks / (decimal)totalq) * 100;
            float perc = float.Parse(Math.Round(percentage, 2).ToString());
            //string status = "";
            //if (perc >= 40)
            //{
            //    status = "PASSED";
            //}
            //else
            //{
            //    status = "FAILED---- What do you want? limit your Challenges? or Challenge you limits.";
            //}
            //string Remarks = "";

            //if (perc > 90)
            //{
            //    Remarks = "Outstanding of Marks--Exceptional";
            //}
            //else if (perc > 80)
            //{
            //    Remarks = "Excellent";
            //}
            //else if (perc > 70)
            //{
            //    Remarks = "Very Good";
            //}
            //else if (perc > 60)
            //{
            //    Remarks = "Good";
            //}
            //else if (perc > 50)
            //{
            //    Remarks = "Fair";
            //}
            //else if (perc > 40)
            //{
            //    Remarks = "Satisfactory";
            //}
            //else if (perc < 40)
            //{
            //    Remarks = "Poor";
            //}
            //string 
            iTextSharp.text.html.simpleparser.StyleSheet styles = new iTextSharp.text.html.simpleparser.StyleSheet();
            styles.LoadTagStyle("p", "color", "Blue");
            styles.LoadTagStyle("body", "color", "Blue");
           // styles.LoadTagStyle("p", "size", 40 + "px");
            styles.LoadTagStyle("p", "font-weight", "bold"); 
            iTextSharp.text.html.simpleparser.StyleSheet stylesOption = new iTextSharp.text.html.simpleparser.StyleSheet();
            stylesOption.LoadTagStyle("p", "color", "black");
            //styles.LoadTagStyle("p", "size", 16 + "px");
           // styles.LoadTagStyle("p", "font-weight", "200");
            foreach (ShowMcqs prop in data)
            {
                attempted = attempted + prop.IsuserAttempt;
                string myattempt = attempted.ToString();
                if (head == 0)
                {


                    //infocell = new PdfPCell(new Phrase("Candidate Name: ", regularFont));
                    //infocell.Colspan = 1;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);
                    //infocell = new PdfPCell(new Phrase("Anonymous", boldFont));
                    //infocell.Colspan = 3;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase("Subject: ", regularFont));
                    infocell.Colspan = 1;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase(prop.SubjectName, boldFont));
                    infocell.Colspan = 3;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);

                    //doc.Add(new Paragraph(prop.SubjectName));
                    //doc.Add(new Paragraph("Test: " + prop.TestName));
                    //doc.Add(new Paragraph("Total Questions: " + data.Count.ToString()));

                    infocell = new PdfPCell(new Phrase("Test: ", regularFont));
                    infocell.Colspan = 1;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase(prop.TestName, boldFont));
                    infocell.Colspan = 3;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);

                    //iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(Server.MapPath("../All_Images/NoImage.gif"));
                    //jpg.ScaleToFit(350f, 350f);
                    //jpg.Border = iTextSharp.text.Rectangle.BOX;
                    //jpg.BorderColor = iTextSharp.text.BaseColor.BLACK;
                    //jpg.BorderWidth = 1f;
                    // doc.Add(jpg);
                    //doc.Add(new Paragraph("Original Width: " + jpg.Width.ToString()));
                    //doc.Add(new Paragraph("Original Height " + jpg.Height.ToString()));
                    //doc.Add(new Paragraph("Scaled Width: " + jpg.ScaledWidth.ToString()));
                    //doc.Add(new Paragraph("Scaled Height " + jpg.ScaledHeight.ToString()));
                    //float Resolution = jpg.Width / jpg.ScaledWidth * 72f;
                    //doc.Add(new Paragraph("Resolution: " + Resolution));

                    // infocell = new PdfPCell(jpg);
                   // infocell.Colspan = 4;
                  //  infocell.Border = 0;
                    //infocell.EnableBorderSide(4);
                    // infocell.Width = 10f;
                   // infocell.PaddingTop = -30;
                  //  infocell.FixedHeight = 10f;
                    infocell.PaddingLeft = 105f;
                    infocell.HorizontalAlignment = 1;
                      //tblinfo.AddCell(infocell);



                    infocell = new PdfPCell(new Phrase("Total Questions: ", regularFont));
                    infocell.Colspan = 1;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase(data.Count.ToString(), boldFont));
                    infocell.Colspan = 3;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);

                    //infocell = new PdfPCell(new Phrase("Attempted Questions: ", regularFont));
                    //infocell.Colspan = 1;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);


                    //infocell = new PdfPCell(new Phrase(totaluserattempt.ToString(), boldFont));
                    //infocell.Colspan = 3;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);

                    //infocell = new PdfPCell(new Phrase("Total Marks: ", regularFont));
                    //infocell.Colspan = 1;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);
                    //infocell = new PdfPCell(new Phrase(data.Count.ToString(), boldFont));
                    //infocell.Colspan = 3;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);

                    //infocell = new PdfPCell(new Phrase("Obtained Marks: ", regularFont));
                    //infocell.Colspan = 1;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);
                    //infocell = new PdfPCell(new Phrase(obmarks.ToString(), boldFont));
                    //infocell.Colspan = 3;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);

                    //infocell = new PdfPCell(new Phrase("Percentage: ", regularFont));
                    //infocell.Colspan = 1;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);
                    //infocell = new PdfPCell(new Phrase(perc.ToString() + "%", boldFont));
                    //infocell.Colspan = 3;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);

                    //infocell = new PdfPCell(new Phrase("Status: ", regularFont));
                    //infocell.Colspan = 1;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);
                    //infocell = new PdfPCell(new Phrase(status, boldFont));
                    //infocell.Colspan = 3;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);

                    //infocell = new PdfPCell(new Phrase("Remarks: ", regularFont));
                    //infocell.Colspan = 1;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);
                    //infocell = new PdfPCell(new Phrase(Remarks, boldFont));
                    //infocell.Colspan = 3;
                    //infocell.Border = 0;
                    //tblinfo.AddCell(infocell);
                    doc.Add(tblinfo);
                    // text = new Paragraph("Details", regularFont);

                    // doc.Add(text);

                    cell.Colspan = 1;
                    cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                    table.AddCell(cell);
                    cell = new PdfPCell(new Phrase("Question Details", titleFont_u));
                    cell.Colspan = 2;
                    cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                    cell.VerticalAlignment = 1;
                    table.AddCell(cell);
                    cell = new PdfPCell(new Phrase("Total Marks", regularFont));
                    cell.Colspan = 1;
                    cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                    table.AddCell(cell);
                    //cell = new PdfPCell(new Phrase("Obtained Marks", regularFont));
                    //cell.Colspan = 1;
                    //cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                    //table.AddCell(cell);

                }
                ++head;
                cell = new PdfPCell(new Phrase((++serialno).ToString(), regularFont));
                cell.FixedHeight = 1f;

                cell.Colspan = 1;
                cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                table.AddCell(cell);

                PdfPTable Qtable = new PdfPTable(4);
                float[] Qwidths = new float[] { 1f, 5f, 5f, 7f};
                Qtable.SetWidths(Qwidths);
                PdfPCell qcell = new PdfPCell();
                qcell.Border = 0;
                qcell.PaddingBottom = 5;
                
                if (prop.QuestionText != null)
                {
                    //List<string> list = new List<string>();
                    //Regex urlRx = new
                    //Regex(@"(http|ftp|https)://([\w+?\.\w+])+([a-zA-Z0-9\~\!\@\#\$\%\^\&\*\(\)_\-\=\+\\\/\?\.\:\;\'\,]*)?",
                    //RegexOptions.IgnoreCase);

                    //MatchCollection matches = urlRx.Matches(prop.QuestionText);
                    //foreach (Match match in matches)
                    //{
                    //    list.Add(match.Value);
                    //}
                    //list;

                    var htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(prop.QuestionText.Trim('"')), styles);
                    //  var htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(prop.QuestionText), styles);
                    for (int k = 0; k < htmlarraylist.Count; k++)
                    {
                        var ele = (IElement)htmlarraylist[k];
                        qcell.AddElement(ele);
                    }
                    //var ele = (IElement)htmlarraylist;
                    //  qcell.AddElement(ele);
                    // qcell.AddElement(htmlarraylist)
                    //qcell = new PdfPCell(new HtmlString(htmlarraylist));
                }
                else
                {
                    qcell = new PdfPCell(new Paragraph("No Question Found", regularFont_question));
                }

                qcell.Colspan =4;
                qcell.Border = 0;
                Qtable.AddCell(qcell);

                // qcell.BorderColor = iTextSharp.text.BaseColor.LIGHT_GRAY;


                qcell = new PdfPCell();
                if (prop.Option1Correct == true)
                {
                    string imagepath = Server.MapPath("acme-free/img");
                    Image image = Image.GetInstance(imagepath + "/check.png");
                    image.ScaleToFit(250f, 20f);
                    
                    qcell.AddElement(image);
                }
                else
                {
                    string imagepath = Server.MapPath("acme-free/img");
                    Image image = Image.GetInstance(imagepath + "/emptycheckbox.png");
                    image.ScaleToFit(250f, 20f);
                    //qcell = new PdfPCell();
                    qcell.AddElement(image);
                    //  qcell = new PdfPCell(new Paragraph("Option 1", regularFont));
                }
                qcell.Colspan = 1;
                qcell.HorizontalAlignment = 0;
                //qcell.BorderColor = iTextSharp.text.BaseColor.LIGHT_GRAY;
                Qtable.AddCell(qcell);
                qcell = new PdfPCell();
                if (prop.Option1Text != null)
                {
                    var htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(prop.Option1Text.Trim('"')), stylesOption);
                    //  var htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(prop.QuestionText), styles);
                    for (int k = 0; k < htmlarraylist.Count; k++)
                    {
                        var ele = (IElement)htmlarraylist[k];
                        qcell.AddElement(ele);
                    }
                    //qcell = new PdfPCell(new Paragraph(Regex.Replace(prop.Option1Text, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim(), regularFont));
                }
                else
                {
                    qcell = new PdfPCell(new Paragraph("No option found!", regularFont));
                }

                qcell.Colspan = 3;
                Qtable.AddCell(qcell);

                if (prop.Option2Correct == true)
                {
                    string imagepath = Server.MapPath("acme-free/img");
                    Image image = Image.GetInstance(imagepath + "/check.png");
                    image.ScaleToFit(250f, 20f);
                    qcell = new PdfPCell();
                    qcell.AddElement(image);
                }
                else
                {
                    string imagepath = Server.MapPath("acme-free/img");
                    Image image = Image.GetInstance(imagepath + "/emptycheckbox.png");
                    image.ScaleToFit(250f, 20f);
                    qcell = new PdfPCell();
                    qcell.AddElement(image);
                    //  qcell = new PdfPCell(new Paragraph("Option 1", regularFont));
                }
                qcell.Colspan = 1;
                qcell.HorizontalAlignment = 0;
                //qcell.BorderColor = iTextSharp.text.BaseColor.LIGHT_GRAY;
                Qtable.AddCell(qcell);
                qcell = new PdfPCell();
                // qcell.BorderColor = iTextSharp.text.BaseColor.LIGHT_GRAY;
                // Qtable.AddCell(qcell);

                if (prop.Option2Text != null)
                {
                    var htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(prop.Option2Text.Trim('"')), stylesOption);
                    //  var htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(prop.QuestionText), styles);
                    for (int k = 0; k < htmlarraylist.Count; k++)
                    {
                        var ele = (IElement)htmlarraylist[k];
                        qcell.AddElement(ele);
                    }
                    //  qcell = new PdfPCell(new Paragraph(Regex.Replace(prop.Option2Text, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim(), regularFont));
                }
                else
                {
                    qcell = new PdfPCell(new Paragraph("No option found!", regularFont));
                }


                qcell.Colspan = 3;
                Qtable.AddCell(qcell);

                if (prop.Option3Correct == true)
                {
                    string imagepath = Server.MapPath("acme-free/img");
                    Image image = Image.GetInstance(imagepath + "/check.png");
                    image.ScaleToFit(250f, 20f);
                    qcell = new PdfPCell();
                    qcell.AddElement(image);
                }
                else
                {
                    string imagepath = Server.MapPath("acme-free/img");
                    Image image = Image.GetInstance(imagepath + "/emptycheckbox.png");
                    image.ScaleToFit(250f, 20f);
                    qcell = new PdfPCell();
                    qcell.AddElement(image);
                    //  qcell = new PdfPCell(new Paragraph("Option 1", regularFont));
                }
                qcell.Colspan = 1;
                qcell.HorizontalAlignment = 0;
                //qcell.BorderColor = iTextSharp.text.BaseColor.LIGHT_GRAY;
                Qtable.AddCell(qcell);
                qcell = new PdfPCell();
                if (prop.op3 == true)
                {
                    //qcell = new PdfPCell(new Paragraph("Option 3", regularFont));
                    //qcell.Colspan = 1;
                    //qcell.HorizontalAlignment = 1;
                    //Qtable.AddCell(qcell);

                    if (prop.Option3Text != null)
                    {

                        var htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(prop.Option3Text.Trim('"')), stylesOption);
                        //  var htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(prop.QuestionText), styles);
                        for (int k = 0; k < htmlarraylist.Count; k++)
                        {
                            var ele = (IElement)htmlarraylist[k];
                            qcell.AddElement(ele);
                        }
                        // qcell = new PdfPCell(new Paragraph(Regex.Replace(prop.Option3Text, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim(), regularFont));
                    }
                    else
                    {
                        qcell = new PdfPCell(new Paragraph("", regularFont));
                    }

                    qcell.Colspan = 3;
                    Qtable.AddCell(qcell);

                }
                if (prop.Option4Correct == true)
                {
                    string imagepath = Server.MapPath("acme-free/img");
                    Image image = Image.GetInstance(imagepath + "/check.png");
                    image.ScaleToFit(250f, 20f);
                    qcell = new PdfPCell();
                    qcell.AddElement(image);
                }
                else
                {
                    string imagepath = Server.MapPath("acme-free/img");
                    Image image = Image.GetInstance(imagepath + "/emptycheckbox.png");
                    image.ScaleToFit(250f, 20f);
                    qcell = new PdfPCell();
                    qcell.AddElement(image);
                    //  qcell = new PdfPCell(new Paragraph("Option 1", regularFont));
                }
                qcell.Colspan = 1;
                qcell.HorizontalAlignment = 0;
                //qcell.BorderColor = iTextSharp.text.BaseColor.LIGHT_GRAY;
                Qtable.AddCell(qcell);
                qcell = new PdfPCell();
                if (prop.op4 == true)
                {
                    //qcell = new PdfPCell(new Paragraph("Option 4", regularFont));
                    //qcell.Colspan = 1;
                    //qcell.HorizontalAlignment = 1;
                    //Qtable.AddCell(qcell);
                    if (prop.Option4Text != null)
                    {
                        var htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(prop.Option4Text.Trim('"')), stylesOption);
                        //  var htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(prop.QuestionText), styles);
                        for (int k = 0; k < htmlarraylist.Count; k++)
                        {
                            var ele = (IElement)htmlarraylist[k];
                            qcell.AddElement(ele);
                        }
                        // qcell = new PdfPCell(new Paragraph(Regex.Replace(prop.Option4Text, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim(), regularFont));
                    }
                    else
                    {
                        qcell = new PdfPCell(new Paragraph("", regularFont));
                    }
                    qcell.Colspan = 3;

                    Qtable.AddCell(qcell);
                }
                
                int isuserco = prop.Points;
               
                if (prop.SpecMarks != null)
                {
                    isuserco = prop.SpecMarks;
                }
                if (isuserco == null || isuserco == 0)
                {
                    isuserco = 1;
                }

                //if (correctop == prop.userselectedoption)
                //{
                //    ++getmarks;
                //    isuserco = 1;
                //    totalmarks = totalmarks + 1;
                //}
                // cell = new PdfPCell(Question + Environment.NewLine + option1 + Environment.NewLine + option2 + Environment.NewLine + "3." + Environment.NewLine + "4. " + Environment.NewLine + "User Selected Option: " + "" + Environment.NewLine + "Correct Option: " + "");
                cell = new PdfPCell(Qtable);
                cell.Colspan = 2;
                cell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
                table.AddCell(cell);
                //cell = new PdfPCell(new Phrase("1", regularFont));
                //cell.Colspan = 1;
                //cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                //table.AddCell(cell);
                if (isuserco != null)
                {
                    cell = new PdfPCell(new Phrase(isuserco.ToString(), regularFont));
                }
                else
                {
                    cell = new PdfPCell(new Phrase("", regularFont));
                }

                cell.Colspan = 1;
                cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                table.AddCell(cell);
            }
            //iTextSharp.text.Font gnrFont = new Font();

            //table.AddCell("Col 1 Row 1");
            //table.AddCell("Col 2 Row 1");
            //table.AddCell("Col 3 Row 1");
            //table.AddCell("Col 1 Row 2");
            //table.AddCell("Col 2 Row 2");
            //table.AddCell("Col 3 Row 2");

            doc.Add(table);



            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);


            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Signature:", boldFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("___________________", regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;


            tbl_footer.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("Proprietary license by Freemcqs.com Inc. ", footerFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("More Information at http://Freemcqs.com", footerFont));
            infocell.Colspan = 4;
            infocell.Border = 0;
            tbl_footer.AddCell(infocell);

            //0=Left, 1=Centre, 2=Right
            doc.Add(tbl_footer);
            //text = new Paragraph(new Phrase("Candidate Signature" + Environment.NewLine + " ____________________", fontNormal));
            //text.Alignment = 2;
            ////0=Left, 1=Centre, 2=Right
            //doc.Add(text);
           // Watermark watermark = new Watermark(Image.getInstance("watermark.jpg"), 200, 420);
            //doc.Add(watermark);
            doc.Close();
            ShowPdf(filename);
            return filename;

        }

        public void createpdf()
        {
            List<ShowMcqs> exampleList = new List<ShowMcqs>();
            exampleList = HttpContext.Current.Session["data"] as List<ShowMcqs>;
            i(exampleList);
        }

        public void ShowPdf(string filename)
        {
            //Clears all content output from Buffer Stream

            HttpContext.Current.Response.ClearContent();
            ////Clears all headers from Buffer Stream
            HttpContext.Current.Response.ClearHeaders();
            ////Adds an HTTP header to the output stream
            HttpContext.Current.Response.AddHeader("Content-Disposition", "inline;filename=" + filename);
            ////Gets or Sets the HTTP MIME type of the output stream
            HttpContext.Current.Response.ContentType = "application/pdf";
            ////Writes the content of the specified file directory to an HTTP response output stream as a file block
            HttpContext.Current.Response.WriteFile(filename);
            ////sends all currently buffered output to the client
            HttpContext.Current.Response.Flush();
            ////Clears all content output from Buffer Stream
            HttpContext.Current.Response.Clear();
        }

         class PdfWriterEvents : IPdfPageEvent
    {
        string watermarkText = string.Empty;

        public PdfWriterEvents(string watermark) 
        {
            watermarkText = watermark;
        }

        public void OnOpenDocument(PdfWriter writer, Document document) { }
        public void OnCloseDocument(PdfWriter writer, Document document) { }
        public void OnStartPage(PdfWriter writer, Document document) {
            float fontSize = 80;
            float xPosition = 300;
            float yPosition = 400;
            float angle = 45;
            try
            {
                PdfContentByte under = writer.DirectContentUnder;
                BaseFont baseFont = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.WINANSI, BaseFont.EMBEDDED);
                under.BeginText();
                under.SetColorFill(BaseColor.LIGHT_GRAY);
                under.SetFontAndSize(baseFont, fontSize);
                under.ShowTextAligned(PdfContentByte.ALIGN_CENTER, watermarkText, xPosition, yPosition, angle);
                under.EndText();
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
            }
        }
        public void OnEndPage(PdfWriter writer, Document document) { }
        public void OnParagraph(PdfWriter writer, Document document, float paragraphPosition) { }
        public void OnParagraphEnd(PdfWriter writer, Document document, float paragraphPosition) { }
        public void OnChapter(PdfWriter writer, Document document, float paragraphPosition, Paragraph title) { }
        public void OnChapterEnd(PdfWriter writer, Document document, float paragraphPosition) { }
        public void OnSection(PdfWriter writer, Document document, float paragraphPosition, int depth, Paragraph title) { }
        public void OnSectionEnd(PdfWriter writer, Document document, float paragraphPosition) { }
        public void OnGenericTag(PdfWriter writer, Document document, Rectangle rect, String text) { }

    }
}
    }

