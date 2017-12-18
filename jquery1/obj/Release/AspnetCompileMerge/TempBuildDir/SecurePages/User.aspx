<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="jquery1.SecurePages.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-1.11.3.min.js"></script>
    <script src="DataTables/DataTables-1.10.10/js/jquery.dataTables.min.js"></script>
    <link href="DataTables/DataTables-1.10.10/css/jquery.dataTables.min.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {

            console.log('I am ajax called');
            var QuestioNo = 0;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "User.aspx/Getmcqs_Detail",
                data: "{'QNo':'" + QuestioNo + "'}",
                dataType: "json",
                success: function (data) {
                    console.log('in Success stage');
                   
                    $("#example").append("<thead><tr><th>Subject</th><th>Test</th><th>Total Test Questions</th><th>Total Test Marks</th><th>Test</th><th>Practice</th></tr></thead><tbody>");
                   // $('#example').DataTable();
                    var len = data.d.length;
                    console.log("Data length = " + len);
                    if (len > 0) {
                        for (var i = 0; i < len; i++) {


                            TotalQuestions = data.d[i].TotalQuestion;
                            TotalMarks = data.d[i].TotalPoints;
                            console.log("Total Questions = " + TotalQuestions + " and  Total Points = " + TotalMarks);

                            $("#TotalQuest").text(TotalQuestions);
                            $("#TotalPoints").text(TotalMarks);
                          //  alert("<thead><tr><th>Subject</th><th>Test</th><th>Total Test Questions</th><th>Total Test Marks</th></tr></thead><tbody><tr><td>" + data.d[i].SubjectName + "</td><td>" + data.d[i].TestName + "</td><td>" + data.d[i].TotalQuestion + "</td><td>" + data.d[i].TotalPoints +"</td><td><a href=design.aspx?testid="+data.d[i].TestId+">Let's Start Test</a></td></tr></tbody>");
                            $("#example").append("<tr><td>" + data.d[i].SubjectName + "</td><td>" + data.d[i].TestName + "</td><td>" + data.d[i].TotalQuestion + "</td><td>" + data.d[i].TotalPoints + "</td><td><a href=design.aspx?Mode=1&testid=" + data.d[i].TestId + ">Let's Start Test</a></td><td><a href=design.aspx?Mode=0&testid="+ data.d[i].TestId+" id='btnpract'>Let's Start Practice</a></td></tr>");

                            
                        }
                       

                    }
                    $('#example').DataTable();
                },
                error: function (data) {
                    alert("Error");
                }
            });

           // $('#example').DataTable({});
        });
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div style="width: 80%; text-align: center; margin-left: 5%;">
            <table id="example" class="display compact" cellspacing="0" width="100%">
               <%-- <thead>
                    <tr>
                        <th>Subject
                        </th>
                        <th>Test</th>
                        <th>Total Questions</th>
                        <th>Start Test</th>
                        <th>Due Date</th>
                    </tr>

                </thead>
                <tbody>
                    <tr>
                        <td>
                            Computer Science
                        </td>
                        <td>
                            CS101
                        </td>
                        <td>
                            4
                        </td>
                        <td>
                            <a href="design.aspx?testid=223">Let's Start</a>
                        </td>
                        
                    </tr>
                </tbody>--%>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
