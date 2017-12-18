
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
namespace jquery1
{
    public partial class MakePdf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            i();
        }
        public void i()
        {
            iTextSharp.text.Rectangle rec = new iTextSharp.text.Rectangle(PageSize.A4);
            // Page Size with Margins
            Document doc = new Document(rec, 36, 72, 3, 180);
            var output = new FileStream(Server.MapPath("pdfs/Doc1.pdf"), FileMode.Create);
            string path = Server.MapPath("pdfs");
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




            title = new Paragraph("Freemcqs.com Test Certificate, | " + DateTime.Now.ToString("dd-MMMM-yyyy")+" | Freemcqs.com", titleFont_u);
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
            infocell = new PdfPCell(new Phrase("Nauman Ahmad", Heading));
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
            infocell = new PdfPCell(new Phrase("An Aplecopse is running", regularFont));
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
            infocell = new PdfPCell(new Phrase("25-Oct-2016 07:43 PM", regularFont));
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
            infocell = new PdfPCell(new Phrase("01:00 min.", regularFont));
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
            infocell = new PdfPCell(new Phrase("01:00 min.", regularFont));
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
            infocell = new PdfPCell(new Phrase("46 wpm", regularFont));
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
            infocell = new PdfPCell(new Phrase("98%", regularFont));
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
            infocell = new PdfPCell(new Phrase("45 wpm", regularFont));
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
            infocell = new PdfPCell(new Phrase("46", regularFont));
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
            infocell = new PdfPCell(new Phrase("5 (5 errors * 5)", regularFont));
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
            infocell = new PdfPCell(new Phrase("45 ", regularFont));
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
    }
}