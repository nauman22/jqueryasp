using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace jquery1
{
    public class Global : System.Web.HttpApplication
    {
        protected  void Page_Init(object sender, EventArgs e)
        {
            
        }
        protected void Application_Start(object sender, EventArgs e)
        {
                  // Add Routes.
          RegisterCustomRoutes(RouteTable.Routes);
        }

        void RegisterCustomRoutes(RouteCollection routes)
        {
            //   Router.navigate('Category/Online/Mcqs/Category/FreeMcqs' + subid);
            routes.MapPageRoute("Practice", "Practice/Online/Mcqs/Practice/FreeMcqs-{TestId}", "~/default.aspx");
            routes.MapPageRoute("Test", "Test/Online/Mcqs/Test/FreeMcqs-{TestId}", "~/default.aspx");
            routes.MapPageRoute("Category", "Category/Online/Mcqs/Category/FreeMcqs-{TestId}", "~/default.aspx");
            routes.MapPageRoute("Default", "default.aspx", "~/default.aspx");
           // routes.MapPageRoute("check", "hi/hello", "~/General_Pages/PractiseTest.aspx");
         
        }
        
    }
}