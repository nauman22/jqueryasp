<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowQuestions.aspx.cs" Inherits="jquery1.SecurePages.ShowQuestions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
        //document.addEventListener("DOMContentLoaded", function () {

        //    if ("indexedDB" in window) {
        //        console.log("YES!!! I CAN DO IT!!! WOOT!!!");
        //        var openRequest = indexedDB.open("test", 1);

        //        openRequest.onupgradeneeded = function (e) {
        //            console.log("Upgrading...");
        //        }

        //        openRequest.onsuccess = function (e) {
        //            console.log("Success!");
        //            db = e.target.result;
        //        }

        //        openRequest.onerror = function (e) {
        //            console.log("Error");
        //            console.dir(e);
        //        }
        //    }
            
        //    else {
        //        alert("I has a sad.");
        //    }

        //}, false);
        $(document).ready(function () {

           
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "AddQuestions.aspx/Dashboard_UsersMcqss",
                data: "{}",
                dataType: "json",
                success: function (data) {
                    //alert(data.d);
                    //$.each(Result.d, function (key, value) {
                    //    alert(value.SubjectName);
                    //    alert(value.TestName);
                    //    // var table = $('<table></table>').addClass('foo');
                    //    var table = ('<table></table>');
                    //    for (i = 0; i < Result.d.length; i++) {
                    //        //var row = $('<tr></tr>').addClass('bar').text('result ' + i);
                    //        var row = $('<tr></tr>').text(value.SubjectName);
                    //        var row1 = $('<tr></tr>').text(value.SubjectName);
                    //        var row2 = $('<tr></tr>').text(value.SubjectName);
                    //        var row3 = $('<tr></tr>').text(value.SubjectName);
                    //        var row4 = $('<tr></tr>').text(value.SubjectName);
                    //        table.append(row);
                    //    }
                    //    $('#divtableUsersDashboardmcqs').append(table);
                    //});

                    var len = data.d.length;
                    var txt = "";
                    //  alert(len);
                    if (len > 0) {
                        for (var i = 0; i < len; i++) {
                            //alert(data.length);
                            //alert(data.d[i].SubjectName);
                            // if (data.d[i].SubjectName )//&& data[i].TestName && data[i].TestStartingDate && data[i].TestEndingDate && data[i].TestStatus)
                            //  {
                            txt += '<tbody><tr><td>' + data.d[i].SubjectName + '</td><td>' + data.d[i].TestName + '</td><td>' + data.d[i].TestStartingDate + '</td><td>' + data.d[i].TestEndingDate + '</td><td>' + data.d[i].TestStatus + '</td></tr></tbody>';
                            //  }
                            //alert(txt);
                        }

                        if (txt != '') {
                            $("#tableShowUserMcqs").append(txt).removeClass("hidden");
                            $("#tableShowUserMcqs").DataTable();
                            alert(txt);
                        }
                    }

                },
                error: function (data) {
                   // alert("Error");
                }
            });
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <div id="subUser">
            <table class="table" border="1">
                <thead>
                    <tr>
                        <td class="col-xs-12" colspan="6">
                            <h4>Please Select for Test/Practice !</h4>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-xs-1">
                            <label >Sr No.</label>
                        </td>
                        <td class="col-xs-4">
                            <label>Subject Name</label>
                        </td>
                        <td class="col-xs-4">
                            <label>Test Name</label>

                        </td>
                        <td class="col-xs-1">
                            <label>Status</label>
                        </td>
                        <td class="col-xs-1">
                            <label>For Practice</label>
                        </td>
                        <td class="col-xs-1">
                            <label>For Test</label>
                        </td>

                    </tr>

                </thead>
                <tr>
                    <td>

                    </td>
                </tr>
            </table>

        </div>
    <div id="showTest">
        <table id="ShowUsersTest">

        </table>

    </div>
        <div id="Mcqs">

        </div>
        <div id="Questions">

        </div>
        <div id="test">
            <div id="InformationTest">
                <label>Name </label>
                <label id="lblUserName"></label>
                <label>Time Left</label>
                <img src="../All_Images/counter.gif" width="40px" height="30px" />
                <label>Quiz Start Time</label><label id="QuizStartTime"></label>
            </div>
            <div id="Question">
                <label>Question No. </label><label id="lblQuestionNo"></label>
                <label >Start Time:</label><label id="StartTime"></label>
                <label id="lblQuestion"></label>
            </div>
            <div id="Answer">
                <label>Select Correct Option:</label>
                <table border="1">
                    <tr>
                        <td>
                            <input type="radio" />
                        </td>
                        <td>
                            <label id="lblOption1"></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" />
                        </td>
                        <td>
                            <label id="lblOption2"></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" />
                        </td>
                        <td>
                            <label id="lblOption3"></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" />
                        </td>
                        <td>
                            <label id="lblOption4"></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" />
                        </td>
                        <td>
                            <label id="lblOption5"></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" />
                        </td>
                        <td>
                            <label id="lblOption6"></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" />
                        </td>
                        <td>
                            <label id="lblOption7"></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" />
                        </td>
                        <td>
                            <label id="lblOption8"></label>
                        </td>
                    </tr>
                </table>

            </div>
            <div id="buttons">
                <input type="button" id="btnNextQuestion" />
                <input type="button" id="btnPreviousQuestion" />

            </div>
            <div id="Status">

            </div>
        </div>
    </div>
    </form>
</body>
</html>
