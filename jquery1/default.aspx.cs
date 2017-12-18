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
using System.Security.Cryptography;
using System.IO;
using System.Web.Script.Services;
using System.Drawing;
using TheArtOfDev.HtmlRenderer.WinForms;
using System.Drawing.Imaging;

using System.Collections.Specialized;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp;
using System.ComponentModel;
using System.Collections;
using System.Web.Script.Serialization;



namespace jquery1
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string imagedata = "R0lGODlhAQABAIAAAAAAAAAAACH5BAAAAAAALAAAAAABAAEAAAICTAEAOw";
            Response.Cache.SetCacheability(HttpCacheability.Public);
            Response.Cache.SetMaxAge(new TimeSpan(500, 0, 0));
            // if (!IsPostBack) 
            //{
            //    string[] url_new = HttpContext.Current.Request.Url.AbsolutePath.Split('/');
              
            //    var nameValues = HttpUtility.ParseQueryString(Request.QueryString.ToString());
            //   // nameValues.Set("TestId", "1262");
            //    var url = Request.Url.AbsolutePath;

            ////    Response.Redirect(url + "?" + nameValues);
            //    if (Request.QueryString["TestId"] == "" || Request.QueryString["TestId"] == null)
            //    {
            //         nameValues = HttpUtility.ParseQueryString(Request.QueryString.ToString());
            //        //nameValues.Set("TestId", "1262");
            //        url = Request.Url.AbsolutePath;
            //        var str = "Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/{SubjectName}/{TestName}";

            //        //Response.Redirect("YOUR_PAGE_HERE");
            //    }
               
            //}
            //if (!this.IsPostBack)
            //{
            //    HttpContext.Current.Session["AdminId"] = testid;
            //}
           
           // UploadPic(imagedata, "Test Name  ANATOMY-Nervous System");
        }

        public static NameValueCollection GetQueryStringCollection(string url)
        {
            string keyValue = string.Empty;
            NameValueCollection collection = new NameValueCollection();
            string[] querystrings = url.Split('&');
            if (querystrings != null && querystrings.Count() > 0)
            {
                for (int i = 0; i < querystrings.Count(); i++)
                {
                    string[] pair = querystrings[i].Split('=');
                    collection.Add(pair[0].Trim('?'), pair[1]);
                }
            }
            return collection;
        }
        public static string base64Decode(string data)
        {
            byte[] binary = Convert.FromBase64String(data);
            return Encoding.Default.GetString(binary);
        }
        
        [System.Web.Services.WebMethod]
        public static string UploadPic(string imageData, string TestName)
        {
            //string base64coll = "";
            //NameValueCollection collection = GetQueryStringCollection(HttpContext.Current.Request.UrlReferrer.Query);
            //if (collection != null && collection.Count > 0)
            //{
            //    base64coll = HttpContext.Current.Server.UrlDecode(collection["base64"]);
            //}  

           string validTestName =  TestName.Remove(0, 11);
          // string validImagedate = imageData.Remove(0, 22);
           validTestName = validTestName.Replace(" ", "_");


           Int64 datetimeticks = DateTime.Now.Ticks;
           DateTime formatdate = new DateTime(datetimeticks);
           string pic_Name = validTestName + formatdate.ToString("dd-M-yyyy-HH-mm-ss") + ".png";
            string combinepath = Path.Combine("~/Facebook/", pic_Name);
            string Pic_Path = HttpContext.Current.Server.MapPath(combinepath);



            using (var imageFile = new FileStream(Pic_Path, FileMode.Create))
            {
                byte[] data = Convert.FromBase64String(imageData);
                imageFile.Write(data, 0, data.Length);
                
                imageFile.Flush();
            }
            //using (FileStream fs = new FileStream(Pic_Path, FileMode.Create))
            //{
            //    using (BinaryWriter bw = new BinaryWriter(fs))
            //    {

                    
            //        byte[] data = Convert.FromBase64String(imageData);
            //        System.Drawing.Image image;
            //        using (MemoryStream ms = new MemoryStream(data))
            //        {
            //            image = System.Drawing.Image.FromStream(ms);
            //        }
            //        image.Write(bytes, 0, bytes.Length);
            //        image.Flush();
            //        image.Save(Pic_Path, System.Drawing.Imaging.ImageFormat.Png);
            //       // bw.Write(data);
            //        //bw.Close();
            //    }
            //}
            return pic_Name;
        }


     
        

        [System.Web.Services.WebMethod]
        public static void downloadResultCard(List<ShowMcqs> data)
        {
            string abs_;
            HttpContext.Current.Session["data"] = data;
            return;

            //pdf_ResultCard(data);
          
            

}
          public static void ShowPdf(string filename)
    {
        //Clears all content output from Buffer Stream
        HttpContext.Current.Response.ClearContent();
        //Clears all headers from Buffer Stream
        HttpContext.Current.Response.ClearHeaders();
        //Adds an HTTP header to the output stream
        HttpContext.Current.Response.AddHeader("Content-Disposition", "inline;filename=" + filename);
        //Gets or Sets the HTTP MIME type of the output stream
        HttpContext.Current.Response.ContentType = "application/pdf";
        //Writes the content of the specified file directory to an HTTP response output stream as a file block
        HttpContext.Current.Response.WriteFile(filename);
        //sends all currently buffered output to the client
        HttpContext.Current.Response.Flush();
        //Clears all content output from Buffer Stream
        HttpContext.Current.Response.Clear();
    }  

        [System.Web.Services.WebMethod]
        public static List<Hompagetable> LoadHomePages(int subid)
        {

            return LoadHomepage(subid);
        }


      
        public static List<Hompagetable> LoadHomepage(int subid)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // Int32 AdminId = 124;
            // string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<Hompagetable> homeinfo = new List<Hompagetable>();
            //List<ddlLoadUsers> UsersInformation = new List<ddlLoadUsers>();  //create a reference of List<Property>.  
            DataSet ds;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("HomePageTable", con)) //GetCountryRecords is a Stored Procedure.  
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
                                                homeinfo.Add(new Hompagetable()
                                                {
                                                    SubjectName = dr["SubjectName"].ToString(),
                                                    TestName = dr["TestName"].ToString(),
                                                    AdminName = dr["AdminName"].ToString(),
                                                    TotalMcqs = DBNull.Value.Equals(dr["TotalMcqs"]) ? 0 : Convert.ToInt32(dr["TotalMcqs"]),
                                                  
                                                    TestId = DBNull.Value.Equals(dr["TestId"]) ? 0 : Convert.ToInt32(dr["TestId"]),
                                                    
                                                    IsMultiple = DBNull.Value.Equals(dr["ismultiple"]) ? 0 : Convert.ToInt32(dr["ismultiple"]),
                                                    SubId = Convert.ToInt32(dr["SubjectId"].ToString()),//,//SubjectId
                                                   // SecId = DBNull.Value.Equals(dr["ismultiple"]) ? 0 : Convert.ToInt32(dr["ismultiple"])
                                                    //catid = Convert.ToInt32(dr["CatId"])
                                                   
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

        [System.Web.Services.WebMethod]
        public static List<Hompagetable> LoadHomePagesAllsub()
        {

            return LoadHomePagesAllsub1();
        }
        public static List<Hompagetable> LoadHomePagesAllsub1()
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
            List<Hompagetable> homeinfo = new List<Hompagetable>();
            //List<ddlLoadUsers> UsersInformation = new List<ddlLoadUsers>();  //create a reference of List<Property>.  
            DataSet ds;
            try
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("HomePageTableSubAll", con)) //GetCountryRecords is a Stored Procedure.  
                    {

                        cmd.CommandTimeout = 100 * 100000;
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
                                                homeinfo.Add(new Hompagetable()
                                                {
                                                    SubjectName = dr["SubjectName"].ToString(),
                                                    //TestName = dr["TestName"].ToString(),
                                                  //  AdminName = dr["AdminName"].ToString(),
                                                    TotalTest = Convert.ToInt32(dr["TotalTest"]),
                                                    TotalMcqs = Convert.ToInt32(dr["totalmcqs"]),
                                                   // TestId = Convert.ToInt32(dr["TestId"].ToString()),
                                                    SubId = Convert.ToInt32(dr["SubjectId"].ToString()),//SubjectId
                                                    catid = Convert.ToInt32(dr["CatId"]),
                                                    CatName = DBNull.Value.Equals(dr["CatName"]) ? "" : dr["CatName"].ToString(),
                                                    CatDesc = DBNull.Value.Equals(dr["CatDesc"]) ? "" : dr["CatDesc"].ToString(),
                                                    CatPurpose = DBNull.Value.Equals(dr["CatPurpose"]) ? "" : dr["CatPurpose"].ToString(),
                                                    CatImg = DBNull.Value.Equals(dr["CatImg"]) ? "" : dr["CatImg"].ToString()

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
        public static List<ShowMcqs> LoadMcqsQuestions(string TestId, int name, int pageIndex, int IsMultiple, string ClientTestInfo)
        {
            return LoadMcqsQuestionAll(TestId, name, pageIndex,  IsMultiple,  ClientTestInfo);
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
                    cmd.Parameters.AddWithValue("@PageSize", 10);
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
                                        exp_check_staff_name = HttpUtility.HtmlDecode(dr["exp_check_staff_name"].ToString());
                                        exp_check_staff_qual = HttpUtility.HtmlDecode(dr["exp_check_staff_qual"].ToString());
                                        exp_check_staff_pic = HttpUtility.HtmlDecode(dr["exp_check_staff_pic"].ToString());
                                        exp_check_staff_acc = (dr["exp_check_staff_acc"].ToString());
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
                                if (name == 1)
                                {
                                    if (dr["Exptext"] != "")
                                    {
                                        exptxt = HttpUtility.HtmlDecode(dr["Exptext"].ToString());
                                    }
                                    else
                                    {
                                        exptxt = "";
                                    }
                                    if (dr["Reftext"] != "")
                                    {
                                        reftxt = HttpUtility.HtmlDecode(dr["Reftext"].ToString());
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
                                    QuestionText = HttpUtility.HtmlDecode(dr["QuestionText"].ToString()),
                                    Points = Convert.ToInt32(dr["Points"].ToString()),
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
                                    isExplained = isExplained,
                                    edate = DBNull.Value.Equals(dr["edate"]) ? "" : dr["edate"].ToString()
                                  
                                    //pagecount = Convert.ToInt32(dr["PageCount"])
                                    
                                    //  McqsQuestionId = Convert.ToInt32(dr["McqsQuestionInformationId"].ToString())
                                });
                                if ( i == 101)
                                {
                                    break;
                                }
                            }
                        }

                    }
                   
                    int v = Convert.ToInt32(cmd.Parameters["@PageCount"].Value);
                    //ShowMcqs m = new ShowMcqs();
                    //m.pagecount = v;
                    ShowMcqsInfo.Add(new ShowMcqs() { pagecount = v});
                    //ShowMcqsInfo.Concat(IEnumerable<ShowMcqs>)
                    return ShowMcqsInfo;
                }
            }
        }


        public static string Decrypt(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
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
        //this method is a static type and list<property> is return.

        [System.Web.Services.WebMethod(EnableSession = false)]
        public static string InsertReport(string ReporterName, string ReporterEmail, int Report_McqsId, string Report_OptionText,int Report_Type)
        {

            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
          //  int AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_User_Report", con))
                {
                    //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    //// Int32 AdminId = 124;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ReporterName", HttpUtility.HtmlEncode(ReporterName));
                    cmd.Parameters.AddWithValue("@ReporterEmail", HttpUtility.HtmlEncode(ReporterEmail));
                    cmd.Parameters.AddWithValue("@Report_McqsId", Report_McqsId);
                    cmd.Parameters.AddWithValue("@Report_OptionText", HttpUtility.HtmlEncode(Report_OptionText));
                    cmd.Parameters.AddWithValue("@Report_Type", Report_Type);
                   
                    con.Open();
                    int ReportId = (Int32)cmd.ExecuteNonQuery();
                    con.Close();
                    //HttpContext.Current.Session["SubjectId"] = SubjectId;
                    if (ReportId >= 1)
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
                                                , string ExplanationText
            , string ReferenceTexts

            )
        {
            HttpContext.Current.Server.ScriptTimeout = 3000;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {

                {
                    using (SqlCommand cmd = new SqlCommand("mcqs_AllOption_Insert_Ref_Exp_AllUsers", con))
                    {
                        //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                        // Int32 McqsQuestionInformationId = (Int32)HttpContext.Current.Session["McqsQuestionInformationId"];
                        cmd.CommandType = CommandType.StoredProcedure;
                        //cmd.Parameters.AddWithValue("@SubjectId", SubjectId);
                        //cmd.Parameters.AddWithValue("@TestId", TestId);
                        // cmd.Parameters.AddWithValue("@McqsQuestionInformationId", McqsQuestionInformationId);

                        // option text box.
                        Int32 AdminId = 100; //Convert.ToInt32(Decrypt(Emyadminid));
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

        [System.Web.Services.WebMethod(EnableSession = false)]
        public static List<ddlSubject> LoadddlSubject()
        {
            return    LoadddlSubject1();
        }

        [System.Web.Services.WebMethod(EnableSession = false)]
        // [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<ddlSubject> LoadddlSubject1() 
        {
            // HiddenField AdminId = ""; //(Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
          //  string id = dadminid;
            //string converted = //Decrypt(id);
            HttpContext.Current.Server.ScriptTimeout = 90000;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ddlSubject> SubjectInformation = new List<ddlSubject>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ddlSubjectName_AllUsers", con)) //GetCountryRecords is a Stored Procedure.  
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                   // SqlParameter parameter = cmd.Parameters.Add("@AdminId", converted);  //@count is Stored Procedure parameter and 
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

        [System.Web.Services.WebMethod]
        public static List<ddlTest> LoadddlTestForSpecificSub(int SubId)
        {
            return LoadddlTestForSpecificSubj(SubId);
        }
        //this method is a static type and list<property> is return. 
        
        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<ddlTest> LoadddlTestForSpecificSubj(int subid)
        {
            // // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
            // // Int32 AdminId = 124;
            //Int32 AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            HttpContext.Current.Server.ScriptTimeout = 90000;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<ddlTest> SubjectInformation = new List<ddlTest>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ddlTestNameForSpecificSubj_AllUsers", con)) //GetCountryRecords is a Stored Procedure.  
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                   // SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
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

        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<GetTestInst> getTestInst(int TestId)
        {
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
                                                TestPassingPercent = DBNull.Value.Equals(dr["TestPassingPercentage"])? 0: Convert.ToInt32(dr["TestPassingPercentage"]),
                                                TestName =DBNull.Value.Equals(dr["TestName"])? "":dr["TestName"].ToString(),
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

                    return SubjectInformation;
                }
            }
        }


        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<TestInfo> getTestInfo(int TestId)
        {
            HttpContext.Current.Server.ScriptTimeout = 90000;
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<TestInfo> SubjectInformation = new List<TestInfo>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("GetTestInfo", con)) //GetCountryRecords is a Stored Procedure.  
                {

                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    // SqlParameter parameter = cmd.Parameters.Add("@AdminId", AdminId);  //@count is Stored Procedure parameter and 
                    SqlParameter parameter1 = cmd.Parameters.Add("@TestId", TestId);
                 
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
                                            SubjectInformation.Add(new TestInfo()
                                            {
                                                SubId = DBNull.Value.Equals(dr["SubjectId"]) ? 0 : Convert.ToInt32(dr["SubjectId"]),
                                                TotalQ = DBNull.Value.Equals(dr["TotalMcqs"]) ? 0 : Convert.ToInt32(dr["TotalMcqs"]),
                                                SubName = DBNull.Value.Equals(dr["SubName"]) ? "" : dr["SubName"].ToString(),
                                                AdminName = DBNull.Value.Equals(dr["AdminName"]) ? "" : dr["AdminName"].ToString(),
                                                IsMultiple = DBNull.Value.Equals(dr["ismultiple"]) ? 0 : Convert.ToInt32(dr["ismultiple"]),
                                                TestName = DBNull.Value.Equals(dr["TestName"]) ? "" : dr["TestName"].ToString()
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
    }
}