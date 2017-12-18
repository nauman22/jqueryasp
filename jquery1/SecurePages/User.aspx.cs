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

namespace jquery1.SecurePages
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static List<McqsDetail> Getmcqs_Detail(int QNo)
        {
            return Getmcqs_Details(QNo);
        }
        public static List<McqsDetail> Getmcqs_Details(int QuestioNo)
        {


            Int32 AdminId =Convert.ToInt32(HttpContext.Current.Session["UserAdminId"]);
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<McqsDetail> Dashboard_UsersMcqsDetail = new List<McqsDetail>();  //create a reference of List<Property>.  
            DataSet ds;
            using (SqlConnection con = new SqlConnection(constr))
            {
                //string myquery;
                if (QuestioNo == 0)
                {

                    //myquery = "select count(QuestionsId) as TotalQuestions , SUM(Points) as totalNumbers from View_Final_ShowMcqs_Question_8Options_Reference_Explanation where AdminId = " + AdminId ;
                    using (SqlCommand cmd = new SqlCommand()) // '" + useradminid + "'" GetCountryRecords is a Stored Procedure.  
                    {
                        
                        cmd.Connection = con;
                        cmd.CommandText = "ShowDetails";
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlParameter paramAdminId = new SqlParameter("@AdminId",AdminId);
                        cmd.Parameters.Add(paramAdminId);
                        con.Open();
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
                                                    TotalPoints = Convert.ToInt32(dr["TotalMarks"]),
                                                    SubjectId = Convert.ToInt32(dr["SubjectId"]),
                                                    TestId = Convert.ToInt32(dr["TestId"]),
                                                    SubjectName = (dr["SubjectName"].ToString()),
                                                    TestName = (dr["TestName"].ToString())

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
    }
}