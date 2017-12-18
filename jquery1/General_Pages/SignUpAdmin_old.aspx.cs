using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace jquery1
{
    public partial class SignUpAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string InsertData(string adminName, string adminPassword, string adminEmail)
        {
            string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            string msg = string.Empty;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("AddUser_Insert", con))
                {
                    Int32 AdminId = 0;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AdminName", adminName);
                    cmd.Parameters.AddWithValue("@AdminPassword", adminPassword);
                    cmd.Parameters.AddWithValue("@AdminEmail", adminEmail);
                    con.Open();

                    AdminId = (Int32)cmd.ExecuteScalar();
                    con.Close();
                    if (AdminId >= 1)
                    {
                        HttpContext.Current.Session["AdminId"] = AdminId;
                        HttpContext.Current.Session["AdminName"] = adminName;
                        msg = "true";
                    }
                    else
                    {
                        msg = "false";
                    }
                   
                }
               
            }
            
            return msg;
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static int CheckUserNameAvailability(string adminEmailCheck)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = connection;
                    cmd.CommandText = "CheckUserNameAvailability";
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter paramUserName = new SqlParameter("@AdminEmail", SqlDbType.NVarChar, 50);
                    paramUserName.Value = adminEmailCheck;
                    cmd.Parameters.Add(paramUserName);
                    connection.Open();
                    int result = Int32.Parse((cmd.ExecuteScalar().ToString()));
                   
                    return result;

                }
            }

        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string SignIn(string SigninEmailCheck, string SignInPassword)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = connection;
                    cmd.CommandText = "sp_SignIn";
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter paramUserName = new SqlParameter("@Email", SigninEmailCheck);
                    cmd.Parameters.Add(paramUserName);

                    SqlParameter paramUserPassword = new SqlParameter("@Password", SignInPassword);
                    cmd.Parameters.Add(paramUserPassword);
                    
                    int result = 0;
                    string adminid = "";
                    connection.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                      //  HttpContext.Current.Session["AdminId"] = 0;
                        //HttpContext.Current.Session["AdminName"] = 0;
                        //HttpContext.Current.Session["AdminEmail"] = 0;
                        //HttpContext.Current.Session["SubUserId"] = 0;
                        //HttpContext.Current.Session["UserName"] = 0;
                        //HttpContext.Current.Session["UserEmail"] = 0;
                        //HttpContext.Current.Session["totalmcqs"] = 0;
                        //HttpContext.Current.Session["totalshortq"] = 0;
                        //HttpContext.Current.Session["totallongq"] = 0;
                        //HttpContext.Current.Session["totalsub"] = 0;
                        //HttpContext.Current.Session["totaltest"] = 0;
                        //HttpContext.Current.Session["totalsubuser"] = 0;
                        

                        rd.Read();
                        Int32 UserRoleId = (Int32)rd["UserRoleId"];
                        
                        switch(UserRoleId){
                                // for super admin
                            case 9:
                                Int32 AdminId = (Int32)rd["AdminId"];
                                string adminIds = HttpUtility.UrlEncode(HttpUtility.UrlEncode(Encrypt(AdminId.ToString())));
                                adminid = "9," + adminIds;
                                break;

                                // for Regular Admin
                            case 8:
                             AdminId = (Int32)rd["AdminId"];
                            //string AdminName = rd["AdminName"].ToString();
                            //string AdminEmail = rd["AdminEmail"].ToString();
                            //string totalmcqs = rd["totalmcqs"].ToString();
                            //string totalshorq = rd["totalshortq"].ToString();
                            //string totallongq = rd["totallongq"].ToString();
                            //string totalsub =   rd["totalsub"].ToString();
                            //string totaltest = rd["totaltest"].ToString();
                            //string totaluser = rd["totalsubuser"].ToString();
                           //HttpContext.Current.Session["AdminId"] = AdminId;
                          adminIds =  HttpUtility.UrlEncode(HttpUtility.UrlEncode(Encrypt(AdminId.ToString())));
                            //HttpContext.Current.Session["AdminName"] = AdminName;
                            //HttpContext.Current.Session["AdminEmail"] = AdminEmail;
                            //HttpContext.Current.Session["totalmcqs"] = totalmcqs;
                            //HttpContext.Current.Session["totalshortq"] = totalshorq;
                            //HttpContext.Current.Session["totallongq"] = totallongq;
                            //HttpContext.Current.Session["totalsub"] = totalsub;
                            //HttpContext.Current.Session["totaltest"] = totaltest;
                            //HttpContext.Current.Session["totalsubuser"] = totaluser;
                         adminid = "8," + adminIds;
                            break;

                            case 3:
                            //Int32 UserId = (Int32)rd["SubUserId"];
                            //string UserName = rd["UserName"].ToString();
                            //string UserEmail = rd["UserEmail"].ToString();
                            //Int32 UserAdminId =(Int32)rd["AdminId"];
                            //HttpContext.Current.Session["SubUserId"] = UserId;
                            //HttpContext.Current.Session["UserName"] = UserName;
                            //HttpContext.Current.Session["UserEmail"] = UserEmail;
                            //HttpContext.Current.Session["UserAdminId"] = UserAdminId;
                            adminid = "3";
                            break;

                            case -1:
                            adminid = "-1";
                            break;
                        }


                       // result = 1;
                        
                        
                       

                        

                    }
                    else
                    {
                        adminid ="0";
                    }
                    //using (connection)
                    //{
                     
                    //    SqlDataReader reader = cmd.ExecuteReader();

                    //    if (reader.HasRows)
                    //    {
                    //        while (reader.Read())
                    //        {
                    //            result = 1;
                    //           // Console.WriteLine("{0}\t{1}", reader.GetInt32(0),
                    //             //   reader.GetString(1));
                    //        }
                    //    }
                    //    else
                    //    {
                    //        result = 0;
                    //        Console.WriteLine("No rows found.");
                    //    }
                    //    reader.Close();
                    //}
                    //int result = Int32.Parse((cmd.ExecuteScalar().ToString()));
                    //int UserRoleId = (Int32)HttpContext.Current.Session["UserRoleId"];
                   // return UserRoleId;
                    return adminid;

                }
            }

        }


        public static string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }
             
    }
}