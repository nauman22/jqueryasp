using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Text.RegularExpressions;


namespace jquery1.SecurePages
{
    public partial class ResultCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            List<ShowMcqs> exampleList = new List<ShowMcqs>();
            exampleList = HttpContext.Current.Session["data"] as List<ShowMcqs>;
            exampleList.RemoveAt(exampleList.Count - 1);
            //pdf_ResultCard(exampleList);
            i(exampleList);
        }
        public void i(List<ShowMcqs> data)
        {
            iTextSharp.text.Rectangle rec = new iTextSharp.text.Rectangle(PageSize.A4);
            // Page Size with Margins
            Document doc = new Document(rec, 36, 36, 36, 36);
            var output = new FileStream (Server.MapPath("../pdfs/Doc1.pdf"),FileMode.Create);
            string path = Server.MapPath("../pdfs");
            string filename = path + "/Doc1.pdf";
            // Saving File Path
            PdfWriter writer = PdfWriter.GetInstance(doc,output);
            doc.Open();
            doc.AddHeader ("Header Text","Hello I am Header");
            Font Heading = FontFactory.GetFont(FontFactory.HELVETICA, 16, Font.BOLDITALIC);
            Font titleFont = FontFactory.GetFont("Arial", 18);
            Font regularFont = FontFactory.GetFont("Arial", 8);
            Font regularFont_question = FontFactory.GetFont("Arial", 9);
            Font boldFont = FontFactory.GetFont("Arial", 8,Font.BOLD);
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



            title = new Paragraph("Freemcqs.com Test Certificate, | " + DateTime.Now.ToString("dd-MMM-yyyy") + " | Freemcqs.com", titleFont_u);
            title.Alignment = Element.ALIGN_CENTER;
            doc.Add(title);

            //text = new Paragraph("Result Card No: "+"1234567",regularFont);
            //doc.Add(text);

            PdfPCell infocell = new PdfPCell(new Phrase("Result Card", titleFont));
            infocell.Colspan = 4;
            infocell.HorizontalAlignment = 1;
            infocell.PaddingLeft = 69f;
            infocell.Border = 0;
            
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
            int totaluserattempt =  data.AsEnumerable().Sum(o => o.IsuserAttempt);
            int obmarks = data.AsEnumerable().Sum(o => o.Isusercorrect);
            decimal percentage = ((decimal)obmarks/(decimal)totalq)*100;
            float perc = float.Parse(Math.Round(percentage, 2).ToString());
            string status = "";
            if(perc >= 40)
            {
                status = "PASSED";
            }
            else
            {
                status = "FAILED---- What do you want? limit your Challenges? or Challenge you limits.";
            }
            string Remarks = "";
            
            if (perc > 90)
            {
                Remarks = "Outstanding of Marks--Exceptional";
            }
            else if(perc > 80)
            {
                Remarks = "Excellent";
            }
            else if (perc > 70)
            {
                Remarks = "Very Good";
            }
            else if (perc > 60)
            {
                Remarks = "Good";
            }
            else if (perc > 50)
            {
                Remarks = "Fair";
            }
            else if (perc > 40)
            {
                Remarks = "Satisfactory";
            }
            else if (perc < 40)
            {
                Remarks = "Poor";
            }
            //string 
            foreach (ShowMcqs prop in data)
            {
                attempted = attempted + prop.IsuserAttempt;
                string myattempt = attempted.ToString();
                if (head == 0) 
                {
                
                
            infocell = new PdfPCell(new Phrase("Candidate Name: ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Anonymous", boldFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase("Subject: ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(prop.SubjectName, boldFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

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
            infocell.Colspan = 4;
            infocell.Border = 0;
            //infocell.EnableBorderSide(4);
           // infocell.Width = 10f;
            infocell.PaddingTop = -30;
            infocell.FixedHeight = 10f;
            infocell.PaddingLeft = 105f;
            infocell.HorizontalAlignment = 1;
          //  tblinfo.AddCell(infocell);

           

            infocell = new PdfPCell(new Phrase("Total Questions: ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(data.Count.ToString(), boldFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("Attempted Questions: ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);


            infocell = new PdfPCell(new Phrase(totaluserattempt.ToString(), boldFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
               
            infocell = new PdfPCell(new Phrase("Total Marks: ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(data.Count.ToString(), boldFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("Obtained Marks: ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(obmarks.ToString(), boldFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("Percentage: ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(perc.ToString()+"%", boldFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("Status: ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(status, boldFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);

            infocell = new PdfPCell(new Phrase("Remarks: ", regularFont));
            infocell.Colspan = 1;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            infocell = new PdfPCell(new Phrase(Remarks, boldFont));
            infocell.Colspan = 3;
            infocell.Border = 0;
            tblinfo.AddCell(infocell);
            doc.Add(tblinfo);
           // text = new Paragraph("Details", regularFont);
                
           // doc.Add(text);
            
            cell.Colspan = 1;
            cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
            table.AddCell(cell);
            cell = new PdfPCell(new Phrase("Question Details", titleFont_u));
            cell.Colspan = 1;
            cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
            cell.VerticalAlignment = 1;
            table.AddCell(cell);
            cell = new PdfPCell(new Phrase("Total Marks", regularFont));
            cell.Colspan = 1;
            cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
            table.AddCell(cell);
            cell = new PdfPCell(new Phrase("Obtained Marks", regularFont));
            cell.Colspan = 1;
            cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
            table.AddCell(cell);
            
            }
                ++head;
                cell = new PdfPCell(new Phrase((++serialno).ToString(), regularFont));
            cell.FixedHeight = 1f;

            cell.Colspan = 1;
            cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
            table.AddCell(cell);

            PdfPTable Qtable = new PdfPTable(5);
            float[] Qwidths = new float[] { 5f, 1f, 5f, 7f,7f };
            Qtable.SetWidths(Qwidths);
            PdfPCell qcell = new PdfPCell();
            qcell.Border = 0;
                if(prop.QuestionText != null)
                {
                    qcell = new PdfPCell(new Paragraph(Regex.Replace((prop.QuestionText), @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim(), regularFont_question));
                }
                else
                {
                    qcell = new PdfPCell(new Paragraph("No Question Found", regularFont_question));
                }
               
                qcell.Colspan = 5;
                qcell.Border = 0;
                Qtable.AddCell(qcell);

                // qcell.BorderColor = iTextSharp.text.BaseColor.LIGHT_GRAY;


                qcell = new PdfPCell(new Paragraph("Option 1", regularFont));
                qcell.Colspan = 1;
                qcell.HorizontalAlignment = 1;
                //qcell.BorderColor = iTextSharp.text.BaseColor.LIGHT_GRAY;
                Qtable.AddCell(qcell);

                if (prop.Option1Text != null)
                {
                    qcell = new PdfPCell(new Paragraph(Regex.Replace(prop.Option1Text, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim(), regularFont));
                }
                else
                {
                    qcell = new PdfPCell(new Paragraph("No option found!", regularFont));
                }
                
                qcell.Colspan = 4;
                Qtable.AddCell(qcell);

                qcell = new PdfPCell(new Paragraph("Option 2", regularFont));
                qcell.Colspan = 1;
                qcell.HorizontalAlignment = 1;
                // qcell.BorderColor = iTextSharp.text.BaseColor.LIGHT_GRAY;
                Qtable.AddCell(qcell);

                if (prop.Option2Text != null)
                {
                    qcell = new PdfPCell(new Paragraph(Regex.Replace(prop.Option2Text, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim(), regularFont));
                }
                else
                {
                    qcell = new PdfPCell(new Paragraph("No option found!", regularFont));
                }

                
                qcell.Colspan = 4;
                Qtable.AddCell(qcell);
                if (prop.op3 == true)
                {
                qcell = new PdfPCell(new Paragraph("Option 3", regularFont));
                qcell.Colspan = 1;
                qcell.HorizontalAlignment = 1;
                Qtable.AddCell(qcell);

                if (prop.Option3Text != null)
                {
                    qcell = new PdfPCell(new Paragraph(Regex.Replace(prop.Option3Text, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim(), regularFont));
                }
                else
                {
                    qcell = new PdfPCell(new Paragraph("", regularFont));
                }
                  
                    qcell.Colspan = 4;
                    Qtable.AddCell(qcell);
                    
                }
                if (prop.op4 == true)
                {
                    qcell = new PdfPCell(new Paragraph("Option 4", regularFont));
                    qcell.Colspan = 1;
                    qcell.HorizontalAlignment = 1;
                    Qtable.AddCell(qcell);
                    if (prop.Option4Text != null)
                    {
                        qcell = new PdfPCell(new Paragraph(Regex.Replace(prop.Option4Text, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim(), regularFont));
                    }
                    else
                    {
                        qcell = new PdfPCell(new Paragraph("", regularFont));
                    }
                    qcell.Colspan = 4;
                   
                    Qtable.AddCell(qcell);
                }
                qcell = new PdfPCell(new Paragraph("User Selected Option", regularFont));
                qcell.Colspan = 1;
                Qtable.AddCell(qcell);
                string userselop = "";
                if (prop.userselectedoption == 1)
                {
                    if (prop.Option1Text != null)
                    {
                        userselop = Regex.Replace(prop.Option1Text, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim();
                    }
                    else
                    {
                        userselop ="";
                    }
                    
                }
                else if (prop.userselectedoption == 2)
                {
                    if (prop.Option2Text != null)
                    {
                        userselop = Regex.Replace(prop.Option2Text, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim();
                    }
                    else
                    {
                        userselop = "";
                    }
                   
                }
                else if (prop.userselectedoption == 3)
                {
                    if (prop.Option3Text != null)
                    {
                        userselop = Regex.Replace(prop.Option3Text, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim();
                    }
                    else
                    {
                        userselop = "";
                    }
                    
                }
                else if (prop.userselectedoption == 4)
                {
                    if (prop.Option4Text != null)
                    {
                        userselop = Regex.Replace(prop.Option4Text, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim();
                    }
                    else
                    {
                        userselop = "";
                    }
                    
                }
                else if (prop.userselectedoption == 5)
                {
                    if (prop.Option5Text != null)
                    {
                        userselop = Regex.Replace(prop.Option5Text, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim();
                    }
                    else
                    {
                        userselop = "";
                    }
                   
                }
                qcell = new PdfPCell(new Paragraph(prop.userselectedoption.ToString(), regularFont));
                qcell.Colspan = 1;
                qcell.HorizontalAlignment = 1;
                Qtable.AddCell(qcell);
                qcell = new PdfPCell(new Paragraph(Regex.Replace(userselop, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim(), regularFont));
                qcell.Colspan = 3;
                Qtable.AddCell(qcell);
                qcell = new PdfPCell(new Paragraph("Correct Option", boldFont));
                qcell.Colspan = 1;
                Qtable.AddCell(qcell);
                int correctop = 0;
                string correctoptext = "";
                if (prop.Option1Correct == true)
                {
                    correctop = 1;
                    correctoptext = prop.Option1Text;
                }
                else if (prop.Option2Correct == true)
                {
                    correctop = 2;
                    correctoptext = prop.Option2Text;
                }
                else if (prop.Option3Correct == true)
                {
                    correctop = 3;
                    correctoptext = prop.Option3Text;
                }
                else if (prop.Option4Correct == true)
                {
                    correctop = 4;
                    correctoptext = prop.Option4Text;
                }
                else if (prop.Option5Correct == true)
                {
                    correctop = 5;
                    correctoptext = prop.Option5Text;
                }
                qcell = new PdfPCell(new Paragraph(correctop.ToString(), boldFont));
                qcell.Colspan = 1;
                qcell.HorizontalAlignment = 1;
                Qtable.AddCell(qcell);
                if (correctoptext != null)
                {
                    qcell = new PdfPCell(new Paragraph(Regex.Replace(correctoptext, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim(), boldFont));
                }
                else
                {
                    qcell = new PdfPCell(new Paragraph("", regularFont));
                }
                //qcell = new PdfPCell(new Paragraph(Regex.Replace(correctoptext, @"<[^>]+>|&nbsp;", "").Replace("\"", "").Trim(), boldFont));
                qcell.Colspan = 3;
                Qtable.AddCell(qcell);

                int isuserco = 0;
               
                if (correctop == prop.userselectedoption)
                {
                    ++getmarks;
                    isuserco = 1;
                    totalmarks = totalmarks + 1;
                }
                // cell = new PdfPCell(Question + Environment.NewLine + option1 + Environment.NewLine + option2 + Environment.NewLine + "3." + Environment.NewLine + "4. " + Environment.NewLine + "User Selected Option: " + "" + Environment.NewLine + "Correct Option: " + "");
                cell = new PdfPCell(Qtable);
                cell.Colspan = 1;
                cell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
                table.AddCell(cell);
                cell = new PdfPCell(new Phrase("1", regularFont));
                cell.Colspan = 1;
                cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                table.AddCell(cell);
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

                doc.Close();
                ShowPdf(filename);
            
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
        public  void pdf_ResultCard(List<ShowMcqs> data)
        {
            iTextSharp.text.Rectangle rec = new iTextSharp.text.Rectangle(PageSize.A4);
            Document doc = new Document(rec, 36, 72, 3, 180);
            string path = Server.MapPath("/pdfs");
            string filename = path + "/Doc1.pdf";
            if (data.Count > 0)
            {
                doc.Open();
                var output = new FileStream(Server.MapPath("../pdfs/Doc1.pdf"), FileMode.Create);

                // Saving File Path
                PdfWriter writer = PdfWriter.GetInstance(doc, output);

              //  List<ShowMcqs> data = new List<ShowMcqs>();
                string userselop = "";
                int correctop = 0;
                string correctoptext = "";
                int getmarks = 0;
                int totalmarks = 0;
                foreach (ShowMcqs prop in data)
                {




                    #region Start PDF Result Card


                    iTextSharp.text.Font Heading = FontFactory.GetFont(FontFactory.HELVETICA, 16, iTextSharp.text.Font.BOLDITALIC);
                    iTextSharp.text.Font titleFont = FontFactory.GetFont("Arial", 18);
                    iTextSharp.text.Font regularFont = FontFactory.GetFont("Arial", 8);
                    iTextSharp.text.Font boldFont = FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.BOLD);
                    Paragraph title;
                    Paragraph text;

                    PdfPTable table = new PdfPTable(4);
                    PdfPTable tblinfo = new PdfPTable(4);
                    tblinfo.TotalWidth = 550f;
                    table.TotalWidth = 550f;
                    //fix the absolute width of the table
                    table.LockedWidth = true;
                    //relative col widths in proportions - 1/3 and 2/3
                    float[] widths = new float[] { 1f, 19f, 1f, 1f };
                    float[] widths1 = new float[] { 5f, 5f, 5f, 7f };
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
                    PdfPCell cell = new PdfPCell(new Phrase("Serial No.", regularFont));
                    cell.FixedHeight = 1f;



                    title = new Paragraph("McqsTest.com", titleFont);
                    title.Alignment = Element.ALIGN_CENTER;
                    doc.Add(title);

                    text = new Paragraph("Result Card No: " + "1234567", regularFont);
                    doc.Add(text);

                    PdfPCell infocell = new PdfPCell(new Phrase("Result Card", regularFont));
                    infocell.Colspan = 4;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);


                    //infocell = new PdfPCell(new Phrase("", regularFont));
                    //infocell.Colspan = 2;
                    //tblinfo.AddCell(infocell);

                    infocell = new PdfPCell(new Phrase("Candidate Name: ", regularFont));
                    infocell.Colspan = 1;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase("Nauman Ahmad", boldFont));
                    infocell.Colspan = 3;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase("Subject: ", regularFont));
                    infocell.Colspan = 1;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase(prop.SubjectName, boldFont));
                    infocell.Colspan = 3;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);

                    infocell = new PdfPCell(new Phrase("Test: ", regularFont));
                    infocell.Colspan = 1;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase(prop.TestName, boldFont));
                    infocell.Colspan = 2;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);

                   // iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(HttpContext.Current.Server.MapPath("/All_Images/NoImage.gif"));
                  //  jpg.ScaleToFit(350f, 350f);
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
                    ////infocell.EnableBorderSide(4);
                    ////infocell.Width = 10f;
                    //infocell.PaddingTop = -30;
                    //infocell.FixedHeight = 10f;
                    //infocell.PaddingLeft = 105f;
                    //infocell.HorizontalAlignment = 1;
                    //tblinfo.AddCell(infocell);



                    infocell = new PdfPCell(new Phrase("Total Questions: ", regularFont));
                    infocell.Colspan = 1;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase(data.Count.ToString(), boldFont));
                    infocell.Colspan = 3;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);

                    infocell = new PdfPCell(new Phrase("Attempted Questions: ", regularFont));
                    infocell.Colspan = 1;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase("10", boldFont));
                    infocell.Colspan = 3;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);

                    infocell = new PdfPCell(new Phrase("Total Marks: ", regularFont));
                    infocell.Colspan = 1;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase(data.Count.ToString(), boldFont));
                    infocell.Colspan = 3;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);

                    infocell = new PdfPCell(new Phrase("Obtained Marks: ", regularFont));
                    infocell.Colspan = 1;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase("8", boldFont));
                    infocell.Colspan = 3;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);

                    infocell = new PdfPCell(new Phrase("Percentage: ", regularFont));
                    infocell.Colspan = 1;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase("80%", boldFont));
                    infocell.Colspan = 3;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);

                    infocell = new PdfPCell(new Phrase("Status: ", regularFont));
                    infocell.Colspan = 1;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase("PASSED", boldFont));
                    infocell.Colspan = 3;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);

                    infocell = new PdfPCell(new Phrase("Remarks: ", regularFont));
                    infocell.Colspan = 1;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    infocell = new PdfPCell(new Phrase("Excellent", boldFont));
                    infocell.Colspan = 3;
                    infocell.Border = 0;
                    tblinfo.AddCell(infocell);
                    doc.Add(tblinfo);
                    text = new Paragraph("Details", regularFont);
                    doc.Add(text);

                    cell.Colspan = 1;
                    cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                    table.AddCell(cell);
                    cell = new PdfPCell(new Phrase("Question Details", regularFont));
                    cell.Colspan = 1;
                    cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                    table.AddCell(cell);
                    cell = new PdfPCell(new Phrase("Total Marks", regularFont));
                    cell.Colspan = 1;
                    cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                    table.AddCell(cell);
                    cell = new PdfPCell(new Phrase("Obtained Marks", regularFont));
                    cell.Colspan = 1;
                    cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                    table.AddCell(cell);

                    cell = new PdfPCell(new Phrase("1", regularFont));
                    cell.FixedHeight = 1f;

                    cell.Colspan = 1;
                    cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                    table.AddCell(cell);

                    PdfPTable Qtable = new PdfPTable(5);
                    float[] Qwidths = new float[] { 5f, 1f, 5f, 7f, 7f };
                    Qtable.SetWidths(Qwidths);
                    PdfPCell qcell = new PdfPCell();
                    qcell.Border = 0;
                    // qcell.BorderColor = iTextSharp.text.BaseColor.LIGHT_GRAY;
                    qcell = new PdfPCell(new Paragraph(prop.QuestionText, regularFont));
                    qcell.Colspan = 5;
                    qcell.Border = 0;
                    Qtable.AddCell(qcell);

                    qcell = new PdfPCell(new Paragraph("1", regularFont));
                    qcell.Colspan = 1;
                    //qcell.BorderColor = iTextSharp.text.BaseColor.LIGHT_GRAY;
                    Qtable.AddCell(qcell);

                    qcell = new PdfPCell(new Paragraph(prop.Option1Text, regularFont));
                    qcell.Colspan = 4;
                    Qtable.AddCell(qcell);

                    qcell = new PdfPCell(new Paragraph("2", regularFont));
                    qcell.Colspan = 1;
                    // qcell.BorderColor = iTextSharp.text.BaseColor.LIGHT_GRAY;
                    Qtable.AddCell(qcell);

                    qcell = new PdfPCell(new Paragraph(prop.Option2Text, regularFont));
                    qcell.Colspan = 4;
                    Qtable.AddCell(qcell);
                    qcell = new PdfPCell(new Paragraph("3", regularFont));
                    qcell.Colspan = 1;
                    Qtable.AddCell(qcell);

                    qcell = new PdfPCell(new Paragraph(prop.Option3Text, regularFont));
                    qcell.Colspan = 4;
                    Qtable.AddCell(qcell);
                    qcell = new PdfPCell(new Paragraph("4", regularFont));
                    qcell.Colspan = 1;
                    Qtable.AddCell(qcell);

                    qcell = new PdfPCell(new Paragraph(prop.Option4Text, regularFont));
                    qcell.Colspan = 4;
                    Qtable.AddCell(qcell);
                    qcell = new PdfPCell(new Paragraph("User Selected Option", regularFont));
                    qcell.Colspan = 1;
                    Qtable.AddCell(qcell);

                    if (prop.userselectedoption == 1)
                    {
                        userselop = prop.Option1Text;
                    }
                    else if (prop.userselectedoption == 2)
                    {
                        userselop = prop.Option2Text;
                    }
                    else if (prop.userselectedoption == 3)
                    {
                        userselop = prop.Option3Text;
                    }
                    else if (prop.userselectedoption == 4)
                    {
                        userselop = prop.Option4Text;
                    }
                    else if (prop.userselectedoption == 5)
                    {
                        userselop = prop.Option5Text;
                    }
                    qcell = new PdfPCell(new Paragraph(prop.userselectedoption.ToString(), regularFont));
                    qcell.Colspan = 1;
                    Qtable.AddCell(qcell);
                    qcell = new PdfPCell(new Paragraph(userselop, regularFont));
                    qcell.Colspan = 3;
                    Qtable.AddCell(qcell);

                    if (prop.Option1Correct == true)
                    {
                        correctop = 1;
                        correctoptext = prop.Option1Text;
                    }
                    else if (prop.Option2Correct == true)
                    {
                        correctop = 2;
                        correctoptext = prop.Option2Text;
                    }
                    else if (prop.Option3Correct == true)
                    {
                        correctop = 3;
                        correctoptext = prop.Option3Text;
                    }
                    else if (prop.Option4Correct == true)
                    {
                        correctop = 4;
                        correctoptext = prop.Option4Text;
                    }
                    else if (prop.Option5Correct == true)
                    {
                        correctop = 5;
                        correctoptext = prop.Option5Text;
                    }
                    qcell = new PdfPCell(new Paragraph("Correct Option", boldFont));
                    qcell.Colspan = 1;
                    Qtable.AddCell(qcell);
                    qcell = new PdfPCell(new Paragraph(correctop.ToString(), boldFont));
                    qcell.Colspan = 1;
                    Qtable.AddCell(qcell);
                    qcell = new PdfPCell(new Paragraph(correctoptext, boldFont));
                    qcell.Colspan = 3;
                    Qtable.AddCell(qcell);


                    if (correctop == prop.userselectedoption)
                    {
                        getmarks = 1;
                        totalmarks = totalmarks + 1;
                    }
                    // cell = new PdfPCell(Question + Environment.NewLine + option1 + Environment.NewLine + option2 + Environment.NewLine + "3." + Environment.NewLine + "4. " + Environment.NewLine + "User Selected Option: " + "" + Environment.NewLine + "Correct Option: " + "");
                    cell = new PdfPCell(Qtable);
                    cell.Colspan = 1;
                    cell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
                    table.AddCell(cell);
                    cell = new PdfPCell(new Phrase("1", regularFont));
                    cell.Colspan = 1;
                    cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
                    table.AddCell(cell);
                    cell = new PdfPCell(new Phrase(getmarks.ToString(), regularFont));
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
                    iTextSharp.text.Font fontNormal = new iTextSharp.text.Font(FontFactory.GetFont("Arial", 8, iTextSharp.text.Font.BOLD));
                    text = new Paragraph(new Phrase("Authority Signature                                                                                                                                        Candidate Signature" + Environment.NewLine + "____________________                                                                                                                               _______________________ " + " ", fontNormal));
                    text.Alignment = 0;
                    //0=Left, 1=Centre, 2=Right
                    doc.Add(text);
                    //text = new Paragraph(new Phrase("Candidate Signature" + Environment.NewLine + " ____________________", fontNormal));
                    //text.Alignment = 2;
                    ////0=Left, 1=Centre, 2=Right
                    //doc.Add(text);
                    #endregion
                }
            }


            doc.Close();
            ShowPdf(filename);
        }

    }
}