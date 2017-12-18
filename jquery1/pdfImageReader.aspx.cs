using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jquery1
{
    public partial class pdfImageReader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string answers = @"1. B 2. D 3. D 4. A 5. C 6. A
7. B 8. B 9. A 10. C 11. C 12. A
13. B 14. B 15. D 16. B 17. B 18. A
19. A 20. D 21. B 22. B 23. A 24. A
25. A 26. D 27. D 28. D 29. D 30. A
31. D 32. C 33. D 34. B 35. D 36. C
37. C 38. D 39. C 40. A";


            //var alphabet = new List<string>();
            //string[] questionsplit = Regex.Split(answers, "([A-Z]+)");
            //int i = 1;
            //int j = 0;
            //int k = 0;
            //for (i = 0; i < questionsplit.Length-2; i++)
            //{
            //  if (i%2 == 0)
            //        {
            //            j = i + 1;
            //            lblText.Text += "The Correct Answer of option No. " + questionsplit[i] + " is " + questionsplit[j] + "<br />";
            //        }
            //        else
            //  {
            //      i = i + 1;
            //      j = i + 1;
            //            lblText.Text += "The Correct Answer of option No. " + questionsplit[i] + " is " + questionsplit[j] + "<br />";
            //        }
                        
                    
                  
                   
                
            //}
                //foreach (string no in questionsplit)
                //{


                //    if (i == 1)
                //    {
                //        lblText.Text += "The Correct Answer of option No. " + no[0] + " is " + no[1] + "<br />";
                //    }
                //    else
                //    {
                //        i = i + 2;
                //        int j = 1;
                //        j = i - j;
                //        lblText.Text += "The Correct Answer of option No. " + no[j] + " is " + no[i] + "<br />";
                //    }
                //    i++;

                //}

            string myString = answers;

List<string> digits = new List<string>();
List<string> alphabets = new List<string>();

Match regexMatch = null;

//while (myString.Length > 0)
//{
//    if ((regexMatch = Regex.Match(myString, "\\d")).Success) //if there are digits
//    {
        
//        myString = myString.Substring(regexMatch.Index);
//    }
//    else //there are no digits in myString
//    {
//        alphabets.Add(myString);
//        break; //no more digits
//    }

//    foreach (string no in alphabets)
//    {
//        lblText.Text += no + "<br />";
//    }
//}
            //char[] characters = answers.ToCharArray();
            //foreach (char c in characters)
            //{

            //    lblText.Text += c.ToString() + "<br/>";
            //}
            // string roughstring = ReadPdfFile(@"D:\jquery1\jquery1\Historics.pdf");
            //  txtrow.Text = roughstring;
            // string parseText = lblText.Text;
            //string[] questionsplit = Regex.Split(parseText, "(a)");
            //string result_questionsplit = "";
            //foreach (string line in questionsplit)
            //         {
            //             result_questionsplit += line.ToString();
            //         }
            //string[] questionsplit1 = Regex.Split(result_questionsplit, "(a)");
            //string result_questionsplit1 = "";
            //foreach (string line in questionsplit)
            //{
            //    result_questionsplit1 += line.ToString();

            //}

            //IList<string> list = new List<string>(result_questionsplit1.Split(new string[] { "(a)" }, StringSplitOptions.None));
            //foreach (string element in list)
            //{
            //    txtquestion.Text +=(element);
            //}
            //  string s = roughstring;
            //lblText.Text = s;
            //  string sp = "(";
            //  string[] q = s.Split('(');
            //foreach (string part in q)
            //{
            //    txtquestion.Text += part;
            //}
            //txtquestion.Text = q[0];
            //op1.Text = q[1];
            //op2.Text = q[2];
            //op3.Text = q[3];
            //op4.Text = q[4];
            //op5.Text = q[5];
            if (!IsPostBack)
            {
                HideCounter.Value = "1";
                txtrow.Text = "";
                txtqarray.Text = "0";
                txtop1array.Text = "0";
                txtop2array.Text = "0";
                txtop3array.Text = "0";
                txtop4array.Text = "0";
                txtop5array.Text = "0";
                txtquestion.Text = "";
                op1.Text = "";
                op2.Text = "";
                op3.Text = "";
                op4.Text = "";
                op5.Text = "";
                txtanswerkeys.Text = "";
              //  lblText.Text = @"";
               // string answers = "1. a 10. c  9. a 28. a  37. c 46. d  55. b 64. d 2. b 11. c  20. b 29. c  38. d 47. d  56. c 65. a 3. b 12. a  21. b 30. c  39. a 48. c  57. b 66. a 4. a 13. c  22. a 31. c  40. c 49. c  58. c 67. b 5. b 14. b  23. b 32. a  41. a 50. a  59. d 68. c 6. b 15. a  24. a 33. b  42. b 51. b  60. d 69. c 7. a 16. c  25. b 34. b  43. c 52. c  61. b 70. a 8. c  17. a  26. a 35. b  44. a 53. c  62. c 71 a 9. a 18. c  27. a 36. b  45. c 54. a  63. a  ";
                lblqno.Text = "";
               // lblText.Text = "";
                question_symbol.Text = "";
                txtop4_symbol.Text = "";
                txtop3_symbol.Text = "";
                txtop2_symbol.Text = "";
                txtop1_symbol.Text = "";
                lblTotalQuestionsFound.Text = "";
                lblTotalQuestionsRemaining.Text = "";
                rdbEnter.SelectedValue = "0";
                rdbSelectAnswerTextbox.SelectedValue = "0";
                txtCorrectAnswerSymbol.Text = "";
                //if (trying.Equals(makesym))
                //{
                //    lblText.Text = "Match Successfully";
                //}
                //else
                //{
                //    lblText.Text = "Please Try Again";
                //}
               // var array = Regex.Matches(answers, @"\D+|\d+")
               //  .Cast<Match>()
               //  .Select(m => m.Value)
               //  .ToArray();
               // string[] parts1 = answers.Split(new string[] { @"\D+|\d+" }, StringSplitOptions.None);
               //// string[] array = {"96", "18", "4"}; // Input array.
               // Array.Sort(array);          // Call sort.
               // foreach (var c in array)
               //     lblText.Text += c.ToString();
               
                //Regex r1 = new Regex(@"(([A-Za-z0-9\-]+)Three");

                //// C
                //// Match the input and write results
                //Match match = r1.Match(myst);
                //if (match.Success)
                //{
                //    string v = match.Groups[1].Value;
                //   questionresutl.Text += v;
                //}
                //var[] parts1 = Regex.Matches(myst, @"\(a\)"); 
                
                //string[] parts1 = myst.Split(new string[] { @"(\()" }, StringSplitOptions.None);
               // questionresutl.Text = parts1[0];
                
                //string[] parts2 = parts1[1].Split(new string[] { @"(?<=[(b)]" }, StringSplitOptions.None);
                //questionresult2.Text = parts2[0];
                //string[] parts3 = parts2[1].Split(new string[] { "(c)" }, StringSplitOptions.None);
                //questionresut3.Text = parts3[0];
                //string[] parts4 = parts3[1].Split(new string[] { "(d)" }, StringSplitOptions.None);
                //questionresut4.Text = parts4[0];
                //string[] parts5 = parts4[1].Split(new string[] { "2." }, StringSplitOptions.None);
                //questionresut5.Text = parts5[0];    
               //  string myst = lblText.Text;
                //string[] parts = Regex.Split(originalString, @"(?<=[.,;])")
                //var[] parts1 = Regex.Matches(myst, @"\(a\)"); 
                //questionresutl.Text = parts1[0];
                //string[] parts2 = Regex.Split(parts1[1], @"(?<=[(b)]");  
                //questionresult2.Text = parts2[0];
                //string[] parts3 = Regex.Split(parts2[1], @"(?<=[(c)]");
                //questionresut3.Text = parts3[0];
                //string[] parts4 = Regex.Split(parts3[1], @"(?<=[(d)]");
                //questionresut4.Text = parts4[0];
                //string[] parts5 = Regex.Split(parts4[1], @"(?<=[(.)]");
                //questionresut5.Text = parts5[0];
                //string myst = lblText.Text;
            //    for (int i = 0; i <= myst.Length; i++)
            //    {
                    
            //}
            }
            else
            {
               
                
                

                
                //string[] parts1 = myst.Split(new string[] { @"(a)" }, StringSplitOptions.None);
                //questionresutl.Text = parts1[0];
                //string[] parts2 = parts1[1].Split(new string[] { @"(?<=[(b)]" }, StringSplitOptions.None);
                //questionresult2.Text = parts2[0];
                //string[] parts3 = parts2[1].Split(new string[] { "(c)" }, StringSplitOptions.None);
                //questionresut3.Text = parts3[0];
                //string[] parts4 = parts3[1].Split(new string[] { "(d)" }, StringSplitOptions.None);
                //questionresut4.Text = parts4[0];
                //string[] parts5 = parts4[1].Split(new string[] { "2." }, StringSplitOptions.None);
                //questionresut5.Text = parts5[0];



                //lblText.Text = "";
                //string[] parts6_rect = parts[Convert.ToInt32(HideCounter.Value)].Split('.');
                //int lengthOfparts6 = (parts6_rect.Length-1);
                //parts[Convert.ToInt32(HideCounter.Value)] = parts6_rect[lengthOfparts6];
               // HideCounter.Value = (Convert.ToInt32(HideCounter.Value)+1).ToString();
                //for (int i =Convert.ToInt32(HideCounter.Value); i < parts.Length; i++)
                //{
                //    if (i == Convert.ToInt32(HideCounter.Value))
                //    {
                        
                //    }
                //        lblText.Text += parts[i];
                //}
               // Regex.Split(parts[1], @".");
                //Array.Clear(parts1, 0, parts1.Length);
                //Array.Clear(parts2, 0, parts2.Length);
                //Array.Clear(parts3, 0, parts3.Length);
                //Array.Clear(parts4, 0, parts4.Length);
                //Array.Clear(parts5, 0, parts5.Length);
                //questionresutl.Text +="<br/>"+ parts1[5];
                //questionresult2.Text += "<br/>" + parts1[6];
                //questionresut3.Text += "<br/>" + parts1[7];
                //questionresut4.Text += "<br/>" + parts1[8];
                //questionresut5.Text += "<br/>" + parts1[9];

            }
           
          
        }
      

        public string ReadPdfFile(string fileName)
        {
            StringBuilder text = new StringBuilder();

            if (File.Exists(fileName))
            {
                PdfReader pdfReader = new PdfReader(fileName);

                for (int page = 1; page <= pdfReader.NumberOfPages; page++)
                {
                    ITextExtractionStrategy strategy = new SimpleTextExtractionStrategy();
                    string currentText = PdfTextExtractor.GetTextFromPage(pdfReader, page, strategy);

                    currentText = Encoding.UTF8.GetString(ASCIIEncoding.Convert(Encoding.Default, Encoding.UTF8, Encoding.Default.GetBytes(currentText)));
                    text.Append(currentText);
                }
                pdfReader.Close();
            }
            return text.ToString();
        }
        public string symbol(string originsym)
        {
            char[] ch_originsym = originsym.ToCharArray();
            int totallenghtofch = (ch_originsym.Length);
            int exactlength = totallenghtofch;
            int counterss = 0;
            string trying = "";
            foreach (char c in ch_originsym)
            {
                if (exactlength > counterss)
                {
                    if (counterss == 0)
                    {
                        

                        if(char.IsLetterOrDigit(c))
                        {
                            trying += c;
                        }
                        else
                        {
                            trying += @"\" + c;
                        }
                      
                    }
                    if (counterss == 1)
                    {
                        if (char.IsLetterOrDigit(c))
                        {
                            trying += @"+" + c;
                        }
                        else
                        {
                            trying += @"+\" + c;
                        }
                        
                    }
                    
                    if (counterss == 2)
                    {
                        if(char.IsLetterOrDigit(c))
                        {
                            trying += @"+" + c;
                        }
                        else
                        {
                            trying += @"+\" + c;
                        }

                       
                    }
                    counterss++;

                }


            }
            return trying;
        }
        protected void btnSavenNext_Click(object sender, EventArgs e)
        {
             string constr = ConfigurationManager.ConnectionStrings["vuhomework"].ConnectionString;
                string msg = string.Empty;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("insert_from_PDFs", con))
                    {
                        //Int32 AdminId = (Int32)HttpContext.Current.Session["AdminId"];
                        //Int32 AdminId = 124;
                     //   Int32 SubjectId = ddlSubjectId;
                        int correct = 0;
                        if(chk1.Checked){
                            correct = 1;
                        }
                        else if(chk2.Checked){
                            correct = 2;
                        }
                        else if(chk3.Checked){
                            correct = 3;
                        }
                        else if(chk4.Checked){
                            correct = 4;
                        }
                        else if(chk5.Checked){
                            correct = 5;
                        }
                        //string exp1 = txtquestion.Text;
                        string txt = WebUtility.HtmlEncode(txtquestion.Text);
                        string stop1 = WebUtility.HtmlEncode(op1.Text);
                        string stop2 = WebUtility.HtmlEncode(op2.Text);
                        string stop3 = WebUtility.HtmlEncode(op3.Text);
                        string stop4 = WebUtility.HtmlEncode(op4.Text);
                        string stop5 = WebUtility.HtmlEncode(op5.Text);
                        string stexp = WebUtility.HtmlEncode(txtexp.Text);
                        string strefer = WebUtility.HtmlEncode(txtref.Text);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@AdminId", 132);
                        cmd.Parameters.AddWithValue("@SubjectId",Convert.ToInt32(ddlsubject.SelectedValue));
                        cmd.Parameters.AddWithValue("@TestId",Convert.ToInt32( ddltest.SelectedValue));
                        cmd.Parameters.AddWithValue("@Points",Convert.ToInt32(ddlPoints.Value));
                        cmd.Parameters.AddWithValue("@QuestionText", txt);
                        cmd.Parameters.AddWithValue("@Option1Text",stop1);
                        cmd.Parameters.AddWithValue("@Option2Text",stop2);
                        cmd.Parameters.AddWithValue("@Option3Text",stop3);
                        cmd.Parameters.AddWithValue("@Option4Text",stop4);
                        cmd.Parameters.AddWithValue("@Option5Text",stop5);
                        cmd.Parameters.AddWithValue("@CorrectOption",correct);
                        cmd.Parameters.AddWithValue("@Explanation",stexp);
                        cmd.Parameters.AddWithValue("@ReferenceText",strefer);
                        
                        con.Open();
                       int count = Convert.ToInt32(cmd.ExecuteScalar());
                       lblTotalQuestionFeeded.Text = count.ToString()+" Mcqs Saved.";
                        msg = "1";
                        con.Close();
                    }
                }
                sep();
            //string txtrows =Server.HtmlEncode(txtrow.Text);
            //string txtq_symbol = question_symbol.Text;
            //string op1_symbol = @"" + txtop1_symbol.Text;
            //string op2_symbol = @""+txtop2_symbol.Text;
            //string op3_symbol = @""+txtop3_symbol.Text;
            //string op4_symbol = @""+txtop4_symbol.Text;
            //int truefalse = Convert.ToInt32(rdbTrueFalse.SelectedValue) ;
            //int i = Convert.ToInt32(HideCounter.Value);
            //if (op1_symbol == op2_symbol && op3_symbol == op4_symbol && op2_symbol == op3_symbol)
            //{
            //    string q_anaylsye = symbol(op1_symbol);
            //    string[] parts = Regex.Split(txtrows, @"(?<=" + q_anaylsye + ")");
            //    Regex.Split(parts[i], @"\n");
            //    string[] parts_rect = parts[i].Split(new string[] { op1_symbol }, StringSplitOptions.None);
            //    txtquestion.Text = Environment.NewLine + parts_rect[0];

            //    string op1_anaylse = symbol(op2_symbol);
            //    string newst = "";
            //    i++;
            //    newst = parts[i];
            //    //if (parts[i + 1] != null)
            //    //{
            //    //    newst = parts[i + 1];
            //    //}
            //    //else
            //    //{
            //    //    newst = parts[i];
            //    //}

            //    string[] parts2 = Regex.Split(newst, @"(?<=" + op1_anaylse + ")");
            //    string[] parts2_rect = parts2[0].Split(new string[] { op2_symbol }, StringSplitOptions.None);
            //    op1.Text = Environment.NewLine + parts2_rect[0];

            //    string op2_analyse = symbol(op3_symbol);
            //    string new_parts2 = "";
            //    i++;
            //    new_parts2 = parts[i];
            //    //if (parts2[1] != null)
            //    //{
            //    //    new_parts2 = parts2[1];
            //    //}
            //    //else
            //    //{
            //    //    new_parts2 = parts2[0];
            //    //}



            //    string[] parts3 = Regex.Split(new_parts2, @"(?<=" + op2_analyse + ")");
            //    string[] parts3_rect = parts3[0].Split(new string[] { op3_symbol }, StringSplitOptions.None);
            //    op2.Text = Environment.NewLine + parts3_rect[0];
            //    if (truefalse != 1)
            //    {
            //        string op3_analyse = symbol(op4_symbol);
            //        string new_parts3 = "";
            //        i++;
            //        new_parts3 = parts[i];
            //        //if (parts3[1] != null)
            //        //{
            //        //    new_parts3 = parts3[1];
            //        //}
            //        //else
            //        //{
            //        //    new_parts3 = parts3[0];
            //        //}


            //        string[] parts4 = Regex.Split(new_parts3, @"(?<=" + op3_analyse + ")");
            //        string[] parts4_rect = parts4[0].Split(new string[] { op4_symbol }, StringSplitOptions.None);
            //        op3.Text = Environment.NewLine + parts4_rect[0];

            //        string op4_analyse = symbol(txtq_symbol);

            //        string new_parts4 = "";
            //        i++;
            //        new_parts4 = parts[i];
            //        //if (parts4[1] != null)
            //        //{
            //        //    new_parts4 = parts4[1];
            //        //}
            //        //else
            //        //{
            //        //    new_parts4 = parts4[0];
            //        //}
                    

            //        string[] parts5 = Regex.Split(new_parts4, @"(?<=" + op4_analyse + ")");
            //        string[] parts5_rect = Regex.Split(parts5[0], @"\n");
            //        op4.Text = Environment.NewLine + parts5_rect[0];
            //    }

            //   // i++;
            //    if (i == 1)
            //    {
            //        lblTotalQuestionsFound.Text = (Convert.ToInt32(parts.Length) - 1).ToString();
            //    }
            //    //lblTotalQuestionsRemaining.Text = (parts.Length).ToString();
            //    HideCounter.Value = i.ToString();
            //    if (i == (parts.Length))
            //    {
            //        lblText.Text = "No more questions in the file ";
            //        lblText.ForeColor = System.Drawing.Color.Red;
            //        lblText.Font.Bold = true;
            //        return;
            //    }
            //    lblqno.Text = i.ToString();

                
               

            //}
            //else
            //{
            //    string q_anaylsye = symbol(op1_symbol);
            //    string[] stringSeparators;
            //    if (Convert.ToInt32(rdbEnter.SelectedValue) == 0)
            //    {
            //         stringSeparators = new string[] { op1_symbol, op2_symbol, op3_symbol, op4_symbol, op1_symbol };
            //    }
            //    else
            //    {
            //          stringSeparators = new string[] { "\n", "\r\n" };
            //    }
                
                
            //    string[] parts = txtrows.Split(stringSeparators, StringSplitOptions.RemoveEmptyEntries);  //Regex.Split(txtrows, @"(?<=" + q_anaylsye + ")");
            //    //Regex.Split(parts[i], @"\n");
            //  //  string[] parts_rect = parts[i].Split(new string[] { op1_symbol }, StringSplitOptions.RemoveEmptyEntries);
            //    i = 0;
            //    txtquestion.Text = Environment.NewLine + parts[i];
            //    i++;
            //    op1.Text = Environment.NewLine + parts[i];
            //    i++;
            //    op2.Text = Environment.NewLine + parts[i];
            //    i++;
            //    op3.Text = Environment.NewLine + parts[i];
            //    i++;
            //    string[] stringSeparators_4;
            //    if (Convert.ToInt32(rdbEnter.SelectedValue) == 0)
            //    {
            //        stringSeparators_4 = new string[] { "\n" };
            //    }
            //    else
            //    {
            //        stringSeparators_4 = new string[] { "" };
            //    }
              
            //    string[] part4 = parts[i++].Split(stringSeparators_4, StringSplitOptions.RemoveEmptyEntries);
            //    op4.Text = Environment.NewLine + part4[0];
                
            //    if (i == 1)
            //    {
            //        lblTotalQuestionsFound.Text = (Convert.ToInt32(parts.Length) - 1).ToString();
            //    }
            //    //lblTotalQuestionsRemaining.Text = (parts.Length).ToString();
            //   // HideCounter.Value = i.ToString();
            //    if (i == (parts.Length))
            //    {
            //        lblText.Text = "No more questions in the file ";
            //        lblText.ForeColor = System.Drawing.Color.Red;
            //        lblText.Font.Bold = true;
            //        return;
            //    }
            //    if (Convert.ToInt32(rdbEnter.SelectedValue) == 0)
            //    {
            //        string newst = txtrow.Text;
            //        string pattern = @"(d+\.)";
            //        string op4_anaylse = symbol(op4_symbol);
            //        string[] parts2 = Regex.Split(newst, "(" + op4_anaylse + ")");

            //        txtrow.Text = "";

            //        int storevalue = Convert.ToInt32(HideCounter.Value);
            //        int temp = 0;
            //        if (storevalue != 1)
            //        {
            //            temp = 3;

            //        }
            //        else
            //        {
            //            temp = storevalue;
            //        }
            //        //if (Convert.ToInt32(rdbCuttingStyle.SelectedValue) == 1)
            //        //{
            //        //    for (int j = temp; j < parts2.Length - 1; j++)
            //        //    {
            //        //        txtrow.Text += parts[j];


            //        //    }
            //        //}
            //        //else
            //        //{
            //        for (int j = temp; j < parts2.Length - 1; j++)
            //        {
            //            txtrow.Text += parts2[j];


            //        }
            //        //}

            //        storevalue++;
            //        HideCounter.Value = storevalue.ToString();
            //    }
            //    else
            //    {
            //        string newst = txtrow.Text;
            //        txtrow.Text = "";
            //        string[] parts2 = Regex.Split(newst, "(\r+\n+)");
            //        int storevalue = Convert.ToInt32(HideCounter.Value);
            //        int temp = 0;
            //        if (storevalue != 1)
            //        {
            //            temp = 3;

            //        }
            //        else
            //        {
            //            temp = storevalue;
            //        }
            //        for (int j = temp; j < parts2.Length - 1; j++)
            //        {
            //            txtrow.Text += parts2[j];


            //        }
            //        storevalue++;
            //        HideCounter.Value = storevalue.ToString();
            //    }
               
                
              //  lblqno.Text = i.ToString();
                //string op1_anaylse = symbol(op2_symbol);
                //string newst = "";

                //if (parts_rect.Length > 2)
                //{
                //    if (parts_rect[i + 1] != null)
                //    {
                //        newst = parts_rect[i + 1];
                //    }
                //    else
                //    {
                //        newst = parts_rect[i];
                //    }

                //    string[] parts2 = Regex.Split(newst, @"(?<=" + op2_symbol + ")");
                //    string[] parts2_rect = parts2[0].Split(new string[] { op2_symbol }, StringSplitOptions.RemoveEmptyEntries);
                //    op1.Text = Environment.NewLine + parts2_rect[0];

                //    string op2_analyse = symbol(op3_symbol);
                //    string new_parts2 = "";

                //    if (parts2[1] != null)
                //    {
                //        new_parts2 = parts2[1];
                //    }
                //    else
                //    {
                //        new_parts2 = parts2[0];
                //    }



                //    string[] parts3 = Regex.Split(new_parts2, @"(?<=" + op2_analyse + ")");
                //    string[] parts3_rect = parts3[0].Split(new string[] { op3_symbol }, StringSplitOptions.RemoveEmptyEntries);
                //    op2.Text = Environment.NewLine + parts3_rect[0];
                //    if (truefalse != 1)
                //    {
                //        string op3_analyse = symbol(op4_symbol);
                //        string new_parts3 = "";

                //        if (parts3[1] != null)
                //        {
                //            new_parts3 = parts3[1];
                //        }
                //        else
                //        {
                //            new_parts3 = parts3[0];
                //        }


                //        string[] parts4 = Regex.Split(new_parts3, @"(?<=" + op3_analyse + ")");
                //        string[] parts4_rect = parts4[0].Split(new string[] { op4_symbol }, StringSplitOptions.RemoveEmptyEntries);
                //        op3.Text = Environment.NewLine + parts4_rect[0];

                //        string op4_analyse = symbol(txtq_symbol);

                //        string new_parts4 = "";

                //        if (parts4[1] != null)
                //        {
                //            new_parts4 = parts4[1];
                //        }
                //        else
                //        {
                //            new_parts4 = parts4[0];
                //        }
                //        new_parts4 = parts4[1];

                //        string[] parts5 = Regex.Split(new_parts4, @"(?<=" + op4_analyse + ")");
                //        string[] parts5_rect = Regex.Split(parts5[0], @"\n");
                //        op4.Text = Environment.NewLine + parts5_rect[0];
                //    }

                   
                //}
                //else
                //{
                //    if (parts[i + 1] != null)
                //    {
                //        newst = parts[i + 1];
                //    }
                //    else
                //    {
                //        newst = parts[i];
                //    }

                //    string[] parts2 = Regex.Split(newst, @"(?<=" + op1_anaylse + ")");
                //    string[] parts2_rect = parts2[0].Split(new string[] { op2_symbol }, StringSplitOptions.None);
                //    op1.Text = Environment.NewLine + parts2_rect[0];

                //    string op2_analyse = symbol(op3_symbol);
                //    string new_parts2 = "";

                //    if (parts2[1] != null)
                //    {
                //        new_parts2 = parts2[1];
                //    }
                //    else
                //    {
                //        new_parts2 = parts2[0];
                //    }



                //    string[] parts3 = Regex.Split(new_parts2, @"(?<=" + op2_analyse + ")");
                //    string[] parts3_rect = parts3[0].Split(new string[] { op3_symbol }, StringSplitOptions.None);
                //    op2.Text = Environment.NewLine + parts3_rect[0];
                //    if (truefalse != 1)
                //    {
                //        string op3_analyse = symbol(op4_symbol);
                //        string new_parts3 = "";

                //        if (parts3[1] != null)
                //        {
                //            new_parts3 = parts3[1];
                //        }
                //        else
                //        {
                //            new_parts3 = parts3[0];
                //        }


                //        string[] parts4 = Regex.Split(new_parts3, @"(?<=" + op3_analyse + ")");
                //        string[] parts4_rect = parts4[0].Split(new string[] { op4_symbol }, StringSplitOptions.None);
                //        op3.Text = Environment.NewLine + parts4_rect[0];

                //        string op4_analyse = symbol(txtq_symbol);

                //        string new_parts4 = "";

                //        if (parts4[1] != null)
                //        {
                //            new_parts4 = parts4[1];
                //        }
                //        else
                //        {
                //            new_parts4 = parts4[0];
                //        }
                //        new_parts4 = parts4[1];

                //        string[] parts5 = Regex.Split(new_parts4, @"(?<=" + op4_analyse + ")");
                //        string[] parts5_rect = Regex.Split(parts5[0], @"\n");
                //        op4.Text = Environment.NewLine + parts5_rect[0];
                //    }

                //    i++;
                //    if (i == 1)
                //    {
                //        lblTotalQuestionsFound.Text = (Convert.ToInt32(parts.Length) - 1).ToString();
                //    }
                //    //lblTotalQuestionsRemaining.Text = (parts.Length).ToString();
                //    HideCounter.Value = i.ToString();
                //    if (i == (parts.Length))
                //    {
                //        lblText.Text = "No more questions in the file ";
                //        lblText.ForeColor = System.Drawing.Color.Red;
                //        lblText.Font.Bold = true;
                //        return;
                //    }
                //    lblqno.Text = i.ToString();
                //}
               

            
            //chk1.Checked = false;
            //chk2.Checked = false;
            //chk3.Checked = false;
            //chk4.Checked = false;
