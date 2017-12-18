using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace jquery1
{
    /// <summary>
    /// Summary description for TestImg
    /// </summary>
    public class TestImg : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //D:\jquery1\jquery1\TestImg
            const string basePath = @"\\D:\jquery1\jquery1\TestImg\";
            const string baseUrl = @"/jquery1/jquery1/";
            context.Response.ContentType = "text/plain";
            // context.Response.Write("Hello World");
            try
            {
                string dirFullPath = HttpContext.Current.Server.MapPath("~/TestImg/");
                string[] files;
                int numFiles;
                files = System.IO.Directory.GetFiles(dirFullPath);
                numFiles = files.Length;

                numFiles = numFiles + 1;
                string str_image = "";
                string pathToSave_100 = "";
                string CKEditorFuncNum = ""; //= context.Request["CKEditorFuncNum"];
                string fileName = "";
                string json = "";
                string mynewfilename = "";
                Int64 datetimeticks = DateTime.Now.Ticks;
                DateTime formatdate = new DateTime(datetimeticks);
                System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();

                foreach (string s in context.Request.Files)
                {
                    HttpPostedFile file = context.Request.Files[s];

                    fileName = file.FileName;
                    string validTestName = fileName.Remove(0, fileName.Length);
                    // string validImagedate = imageData.Remove(0, 22);
                    validTestName = validTestName.Replace(" ", "_");
                    string extension = System.IO.Path.GetExtension(fileName).Remove(0, 1).ToLower();
                    string fileExtension = file.ContentType;
                    CKEditorFuncNum = context.Request["CKEditorFuncNum"];
                    //  string[] filetypes = { "application/pdf", "image/jpeg", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.ms-excel" };
                    string[] filetypes = { "image/jpeg", "image/jpg", "image/png", "image/gif", "image/bmp" };
                    if (!string.IsNullOrEmpty(fileName))
                    {
                        //string extension = System.IO.Path.GetExtension(filename).Remove(0, 1).ToLower();
                        if (context.Request.Files[0].InputStream.Length > 1048576)
                        {
                            //  string msg = GetResource("Upload_Error_1", culture, "File exceeds maximum size allowed ({0} Mb)");
                            // customer = new { uploaded = "1", fileName = fileName, url = str_image };
                            var customer = new { uploaded = "0", fileName = fileName, url = str_image, error = "This file can't be uploaded due to exceed the maximum size limit (2 MB)" };
                            json = serializer.Serialize(customer);
                        }
                        else if (!filetypes.Contains(file.ContentType))
                        {
                            var customer = new { uploaded = "0", fileName = fileName, url = str_image, error = "This file can't be uploaded. Only Image file allowed." };
                            json = serializer.Serialize(customer);
                        }
                        else
                        {
                            fileExtension = Path.GetExtension(fileName);

                            mynewfilename = validTestName + formatdate.ToString("dd-M-yyyy-HH-mm-ss") + fileExtension;
                            //  str_image = "MyPHOTO_" + numFiles.ToString() + fileExtension;
                            pathToSave_100 = HttpContext.Current.Server.MapPath("~/TestImg/") + mynewfilename;
                            //   Server.MapPath("~/Uploads/User_" + userId + "/");
                            // str_image = "http:/TestImg/" + mynewfilename;
                            str_image = "http://localhost:34128/TestImg/" + mynewfilename;
                            //  str_image = string.Format("{0}/{1}", HttpContext.Current.Server.MapPath("~/TestImg/"), fileName);
                            file.SaveAs(pathToSave_100);

                            //   var customer = new {  fileName = mynewfilename };
                            json = mynewfilename; //serializer.Serialize(mynewfilename);
                        }

                    }
                }
                //  database record update logic here  ()
                //string url = basePath + fileName;
                //context.Response.Write("<script>window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ", \"" + url + "\");</script>");
                //context.Response.End();   

                //var customer = new { uploaded = "1", fileName = fileName, url = str_image };
                //string json = serializer.Serialize(customer);

                //context.Response.ContentType = "application/json";
                // context.Response.Charset = "UTF-8";
                context.Response.Write(json);
                // context.Response.Write(str_image);
                context.Response.End();
                // return (pathToSave_100);
            }
            catch (Exception ac)
            {

            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}