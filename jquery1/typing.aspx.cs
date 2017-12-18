using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Services;

using System.Web.Script.Services;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Globalization;

namespace jquery1
{
    public partial class typing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(!IsPostBack)
            {
                List<string> list = new List<string>();
               // string combinepath = Path.Combine("~/acme-free/PARAGRAPH", filename);
                string path = HttpContext.Current.Server.MapPath("~/acme-free/PARAGRAPH/");
               // string path = @"D:\jquery1\jquery1\acme-free\PARAGRAPH\";
                // string mynames = "";
                int i = 0;
                ddltypingtext.Items.Clear();
                foreach (string s in Directory.GetFiles(path, "*.txt").Select(Path.GetFileName))
                {
                    i++;
                    ddltypingtext.Items.Add(new System.Web.UI.WebControls.ListItem(s, i.ToString()));

                }
               // Dashboard_UsersMcqs();
                // ListItem li = ddltypingtext.Items.FindByText("Three");
                System.Web.UI.WebControls.ListItem li = ddltypingtext.Items.FindByValue("1");
                li.Selected = true;

               

               // Loadbasics();
 // string path = @"../acme-free/PARAGRAPH/";
           
           // ddltypingtext.SelectedIndex.Equals("1");
              //  list.Add(s);
                    
                    
            //ddltypingtext.DataSource = ds;

           //ddltypingtext.DataTextField = "au_fname";
            //ddltypingtext.DataValueField = "au_fname";
            //ddltypingtext.DataBind();
            }
          