//            string answers_keys = @"1. a 10. c  9. a 28. a  37. c 46. d  55. b 64. d 
//2. b 11. c  20. b 29. c  38. d 47. d  56. c 65. a 
//3. b 12. a  21. b 30. c  39. a 48. c  57. b 66. a 
//4. a 13. c  22. a 31. c  40. c 49. c  58. c 67. b 
//5. b 14. b  23. b 32. a  41. a 50. a  59. d 68. c 
//6. b 15. a  24. a 33. b  42. b 51. b  60. d 69. c 
//7. a 16. c  25. b 34. b  43. c 52. c  61. b 70. a 
//8. c  17. a  26. a 35. b  44. a 53. c  62. c 71 a 
//9. a 18. c  27. a 36. b  45. c 54. a  63. a ";

            //string refine_answerkeys = Regex.Replace(answers_keys, @"\s+\r+\n+", "");
            // var mat = Regex.Matches(refine_answerkeys, "[a-z]");
            //int newss = refine_answerkeys.IndexOf(" "+i.ToString()+".");
            //string newss_1 = refine_answerkeys.Substring(newss);

          //  string bet = refine_answerkeys.Between(i + ".", ".");
            //string ind = newss_1.Substring(0, 2);
            //string correct_option = Regex.Replace(ind, @"\s", "");
            //if (correct_option.Equals("a"))
            //{
            //    chk1.Checked = true;
            //}
            //else if (correct_option.Equals("b"))
            //{
            //    chk2.Checked = true;
            //}
            //else if (correct_option.Equals("c"))
            //{
            //    chk3.Checked = true;
            //}
            //else if (correct_option.Equals("d"))
            //{
            //    chk4.Checked = true;
            //}
            // string correctanswer_1 = answers_keys.After("1.");
            //string correctanswer_2 = correctanswer_1.Before(".");
            //lblText.Text = ind;
            //int qno = Int32.Parse(hidequestionno.Value);
            //int op1 = Int32.Parse(hideop1.Value);
            //int op2 = Int32.Parse(hideop2.Value);
            //int op3 = Int32.Parse(Hideop3.Value);
            //int op4 = Int32.Parse(Hideop4.Value);
            //int op5 = Int32.Parse(Hideop5.Value);
            //hidequestionno.Value = qno++.ToString();
            //hideop1.Value = op1++.ToString();
            //Hideop3.Value = op3++.ToString();
            //Hideop4.Value = op4++.ToString();
            //Hideop5.Value = op5++.ToString();
            //int qno = Convert.ToInt32(txtqarray.Text);
            //int op1 = Convert.ToInt32(txtop1array.Text);
            //int op2 = Convert.ToInt32(txtop2array.Text);
            //int op3 = Convert.ToInt32(txtop3array.Text);
            //int op4 = Convert.ToInt32(txtop4array.Text);
            //int op5 = Convert.ToInt32(txtop5array.Text);
            //if (lblText.Text == "0")
            //{
            //    int qno_inc = qno;
            //    txtqarray.Text = qno_inc.ToString();
            //    //txtqarray.Text = (qno++).ToString();
            //    txtop1array.Text = (op1).ToString();
            //    txtop2array.Text = (op2).ToString();
            //    txtop3array.Text = (op3).ToString();
            //    txtop4array.Text = (op4).ToString();
            //    txtop5array.Text = (op5).ToString();
            //    lblText.Text = "1";
            //}
            //else
            ////{
            //    int qno_inc = qno + op4;
            //    txtqarray.Text = qno_inc.ToString();
                ////txtqarray.Text = (qno++).ToString();
                //txtop1array.Text = (op1 + op4).ToString();
                //txtop2array.Text = (op2 + op4).ToString();
                //txtop3array.Text = (op3 + op4).ToString();
                //txtop4array.Text = (op4 + op4).ToString();
                //txtop5array.Text = (op5 + op4).ToString();
            //}
            
            //char seprator = char.Parse(txtsep.Text);
           // seprate_string(qno,op1,op2,op3,op4,op5,txtrows,seprator);
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            sep();

        }
        public void sep()
        {
            chk1.Checked = false;
            chk2.Checked = false;
            chk3.Checked = false;
            chk4.Checked = false;
            chk5.Checked = false;
            int storevalue = Convert.ToInt32(HideCounter.Value);
            string txtrows;
            //if (storevalue != 1)
            //{
            //    txtrows = Server.HtmlEncode(hiddenrowtext.Value);

            //}
            //else
            //{
            txtrows = Server.HtmlEncode(txtrow.Text);
            // }

            string txtq_symbol = question_symbol.Text;
            string op1_symbol = @"" + txtop1_symbol.Text;
            string op2_symbol = @"" + txtop2_symbol.Text;
            string op3_symbol = @"" + txtop3_symbol.Text;
            string op4_symbol = @"" + txtop4_symbol.Text;
            int truefalse = Convert.ToInt32(rdbTrueFalse.SelectedValue);
            int i = 0;// Convert.ToInt32(HideCounter.Value);
            string q_anaylsye = symbol(op1_symbol);
            string[] stringSeparators;
            if (Convert.ToInt32(rdbEnter.SelectedValue) == 0)
            {
                stringSeparators = new string[] { op1_symbol, op2_symbol, op3_symbol, op4_symbol, op1_symbol };
            }
            else
            {
                stringSeparators = new string[] { "\n", "\r\n" };
            }


            string[] parts = txtrows.Split(stringSeparators, StringSplitOptions.RemoveEmptyEntries);  //Regex.Split(txtrows, @"(?<=" + q_anaylsye + ")");
            //Regex.Split(parts[i], @"\n");
            //  string[] parts_rect = parts[i].Split(new string[] { op1_symbol }, StringSplitOptions.RemoveEmptyEntries);
            // i = storevalue;
            txtquestion.Text = "";
            op1.Text = "";
            op2.Text = "";
            op3.Text = "";
            op4.Text = "";
            op5.Text = "";
            int lenghtparts4 = 0;

            if (Convert.ToInt16(rdbSelectAnswerTextbox.SelectedValue) == 1)
            {
                string mykey = txtanswerkeys.Text;
                string[] stringSeparators_answerkeys = new string[] { "\n", "\r\n" };
                string[] answerkeysparts = mykey.Split(stringSeparators_answerkeys, StringSplitOptions.RemoveEmptyEntries);
                Regex regexanswer = new Regex(@"[A-Za-z]");
                Match match_answer = regexanswer.Match(answerkeysparts[i]);
                if (match_answer.ToString() == "a" || match_answer.ToString() == "A")
                {
                    chk1.Checked = true;
                }

                if (match_answer.ToString() == "b" || match_answer.ToString() == "B")
                {
                    chk2.Checked = true;
                }

                if (match_answer.ToString() == "c" || match_answer.ToString() == "C")
                {
                    chk3.Checked = true;
                }

                if (match_answer.ToString() == "d" || match_answer.ToString() == "D")
                {
                    chk4.Checked = true;
                }
                int totaloptionlenght = answerkeysparts[i].Length;
                totaloptionlenght =totaloptionlenght + 2;
                string newstringanswer = mykey;
                newstringanswer = newstringanswer.Substring(totaloptionlenght);
                txtanswerkeys.Text = newstringanswer;
            }


          

            txtquestion.Text = Environment.NewLine + parts[i];
            int question_actualtext = parts[i].Length;
            i++;
            op1.Text = Environment.NewLine + parts[i];
            Regex regex = new Regex(@"(" + txtCorrectAnswerSymbol.Text + ")");
            Match match = regex.Match(parts[i]);
            if (match.Success)
            {
                chk1.Checked = true;
            }

            

            i++;
            op2.Text = Environment.NewLine + parts[i];
            match = regex.Match(parts[i]);
            if (match.Success)
            {
                chk2.Checked = true;
            }
            i++;
            op3.Text = Environment.NewLine + parts[i];
            match = regex.Match(parts[i]);
            if (match.Success)
            {
                chk3.Checked = true;
            }
            i++;
            string[] stringSeparators_4;
            if (Convert.ToInt32(rdbEnter.SelectedValue) == 0)
            {
                stringSeparators_4 = new string[] { "\n" };
            }
            else
            {
                stringSeparators_4 = new string[] { "" };
            }

            string[] part4 = parts[i++].Split(stringSeparators_4, StringSplitOptions.RemoveEmptyEntries);
            op4.Text = Environment.NewLine + part4[0];
            match = regex.Match(part4[0]);
            if (match.Success)
            {
                chk4.Checked = true;
            }

            if (i == 1)
            {
                lblTotalQuestionsFound.Text = (Convert.ToInt32(parts.Length) - 1).ToString();
            }

            //lblTotalQuestionsRemaining.Text = (parts.Length).ToString();
            // HideCounter.Value = i.ToString();
            if (i == (parts.Length))
            {
                lblText.Text = "No more questions in the file ";
                lblText.ForeColor = System.Drawing.Color.Red;
                lblText.Font.Bold = true;
                return;
            }
            if (Convert.ToInt32(rdbEnter.SelectedValue) == 0)
            {

                string newst = txtrow.Text;
              //  string pattern = @"(d+\.)";
               // string op4_anaylse = symbol(op4_symbol);
               // string[] parts2 = Regex.Split(newst, "(" + op4_anaylse + ")");

               // txtrow.Text = "";
                //stringSeparators_4 = new string[] { "\n" };
                int length1 = question_actualtext;
                    //txtquestion.Text.Split(stringSeparators_4, StringSplitOptions.RemoveEmptyEntries).Length; //parts[0].Length;
               // string[] question_len = txtquestion.Text.Split(stringSeparators_4, StringSplitOptions.RemoveEmptyEntries);
                // now we check here that either /r/n in the start of question ? then remove it.
                //string withoutbackslash = question_len.Replace("\n", "").Replace("\t", "").Replace("\r", "");
               // length1 = txtquestion.Text.Length; 
                int length2 = op1.Text.Length;//parts[1].Length;
                string op1_len = op1.Text;
                //length2 = (op1_len.Replace("\n", "  ").Replace("\t", "  ").Replace("\r", "  ")).Count(); 
                int length3 = op2.Text.Length; //parts[2].Length;
                string op2_len = op2.Text;
                //length3 = (op2_len.Replace("\n", "  ").Replace("\t", "  ").Replace("\r", "  ")).Count();
                int length4 = op3.Text.Length;//parts[3].Length;
                string op3_len = op3.Text;
                //length4 = (op3_len.Replace("\n", "  ").Replace("\t", "  ").Replace("\r", "  ")).Count(); 
                int length5 = op4.Text.Length; // parts[4].Length;
                string op4_len = op4.Text;
                //length5 = (op4_len.Replace("\n", "  ").Replace("\t", "  ").Replace("\r", "  ")).Count(); 
                
                if (length3 == 0)
                {
                    length4 = 0;
                    length5 = 0;
                }
                //if (length5 > 20)
                //{
                //    length5 = 0;
                //}
                int totallenght = length1 + length2 + length3 + length4 + length5;
                //totallenght = totallenght;

                // newst = newst.Where(w => w != newst[2]).ToString(); 
                newst = newst.Substring(totallenght);
                txtrow.Text = newst;

                //int temp = 0;
                //if (storevalue != 1)
                //{
                //    temp = 3;

                //}
                //else
                //{
                //    temp = storevalue;
                //}
                //newst = newst.Substring(0, newst.IndexOf(op4_symbol));
                //txtrow.Text = newst;

                //if (Convert.ToInt32(rdbCuttingStyle.SelectedValue) == 1)
                //{
                //    for (int j = temp; j < parts2.Length - 1; j++)
                //    {
                //        txtrow.Text += parts[j];


                //    }
                //}
                //else
                //{
                //for (int j = temp; j < parts2.Length - 1; j++)
                //{
                //    txtrow.Text += parts2[j];


                //}
                //}

                storevalue++;
                HideCounter.Value = storevalue.ToString();
            }
            else
            {
                //int storevalue = Convert.ToInt32(HideCounter.Value);
                string newst;
                //if (storevalue != 1)
                //{
                // newst = hiddenrowtext.Value;
                // }
                //else
                //{
                newst = txtrow.Text;
                //}
                //txtrow.Text = "";
                // string[] parts2 = Regex.Split(newst, "(\r+\n+)");
                //int mi = newst.IndexOf('-');
                //if (mi >= 0) newst = newst.Substring(mi + 1);

                //txtrow.Text = newst;
                // i = i-1;
                // parts[i].Length

                int length1 = txtquestion.Text.Length; //parts[0].Length;
                int length2 = op1.Text.Length;//parts[1].Length;
                int length3 = op2.Text.Length; //parts[2].Length;
                int length4 = op3.Text.Length;//parts[3].Length;
                int length5 = op4.Text.Length; // parts[4].Length;
                
                if (length3 == 0)
                {
                    length4 = 0;
                    length5 = 0;
                }
                if (length5 > 20)
                {
                    length5 = 0;
                }
                int totallenght = length1 + length2 + length3 + length4 + length5;
                // newst = newst.Where(w => w != newst[2]).ToString(); 
                newst = newst.Substring(totallenght);
                txtrow.Text = newst;
                //int temp = 0;
                //if (storevalue != 1)
                //{
                //    temp = 3;
                //    temp = storevalue+temp;
                //    for (int j = temp; j < 30; j++)
                //    {
                //        txtrow.Text += parts2[j];


                //    }
                //    storevalue = temp;

                //}
                //else
                //{
                //    for (int j = temp; j < parts2.Length - 1; j++)
                //    {
                //        hiddenrowtext.Value += parts2[j];


                //    }
                //    temp = storevalue;
                //    for (int j = temp; j < 10; j++)
                //    {
                //        txtrow.Text += parts2[j];


                //    }
                storevalue++;
                //  }
                //parts2 = parts2.Where(w => w != parts2[temp]).ToArray(); 


                HideCounter.Value = storevalue.ToString();
            }
        }
        public void seprate_string(int question, int op1,int op2, int op3, int op4, int op5, string row_string, char seprator)
        {
            txtrow.Text = row_string;
            string s = row_string;
            //lblText.Text = s;
            char sp = seprator;
            string[] q = s.Split(sp);
            //foreach (string part in q)
            //{
            //    txtquestion.Text += part;
            //}
            
            assign_parts(question,op1,op2,op3,op4,op5,q);
            
            
        }
        public void assign_parts(int i, int j, int k, int l,int m,int n,params string[] q)
        {
            
            txtquestion.Text = q[i];
            op1.Text = q[j];
            op2.Text = q[k];
            op3.Text = q[l];
            op4.Text = q[m];
            op5.Text = q[n];
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Boolean fileOK = false;
            String path = Server.MapPath("~/UploadedDoc/");
            if (FileUpload1.HasFile)
            {
                String fileExtension =
                    System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                String[] allowedExtensions = { ".xls", ".docx", ".doc", ".pdf" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
                if (fileOK)
                {
                    try
                    {
                        FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName);
                        lblText.Text = "File uploaded!";
                        string filename = path + FileUpload1.FileName;
                      //  WriteImageFile(filename);
                        string roughstring = ReadPdfFile(filename);
                        txtrow.Text = roughstring;
                      //  WriteImageFile(filename);
                        //string txtrows = roughstring;

                        //int qno = Int32.Parse(hidequestionno.Value);
                        //int op1 = Int32.Parse(hideop1.Value);
                        //int op2 = Int32.Parse(hideop2.Value);
                        //int op3 = Int32.Parse(Hideop3.Value);
                        //int op4 = Int32.Parse(Hideop4.Value);
                        //int op5 = Int32.Parse(Hideop5.Value);
                        //hidequestionno.Value = (qno++).ToString();
                        //hideop1.Value = (op1++).ToString();
                        //Hideop3.Value = (op3++).ToString();
                        //Hideop4.Value = (op4++).ToString();
                        //Hideop5.Value = (op5++).ToString();
                        //int qno = Int32.Parse(txtqarray.Text);
                        //int op1 = Int32.Parse(txtop1array.Text);
                        //int op2 = Int32.Parse(txtop2array.Text);
                        //int op3 = Int32.Parse(txtop3array.Text);
                        //int op4 = Int32.Parse(txtop4array.Text);
                        //int op5 = Int32.Parse(txtop5array.Text);
                        //txtqarray.Text = (qno++).ToString();
                        //txtop1array.Text = (op1++).ToString();
                        //txtop2array.Text = (op2++).ToString();
                        //txtop3array.Text = (op3++).ToString();
                        //txtop4array.Text= (op4++).ToString();
                        //txtop5array.Text = (op5++).ToString();
                        //char seprator =char.Parse(txtsep.Text);
                        //seprate_string(qno, op1, op2, op3, op4, op5, txtrows, seprator);
                       
                    }
                    catch (Exception ex)
                    {
                        lblText.Text = "File could not be uploaded.";
                    }
                }
                else
                {
                    lblText.Text = "Cannot accept files of this type.";
                }



               // lblText.Text = "Please Select a file";


            }

        }
        private static List<System.Drawing.Image> ExtractImages(String PDFSourcePath)
        {
            List<System.Drawing.Image> ImgList = new List<System.Drawing.Image>();

            iTextSharp.text.pdf.RandomAccessFileOrArray RAFObj = null;
            iTextSharp.text.pdf.PdfReader PDFReaderObj = null;
            iTextSharp.text.pdf.PdfObject PDFObj = null;
            iTextSharp.text.pdf.PdfStream PDFStremObj = null;

            try
            {
                RAFObj = new iTextSharp.text.pdf.RandomAccessFileOrArray(PDFSourcePath);
                PDFReaderObj = new iTextSharp.text.pdf.PdfReader(RAFObj, null);

                for (int i = 0; i <= PDFReaderObj.XrefSize - 1; i++)
                {
                    PDFObj = PDFReaderObj.GetPdfObject(i);

                    if ((PDFObj != null) && PDFObj.IsStream())
                    {
                        PDFStremObj = (iTextSharp.text.pdf.PdfStream)PDFObj;
                        iTextSharp.text.pdf.PdfObject subtype = PDFStremObj.Get(iTextSharp.text.pdf.PdfName.SUBTYPE);

                        if ((subtype != null) && subtype.ToString() == iTextSharp.text.pdf.PdfName.IMAGE.ToString())
                        {
                            try
                            {

                                iTextSharp.text.pdf.parser.PdfImageObject PdfImageObj =
                         new iTextSharp.text.pdf.parser.PdfImageObject((iTextSharp.text.pdf.PRStream)PDFStremObj);

                                System.Drawing.Image ImgPDF = PdfImageObj.GetDrawingImage();


                                ImgList.Add(ImgPDF);

                            }
                            catch (Exception)
                            {

                            }
                           
                        }
                    }
                }
                PDFReaderObj.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return ImgList;
        }


        /// <summary>
        ///  Write Image File
        /// </summary>
        private static void WriteImageFile(string filename)
        {
            try
            {
                

                // Get a List of Image
                List<System.Drawing.Image> ListImage = ExtractImages(filename);

                for (int i = 0; i < ListImage.Count; i++)
                {
                    try
                    {
                        // Write Image File
                        //HttpUtility.Server.MapPath("~/UploadedDoc/");
                        ListImage[i].Save(AppDomain.CurrentDomain.BaseDirectory + "UploadedDoc\\images\\" + i + ".jpeg", System.Drawing.Imaging.ImageFormat.Jpeg);
//                        System.Console.WriteLine("Image" + i + ".jpeg write sucessfully");
                    }
                    catch (Exception)
                    {

                    }
                    
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int i = Convert.ToInt32(HideCounter.Value);
            i++;
            HideCounter.Value = i.ToString();
        }

        protected void btnHideInformationPanel_Click(object sender, EventArgs e)
        {
            if (divInformationPanel.Visible == false)
            {
                divInformationPanel.Visible = true;
            }
            else
            {
                divInformationPanel.Visible = false;
            }
        }
    }
    static class SubstringExtensions
    {
        /// <summary>
        /// Get string value between [first] a and [last] b.
        /// </summary>
        public static string Between(this string value, string a, string b)
        {
            int posA = value.IndexOf(a);
            int posB = value.LastIndexOf(b);
            if (posA == -1)
            {
                return "";
            }
            if (posB == -1)
            {
                return "";
            }
            int adjustedPosA = posA + a.Length;
            if (adjustedPosA >= posB)
            {
                return "";
            }
            return value.Substring(adjustedPosA, posB - adjustedPosA);
        }

        /// <summary>
        /// Get string value after [first] a.
        /// </summary>
        public static string Before(this string value, string a)
        {
            int posA = value.IndexOf(a);
            if (posA == -1)
            {
                return "";
            }
            return value.Substring(0, posA);
        }

        /// <summary>
        /// Get string value after [last] a.
        /// </summary>
        public static string After(this string value, string a)
        {
            int posA = value.LastIndexOf(a);
            if (posA == -1)
            {
                return "";
            }
            int adjustedPosA = posA + a.Length;
            if (adjustedPosA >= value.Length)
            {
                return "";
            }
            return value.Substring(adjustedPosA);
        }
    }


}