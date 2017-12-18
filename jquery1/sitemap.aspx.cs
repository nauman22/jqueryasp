using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace jquery1
{
    public partial class sitemap : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
             string constring = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
                cn = new SqlConnection(constring);
                string mydomain = "http://www.freemcqs.com"; //ex : http://www.example.com

                string strSql = "select TestId,TestName,(select SubjectName from tblSubjectInformation where SubjectId = t.SubjectId) as SubjectName from tblTest t where TestDeletebit = 0 ";
                SqlDataAdapter dacontent = new SqlDataAdapter(strSql, cn);
                DataSet dscontent = new DataSet();
                dacontent.Fill(dscontent, "SiteMap"); //here we fill all the products into dataset

                //Now we are going to create XML file using XMLTextWriter

                XmlTextWriter writer = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);
                writer.WriteStartDocument();
                writer.WriteStartElement("urlset", "http://www.sitemaps.org/schemas/sitemap/0.9");

                writer.WriteStartElement("url");

                writer.WriteElementString("loc", mydomain);
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                //Now we loop for creating the XML node for all products
                if (dscontent.Tables[0].Rows.Count > 0)
                {
                    DataRow dtr;
                    int i = 0;
                    while (i < dscontent.Tables[0].Rows.Count)
                    {
                        dtr = dscontent.Tables[0].Rows[i];

                        //Creating the  element
                        writer.WriteStartElement("url");
                        string subname = dtr["SubjectName"].ToString();
                        string testname = dtr["TestName"].ToString();
                        

                        subname = Regex.Replace(subname, @"\s+", "-").Trim();
                        testname = Regex.Replace(testname, @"\s+", "-").Trim();
                        subname = Regex.Replace(subname, @"\&+", "-").Trim();
                        subname = Regex.Replace(subname, @"\%+", "-").Trim();
                        testname = Regex.Replace(testname, @"\&+", "-").Trim();
                        testname = Regex.Replace(testname, @"\%+", "-").Trim();
                        subname = HttpUtility.UrlEncode(subname);
                        testname = HttpUtility.UrlEncode(testname);
                        string testid = "TestId="+dtr["TestId"].ToString();
                        testid = Regex.Replace(testid, @"\s+", "").Trim();
                        writer.WriteElementString("loc", mydomain + "/Practice/Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/" + subname + "/" + testname + "/" + testid);
                        writer.WriteElementString("priority", "1");
                       // writer.WriteEndElement();
                        //writer.WriteStartElement("url");
                        //writer.WriteElementString("loc", mydomain + "/Test/" + subname + "/" + testname + "/" + testid);
                        //writer.WriteElementString("priority", "0.5");

                        //End URL
                        writer.WriteEndElement();


                        i++;
                    }
                }
                writer.WriteEndDocument();
                writer.Close();
        }
            
            catch (Exception ex)
            {

            }
        }
    }
}