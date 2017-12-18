using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace jquery1
{
    public partial class WebSite_data : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (WebClient client = new WebClient())
            {
                //string s = "";
                string appURL = "http://lms1.vu.edu.pk";
                string strPostData = String.Format("26txtStudentID={0}&txtPassword={1}",
                "ms150400193", "eqt2a2ypq");
                // Setup the http request.      
                HttpWebRequest wrWebRequest = WebRequest.Create(appURL) as
                HttpWebRequest;
                wrWebRequest.Method = "post";
                wrWebRequest.ContentLength = strPostData.Length;
                wrWebRequest.ContentType = "application/x-www-form-urlencoded";
                CookieContainer cookieContainer = new CookieContainer();
                wrWebRequest.CookieContainer = cookieContainer;
                // Post to the login form.      
                StreamWriter swRequestWriter = new
                StreamWriter(wrWebRequest.GetRequestStream());
                swRequestWriter.Write(strPostData);
                swRequestWriter.Close();
                // Get the response.      
                HttpWebResponse hwrWebResponse = (HttpWebResponse)wrWebRequest.GetResponse();
                // Read the response      
                StreamReader srResponseReader = new
                StreamReader(hwrWebResponse.GetResponseStream());
                string strResponseData = srResponseReader.ReadToEnd();
                srResponseReader.Close();

                Response.Write(strResponseData);
                return;// cookieContainer;
                HttpWebRequest request;
HttpWebResponse response;
CookieContainer cookies;
Response.Redirect("http://lms1.vu.edu.pk");
return;
//%5B%22log%22%2C%22http%3A//lms1.vu.edu.pk/LMS_LandingPage.aspx%3Fid%3D2e22945e-9f23-402a-aa1d-10e6230a6a52%26__VIEWSTATE%3Dgu7y9dlirifj4c45lh5cLWQ2qhxLXtxO7EgrfjzgX3DTckKei4xKlOp7aLIetjX%252Bek69IauyuJs%252BqC%252F8uMPB9KyuvME3Gyrakh6QKmu9LAWIeDCn3Af3NE23vKv4Wgn68cGRqyyjWN4Ix%252FaSRhPiDUgOwLYZEPW%252FDe32lSU7fBIZY5HgRVMNeYfNTmfqUqjHZ8SDfSoqOYEbBL7H54D4f2qgvhkr9yofpqJ1TYUpArgrlo%252BjiQbJu8nl2CAFWVGfx7uQxiJGeQtUKEPuSkXXWzWpPlQp%252BsqwOJz8srSWmQPzkOdCopGln26ZbFnlchFrM1v1%252B3o%252Ft0ZKNCBrT2adWRfoG1Sq5TURDrfcq4tMj9sMsfL58ll4dreby4mlVcYHRcYgQASqXeSmiYR29%252B54%252Fewlqq1mQQvhZjYiFZXv60XsJVnien6%252B7zG%252FIWQKV0P8%252B8OAqMyvOixqMjeiSUVRVFYxY140lWtBK3%252BoN75F7LIfS75YyvFAEJ8gtx8C5ppb%252B8IZR2Uq7OyRfP11IwxpRmbNtMcNRGZ1414Kh32I1bppR4scoNJhHhSIycCXzdqTO88OUQi%252B7V7Gd2fxI5JgCSiLTJIIkb29pgpHU64eX%252BEPegfIMSJGRDAFalG96MZbo2qijCH9MEJYOhcXF4Ybfut8ykJO3fyB7Kif69t%252F03iWJtRJqn3Fehm61Y73VIq7tb68AvfA1pH2JdvFukoYA%252FJmjtp9za75NXaTvhVpfgAHy6nFBEyw4%252Fn5GvQ%252FdZjfyXces5EHYb%252F4a1HuyscLClnU%252FDbnmw9VIWgF5qMlieBCWlU8f0IwiZrQRgOu7Psa%26__VIEWSTATEGENERATOR%3D15B8C694%26__EVENTTARGET%3D%26__EVENTARGUMENT%3D%26txtStudentID%3Dms150400193%26txtPassword%3D7yrc2uapq%26ibtnLogin.x%3D54%26ibtnLogin.y%3D6%26hdfFailedAttemptsCount%3D%22%5D
string url = string.Format("http://lms1.vu.edu.pk/LMS_LandingPage.aspx?id=44eee1da-e72e-403f-bba9-35d6733fff6c&__VIEWSTATE=8TZ8ULwPnlURXhGTCiAgsByfY6XzRsbZTc2F0zIguLXPNAgEBdUfU4rjJL4PrHVS90PfsLfFDvf5FLfQ7gdrdHB5bKmNyexgWFmn7YDKxwKUf9KIuy4gQG5olI866q4qWRb037Nb1DlJKJmyYMNoD4Kvb5%2F%2FIpoOwQaXBq9LFNAWpAxWvP1MpUCnU5PEVG636gYQb3%2FJ3EthWu3JjwARc76qv8hQbbQUTH3sDOHOvc37DcjCzVMmtBjhvYDDKyt2NH8OxhPH56pWNzQXaQ7vp5DmWj2Ij83nBC4wFSy29BoxRwPpdu7yl6aUAV37LWkLdQWajejd4SwBTgGNnzZveO9uC0AWOrpGoWMV7C4CuYQpqe6cJ9QatIaQsvL6FHc4ARGA7CpW37CjjvelE%2Bp00Bj7O38nlJ%2BCCNNgiRV%2B%2F5MRHKAP%2B18gRKxXCO4ry9LdX9BGQ3bt52%2FGojiU6%2FhbuXU7NAuMfM9l3kUOYH1a1UKTL2J1l5fvGy2DtpMYFHZA1uitvs357iGHHWrpqoqHcbF99WjtDN2Q2LvvhprCvn4%2FLPUZ%2BRUNOcrSeylLeklzLjQnZ0HjK9EROH5HV8aggKbqhdTkSPkNKZBafzPQPofglHNWF%2FU2sVUv0QBC23eNZ5DXAfllXbZUp0%2FfNYOBHkJnOzEYUyModJxOZfTBlI8y8XWyL2Tkiq%2FRDEsmnnVJlR8end4hn1dDLsgKaV7nChHsyrTxTAGci2rLQtBE5Ah8C8RrNjOcRQXJFo%2B%2FsgybLnbee2ii3lrZ3QmjAGeGVy%2FtURLUTky25zP10UvaaXzvtjmh%2B8kv2z85VnSpvSE1zeSh4u9sZK0sLWIyniWkFT9XI2Lq5NZb%2FMYI7TT9NzDR9z%2BboJlt90se06ncxF%2FyL01cVqakMmpLRMAOZzsv9w%3D%3D&__VIEWSTATEGENERATOR=15B8C694&__EVENTTARGET=&__EVENTARGUMENT=&txtStudentID={0}&txtPassword={1}&ibtnLogin.x=47&ibtnLogin.y=44&hdfFailedAttemptsCount=3D225D", "ms150400193", "eqt2a2ypq");
request = (HttpWebRequest)WebRequest.Create(url);
request.AllowAutoRedirect = false;
request.CookieContainer = new CookieContainer();
response = (HttpWebResponse)request.GetResponse();
//if (response.StatusCode != HttpStatusCode.Found)
//{
////ToDo: if the page wasn't found raise Exception
////instead of this textmessage
//MessageBox.Show("Something Wrong");
//response.Close();
//request.KeepAlive = false;
//return;
//}
cookies = request.CookieContainer;
response.Close();
Response.Redirect("http://lms1.vu.edu.pk/WebTop/Home.aspx?id=1196d6c8-f72c-49c1-b029-41a2cc848374");
//request = (HttpWebRequest)WebRequest.Create("http://lms1.vu.edu.pk/WebTop/Home.aspx?body=http://lms1.vu.edu.pk/Profile/StudentProfile.aspx");
//request.AllowAutoRedirect = false;
//request.CookieContainer = cookies;
//response = (HttpWebResponse)request.GetResponse();
//using (Stream s = response.GetResponseStream())
//{
//StreamReader sr = new StreamReader(s);
//string line;
//while (!sr.EndOfStream)
//{
////todo read the page contents
//}}
             //   string m = @"<div id=""question-header"">\s*(.+?)\s*</div>";
               // string s = client.DownloadString("http://lms1.vu.edu.pk/Default.aspx");
string s = client.DownloadString("http://lms1.vu.edu.pk/WebTop/Home.aspx?id=1196d6c8-f72c-49c1-b029-41a2cc848374");
               Response.Write(GetTitle(s));
                all.Text = GetTitle(s);
                //string input = "/content/alternate-1.aspx";

                // Here we call Regex.Match.
               // Match match = Regex.Match(s, @"<div id='hlogo'>.*</div>",
                //    RegexOptions.IgnoreCase);

                // Here we check the Match instance.
                //if (match.Success)
                //{
                //    // Finally, we get the Group value and display it.
                //    string key = match.Value;

                //    mydiv.InnerHtml = key.ToString();
                //    //Console.WriteLine(key);
                //}

                //string b = s.Substring(0, 5);

                

            }
        }
          static string GetTitle(string file)
            {
                Match m = Regex.Match(file, @" <span id=""lblStdId"">\s*(.+?)\s*</span>");
	        if (m.Success)
	        {
	            return m.Groups[1].Value;
	        }
	        else
	        {
	            return "Not Matched !";
	        }
            }
}
    
}