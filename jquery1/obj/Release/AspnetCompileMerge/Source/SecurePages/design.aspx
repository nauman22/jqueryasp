<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="design.aspx.cs" Inherits="jquery1.SecurePages.design" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome</title>

    <script src="../Scripts/jquery-1.11.2.min.js"></script>
    <script src="../ckeditor/ckeditor.js"></script>
    <script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <link href="../Styles/CustomStyles.css" rel="stylesheet" />
    <link href="../Scripts/datetimepicker-master/jquery.datetimepicker.css" rel="stylesheet" />
    <script src="../Scripts/datetimepicker-master/jquery.datetimepicker.js"></script>
    <script src="../DataTables/DataTables-1.10.8/media/js/jquery.dataTables.min.js"></script>
    <link href="../DataTables/DataTables-1.10.8/media/css/jquery.dataTables.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="background-color: cadetblue; width: 95%">

            <label class="information">information</label>
            <style>
                .table_FirstTdWidth {
                    width: 15%;
                }

                .lblQuest {
                    font-size: 35px;
                    font-weight: bold;
                    color: green;
                }

                .question {
                    font-size: 13px;
                }

                .opt {
                    font-size: 30px;
                    font-weight: bold;
                }

                .rdb_opt {
                    width: 25px;
                    height: 29px;
                }

                .opt_td {
                    width: 97%;
                    background-color: lightyellow;
                }

                .btn {
                    background: #3498db;
                    background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
                    background-image: -moz-linear-gradient(top, #3498db, #2980b9);
                    background-image: -ms-linear-gradient(top, #3498db, #2980b9);
                    background-image: -o-linear-gradient(top, #3498db, #2980b9);
                    background-image: linear-gradient(to bottom, #3498db, #2980b9);
                    -webkit-border-radius: 28;
                    -moz-border-radius: 28;
                    border-radius: 28px;
                    font-family: Arial;
                    color: #ffffff;
                    font-size: 20px;
                    padding: 10px 20px 10px 20px;
                    text-decoration: none;
                }

                    .btn:hover {
                        background: #3cb0fd;
                        background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
                        background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
                        background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
                        background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
                        background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
                        text-decoration: none;
                    }

                .myButton {
                    background-color: #44c767;
                    -moz-border-radius: 20px;
                    -webkit-border-radius: 20px;
                    border-radius: 20px;
                    border: 1px solid #18ab29;
                    display: inline-block;
                    cursor: pointer;
                    color: #ffffff;
                    font-family: Arial;
                    font-size: 28px;
                    font-weight: bold;
                    padding: 6px 18px;
                    text-decoration: none;
                }

                    .myButton:hover {
                        background-color: #5cbf2a;
                    }

                    .myButton:active {
                        position: relative;
                        top: 1px;
                    }

                    .myButton:disabled {
                        background-color: gray;
                        color: lightgray;
                        position: relative;
                        top: 1px;
                    }

                .wrong_Red {
                    background-color: #F7000E;
                    color: #E5F2F3;
                }

                .correct_Green {
                    background-color: #07F700;
                    color: #0E0E0E;
                }

                .correct_yellow {
                    background-color: #F7CA00;
                    color: #0E0E0E;
                }

                .rd_Wrong_Red {
                    background-color: #F7000E;
                }

                .rd_Correct_Green {
                    background-color: #07F700;
                }

                .rd_Correct_yellow {
                    background-color: #F7CA00;
                }

                .td_Correct {
                    background-color: green;
                }

                .td_Select_Not_Correct {
                    background-color: yellow;
                }

                .td_Select_wrong {
                    background-color: red;
                }



                #intro-wrap {
                    position: relative;
                    z-index: 1;
                    border-left: 25px solid rgba(0,0,0,.2);
                    width: 200px;
                }

                #contentWrap {
                    background: rgba(0,0,0,.8);
                    padding: 15px 40px 25px 30px;
                }

                #intro-wrap h1 {
                    font-family: "PT Sans Narrow";
                    font-size: 25px;
                    color: #fff;
                    font-weight: 700;
                    margin-bottom: 0px !important;
                    padding-bottom: 10px;
                }

                #panel {
                    background: #EADDD0;
                    height: 200px;
                    display: none;
                }

                .slide {
                    margin: 0;
                    padding: 0;
                    /*border-top: solid 4px #422410;*/
                    /*background: url(..All_Images/btn-slide.gif) no-repeat center top;*/
                    background-color: orange;
                }

                .btn-slide {
                    background: url(../All_Images/white-arrow.gif) no-repeat right -50px;
                    text-align: center;
                    width: 144px;
                    height: 31px;
                    padding: 10px 10px 0 0;
                    margin: 0 auto;
                    display: block;
                    font: bold 120%/100% Arial, Helvetica, sans-serif;
                    color: #fff;
                    text-decoration: none;
                }

                .active {
                    background-position: right 12px;
                }
            </style>
            <script type="text/javascript">
                var QuestioNo = 0;
                var firstQNo = 0;
                var lastQNo = 0;

                var CorrectAnswers = 0;
                var WrongAnswers = 0;
                var TotalQuestAttempt = 0;
                var QMarks = 0;
                var NegativeMarking = 0;
                var TotalQuestAttemptMarks = 0;
                var Result = 0;
                var TotalQuestions = 0;
                var TotalMarks = 0;
                var CurrectQNo = 0;


               // String.prototype.unquoted = function () { return this.replace(/(^")|("$)/g, '') }

                function Marks() {
                    op1ch = $("#op1").is(':checked');
                    //alert("op1 is checked");
                    op2ch = $("#op2").is(':checked');
                    op3ch = $("#op3").is(':checked');
                    op4ch = $("#op4").is(':checked');
                    op5ch = $("#op5").is(':checked');
                    op6ch = $("#op6").is(':checked');
                    op7ch = $("#op7").is(':checked');
                    op8ch = $("#op8").is(':checked');
                    if ((op1ch == true & CorrectAnswers == 1) || (op2ch == true & CorrectAnswers == 2) ||
                        (op2ch == true & CorrectAnswers == 2) || (op2ch == true & CorrectAnswers == 2) ||
                        (op2ch == true & CorrectAnswers == 2) || (op2ch == true & CorrectAnswers == 2) ||
                        (op2ch == true & CorrectAnswers == 2) || (op2ch == true & CorrectAnswers == 2)) {
                        //   var m =parseInt(TotalQuestAttemptMarks.val()) + parseInt(QMarks.val());
                        //alert("TotalQuestionAttemptMarks  " + parseInt(TotalQuestAttemptMarks.val()) + " QMarks  " + parseInt(QMarks.val()));
                        TotalQuestAttemptMarks += parseInt(QMarks)
                        console.log("Obtained Marks = " + TotalQuestAttemptMarks);
                        $("#obMarks").text(TotalQuestAttemptMarks);
                        // alert("This is correct ");
                    }
                    else {
                        // alert("Ops it wrong Answer :(");
                    }
                };
                function Getmcqs_Detail(QuestionNo) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "design.aspx/Getmcqs_Detail",
                        data: "{'QNo':'" + QuestioNo + "'}",
                        dataType: "json",
                        success: function (data) {
                            var len = data.d.length;
                            if (len > 0) {
                                for (var i = 0; i < len; i++) {
                                    if (QuestionNo == 0) {
                                        TotalQuestions = data.d[i].TotalQuestion;
                                        lastQNo = TotalQuestions;
                                        TotalMarks = data.d[i].TotalPoints;
                                        var UserEmail = data.d[i].UserEmail;
                                        var UserImage = data.d[i].UserImage;
                                        $("#UserEmail").text(UserEmail);

                                        $("#TotalQuest").text(TotalQuestions);
                                        $("#TotalPoints").text(TotalMarks);

                                    }
                                }

                            }
                        },
                        error: function (data) {
                            alert("Error");
                        }
                    });
                }
                function Getmcqs(QuestionNo) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "design.aspx/Dashboard_UsersMcqs",
                        data: "{'QNo':'" + QuestioNo + "'}",
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
                            if (len == 0) {
                                // lastQNo = QuestionNo--;
                                $("#btnNext").prop('disabled', true);
                            }
                            else {

                                //$("#btnPrevious").prop('disabled', false);
                            }
                            //alert(len);
                            if (len > 0) {
                                // CurrectQNo++;
                                //  $("#lblQuestionsId").text(CurrectQNo);
                                for (var i = 0; i < len; i++) {
                                    //alert(data.length);
                                    //alert(data.d[i].SubjectName);
                                    // if (data.d[i].SubjectName )//&& data[i].TestName && data[i].TestStartingDate && data[i].TestEndingDate && data[i].TestStatus)
                                    //  {
                                    //alert("in loop " + QuestionNo);

                                    if (QuestionNo == 0) {
                                        firstQNo = data.d[i].QuestionId;
                                        // lastQNo = data.d[i].TotalQuestion;
                                    }
                                    QuestioNo = data.d[i].QuestionId;
                                    console.log("Question No. GetMcqs() when first loaded = " + QuestionNo);
                                    var Mode = data.d[i].Mode;   // if mode = 0 it is practice mode else it is test mode.
                                    // alert(Mode);
                                    console.log("This is Mode value = " + Mode);
                                    // alert("This is Question NO" + QuestioNo);
                                    var QuestionText = data.d[i].QuestionText.unquoted();
                                    var option1Text = data.d[i].op1Text.unquoted();
                                    var option2Text = data.d[i].op2Text.unquoted();
                                    var option3Text = data.d[i].op3Text;
                                    var option4Text = data.d[i].op4Text;
                                    var option5Text = data.d[i].op5Text;
                                    var option6Text = data.d[i].op6Text;
                                    var option7Text = data.d[i].op7Text;
                                    var option8Text = data.d[i].op8Text;
                                    var Op1Correct = data.d[i].Op1Correct;
                                    var Op2Correct = data.d[i].Op2Correct;
                                    var Op3Correct = data.d[i].Op3Correct;
                                    var Op4Correct = data.d[i].Op4Correct;
                                    var Op5Correct = data.d[i].Op5Correct;
                                    var Op6Correct = data.d[i].Op6Correct;
                                    var Op7Correct = data.d[i].Op7Correct;
                                    var Op8Correct = data.d[i].Op8Correct;

                                    // alert(option8Text.length);
                                    if ((option3Text.length == 0) || (option3Text == null)) {
                                        $("#trop3").hide();
                                    }
                                    else {

                                        option3Text = data.d[i].op3Text.unquoted();
                                        $("#trop3").show();

                                    }
                                    if (option4Text.length == 0) {
                                        $("#trop4").hide();
                                    }
                                    else {
                                        option4Text = data.d[i].op4Text.unquoted();
                                        $("#trop4").show();
                                    }
                                    console.log("option 5 text length = " + option5Text);
                                    if (option5Text == null) {
                                        $("#trop5").hide();
                                    }
                                    else {
                                        option5Text = data.d[i].op5Text.unquoted();
                                        $("#trop5").show();
                                    }
                                    if (option6Text == null) {
                                        $("#trop6").hide();
                                    }
                                    else {
                                        option6Text = data.d[i].op6Text.unquoted();
                                        $("#trop6").show();
                                    }
                                    if (option7Text == null) {
                                        $("#trop7").hide();
                                    }
                                    else {
                                        option7Text = data.d[i].op7Text.unquoted();
                                        $("#trop7").show();
                                    }
                                    if (option8Text == null) {
                                        $("#trop8").hide();
                                    }
                                    else {
                                        option8Text = data.d[i].op8Text.unquoted();
                                        $("#trop8").show();
                                    }
                                    $("#lblSubjectName").text(data.d[i].SubjectName);
                                    $("#lblTestName").text(data.d[i].TestName);
                                    $("#lblQuestionsId").text(data.d[i].QuestionId);
                                    $("#lblQuestionPoints").text(data.d[i].Points);
                                    // alert("This Question Marks = "+data.d[i].Points);
                                    $("#questionText").html(QuestionText);
                                    $("#op1Text").html(option1Text);
                                    $("#op2Text").html(option2Text);
                                    $("#op3Text").html(option3Text);
                                    $("#op4Text").html(option4Text);
                                    $("#op5Text").html(option5Text);
                                    $("#op6Text").html(option6Text);
                                    //if (option6Text == '') {

                                    //}

                                    //var Mode = 0;   // if mode = 0 it is practice mode else it is test mode.
                                    //var CorrectAnswers = 0;
                                    //var WrongAnswers = 0;
                                    //var TotalQuestAttempt = 0;
                                    //var QMarks = 0;
                                    //var NegativeMarking = 0;
                                    //var TotalQuestAttemptMarks = 0;
                                    //var Result = 0;
                                    $("#op7Text").html(option7Text);
                                    $("#op8Text").html(option8Text);
                                    //  alert("op1 = " + Op1Correct + "  op2 = " + Op2Correct + " op3 = " + Op3Correct + "  and op4 = " + Op4Correct);
                                    if (Op1Correct == true) {
                                        if (Mode == 0) {
                                            $("#op1").prop("checked", true);
                                            $("#tdop1").addClass('RadioCorrectColor');
                                            $("#tdop2").removeClass('RadioCorrectColor');
                                            $("#tdop3").removeClass('RadioCorrectColor');
                                            $("#tdop4").removeClass('RadioCorrectColor');
                                        }
                                        else {
                                            CorrectAnswers = 1;
                                            QMarks = (data.d[i].Points);
                                            Marks();
                                        }



                                    }
                                    if (Op2Correct == true) {

                                        if (Mode == 0) {
                                            $("#op2").prop("checked", true);
                                            $("#tdop2").addClass('RadioCorrectColor');
                                            $("#tdop1").removeClass('RadioCorrectColor');
                                            $("#tdop3").removeClass('RadioCorrectColor');
                                            $("#tdop4").removeClass('RadioCorrectColor');
                                        } else {
                                            CorrectAnswers = 2;
                                            QMarks = (data.d[i].Points);
                                            Marks();
                                        }

                                    }
                                    if (Op3Correct == true) {
                                        if (Mode == 0) {
                                            $("#op3").prop("checked", true);
                                            $("#tdop3").addClass('RadioCorrectColor');
                                            $("#tdop2").removeClass('RadioCorrectColor');
                                            $("#tdop1").removeClass('RadioCorrectColor');
                                            $("#tdop4").removeClass('RadioCorrectColor');
                                        }
                                        else {
                                            CorrectAnswers = 3;
                                            QMarks = (data.d[i].Points);
                                            Marks();
                                        }
                                    }
                                    if (Op4Correct == true) {
                                        if (Mode == 0) {
                                            $("#op4").prop("checked", true);
                                            $("#tdop4").addClass('RadioCorrectColor');
                                            $("#tdop2").removeClass('RadioCorrectColor');
                                            $("#tdop3").removeClass('RadioCorrectColor');
                                            $("#tdop1").removeClass('RadioCorrectColor');
                                        }
                                        else {
                                            CorrectAnswers = 4;
                                            QMarks = (data.d[i].Points);
                                            Marks();
                                        }

                                    }



                                    //txt += '<tbody><tr><td>' + data.d[i].SubjectName + '</td><td>' + data.d[i].TestName + '</td><td>' + data.d[i].TestStartingDate + '</td><td>' + data.d[i].TestEndingDate + '</td><td>' + data.d[i].TestStatus + '</td></tr></tbody>';
                                    //  }
                                    //alert(txt);
                                }

                                //if (txt != '') {
                                //   // $("#tableShowUserMcqs").append(txt).removeClass("hidden");
                                //    //$("#tableShowUserMcqs").DataTable();
                                //    //  alert(txt);
                                //}
                            }

                        },
                        error: function (data) {
                            alert("Error");
                        }
                    });
                }
                function colorCorrect(Selected) {
                    var tdop = '#tdop' + Selected;
                    var tdoptxt = '#tdop' + Selected + 'txt';
                    $(tdop).addClass("td_Select_wrong");
                    $(tdoptxt).addClass("td_Select_wrong");
                    console.log("colorcorrect function is called");
                }
                function setGreen(val) {
                    var tdop = '#tdop' + val;
                    var tdoptxt = '#tdop' + val + 'txt';
                    $(tdop).addClass("td_Correct");
                    $(tdoptxt).addClass("td_Correct");
                    console.log("green function called and correct answer = " + CorrectAnswers);

                }
                function setYellow(val) {
                    var tdop = '#tdop' + val;
                    var tdoptxt = '#tdop' + val + 'txt';
                    $(tdop).addClass("td_Select_Not_Correct");
                    $(tdoptxt).addClass("td_Select_Not_Correct");
                    console.log("yello function called and correct answer = " + CorrectAnswers);
                }
                function removeColors() {
                    $('td').removeClass("td_Select_Not_Correct");
                    $('td').removeClass("td_Correct");
                    $('td').removeClass("td_Select_wrong");
                    // td_Correct td_Select_wrong
                    console.log("removecolors called");
                }
                $(document).ready(function () {
                    Getmcqs_Detail(QuestioNo);
                    Getmcqs(QuestioNo);
                    $(".btn-slide").click(function () {
                        $("#panel").slideToggle("slow");
                        $(this).toggleClass("active"); return false;
                    });


                    $('.close-intro').click(function () {
                        $('#intro-wrap').animate({
                            //opacity: 0.25,
                            left: '-225',
                        }, 400, function () {
                            // Animation complete.
                        });
                        $('.open-intro').show();
                        $('.close-intro').hide();
                    });

                    $("#op1").change(function () {
                        op1ch = $("#op1").is(':checked');
                        if ((op1ch == true & CorrectAnswers == 1)) {
                            setGreen(1);
                            console.log("Correct Answer Hurrah");
                        }
                        else {


                            var selected_option = $("input[type='radio'].rdb_opt:checked").val();
                            colorCorrect(selected_option);
                            setYellow(CorrectAnswers);
                            console.log("Selected option =  " + selected_option);

                        }
                        //console.log("Hello Nauman I am option 1 :)");
                    });

                    $("#op2").change(function () {
                        op2ch = $("#op2").is(':checked');
                        if ((op2ch == true & CorrectAnswers == 2)) {
                            setGreen(2);
                            console.log("Correct Answer Hurrah");
                        }
                        else {


                            var selected_option = $("input[type='radio'].rdb_opt:checked").val();
                            colorCorrect(selected_option);
                            setYellow(CorrectAnswers);
                            console.log("Wrong Answer sorry ");
                        }
                        // console.log("Hello Nauman I am option 2 :)");
                    });
                    $("#op3").change(function () {
                        op3ch = $("#op3").is(':checked');
                        if ((op3ch == true & CorrectAnswers == 3)) {
                            setGreen(3);
                            console.log("Correct Answer Hurrah");
                        }
                        else {
                            var selected_option = $("input[type='radio'].rdb_opt:checked").val();
                            colorCorrect(selected_option);
                            setYellow(CorrectAnswers);
                            console.log("Wrong Answer sorry ");
                        }
                    });


                    $("#op4").change(function () {
                        op4ch = $("#op4").is(':checked');
                        if ((op4ch == true & CorrectAnswers == 4)) {
                            console.log("Correct Answer Hurrah");
                        }
                        else {
                            console.log("Wrong Answer sorry ");
                        }
                    });
                    $("#op5").change(function () {
                        op5ch = $("#op5").is(':checked');
                        if ((op5ch == true & CorrectAnswers == 5)) {
                            console.log("Correct Answer Hurrah");
                        }
                        else {
                            console.log("Wrong Answer sorry ");
                        }
                    });
                    $("#op6").change(function () {
                        op6ch = $("#op6").is(':checked');
                        if ((op6ch == true & CorrectAnswers == 6)) {
                            console.log("Correct Answer Hurrah");
                        }
                        else {
                            console.log("Wrong Answer sorry ");
                        }
                    });
                    $("#op7").change(function () {
                        op7ch = $("#op7").is(':checked');
                        if ((op7ch == true & CorrectAnswers == 7)) {
                            console.log("Correct Answer Hurrah");
                        }
                        else {
                            console.log("Wrong Answer sorry ");
                        }
                    });
                    $("#op8").change(function () {
                        op8ch = $("#op8").is(':checked');
                        if ((op8ch == true & CorrectAnswers == 8)) {
                            console.log("Correct Answer Hurrah");
                        }
                        else {
                            console.log("Wrong Answer sorry ");
                        }
                    });


                    //alert("QNo on window load" + QuestioNo);


                    $("#btnNext").click(function () {
                        //alert
                        removeColors();
                        console.log("This is Quesiton No" + QuestioNo + " and lastQNo. = " + lastQNo)

                        if (QuestioNo == lastQNo) {
                            // removeColors();

                            $("#btnNext").prop('disabled', true);
                            $("#btnPrevious").prop('disabled', false);
                            $("#btnEnd").prop('disabled', true);
                            $("#btnFirst").prop('disabled', false);
                            //alert(' in minus ' + QuestioNo);
                        }
                        else {
                            // Marks();
                            //  removeColors();
                            $('input[name="op"]').prop('checked', false);
                            QuestioNo++;
                            console.log("btnNext Qno = " + QuestioNo);

                            Getmcqs(QuestioNo);
                            $("#btnPrevious").prop('disabled', false);
                            $("#btnFirst").prop('disabled', false);
                            $("#btnEnd").prop('disabled', false);
                            //if (QuestioNo == preQNo) {
                            //    $("#btnNext").prop("disabled", true);
                            //    $("#btnPrevious").prop("disabled", false);
                            //}

                            //alert('in minus ' + QuestioNo);

                        }



                        //   alert(Getmcqs(QuestioNo).op1Text.length);
                    })

                    $("#btnFirst").click(function () {
                        removeColors();
                        QuestioNo = 0;
                        //alert("This is Quesiton No" + QuestioNo)
                        Getmcqs(QuestioNo);

                        $("#btnNext").prop('disabled', false);
                        $("#btnPrevious").prop('disabled', true);
                        $("#btnFirst").prop('disabled', true);
                        $("#btnEnd").prop('disabled', false);
                    })

                    $("#btnPrevious").click(function () {
                        removeColors();
                        // alert(QuestioNo);
                        //alert("first question no " + firstQNo);
                        if (QuestioNo == firstQNo) {
                            // alert(QuestioNo);
                            $("#btnPrevious").prop('disabled', true);
                            $("#btnNext").prop('disabled', false);
                            $("#btnEnd").prop('disabled', false);
                            $("#btnFirst").prop('disabled', true);
                            return true;
                            //QuestioNo++;
                            //alert(' in minus ' + QuestioNo);
                        }
                        //  alert('last questio no' + lastQNo);

                        if (QuestioNo <= lastQNo) {
                            //QuestioNo = lastQNo;
                            QuestioNo--;
                            // alert('question no = lastquno = ' + QuestioNo);
                            CurrectQNo -= 2;
                            Getmcqs(QuestioNo);

                            $("#btnNext").prop('disabled', false);
                            $("#btnFirst").prop('disabled', false);
                            $("#btnEnd").prop('disabled', false);
                        }
                        else {

                            QuestioNo--;
                            CurrectQNo -= 2;
                            $("#btnNext").prop('disabled', false);
                            Getmcqs(QuestioNo);
                            $("#btnFirst").prop('disabled', false);
                            //alert('in minus ' + QuestioNo);
                        }
                        //alert("This is Quesiton No" + QuestioNo)

                    })
                    $("#btnEnd").click(function () {
                        removeColors();
                        QuestioNo = -2;
                        //alert("This is Quesiton No" + QuestioNo)
                        Getmcqs(QuestioNo);
                        $("#btnNext").prop('disabled', true);
                        $("#btnPrevious").prop('disabled', false);
                        $("#btnEnd").prop('disabled', true);
                        $("#btnFirst").prop('disabled', false);
                    })


                });
            </script>
            <style>
                .RadioCorrectColor {
                    background-color: green;
                }

                tr.border {
                    outline: thin solid black;
                }

                .mytd {
                    border-right: thin solid black;
                }

                .td_width {
                    width: 20%;
                }

                .information {
                    font-size: 29px;
                    font-weight: bold;
                    text-transform: capitalize;
                   
                     
                      
                }
            </style>


            <div id="Information" style=" background-color: beige;width: 100%;" >
                <div id="panel">
                    <!-- you can put content here -->
                    <table id="infoTable" width="100%" style="border-spacing: 7px;">
                        <tr>
                            <td class="table_FirstTdWidth ">
                                <label>Subject Name: </label>
                            </td>
                            <td class="td_width">
                                <label id="lblSubjectName"></label>
                            </td>
                            <td class="table_FirstTdWidth">
                                <label>Test Name:</label></td>
                            <td>
                                <label id="lblTestName"></label>
                            </td>
                            <td>
                                <img height="100px" width="90px" style="margin-top: -2%; /* margin-bottom: 4%; */float: right; margin-left: -12%; position: absolute;" />
                            </td>
                            <td>
                                <label style="position: absolute; margin-top: 6%; margin-left: -12%;" id="UserEmail"></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Question No.</label></td>
                            <td>
                                <label id="lblQuestionsId"></label>
                            </td>
                            <td>
                                <label>Total Questions</label></td>
                            <td>
                                <label id="TotalQuest"></label>
                            </td>
                            <%--<td><label>Time</label>
                            <div id="my-timer">
                            <b id="show-time">5</b> 
                            </div>
                           
                        </td>
                        <td>
                            
                        </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <label>Current Question Marks</label></td>
                            <td>
                                <label id="lblQuestionPoints"></label>
                            </td>
                            <td>
                                <label>Total Question Marks</label></td>
                            <td>
                                <label id="TotalPoints"></label>
                            </td>
                            <%--  <td><label>Current Date Time</label></td>
                        <td><label>Monday 19-Oct-2015 at 7:56 PM</label></td>--%>
                        </tr>
                        <tr>
                            <td>
                                <label>Obtained Marks</label></td>
                            <td>
                                <label id="obMarks"></label>
                            </td>

                        </tr>
                    </table>
                </div>

                <p class="slide"><a href="#" class="btn-slide"></a></p>

            </div>


            <div id="Questions" style="background-color: aliceblue">
                <%-- <label class="question">Question</label>--%>
                <label id="questionText" class="lblQuest">What is the meaning of LMS ?</label>
            </div>
            <div id="Description" style="background-color: aliceblue">
                <label>Please Choose Correct Options</label>

            </div>
            <div id="Answers" style="background-color: aquamarine">
                <label>Answers</label>
                <table>
                    <tr id="trop1" class="border">
                        <td id="tdop1" class="mytd">
                            <input type="radio" id="op1" name="op" class="rdb_opt" value="1" />
                        </td>
                        <td class="opt_td" id="tdop1txt">
                            <label id="op1Text" class="opt"></label>
                        </td>
                    </tr>
                    <tr id="trop2" class="border">
                        <td id="tdop2" class="mytd">
                            <input type="radio" id="op2" name="op" class="rdb_opt" value="2" />
                        </td>
                        <td class="opt_td" id="tdop2txt">
                            <label id="op2Text" class="opt">Learning Memory System</label>
                        </td>
                    </tr>
                    <tr id="trop3" class="border">
                        <td id="tdop3" class="mytd">
                            <input type="radio" id="op3" name="op" class="rdb_opt" value="3" />
                        </td>
                        <td class="opt_td" id="tdop3txt">
                            <label id="op3Text" class="opt">Learning Memory System</label>
                        </td>
                    </tr>
                    <tr id="trop4" class="border">
                        <td id="tdop4" class="mytd">
                            <input type="radio" id="op4" name="op" class="rdb_opt" value="4" />
                        </td>
                        <td class="opt_td" id="tdop4txt">
                            <label id="op4Text" class="opt">Learning Memory System</label>
                        </td>
                    </tr>
                    <tr id="trop5" class="border">
                        <td id="tdop5">
                            <input type="radio" id="op5" name="op" class="rdb_opt" value="5" />
                        </td>
                        <td class="opt_td" id="tdop5txt">
                            <label id="op5Text" class="opt">Learning Memory System</label>
                        </td>
                    </tr>
                    <tr id="trop6" class="border">
                        <td id="tdop6">
                            <input type="radio" id="op6" name="op" class="rdb_opt" value="6" />
                        </td>
                        <td class="opt_td" id="tdop6txt">
                            <label id="op6Text" class="opt">Learning Memory System</label>
                        </td>
                    </tr>
                    <tr id="trop7" class="border">
                        <td id="tdop7">
                            <input type="radio" id="op7" name="op" class="rdb_opt" value="7" />
                        </td>
                        <td class="opt_td" id="tdop7txt">
                            <label id="op7Text" class="opt">Learning Memory System</label>
                        </td>
                    </tr>
                    <tr id="trop8" class="border">
                        <td id="tdop8">
                            <input type="radio" id="op8" name="op" class="rdb_opt" value="8" />
                        </td>
                        <td class="opt_td" id="tdop8txt">
                            <label id="op8Text" class="opt">Learning Memory System</label>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="bottom" style="text-align: right;">

                <input type="button" value="First" id="btnFirst" class="myButton" />
                <input type="button" value="Next" id="btnNext" class="myButton" />
                <input type="button" value="Previous" id="btnPrevious" class="myButton" />
                <input type="button" value="End" id="btnEnd" class="myButton" />


            </div>
        </div>
    </form>
</body>
</html>
