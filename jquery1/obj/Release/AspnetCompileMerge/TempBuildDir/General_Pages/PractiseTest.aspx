<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PractiseTest.aspx.cs" Inherits="jquery1.General_Pages.PractiseTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta http-equiv="X-UA-Compatible" content="IE=9">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Developed By Freemcqs.com">
    <meta name="author" content="Free mcqs">
    <meta name="keywords" content="Important Questions, Mcqs, Solved Mcqs, mcqs test, Past papers, online mcqs">
    <link rel="icon" href="../acme-free/img/faviconFinal.ico" />
      <!-- Bootstrap core CSS -->
    
    <link href="../acme-free/css/bootstrap.min.css" rel="stylesheet">
    <link href="../acme-free/css/alertify.core.css" rel="stylesheet" />
    <link href="../acme-free/css/alertify.default.css" rel="stylesheet" />
    <link href="../acme-free/css/theme.css" rel="stylesheet">
    <link href="../acme-free/css/bootstrap-reset.css" rel="stylesheet">
  <title>FreeMcqs For all | Online MCQS Test, Practise and result
    </title>
      <style>
        p:first-letter {
            text-transform: capitalize;
        }

        .Practice {
        }

        .AddUserMcqs {
        }

        .checkimg {
            width: 23px;
            /*margin-left: 14px;
            width: 32px;*/
        }

        .optionimg {
            width: 23px;
            /*width: 28px;
            margin-left: 14px;*/
        }

        .questionimg {
            width: 23px;
            /*width: 36px;
            margin-left: 8px;*/
        }

        .listimg {
            width: 18px;
            /*width: 20px;
            margin-left: 14px;*/
        }

        .pop {
            /*margin-top: 14px;*/
            font-weight: normal;
            font-size: 12px;
            text-align: left;
            margin-left: 7px;
            text-transform: capitalize;
        }

        .optiontext {
            /*font-size: 19px;*/
            text-align: left;
            margin-left: 7px;
            text-transform: capitalize;
        }

        .exptxt {
            color: white;
            font-size: 10px;
            margin-left: 5%;
            cursor: pointer;
        }

        input.largerCheckbox {
            width: 30px;
            height: 30px;
            margin-left: 7px;
        }

        .correctcls {
            background-color: yellowgreen;
        }

        .inCorrectcls {
            background-color: #F7E424;
        }

        .inCorrectSelected {
            background-color: #EA082A;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
          <header class="head-section" id="testheader" style="display: none;">

        <div class="navbar navbar-fixed-top navbar-static-top container" id="fixedheader" style="background-color: azure; min-height: 72px;">
            <div class="navbar-header">
                <button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse"
                    type="button">
                    <span class="icon-bar"></span><span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/default.aspx">Free<span>Mcqs</span></a>
                <label id="lblTestNamed">Test Name:MCAT - Biology Past Papers.</label>
                <label style="margin-left: 20px;">Total Questions:</label>
                <label id="totq"></label>
                <label id="totr_text" style="margin-left: 24px;">Remaining: </label>
                <label id="totr"></label>
                <label style="margin-left: 24px;">Question Status:</label>
                <select id="ddlallquiz" class=" dropdown dropdown-submenu">
                    <option value="0">Select</option>
                    <option class="ddlattempted" value="1">1</option>
                    <option class="ddlnotattempted" value="2">2</option>
                </select>

                <button id="btndefaulthome" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </header>
       <div class="container">
            <div id="LoadMcqsAllQuestion" class="mcqsShow ">
                <div class="row table-responsive">
                    <div id="tblLoadMcqsAllQuestion"  class=" ui-responsive" style=" margin-left: 2%; width: 96%; margin-top: 14%; display: none;">

                    </div>
                    

                    <button id="btnShowResultdiv" class="myresult btn btn-info btn-lg" style="margin-left: 2%; display: none;">Show Result</button>
                    <button id="btnPracticethistest" class="myresult btn btn-info btn-lg" style="display: none;">Practice this Test</button>
                    <button id="btntestthistest" class="myresult btn btn-info btn-lg" style="margin-left: 2%; display: none;">Take Test</button>

                </div>
            </div>
            <%-- <div id="LoadMcqsAllQuestion" class="mcqsShow" style=" display:none; ">
                <div class="row table-responsive">

                    <table id="tblLoadMcqsAllQuestion"   border="1" class=" ui-responsive" style="margin-left: 2%;  display:none;   width: 96%;">
                        <thead>
                            <tr>

                                <th>
                                    <img class="listimg" src="../acme-free/img/list2.png" />

                                </th>
                                <th>Question and Options

                                </th>

                            </tr>
                        </thead>
                        <tbody id="tbodytblLoadMcqsAllQuestion">
                    </table>

                    <button id="btnShowResultdiv" class="myresult btn btn-info btn-lg" style="display:none; margin-left: 25px; margin-top:3px;">Show Result</button>
                    <button id="btnPracticethistest" class="myresult btn btn-info btn-lg" style="display:none;  margin-left: 5px; margin-top:3px;">Practice this Test</button>
                    <button id="btntestthistest" class="myresult btn btn-info btn-lg" style="display:none; margin-left: 25px; margin-top:3px;">Take Test</button>

                </div>
            </div>--%>
        </div>
    </div>
    </form>
     <script src="/Scripts/jquery-1.11.2.min.js"></script>
    <%-- <script src="../acme-free/js/jquery-1.8.3.min.js"></script>--%>
    <script src="/acme-free/js/bootstrap.min.js"></script>
     <script src="/acme-free/js/jquery.blockUI.js"></script>
    <script src="/acme-free/js/alertify.min.js"></script>
  
    <script>
        $(document).ready(function () {
            String.prototype.unquoted = function () { return this.replace(/(^")|("$)/g, '') }
            String.prototype.notBackSlash = function () { return this.replace(/\\/g, '\\\\') };
            function hide_all() {

                $('#bgimg').hide();
                $('#btnShowResultdiv').hide();
                $('#LoadMcqsAllQuestion').hide();
                $('#btntestthistest').hide();
                $('#btnPracticethistest').hide();
                $('#maintable').hide(); //allmcqscount
                $('#allmcqscount').hide(); //testheader
                $('#testheader').hide(); //testheader
                $("#divinst").hide();
                $("#MoreOptions").hide();
                $("#reference").hide();
                $("#Explanation").hide();
            }
            function goToByScroll(id) {
                // Remove "link" from the ID
                //  id = id.replace("link", "");
                // Scroll

                $('html, body').animate({
                    scrollTop: ($("#" + id).offset().top - 91)
                }, 50);


            }



            function blockui() {
                $.blockUI({
                    css: {
                        border: 'none',
                        padding: '15px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }
                });
            }
            function getParameterByName(name, url) {
               // //debugger;
                if (!url) url = window.location.href;
                name = name.replace(/[\[\]]/g, "\\$&");
                var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                    results = regex.exec(url);
                if (!results) return null;
                if (!results[2]) return '';
                return decodeURIComponent(results[2].replace(/\+/g, " "));
            }
            //var tr = $(this).closest('tr');
            //var row = myTable.row(tr);
            //var Id = myTable.row(row[0][0]).data()[2];
            $("#lblTestNamed").html(" ");
            $("#totr").html('');
            $("#totr_text").html('');
            function showTestdiv(TestId) {

                hide_all();

                Score = 0;
                TotalScore = 0;
                CurrentTestid = TestId;
                // alert(TestId)
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",

                    beforeSend: function () {
                        blockui();
                        $('#divloading').html('Please Wait while loading your requested contents...');
                    },

                    complete: function () {
                        $('#divloading').html('');
                    },
                    url: "../../../../default.aspx/LoadMcqsQuestions",
                    data: "{'TestId':'" + TestId + "','name':'" + 2 + "'}",
                    dataType: "json",
                    timeout: (2 * 1000000),
                    success: function (data) {
                        setTimeout($.unblockUI, 1000);
                        var len = data.d.length;
                        var txt = "";
                        $("#totq").text(len);
                        $("#totr").html(len);
                        $("#totr_text").html('Remaining: ');
                        TotalScore = data.d.length;
                        if (len > 0) {
                            $('#tblLoadMcqsAllQuestion').find('div').empty();

                            var Srno = 1;
                            $("#ddlallquiz").html('');
                            //$("#selectId option").remove();
                            $("#ddlallquiz").append($("<option></option>").attr("value", 0).text('Question Status'));
                            for (var i = 0; i < len; i++) {

                                $("#ddlallquiz").append($("<option></option>").attr("value", Srno).text(Srno));

                                txt += '<div id="uniq_mcq_with_options' + data.d[i].McqsQuestionId + '"><div class="row" id="tr_question_' + Srno + '" ><div class="col-sm-1" id="question' + data.d[i].McqsQuestionId + '"><input type="text" style="display:none;" id="' + data.d[i].McqsQuestionId + 'q" name="' + data.d[i].McqsQuestionId + 'q" value=' + Srno + ' ><label>Q.No.' + parseInt(Srno++) + '</label></div><div class="col-sm-10" style="background-color: #FFFFFF !important;"><b><label style="color:black; font-size:12px;  margin-left: 3px;margin-top: -1px;">' + $.trim(data.d[i].QuestionText.unquoted().replace(/\s+/g, " ")) + '</label></b></div></div>'; //  <td>' + data.d[i].Points + '</td></tr>';

                                if (data.d[i].op1 == true) {

                                    if ($.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<div class="row" id="M1' + data.d[i].McqsQuestionId + '"><div class="col-sm-1" id="1correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="1" id ="1' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-sm-10 clsloadmcqsall" ><label class="pop">' + $.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                    }

                                }
                                if (data.d[i].op2 == true) {
                                    if ($.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<div class="row" id="M2' + data.d[i].McqsQuestionId + '"><div class="col-sm-1" id="2correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="2" id ="2' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-sm-10 clsloadmcqsall" colspan="2"><label class="pop">' + $.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                    }

                                }


                                if (data.d[i].op3 == true) {

                                    if ($.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<div class="row" id="M3' + data.d[i].McqsQuestionId + '"><div class="col-sm-1" id="3correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="3" id ="3' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-sm-10 clsloadmcqsall"><label class="pop">' + $.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                    }

                                }


                                if (data.d[i].op4 == true) {
                                    if ($.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<div class="row" id="M4' + data.d[i].McqsQuestionId + '"><div class="col-sm-1" id="4correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="4" id ="4' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-sm-10 clsloadmcqsall"><label class="pop">' + $.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                    }

                                }


                                if (data.d[i].op5 == true) {

                                    if ($.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<div class="row"  id="M5' + data.d[i].McqsQuestionId + '"><div class="col-sm-1" id="5correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="5" id ="5' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-sm-10 clsloadmcqsall"><label class="pop">' + $.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                    }


                                }


                                if (data.d[i].op6 == true) {

                                    if ($.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<div class="row"  id="M6' + data.d[i].McqsQuestionId + '"><div class="col-sm-1" id="6correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="6" id ="6' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-sm-10 clsloadmcqsall"><label class="pop">' + $.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                    }

                                }


                                if (data.d[i].op7 == true) {

                                    if ($.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<div class="row"  id="M7' + data.d[i].McqsQuestionId + '" ><div class="col-sm-1" id="7correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="7" id ="7' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-sm-10 clsloadmcqsall"><label class="pop">' + $.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                    }
                                }


                                if (data.d[i].op8 == true) {

                                    if ($.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<div class="row"  id="M8' + data.d[i].McqsQuestionId + '"><div class="col-sm-1" id="8correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="8" id ="8' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-sm-10 clsloadmcqsall" ><label class="pop">' + $.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                    }
                                }
                                var correctop;
                                if (data.d[i].Option1Correct == true) {
                                    correctop = 1;
                                }
                                else
                                    if (data.d[i].Option2Correct == true) {
                                        correctop = 2;
                                    }
                                    else
                                        if (data.d[i].Option3Correct == true) {
                                            correctop = 3;
                                        }
                                        else
                                            if (data.d[i].Option4Correct == true) {
                                                correctop = 4;
                                            }
                                            else
                                                if (data.d[i].Option5Correct == true) {
                                                    correctop = 5;
                                                }
                                                else
                                                    if (data.d[i].Option6Correct == true) {
                                                        correctop = 6;
                                                    }
                                                    else
                                                        if (data.d[i].Option7Correct == true) {
                                                            correctop = 7;
                                                        }
                                                        else
                                                            if (data.d[i].Option8Correct == true) {
                                                                correctop = 8;
                                                            }

                                txt += '<div class="row" <div class="col-sm-1"><label hidden="hidden" value="' + correctop + '" id="correctop' + data.d[i].McqsQuestionId + '"  name="' + data.d[i].McqsQuestionId + '" for="' + data.d[i].McqsQuestionId + '" >' + correctop + '</label></div></div>';
                                txt += '<div class="row" ><div class="col-sm-1"></div><di class="col-sm-10"><img style="width: 20%;" src="/acme-free/img/divider2.gif" /></div></div></div></div>';
                            }

                            if (txt != '') {
                                $("#tblLoadMcqsAllQuestion").empty();
                                // $("#tblLoadMcqsAllQuestion").remove();
                                $("#tblLoadMcqsAllQuestion").append(txt);
                                $("#tblLoadMcqsAllQuestion").show();
                                $('#LoadMcqsAllQuestion').show();
                                $('#btnPracticethistest').show();
                                $('#btnShowResultdiv').show();
                                $('#statusbar').show();

                                $("#mainheader").hide();
                                $("#testheader").show();
                                //$('html, body').animate({
                                //    scrollTop: $('#LoadMcqsAllQuestion').offset().top
                                //}, 2000);

                            }
                        }

                    },
                    error: function (Result) {
                        setTimeout($.unblockUI, 1000);
                        alertify.error("Error to load Mcqs! ");
                    }
                });



            }

            // Scroll_top();
            
            // alert('hello    == id is = ' + Id + ' and row = ' + row + ' tr = ' + tr);
            $('#btntestthistest').click(function () {

                if (CurrentTestid != undefined || CurrentTestid != 0) {
                    // Scroll_top();
                    showTestdiv(CurrentTestid);
                    $("#mainheader").hide();
                    $("#testheader").show();
                    // hide_all();
                    //  $('#btnShowResultdiv').show(1000);
                    // $('#LoadMcqsAllQuestion').show(1000);

                }
                else {
                    alertify.error('Please Refresh the Page');
                }
            })
            
            function showPractice(TestId) {
                // //debugger;
                hide_all();
                // var browser = msieversion();
                // alert(browser);
                //#divMcqsQuestion
                CurrentTestid = TestId;
              //  var str = "Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/";
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "../../../../default.aspx/LoadMcqsQuestions",
                    data: "{'TestId':'" + TestId + "','name':'" + 1 + "'}",
                    dataType: "json",
                    timeout: (2 * 10000000),
                    beforeSend: function () {


                        $('#divloading').html('Please Wait while loading your requested contents...');
                        blockui();
                        //$('#lblQuestionBefore').html("Saving...");



                    },
                    complete: function () {
                        $('#divloading').html('');
                    },
                    success: function (data) {
                        var len = data.d.length;
                        var txt = "";
                        $("#totq").text(len);
                        $("#totr").text('');
                        $("#totr_text").html('');
                        subname = data.d[1].SubjectName;
                        testname = data.d[1].TestName;
                        console.log("SubName : " + subname + " testname = " + testname)
                        // var txt = new Array();
                        setTimeout($.unblockUI, 1000);
                        if (len > 0) {
                            $('#tblLoadMcqsAllQuestion').find('div').empty();
                            $("#tblLoadMcqsAllQuestion").empty();
                            $("#ddlallquiz").html('');
                            var Srno = 1;
                            var mcq = 1;
                            var exp = "";
                            $("#ddlallquiz").append($("<option></option>").attr("value", 0).text('Question Status'));
                            for (var i = 0; i < len; i++) {
                                $("#ddlallquiz").append($("<option></option>").attr("value", Srno).text(Srno));

                                txt += '<div id="uniq_mcq_with_options' + data.d[i].McqsQuestionId + '"><div class="row"><div class="col-sm-1" style="background-color: #FFFFFF !important;" id="tr_question_' + Srno + '" > <label>Q.No.'
                                    + parseInt(Srno++) +
                                    '</label></div><div class="col-sm-10"><b><label style="font-size: 14px; margin-left: 3px;margin-top: -1px;">'
                                    + $.trim(data.d[i].QuestionText.unquoted().replace(/\s+/g, " ").replace(/\n/g, " ")) +
                                    '</label></b></div></div>'; //  <td>' + data.d[i].Points + '</td></tr>';
                                // alert("data.d[i].op1 = "+data.d[i].op1)
                                parseInt(mcq++);
                                exp = "";

                                //if (($.trim(data.d[i].ExplanationText.unquoted().replace(/\s+/g, " ")).length > 10)) {
                                //    //  alert(data.d[i].ExplanationText);
                                //    exp = '<button id="explanat">How</button>';
                                //    $('#explanat').click(function () {
                                //        // $.growlUI('Explanation', data.d[i].ExplanationText);
                                //        alert('hello');
                                //    });
                                //    //trquestion_
                                //}
                                //  //debugger;
                                if (data.d[i].op1 == true) {
                                    // alert("txt = " + txt);
                                    if ($.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) != "") {

                                        if (data.d[i].Option1Correct == true) {


                                            txt += '<div  class="row  uniquemcq"><div class="correctcls col-sm-1"><img class="checkimg" src="/acme-free/img/check3.png" /></div><div  class="col-sm-10  clsloadmcqsall"><label class="pop" id="lbl_p_op1_' +
                                                data.d[i].McqsQuestionId + '" >' +
                                                $.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) + '</label>' + exp + '</div></div>';
                                            $("#explanat").remove();
                                            exp = "";
                                        }
                                        else {
                                            txt += '<div  class=" row uniquemcq"><div class= "col-sm-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-sm-10 clsloadmcqsall" ><label class="pop"  id="lbl_p_op1_' + data.d[i].McqsQuestionId + '" >' + $.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }


                                }
                                if (data.d[i].op2 == true) {

                                    if ($.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option2Correct == true) {
                                            txt += '<div class="row " ><div class="correctcls col-sm-1"><img  class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-sm-10  clsloadmcqsall"><label class="pop" id="lbl_p_op2_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) + '</label> ' + exp + '</div></div>';
                                            $("#explanat").remove();
                                            exp = "";
                                        }
                                        else {
                                            txt += '<div class="row"><div class="col-sm-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-sm-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op2_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }
                                }


                                if (data.d[i].op3 == true) {

                                    if ($.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option3Correct == true) {
                                            txt += '<div class="row " ><div class="correctcls col-sm-1"><img  class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-sm-10  clsloadmcqsall"  ><label class="pop" id="lbl_p_op3_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) + '</label>' + exp + '</div></div>';
                                            $("#explanat").remove();
                                            exp = "";
                                        }
                                        else {
                                            txt += '<div class="row"><div class="col-sm-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-sm-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op3_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }
                                }


                                if (data.d[i].op4 == true) {

                                    if ($.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option4Correct == true) {
                                            txt += '<div class="row " ><div class=" correctcls col-sm-1"><img class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-sm-10  clsloadmcqsall" ><label class="pop" id="lbl_p_op4_' + data.d[i].McqsQuestionId + '" >' + $.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) + '</label>' + exp + '</div></div>';
                                            $("#explanat").remove();
                                            exp = "";
                                        }
                                        else {
                                            txt += '<div class="row"><div class="col-sm-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-sm-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op4_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }

                                }


                                if (data.d[i].op5 == true) {

                                    if ($.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option5Correct == true) {
                                            txt += '<div class="row " ><div class="correctcls col-sm-1"><img class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-sm-10  clsloadmcqsall"><label class="pop" id="lbl_p_op5_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                        else {
                                            txt += '<div class="row"><div class="col-sm-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-sm-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op5_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                        exp = "";
                                    }
                                }


                                if (data.d[i].op6 == true) {
                                    if ($.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option6Correct == true) {
                                            txt += '<div class="row " ><div class="correctcls col-sm-1"><img class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-sm-10  clsloadmcqsall" ><label class="pop" id="lbl_p_op6_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                        else {
                                            txt += '<div class="row"><div class="col-sm-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-sm-10 clsloadmcqsall"><label class="pop" id="lbl_p_op6_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }
                                }


                                if (data.d[i].op7 == true) {
                                    if ($.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option7Correct == true) {
                                            txt += '<div class="row " ><div class="correctcls col-sm-1"><img class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-sm-10  clsloadmcqsall"  ><label class="pop" id="lbl_p_op7_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                        else {
                                            txt += '<div class="row"><div class="col-sm-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-sm-10 clsloadmcqsall"><label class="pop" id="lbl_p_op7_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }
                                }


                                if (data.d[i].op8 == true) {
                                    if ($.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option8Correct == true) {
                                            txt += '<div class="row " ><div class="correctcls col-sm-1"><img class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-sm-10  clsloadmcqsall"  ><label class="pop" id="lbl_p_op8_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                        else {
                                            txt += '<div class="row"><div class="col-sm-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-sm-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op8_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }


                                }
                                //  shuffle(txt);
                                // txt.sort(function () { return 0.5 - Math.random() });
                                //txt += txt.toString();
                                //   exp = '<a href="#" class="exptxt" data-toggle="tooltip" title="' + (data.d[i].ExplanationText) + '">How</a>';
                                txt += '</div><div class ="row"><div class="col-sm-1"></div><div class="col-sm-10" ><img style="width: 20%;" src="/acme-free/img/divider2.gif" />  <input style="display:none;" type="button" class="btn btn-default btn-sm btnReporttoggle" id="' + data.d[i].McqsQuestionId + '" name="My Name is nauman" value="Report"  /> <button class="btn  btn-social btn-facebook  sharemcq" id="999' + data.d[i].McqsQuestionId + '" name="999tr_question_' + Srno + '" style="background-color:#30487b; color:#fff; display:none; ">Post this Question on Facebook</i></button><div style="display:none;" id="btnReporttoggle_' + data.d[i].McqsQuestionId + '"></div></div></div>';

                                $(".exptxt").removeAttr("title");
                                $(".exptxt").val('');
                                txt.length = 0;
                                //if (mcq == 50) {
                                //    break;
                                //}
                                // $("#tblLoadMcqsAllQuestion").randomize('tr td');


                            }

                            if (txt != '') {
                                $("#tbodytblLoadMcqsAllQuestion").empty();

                                $("#tblLoadMcqsAllQuestion").append(txt);
                                $("#tblLoadMcqsAllQuestion").show();
                                $('#btntestthistest').hide();
                                $('#LoadMcqsAllQuestion').show();
                               

                                // $("#tblLoadMcqsAllQuestion tr").shuffle();
                                //$('html, body').animate({
                                //    scrollTop: $('#LoadMcqsAllQuestion').offset().top
                                //}, 2000);
                                // $("#tblLoadMcqsAllQuestion").DataTable();
                                //  alert(txt);
                            }
                        }

                    },
                    error: function (Result) {
                        setTimeout($.unblockUI, 1000);
                        alertify.error("a network related Error occour. Please Refresh the page! ");
                    }
                });

                //$('#divShowMcqsQuestion').show(100);
                //  $('#LoadMcqsAllQuestion').show();

            }
            var url = window.location.href;
          //  alert(url)
            //var url = "http://mywebsite/folder/file";
            var array = url.split('/');
            var lastsegment = array[array.length - 1];
            lastsegment = lastsegment.split('TestId=');
            lastsegment = lastsegment[lastsegment.length - 1];
           // window.alert(lastsegment);

            var paramTestid = lastsegment;//getParameterByName('TestId');
            console.log(paramTestid + " is the testid");
            ////debugger;
            showPractice(paramTestid)
            $("#mainheader").hide();
            $("#testheader").show();
            $("#btndefaulthome").click(function () {
                if (confirm("Are you sure you want to finish the test?")) {
                    //  //debugger;
                    window.location.replace("/default.aspx");
                    
                    //window.home();
                   
                }
                return false;

                //$("#logindiv").show();

            });
            $("#ddlallquiz").change(function () {
                // //debugger;
                var select_qno = $("#ddlallquiz").val();
                var tridse = 'tr_question_' + select_qno;
                //var divPosition = $(trid).offset();

                goToByScroll(tridse);
                // $(tridse).on('click', goToByScroll($(tridse).val()));
                // alert($('.content-nav').offset());

                //$(trid).scroll();
                //console.log(trid);
                // document.getElementById("#" + trid).scrollIntoView()
                //$(trid).scrollView();

                // container.scrollTop(scrollTo.offset().top - container.offset().top + container.scrollTop());

            })
        });
    </script>
</body>
</html>
