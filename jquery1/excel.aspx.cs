using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jquery1
{
    public partial class excel : System.Web.UI.Page
    {
        
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }

        }
        public Boolean ImporttoDatatable()
        {
            string path = string.Concat(Server.MapPath("~/excelfiles/" + FlUploadcsv.FileName));
            OleDbConnection OleDbcon = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=Excel 12.0;");
            Boolean i = true;
            try
            {
                if (FlUploadcsv.HasFile)
                {
                    string FileName = FlUploadcsv.FileName;
                   
                    FlUploadcsv.PostedFile.SaveAs(path);
                   
                    OleDbCommand command = new OleDbCommand("SELECT * FROM [Sheet2$]", OleDbcon);
                    OleDbDataAdapter objAdapter1 = new OleDbDataAdapter(command);
                    string tablecount = "SELECT COUNT(*) FROM [Sheet2$]";
                    OleDbCommand countcmd = new OleDbCommand(tablecount, OleDbcon);
                    OleDbcon.Open();
                    long countstart = System.Convert.ToInt32(countcmd.ExecuteScalar());
                    totalrows.Text = "Total Rows " + countstart;
                    OleDbcon.Close();
                    
                    OleDbcon.Open();
                    // Create DbDataReader to Data Worksheet
                    DbDataReader dr = command.ExecuteReader();
                    // SQL Server Connection String
                    string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
                    string msg = string.Empty;
                    SqlBulkCopy bulkInsert = new SqlBulkCopy(constr);
                    bulkInsert.DestinationTableName = "excel_data_mcqs";
                    bulkInsert.SqlRowsCopied +=
                    new SqlRowsCopiedEventHandler(OnSqlRowsCopied);
                    bulkInsert.NotifyAfter = 1;
                    try
                    {
                        // Write from the source to the destination.+
                        bulkInsert.ColumnMappings.Add("AdminId", "AdminId");
                        bulkInsert.ColumnMappings.Add("SubjectId", "SubjectId");
                        bulkInsert.ColumnMappings.Add("TestId", "TestId");
                        bulkInsert.ColumnMappings.Add("QuestionId", "QuestionId");
                        bulkInsert.ColumnMappings.Add("Points", "Points");
                        bulkInsert.ColumnMappings.Add("QuestionText", "QuestionText");
                        bulkInsert.ColumnMappings.Add("Option1Text", "Option1Text");
                        bulkInsert.ColumnMappings.Add("Option2Text", "Option2Text");
                        bulkInsert.ColumnMappings.Add("Option3Text", "Option3Text");
                        bulkInsert.ColumnMappings.Add("Option4Text", "Option4Text");
                        bulkInsert.ColumnMappings.Add("Option5Text", "Option5Text");
                        bulkInsert.ColumnMappings.Add("CorrectOption", "CorrectOption");
                        bulkInsert.ColumnMappings.Add("Explanation", "Explanation");
                        bulkInsert.ColumnMappings.Add("ReferenceText", "ReferenceText");
                      
                        bulkInsert.WriteToServer(dr);
                        i = true;
                    }
                    catch (Exception ex)
                    {
                        Labelerrornotcompleted.Text = (ex.Message);
                        i = false;
                    }
                    finally
                    {
                        // Close the SqlDataReader. The SqlBulkCopy
                        // object is automatically closed at the end
                        // of the using block.
                        dr.Close();
                    }
                  
                    OleDbcon.Close();
                  

                    
                   //  Bulk Copy to SQL Server
                   
                }
            }
            catch (Exception ex)
            {
                lblerror.Text = Convert.ToString(ex.Message);
                i = false;
                OleDbcon.Close();
            }
            OleDbcon.Close();
            return i;
        }
       
        private static void OnSqlRowsCopied(
        object sender, SqlRowsCopiedEventArgs e)
        {

            Page page = (Page)HttpContext.Current.Handler;
            //FileUpload fileupload = (FileUpload)page.FindControl("FileUploadcsv");
            //string path = string.Concat(HttpContext.Current.Server.MapPath("~/excelfiles/" + fileupload.FileName));
            //OleDbConnection OleDbcon = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=Excel 12.0;");

            

           // Page page = (Page)HttpContext.Current.Handler;
            Label TextBox1 = (Label)page.FindControl("lblcounts");
            TextBox1.Text = "and Copied " + e.RowsCopied + " rows Successfully";
            
        }
        void BindGrid()
        {
            DataSet ds = new DataSet();
            conn.Open();
            string cmdstr = "Select * from excel_data_mcqs where Insert_Status = 0";
           
            SqlCommand cmd = new SqlCommand(cmdstr, conn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            lbl_wait_data.Text = (ds.Tables[0].Rows.Count.ToString() + "Data Records Remaining to Published");
            lbl_wait_data.ForeColor = System.Drawing.Color.Blue;
            lblremainingrecords.Text = ds.Tables[0].Rows.Count.ToString();
            gvEmployee.DataSource = ds;
            gvEmployee.DataBind();
            ds.Dispose();
            conn.Close();
        }
        protected void btnIpload_Click(object sender, EventArgs e)
        {
            if (!FlUploadcsv.HasFile)
            {
                lblerror.Text = "No data to import from Excel Sheet!";
            }
            else
            {
                Boolean status = ImporttoDatatable();
                if (status == true)
                {
                    BindGrid();
                    lblerror.Text = "Data Inserted Successfully";
                }
            }
           
            
        }

        protected void onSite_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(lblremainingrecords.Text) < 1)
            {
                lbl_wait_data.Text = "No Data available to Published at this time";
                lbl_wait_data.ForeColor = System.Drawing.Color.DarkMagenta;
                //BindGrid();
            }
            else
            {
                using (SqlCommand cmd = new SqlCommand("mcqs_AllOption_Insert_Ref_Exp_EXCEL_INSERT", conn))
                {
                    //  // Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    //// Int32 AdminId = 124;
                    //  Int32 McqsQuestionInformationId = (Int32)HttpContext.Current.Session["McqsQuestionInformationId"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    cmd.CommandTimeout = 300000;
                    int i = cmd.ExecuteNonQuery();
                    conn.Close();
                    if (i == 1)
                    {
                        lbl_wait_data.Text = "Warning ! All Data not Published Successfully!";
                        lbl_wait_data.ForeColor = System.Drawing.Color.Red;
                        BindGrid();
                    }
                    else
                    {
                        lbl_wait_data.Text = "All Data Published Successfully";
                        lbl_wait_data.ForeColor = System.Drawing.Color.Green;
                        BindGrid();
                    }
                }
            }
         
        }
    }

}