               // Console.WriteLine(s);
        }


        [System.Web.Services.WebMethod]
        public void usercert(int userid, int isall)
        {
            List<tblTyping_UserRecord> mylist = new List<tblTyping_UserRecord>();
            mylist = Dashboard_Userstypingtest(userid, isall);
            print_usertypingcert(mylist);

        }


        [System.Web.Services.WebMethod]
        public static List<tblTyping_UserRecord> userstable()
        {
            int userid; int isall;
            userid = 0;
            isall = 0;
                
            List<tblTyping_UserRecord> mylist = new List<tblTyping_UserRecord>();
            mylist = Dashboard_Userstypingtest(userid, isall);
            return mylist;
        }
        public void print_usertypingcert(List<tblTyping_UserRecord> mylist)
        {
            iTextSharp.text.Rectangle rec = new iTextSharp.text.Rectangle(PageSize.A4);
            // Page Size with Margins
           int id=0,netspeed=0,grossspeed=0,accuracy=0,errorhits=0,grossstrokes=0,netstrokes=0;
           string name="",testname="",duration="",timetaken="",TestTimeTaken="";
           foreach(tblTyping_UserRecord myuse in mylist)
           {
              id =  myuse.Id;
              testname = myuse.TestName;
              name = myuse.Name;
              netspeed = myuse.NetSpeed;
              grossspeed = myuse.GrossSpeed;
              accuracy = myuse.Accuracy;
              errorhits = myuse.ErrorHits;
              grossstrokes = myuse.GrossStrokes;
              netstrokes = myuse.NetStrokes;
              duration = myuse.Duration;
              timetaken = myuse.TimeTaken;
              TestTimeTaken = myuse.TestTakenDateTime.ToString();
           }
            if(accuracy == 100)
            {
                netspeed=grossspeed ;
            }
            name = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(name);

           #region basic settings

           Document doc = new Document(rec, 36, 72, 3, 180);
            var output = new FileStream(Server.MapPath("~/pdfs/Doc1.pdf"), FileMode.Create);
            string path = Server.MapPath("~/pdfs");
            string filename = path + "/Doc1.pdf";
            // Saving File Path
            PdfWriter writer = PdfWriter.GetInstance(doc, output);
            doc.Open();
            Font Heading = FontFactory.GetFont(FontFactory.HELVETICA, 17, Font.BOLD);
            Font titleFont = FontFactory.GetFont("Arial", 18);
            Font regularFont = FontFactory.GetFont("Arial", 14);
            Font footerFont = FontFactory.GetFont("Arial", 12);
            Font titleFont_u = FontFactory.GetFont("Arial", 16, Font.UNDERLINE);
            Font boldFont = FontFactory.GetFont("Arial", 14, Font.BOLD);
            Paragraph title;
            Paragraph text;

            PdfPTable table = new PdfPTable(4);
            PdfPTable tblinfo = new PdfPTable(4);
            tblinfo.TotalWidth = 550f;
            table.TotalWidth = 550f;
            //fix the absolute width of the table
            table.LockedWidth = true;
            //relative col widths in proportions - 1/3 and 2/3
            float[] widths = new float[] { 1f, 19f, 3f, 3f };
            float[] widths1 = new float[] { 5f, 7f, 6f, 19f };
            table.SetWidths(widths);
            tblinfo.SetWidths(widths1);
            table.HorizontalAlignment = 0;
            tblinfo.HorizontalAlignment = 0;
            //leave a gap before and after the table
            table.SpacingBefore = 1f;
            table.SpacingAfter = 1f;
            tblinfo.SpacingBefore = 1f;
            tblinfo.SpacingAfter = 1f;
            //PdfPCell cell = new PdfPCell(new Phrase(""));
            //cell.Colspan = 3;
            //cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
            //table.AddCell(cell);
            PdfPCell cell = new PdfPCell(new Phrase(" ", regularFont));
            cell.FixedHeight = 4f;
            doc.Add(cell);
            cell = new PdfPCell(new Phrase(" ", regularFont));
            cell.FixedHeight = 3f;
            doc.Add(cell);
            cell = new PdfPCell(new Phrase(" ", regularFont));
            cell.FixedHeight = 3f;
            doc.Add(cell);
            cell = new PdfPCell(new Phrase(" ", regularFont));
            cell.FixedHeight = 3f;
            doc.Add(cell);
            cell = new PdfPCell(new Phrase(" ", regularFont));
            cell.FixedHeight = 3f;
            doc.Add(cell);

           #endregion



            title = new Paragraph("Freemcqs.com Test Certificate, | " + DateTime.Now.ToString("dd-MMM-yyyy") + " | Freemcqs.com", titleFont_u);
            title.Alignment = Element.ALIGN_CENTER;
            doc.Add(title);

            text = new Paragraph("" + "", regularFont);
            doc.Add(text);

            PdfPCell infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 4;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);


            //infocell = new PdfPCell(new Phrase("", regularFont));
            //infocell.Colspan = 2;
            //tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("", boldFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("", boldFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("", boldFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            //iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(Server.MapPath("All_Images/NoImage.gif"));
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

            //infocell = new PdfPCell(jpg);
            //infocell.Colspan = 1;
            //infocell.Border = 0;
            //infocell.EnableBorderSide(4);
            //infocell.Width = 10f;
            infocell.PaddingTop = -30;
            infocell.FixedHeight = 10f;
            infocell.PaddingLeft = 105f;
            infocell.HorizontalAlignment = 1;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(name, Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);




            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);


            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("has successfully completed an online based", regularFont));
            infocell.Colspan = 4;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);


            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Freemcqs.com Typing Test with the following results:", regularFont));
            infocell.Colspan = 4;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);


            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Test Name:", boldFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(testname, regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);


            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Date:", boldFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(TestTimeTaken, regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Duration:", boldFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(duration+" min.", regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Done:", boldFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(timetaken+" min.", regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Gross Speed:", boldFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(grossspeed+" wpm", regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Accuracy:", boldFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(accuracy+"%", regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Net Speed:", boldFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(netspeed+" wpm", regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);


            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Gross Strokes:", boldFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

           
            infocell = new PdfPCell(new Phrase(grossstrokes.ToString(), regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Error hits:", boldFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(errorhits + " as per formula(1 error * 5)", regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Net strokes:", boldFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(netstrokes.ToString() , regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);


            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);


            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Signature:", boldFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("___________________", regularFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 2;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase(" ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(" ", Heading));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Proprietary license by Freemcqs.com Inc. ", footerFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("More Information at http://wwww.freemcqs.com", footerFont));
            infocell.Colspan = 4;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);


            doc.Add(tblinfo);




            PdfPTable Qtable = new PdfPTable(5);
            float[] Qwidths = new float[] { 5f, 1f, 5f, 7f, 7f };
            Qtable.SetWidths(Qwidths);
            PdfPCell qcell = new PdfPCell();
            qcell.Border = 0;
            // qcell.BorderColor = iTextSharp.text.BaseColor.LIGHT_GRAY;



            // cell = new PdfPCell(Question + Environment.NewLine + option1 + Environment.NewLine + option2 + Environment.NewLine + "3." + Environment.NewLine + "4. " + Environment.NewLine + "User Selected Option: " + "" + Environment.NewLine + "Correct Option: " + "");
            cell = new PdfPCell(Qtable);
            cell.Colspan = 1;
            cell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
            table.AddCell(cell);
            cell = new PdfPCell(new Phrase("2", regularFont));
            cell.Colspan = 1;
            cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
            table.AddCell(cell);
            cell = new PdfPCell(new Phrase("2", regularFont));
            cell.Colspan = 1;
            cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
            table.AddCell(cell);

            //iTextSharp.text.Font gnrFont = new Font();

            //table.AddCell("Col 1 Row 1");
            //table.AddCell("Col 2 Row 1");
            //table.AddCell("Col 3 Row 1");
            //table.AddCell("Col 1 Row 2");
            //table.AddCell("Col 2 Row 2");
            //table.AddCell("Col 3 Row 2");

            doc.Add(table);
            text = new Paragraph(new Phrase(""));
            doc.Add(text);
            text.Alignment = 0;
            //0=Left, 1=Centre, 2=Right
            doc.Add(text);
            //text = new Paragraph(new Phrase("Candidate Signature" + Environment.NewLine + " ____________________", fontNormal));
            //text.Alignment = 2;
            ////0=Left, 1=Centre, 2=Right
            //doc.Add(text);

            doc.Close();
            ShowPdf(filename);

        }


        public static DataTable resort(DataTable dt, string colName, string direction)
        {
            DataTable dtOut = null;
            dt.DefaultView.Sort = colName + " " + direction;
            dtOut = dt.DefaultView.ToTable();
            return dtOut;
        }

        public void ShowPdf(string filename)
        {
            //Clears all content output from Buffer Stream
            Response.ClearContent();
            //Clears all headers from Buffer Stream
            Response.ClearHeaders();
            //Adds an HTTP header to the output stream
            Response.AddHeader("Content-Disposition", "inline;filename=" + filename);
            //Gets or Sets the HTTP MIME type of the output stream
            Response.ContentType = "application/pdf";
            //Writes the content of the specified file directory to an HTTP response output stream as a file block
            Response.WriteFile(filename);
            //sends all currently buffered output to the client
            Response.Flush();
            //Clears all content output from Buffer Stream
            Response.Clear();
        }  
        public static List<tblTyping_UserRecord> Dashboard_Userstypingtest(int userid, int isall)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            List<tblTyping_UserRecord> Dashboard_UsersMcqs = new List<tblTyping_UserRecord>();  //create a reference of List<Property>.  
            DataSet ds, ds1;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string mysql = "";
                if (isall == 1)
                {
                    mysql = "select * from tblTyping_UsersRecord  Where Id = '" + userid + "'";
                }
                else{
                    mysql = "select * from tblTyping_UsersRecord ";
                }
                using (SqlCommand cmd = new SqlCommand(mysql, con)) // Where AdminId = '" + useradminid + "'", GetCountryRecords is a Stored Procedure.  
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
                        ds1 = new DataSet();
                        da.Fill(ds);    //Fill the dataset. 
                        
                        try
                        {
                            if (ds != null)
                            {
                                if (ds.Tables.Count > 0)
                                {
                                    DataTable table = ds.Tables[0];
                                    DataView view = table.DefaultView;
                                    view.Sort = "Id DESC";
                                 
                                    if (view.Count > 0)
                                    {
                                        foreach (DataRow dr in view.Table.Rows)
                                        {
                                            Dashboard_UsersMcqs.Add(new tblTyping_UserRecord()
                                            {
                                                Id = Convert.ToInt32(dr["Id"]),
                                                Name = (dr["Name"].ToString()),
                                                TestName = (dr["TestName"].ToString()),
                                                Duration = (dr["Duration"].ToString()),
                                                TestTakenDateTime = (DateTime.Parse(dr["TestTakenDateTime"].ToString())),
                                                TimeTaken = (dr["TimeTaken"].ToString()),
                                                GrossSpeed = Convert.ToInt32(dr["GrossSpeed"]),
                                                NetSpeed = Convert.ToInt32(dr["NetSpeed"]),
                                                Accuracy = Convert.ToInt32(dr["Accuracy"]),
                                                GrossStrokes = Convert.ToInt32(dr["GrossStrokes"]),
                                                ErrorHits = Convert.ToInt32(dr["ErrorHits"]),
                                                NetStrokes = Convert.ToInt32(dr["NetStrokes"]),
                                                ispic = Convert.ToInt32(dr["ispic"])

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

        [System.Web.Services.WebMethod(EnableSession = false)]
        public static string UploadTextFile(string filename, string text)
        {
            if (filename == "" || text == "") 
            {
                return "0";
            }


           // string path = @"D:\jquery1\jquery1\acme-free\PARAGRAPH\" + filename;

          string   path1 = Path.Combine("~/acme-free/PARAGRAPH/", filename);
         string    path = HttpContext.Current.Server.MapPath(path1);
            if (File.Exists(path)) 
            {
                 path = @"D:\jquery1\jquery1\acme-free\PARAGRAPH\";
                //path = path.Replace('.','~');
               // string currentdatatime = ;
                filename = filename+"-"+DateTime.Now.ToFileTime() + ".txt";

                 path1 = Path.Combine("~/acme-free/PARAGRAPH/", filename);
                 path = HttpContext.Current.Server.MapPath(path1);
               /// path = path + filename;

            }
           
           

            if (!File.Exists(path))
            {
                byte[] bytes = Encoding.UTF8.GetBytes(text);
                text = Encoding.UTF8.GetString(bytes);
                File.Create(path).Dispose();
                using (TextWriter tw = new StreamWriter(path))
                {
                    tw.WriteLine(text);
                    tw.Close();
                }

            }


            return filename;
        }

        public static bool ThumbnailCallback()
        {
            return false;
        }
        [System.Web.Services.WebMethod(EnableSession = false)] // 
        public static string UploadUserPicFiles(int totalchars, int totalcharscorrect, int GrossSpeed, int NetSpeed, int Accuracy, string username, string TestName, string userFinishTime, string totaluserdeclaredtime, int totalcharsincorrect)//, string filename, string text)
        {
            int ispic = 0;
            string pic_Name = "";
           // if (filename == "users-md.png" || text == "acme-free/img/users-md.png")
           // {
           //     filename = "users-md.png";
           //     pic_Name = filename;
           //     ispic = 1;
           // }
           // else
           // {
           //     pic_Name = filename;
           // }
           //// string path = @"D:\jquery1\jquery1\acme-free\userpics\" + filename;
           // string path1 = Path.Combine("~/acme-free/userpics/", filename);
           // string path = HttpContext.Current.Server.MapPath(path1);
           // if (ispic == 0)
           // {
               
           //     if (File.Exists(path))
           //     {
           //         path = @"D:\jquery1\jquery1\acme-free\PARAGRAPH\";
           //         //path = path.Replace('.','~');
           //         // string currentdatatime = ;
           //         filename = filename + "-" + DateTime.Now.ToFileTime() + ".txt";
           //         path1 = Path.Combine("~/acme-free/userpics/", filename);
           //         path = HttpContext.Current.Server.MapPath(path1);
           //         //path = path + filename;

           //     }
           //     else
           //     {
           //         string validTestName = filename;
           //         // string validImagedate = imageData.Remove(0, 22);
           //         validTestName = validTestName.Replace(" ", "_");
           //         Int64 datetimeticks = DateTime.Now.Ticks;
           //         DateTime formatdate = new DateTime(datetimeticks);
           //         pic_Name = validTestName + formatdate.ToString("dd-M-yyyy-HH-mm-ss") + ".png";
           //     }
           // }
           

           

            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            //  int AdminId = Convert.ToInt32(Decrypt(Emyadminid));
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_TypingUser_Report", con))
                {
                    //// Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                    //// Int32 AdminId = 124;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TestName", TestName);
                    cmd.Parameters.AddWithValue("@userFinishTime", userFinishTime);
                    cmd.Parameters.AddWithValue("@totaluserdeclaredtime", totaluserdeclaredtime);
                    cmd.Parameters.AddWithValue("@totalcharsincorrect", totalcharsincorrect);
                    cmd.Parameters.AddWithValue("@totalcharscorrect", totalcharscorrect);
                    cmd.Parameters.AddWithValue("@totalchars", totalchars);
                    cmd.Parameters.AddWithValue("@username",HttpUtility.HtmlEncode(username));
                    cmd.Parameters.AddWithValue("@GrossSpeed", GrossSpeed);
                    cmd.Parameters.AddWithValue("@NetSpeed", NetSpeed);
                    cmd.Parameters.AddWithValue("@Accuracy", Accuracy);
                 //   cmd.Parameters.AddWithValue("@UserPicPath", pic_Name);
                    cmd.Parameters.AddWithValue("@ispic", ispic);
                    var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.Int);
                    returnParameter.Direction = ParameterDirection.ReturnValue;
                    

                    con.Open();
                    cmd.ExecuteNonQuery();
                    int ReportId =Convert.ToInt32(returnParameter.Value);
                   
                    con.Close();
                    //HttpContext.Current.Session["SubjectId"] = SubjectId;
                    if (ReportId >= 1)
                    {
                        pic_Name = ReportId.ToString()+".JPG";
                    }
                    
                }
            }
           // string path = Server.MapPath("~/Jellyfish.jpg");
           
           //if(ispic == 0)
           //{
           //    if (!File.Exists(path))
           //    {


                 
           //        string combinepath = Path.Combine("~/acme-free/userpics/", pic_Name);

           //        string Pic_Path = HttpContext.Current.Server.MapPath(combinepath);
           //        string converted = text.Replace('-', '+');
           //        converted = converted.Replace('_', '/');
           //        string validImagedate = converted.Remove(0, 23);
           //        using (var imageFile = new FileStream(Pic_Path, FileMode.Create))
           //        {
                       
           //            byte[] data = Convert.FromBase64String(validImagedate);
           //            imageFile.Write(data, 0, data.Length);

           //            imageFile.Flush();
           //            if (imageFile != null)
           //            {
           //                imageFile.Close();
           //            }
           //        }
           //    }
           //}

           

            //string combinepatha = Path.Combine("~/acme-free/userpics/", pic_Name);
            //string Pic_Patha = HttpContext.Current.Server.MapPath(combinepatha);
            //    System.Drawing.Image image = System.Drawing.Image.FromFile(Pic_Patha);
            //    using (System.Drawing.Image thumbnail = image.GetThumbnailImage(50, 50, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero))
            //    {
            //        using (MemoryStream memoryStream = new MemoryStream())
            //        {
            //            thumbnail.Save(memoryStream, ImageFormat.Png);
            //            Byte[] bytes = new Byte[memoryStream.Length];
            //            memoryStream.Position = 0;
            //            memoryStream.Read(bytes, 0, (int)bytes.Length);
            //            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        
            //            using (var imageFile = new FileStream(Pic_Patha, FileMode.Create))
            //            {
            //                byte[] data = Convert.FromBase64String(base64String);
            //                imageFile.Write(data, 0, data.Length);

            //                imageFile.Flush();
            //            }
                       
            //        }
            //    }




           return pic_Name;
        }


        [System.Web.Services.WebMethod(EnableSession = false)]
        public static string Loadbasics(string filename)
        {
           
            string readContents;
            string combinepath = Path.Combine("~/acme-free/PARAGRAPH", filename);
            string path1 = HttpContext.Current.Server.MapPath(combinepath);
           // string path1 = @"D:\jquery1\jquery1\acme-free\PARAGRAPH\" + filename;

            using (StreamReader streamReader = new StreamReader(path1, System.Text.Encoding.UTF8))
            {
                readContents = streamReader.ReadToEnd().Replace('\u2018', '\'').Replace('\u2019', '\'').Replace('\u201c', '\"').Replace('\u201d', '\"'); 
                //readContents = readContents;//.Replace('\u2018', '\'').Replace('\u2019', '\'').Replace('\u201c', '\"').Replace('\u201d', '\"');
                //myselParabyuser.Value = readContents;
            }

            return readContents;
        }

        protected void btnPrintTypingcert_Click(object sender, EventArgs e)
        {
            int usid = txtUserId.Value != "" ? Convert.ToInt32(txtUserId.Value) : 0;
            usercert(usid,1);
        }


    }
}