using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jquery1.General_Pages
{
    public partial class PractiseTest : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack) 
            {
                var nameValues = HttpUtility.ParseQueryString(Request.QueryString.ToString());
               // nameValues.Set("TestId", "1262");
                var url = Request.Url.AbsolutePath;

                Response.Redirect(url + "?" + nameValues);
                if (Request.QueryString["TestId"] == "" || Request.QueryString["TestId"] == null)
                {
                     nameValues = HttpUtility.ParseQueryString(Request.QueryString.ToString());
                 //   nameValues.Set("TestId", "1262");
                    url = Request.Url.AbsolutePath;
                    var str = "Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/{SubjectName}/{TestName}";

                    Response.Redirect("YOUR_PAGE_HERE");
                }
               
            }
            
        }
    }
}