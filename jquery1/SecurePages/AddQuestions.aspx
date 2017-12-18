<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddQuestions.aspx.cs" Inherits="jquery1.SecurePages.AddQuestions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="../Scripts/jquery-1.11.2.min.js"></script>
    <script src="../ckeditor/ckeditor.js"></script>
    <link href="../bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <link href="../Styles/CustomStyles.css" rel="stylesheet" />
    <link href="../Scripts/datetimepicker-master/jquery.datetimepicker.css" rel="stylesheet" />
    <script src="../Scripts/datetimepicker-master/jquery.datetimepicker.js"></script>
    <script src="../DataTables/DataTables-1.10.8/media/js/jquery.dataTables.min.js"></script>
    <link href="../DataTables/DataTables-1.10.8/media/css/jquery.dataTables.min.css" rel="stylesheet" />
   
    <!-- This is AdminLTE theme files-->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="../theme_AdminLTE/bootstrap/css/bootstrap.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="../theme_AdminLTE/dist/css/AdminLTE.min.css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../theme_AdminLTE/dist/css/skins/_all-skins.min.css" />
    <!-- iCheck -->
    <link rel="stylesheet" href="../theme_AdminLTE/plugins/iCheck/flat/blue.css" />
    <!-- Morris chart -->
    <link rel="stylesheet" href="../theme_AdminLTE/plugins/morris/morris.css" />
    <!-- jvectormap -->
    <link rel="stylesheet" href="../theme_AdminLTE/plugins/jvectormap/jquery-jvectormap-1.2.2.css" />
    <!-- Date Picker -->
    <link rel="stylesheet" href="../theme_AdminLTE/plugins/datepicker/datepicker3.css" />
    <!-- Daterange picker -->
    <link rel="stylesheet" href="../theme_AdminLTE/plugins/daterangepicker/daterangepicker-bs3.css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="../theme_AdminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" />

    <script type="text/javascript">
        $(document).ready(function () {

            var subuserid = 0;

            if (subuserid = 0) {

                $('#divUser').show((function ddlsub() {

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/Dashboard_UsersMcqss",
                        data: "{}",
                        dataType: "json",
                        success: function (data) {
                
                            var len = data.d.length;
                            var txt = "";
                            //  alert(len);
                            if (len > 0) {
                                for (var i = 0; i < len; i++) {
                                 
                                    txt += '<tbody><tr><td>' + data.d[i].SubjectName + '</td><td>' + data.d[i].TestName + '</td><td>' + data.d[i].TestStartingDate + '</td><td>' + data.d[i].TestEndingDate + '</td><td>' + data.d[i].TestStatus + '</td></tr></tbody>';
                          
                                }

                                if (txt != '') {
                                    $("#tableShowUserMcqs").append(txt).removeClass("hidden");
                                    $("#tableShowUserMcqs").DataTable();
                                  //  alert(txt);
                                }
                            }

                        },
                        error: function (data) {
                            alert("Error");
                        }
                    });

                }));
            }
            else {
                function hide_all() {
                 
                    $('#divCommonSubTestNumb').hide();
                    $('#divSubjectName').hide();
                    $('#divTestName').hide();
                    $('#tabs').hide(); //MoreOptions
                    $('#MoreOptions').hide();
                    $('#ShortQuestion').hide();
                    $('#LongQuestion').hide();
                    $('#reference').hide();
                    $('#Explanation').hide();
                    $('#ChOption1').hide();
                    $('#ChOption2').hide();
                    $('#ChOption3').hide();
                    $('#ChOption4').hide();
                    $('#ChOption5').hide();
                    $('#ChOption6').hide();
                    $('#ChOption7').hide();
                    $('#ChOption8').hide();
                    $('#UserPrimaryInfo').hide();
                    $('#UserSecondaryInfo').hide();
                    $('#UserAdvancedInfo').hide();
                    $('#divUser').hide();
                    $('#divAddUserGroups').hide();
                    $('#divddlUserGroup').hide();
                    $('#divSubjectSetteings').hide();
                    $('#divEditMoreTestsettings').hide();
                    $('#divAddMoreTestsettings').hide();
                    $('#divMcqsQuestion').hide();
                    $('#divShowAllQuestions').hide();
                    $('#divreporting').hide();
                    $('#divInsertMcqs').hide();
                    $('#mytable').hide();
                    $('#divDeleteMcqsQuestion').hide();
                    $('#divDeleteShortQuestion').hide();
                    $('#divDeleteLongQuestion').hide();
                    $('#divShowMcqsQuestion').hide();
                    $('#showMcqs_Questions').hide();
                    
                    $('#divShowShortQuestion').hide();
                    $('#divShowLongQuestion').hide();
                    $('#AddNewTest').hide();
                    $('#divEditTest').hide();
                    $('#divDeleteTest').hide();
                    $('#divMergeTest').hide();
                    $('#divShowTestMcqs').hide();
                    $('#divAddMoreSubjects').hide();
                    $('#divEditSubjectName').hide();
                    $('#divDeleteSubjectName').hide();
                    $('#divShowSubjects').hide();
                    $('#divSubjectSetteings').hide();
                    $('#divAddUser').hide();
                    $('#divAddedUserTable').hide();
                    $('#divDeleteUsers').hide();
                    $('#divEditUsers').hide();
                    $('#divSubjectAdvancedSettings').hide();
                }
                hide_all();
               
                String.prototype.unquoted = function () { return this.replace(/(^")|("$)/g, '') }
                function Load_Test() {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlTest",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                $("#ddlTestlistForEditTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                $("#ddlTestlistForDeleteTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                $("#ddlTestlistToMergeTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                $("#ddlTestlistShowTestQuestions").append($("<option></option>").val(value.TestId).html(value.TestName));

                            });
                        },
                        error: function (Result) {
                            alert("Error");
                        }
                    });
                }
              
                $('#btnSubjectNext').click(function () {
                    var subName = $('#txtSubjectName').val();
                    var lblName = $('#lblName');
                    var AdminId = $('');


                    if (subName == '') {
                        lblName.html('Please Enter Subject Name First !');
                        lblName.removeClass();
                        lblName.addClass('required');
                    }
                    else {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "AddQuestions.aspx/InsertSubject",
                            data: "{'subjectName':'" + subName + "'}",
                            dataType: "json",
                            success: function (data) {
                                var obj = data.d;
                                if (obj == 'true') {
                                    $('#divSubjectName').hide();
                                    $('#divTestName').show();
                                }
                            },
                            error: function (result) {
                                alert("Error");
                            }
                        })
                    }
                })
              
                var chkoption1bit = 0;
                var chkoption2bit = 0;
                var chkoption3bit = 0;
                var chkoption4bit = 0;
                var chkoption5bit = 0;
                var chkoption6bit = 0;
                var chkoption7bit = 0;
                var chkoption8bit = 0;

                

                $("#chkOption1").click(function () {
                    if ($("#chkOption1").is(":checked")) {
                        chkoption1bit = 1;
                    }
                    else {
                        chkoption1bit = 0;
                    }
                })
                // chk option2 
                $("#chkOption2").click(function () {
                    if ($("#chkOption2").is(":checked")) {
                        chkoption2bit = 1;
                    }
                    else {
                        chkoption2bit = 0;
                    }
                })
                // chk option3 
                $("#chkOption3").click(function () {
                    if ($("#chkOption3").is(":checked")) {
                        chkoption3bit = 1;
                    }
                    else {
                        chkoption3bit = 0;
                    }
                })
                // chk option 4
                $("#chkOption4").click(function () {
                    if ($("#chkOption4").is(":checked")) {
                        chkoption4bit = 1;
                    }
                    else {
                        chkoption4bit = 0;
                    }
                })
                // chk option 5
                $("#chkOption5").click(function () {
                    if ($("#chkOption5").is(":checked")) {
                        chkoption5bit = 1;
                    }
                    else {
                        chkoption5bit = 0;
                    }
                })
                // chk option 6
                $("#chkOption6").click(function () {
                    if ($("#chkOption6").is(":checked")) {
                        chkoption6bit = 1;
                    }
                    else {
                        chkoption6bit = 0;
                    }
                })
                // chk option 7
                $("#chkOption7").click(function () {
                    if ($("#chkOption7").is(":checked")) {
                        chkoption7bit = 1;
                    }
                    else {
                        chkoption7bit = 0;
                    }
                })
                // chk option 8
                $("#chkOption8").click(function () {
                    if ($("#chkOption8").is(":checked")) {
                        chkoption8bit = 1;
                    }
                    else {
                        chkoption8bit = 0;
                    }
                })

                $('#dash_QuestionsLink').resizable();
                $('#dash_QuestionsLink').click(function () {

                    alert('i am clicked');
                })

                var IsEdit = 0;
                $('#btnSave').click(function () {

                   // alert('Hello i am clicked');
                    var SubjectId = $('#ddlSubject').val();
                    var TestId = $('#ddlTest').val();
                    var McqsId = $('#ddlShowMcqsQuestion').val();
                    var QuestionText1 = $('#txtQuestion').val();
                    var QuestionText = '"' + QuestionText1 + '"';
                    if (txtbtnQuestionSimpleBoxbit == 1) {

                        QuestionText = '"' + QuestionText1 + '"';

                    }
                    else {
                        QuestionText = '"' + CKEDITOR.instances.txtQuestion.getData() + '"';

                    }

                    //alert(QuestionText1);



                    var Points = $('#ddlPoints').val();
                    var ReferenceText = $('#txtReference').val();
                    var ExplanationText = $('#txtExplanation').val();
                    var txtOption1 = 0;
                    var txtOption2 = 0;
                    var txtOption3 = 0;
                    var txtOption4 = 0;
                    var txtOption5 = 0;
                    var txtOption6 = 0;
                    var txtOption7 = 0;
                    var txtOption8 = 0;


                    if (txtOption1bit == 0) {
                        txtOption1 = '"' + CKEDITOR.instances.txtOption1.getData() + '"';
                    }
                    else {
                        txtOption1 = $('#txtOption1').val();
                    }

                    // option 2 
                    if (txtOption2bit == 0) {
                        txtOption2 = '"' + CKEDITOR.instances.txtOption2.getData() + '"';
                    }
                    else {
                        txtOption2 = $('#txtOption2').val();
                    }
                    // otpion 3
                    if (txtOption3bit == 0) {

                        txtOption3 = '"' + CKEDITOR.instances.txtOption3.getData() + '"';
                    }
                    else {
                        txtOption3 = $('#txtOption3').val();
                    }
                    // option4
                    if (txtOption4bit == 0) {

                        txtOption4 = '"' + CKEDITOR.instances.txtOption4.getData() + '"';
                    }
                    else {
                        txtOption4 = $('#txtOption4').val();
                    }
                    if (txtOption5bit == 0) {
                        txtOption5 = '"' + CKEDITOR.instances.txtOption5.getData() + '"';
                    }
                    else {
                        txtOption5 = $('#txtOption5').val();
                    }
                    //
                    if (txtOption6bit == 0) {
                        txtOption6 = '"' + CKEDITOR.instances.txtOption6.getData() + '"';
                    }
                    else {
                        txtOption6 = $('#txtOption6').val();
                    }
                    //
                    if (txtOption7bit == 0) {
                        txtOption7 = '"' + CKEDITOR.instances.txtOption7.getData() + '"';
                    }
                    else {
                        txtOption7 = $('#txtOption7').val();
                    }
                    //
                    if (txtOption8bit == 0) {
                        txtOption8 = '"' + CKEDITOR.instances.txtOption8.getData() + '"';
                    }
                    else {
                        txtOption8 = $('#txtOption8').val();

                    }


                    var chkOption1 = 0;
                    var chkOption2 = 0;
                    var chkOption3 = 0;
                    var chkOption4 = 0;
                    var chkOption5 = 0;
                    var chkOption6 = 0;
                    var chkOption7 = 0;
                    var chkOption8 = 0;

                    if (chkoption1bit == 1) {
                        chkOption1 = 1;
                    }
                    else {
                        chkOption1 = 0;
                    }
                    //
                    if (chkoption2bit == 1) {
                        chkOption2 = 1;
                    }
                    else {
                        chkOption2 = 0;
                    }
                    //
                    if (chkoption3bit == 1) {
                        chkOption3 = 1;
                    }
                    else {
                        chkOption3 = 0;
                    }
                    //
                    if (chkoption4bit == 1) {
                        chkOption4 = 1;
                    }
                    else {
                        chkOption4 = 0;
                    }
                    //
                    if (chkoption5bit == 1) {
                        chkOption5 = 1;
                    }
                    else {
                        chkOption5 = 0;
                    }
                    //
                    if (chkoption6bit == 1) {
                        chkOption6 = 1;
                    }
                    else {
                        chkOption6 = 0;
                    }
                    //
                    if (chkoption7bit == 1) {
                        chkOption7 = 1;
                    }
                    else {
                        chkOption7 = 0;
                    }
                    //
                    if (chkoption8bit == 1) {
                        chkOption8 = 1;
                    }
                    else {
                        chkOption8 = 0;
                    }

                    if (IsEdit == 0) {
                        SaveStatus;

                        if ((SaveStatus == 0) || (SaveStatus == 2)) {
                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                complete: function () {
                                    //$('#lblQuestionBefore').html('');
                                    $('#lblQuestionComplete').html("Saved");


                                },
                                beforeSend: function () {
                                    $('#lblQuestionComplete').html('Saving...');
                                    //$('#lblQuestionBefore').html("Saving...");



                                },
                                url: "AddQuestions.aspx/McqsQuestion_Insert",
                                data: "{'SubjectId':'" + SubjectId + "','TestId':'" + TestId + "','QuestionText':'" + QuestionText + "','points':'" + Points + "','SaveStatus':'" + SaveStatus + "'}",
                                dataType: "json",
                                success: function (data) {
                                    var obj = data.d;

                                    if (obj == 'true') {
                                        if (txtbtnQuestionSimpleBoxbit == 1) {
                                            SaveStatus = 2;
                                        }
                                        else {
                                            SaveStatus = 1;
                                        }
                                        $('#lblQuestionStatus').html('<h4>Your question is Saved now :) </h4>');
                                      
                                    }
                                },
                                error: function (result) {
                                    SaveStatus = 0;
                                    alert("Error");
                                }
                            })
                        }




                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            complete: function () {
                               
                            },
                            beforeSend: function () {
                              
                            },
                            url: "AddQuestions.aspx/Mcqs_Options_Insert",
                            data: "{'txtOption1':'" + txtOption1 + "','txtOption2':'" + txtOption2 + "','txtOption3':'" + txtOption3 +
                                "','txtOption4':'" + txtOption4 + "','txtOption5':'" + txtOption5 + "','txtOption6':'" + txtOption6 +
                                "','txtOption7':'" + txtOption7 + "','txtOption8':'" + txtOption8 + "','chkOption1':'" + chkOption1 +
                                "','chkOption2':'" + chkOption2 + "','chkOption3':'" + chkOption3 + "','chkOption4':'" + chkOption4 +
                                "','chkOption5':'" + chkOption5 + "','chkOption6':'" + chkOption6 + "','chkOption7':'" + chkOption7 +
                                "','chkOption8':'" + chkOption8 + "'}",
                            dataType: "json",
                            success: function (data) {
                                var obj = data.d;

                                if (obj == 'true') {
                                    //  alert('data saved ');
                                    SaveStatus = 0;
                                    
                                }
                            },
                            error: function (result) {
                                alert("Error");
                            }
                        })
                        if (SaveStatus = 0) {
                            CKEDITOR.instances.txtQuestion.setData('');
                        }
                        else {
                            $('#txtQuestion').val('');
                        }
                        $("html, body").animate({ scrollTop: 1 }, "slow");

                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            complete: function () {
                                //$('#lblQuestionBefore').html('');
                                $('#lblQuestionComplete').html("Saved");


                            },
                            beforeSend: function () {
                                $('#lblQuestionComplete').html('Saving...');
                                //$('#lblQuestionBefore').html("Saving...");



                            },
                            url: "AddQuestions.aspx/McqsQuestionReference_Insert",
                            data: "{'SubjectId':'" + SubjectId + "','TestId':'" + TestId + "','ReferenceText':'" + ReferenceText + "'}",
                            dataType: "json",
                            success: function (data) {
                                var obj = data.d;

                                if (obj == 'true') {
                                  
                                }
                            },
                            error: function (result) {

                                alert("Reference Error");
                            }
                        })

                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            complete: function () {
                                //$('#lblQuestionBefore').html('');
                                $('#lblQuestionComplete').html("Saved");


                            },
                            beforeSend: function () {
                                $('#lblQuestionComplete').html('Saving...');
                                //$('#lblQuestionBefore').html("Saving...");



                            },
                            url: "AddQuestions.aspx/McqsQuestionExplanation_Insert",
                            data: "{'SubjectId':'" + SubjectId + "','TestId':'" + TestId + "','ExplanationText':'" + ExplanationText + "'}",
                            dataType: "json",
                            success: function (data) {
                                var obj = data.d;

                                if (obj == 'true') {
                                
                                }
                            },
                            error: function (result) {

                                alert("Explanation Save Error");
                            }
                        })
                    }
                    else {

                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            complete: function () {
                                //$('#lblQuestionBefore').html('');
                                $('#lblQuestionComplete').html("Updated");


                            },
                            beforeSend: function () {
                                $('#lblQuestionComplete').html('Saving...');
                                //$('#lblQuestionBefore').html("Saving...");



                            },
                            url: "AddQuestions.aspx/Edit_Mcqs",
                            data: "{'SubjectId':'" + SubjectId + "','TestId':'" + TestId + "','QuestionId':'" + McqsId +
                                    "','QuestionText':'" + QuestionText + "','points':'" + Points + "','txtOption1':'" + txtOption1 +
                                    "','txtOption2':'" + txtOption2 + "','txtOption3':'" + txtOption3 + "','txtOption4':'" + txtOption4 +
                                    "','txtOption5':'" + txtOption5 + "','txtOption6':'" + txtOption6 + "','txtOption7':'" + txtOption7 +
                                    "','txtOption8':'" + txtOption8 + "','chkOption1':'" + chkOption1 + "','chkOption2':'" + chkOption2 +
                                    "','chkOption3':'" + chkOption3 + "','chkOption4':'" + chkOption4 + "','chkOption5':'" + chkOption5 +
                                    "','chkOption6':'" + chkOption6 + "','chkOption7':'" + chkOption7 + "','chkOption8':'" + chkOption8 +
                                    "','ReferenceText':'" + ReferenceText + "','ExplanationText':'" + ExplanationText +
                                    "'}",
                            dataType: "json",
                            success: function (data) {
                                var obj = data.d;

                                if (obj == 'true') {
                       
                                }
                            },
                            error: function (result) {

                                alert("Reference Error");
                            }
                        })
                    }




                })

                $('.mcqsShow').click(function () {
                    
                    hide_all();
                   //#divMcqsQuestion
                    $('#divMcqsQuestion').hide();
                    //$('#divShowMcqsQuestion').show(100);
                    $('#showMcqs_Questions').show(100);
                   // $('#btnSave').hide();
                    Scroll_top();
                    $('#MainHeading').html('Show Multiple choice Question(s) <small>Questions</small>');
                    $('#breadcrumbpath').text('Show Mcqs');
                    $('.mcqsShow').attr('href', '#showMcqs_Questions');
                    $("#ddlShowMcqsQuestion").empty();
                    $("#ddlShowMcqsQuestionTest").empty();
                    $("#ddlShowMcqsQuestionSubject").empty();
                    $("#ddlShowMcqsQuestionSubject").append($("<option></option>").val(0).html('Select Subject'));
                    $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlShowMcqsQuestion").append($("<option></option>").val(0).html('Select Question'));
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlSubject",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                //  $("#ddlShowMcqsQuestionSubject").empty();

                                $("#ddlShowMcqsQuestionSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                $("#ddlShowMcqsQuestionSubject").trigger("chosen:updated");
                                $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                                var subId = $("#ddlShowMcqsQuestionSubject").val();

                                $.ajax({

                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                                    data: "{'SubId':'" + subId + "'}",
                                    dataType: "json",
                                    success: function (Result) {
                                        $.each(Result.d, function (key, value) {
                                            // $("#ddlShowMcqsQuestionTest").empty();

                                            $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                            $("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

                                        });
                                    },
                                    error: function (Result) {
                                        alert("Error");
                                    }
                                });

                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                    return false;


                })
                $('.editmcqs').click(function () {
                    IsEdit = 1;
                  //  alert(IsEdit);
                    hide_all();
                    $('#showMcqs_Questions').show(100);
                    $('#btnSave').show();
                    Scroll_top();
                    $('#MainHeading').html('Edit Multiple choice Question(s) <small>Questions</small>');
                    $('#breadcrumbpath').text('Edit Mcqs');
                    $('#linkEditMcqs').attr('href', '#linkEditMcqs');
                    $("#ddlShowMcqsQuestion").empty();
                    $("#ddlShowMcqsQuestionTest").empty();
                    $("#ddlShowMcqsQuestionSubject").empty();
                    $("#ddlShowMcqsQuestionSubject").append($("<option></option>").val(0).html('Select Subject'));
                    $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlShowMcqsQuestion").append($("<option></option>").val(0).html('Select Question'));
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlSubject",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                //  $("#ddlShowMcqsQuestionSubject").empty();

                                $("#ddlShowMcqsQuestionSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                $("#ddlShowMcqsQuestionSubject").trigger("chosen:updated");
                                $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                                var subId = $("#ddlShowMcqsQuestionSubject").val();

                                $.ajax({

                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                                    data: "{'SubId':'" + subId + "'}",
                                    dataType: "json",
                                    success: function (Result) {
                                        $.each(Result.d, function (key, value) {
                                            // $("#ddlShowMcqsQuestionTest").empty();

                                            $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                            $("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

                                        });
                                    },
                                    error: function (Result) {
                                        alert("Error");
                                    }
                                });

                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                    return false;


                })
                $('#btnShowMcqsQuestion').click(function () {
                    var SubjectId = $('#ddlShowMcqsQuestionSubject').val();
                    var TestId = $('#ddlShowMcqsQuestionTest').val();
                    var QuestionId = $("#ddlShowMcqsQuestion").val();

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/ShowMcqs",
                        //url: "AddQuestions.aspx/DateTimes",
                        data: "{'McqsId':'" + QuestionId + "'}",
                        dataType: "json",
                        success: function (data) {
                            // alert('hhee');
                            //alert("hello this is your data is " + data.d);
                            for (var i = 0; i < data.d.length; i++) {

                                $('#ddlPoints').val(data.d[i].Points).change();
                                CKEDITOR.replace('txtQuestion');
                                CKEDITOR.replace('txtOption1');
                                CKEDITOR.replace('txtOption2');
                                CKEDITOR.replace('txtOption3');
                                CKEDITOR.replace('txtOption4');
                                CKEDITOR.replace('txtOption5');
                                CKEDITOR.replace('txtOption6');
                                CKEDITOR.replace('txtOption7');
                                CKEDITOR.replace('txtOption8');
                                CKEDITOR.replace('txtExplanation');
                                CKEDITOR.replace('txtReference');
                                var QuestionText = data.d[i].QuestionText;
                                $('#txtQuestion').val(QuestionText.unquoted());
                                //CKEDITOR.instances.txtQuestion.setData(QuestionText.unquoted());
                                var Op1txt = data.d[i].Option1Text;
                                $('#txtOption1').val(Op1txt.unquoted());
                                var Op2txt = data.d[i].Option2Text;
                                $('#txtOption2').val(Op2txt.unquoted());
                                var Op3txt = data.d[i].Option3Text;
                                $('#txtOption3').val(Op3txt.unquoted());
                                var Op4txt = data.d[i].Option4Text;
                                $('#txtOption4').val(Op4txt.unquoted());
                                var Op5txt = data.d[i].Option5Text;
                                $('#txtOption5').val(Op5txt.unquoted());
                                var Op6txt = data.d[i].Option6Text;
                                $('#txtOption6').val(Op6txt.unquoted());
                                var Op7txt = data.d[i].Option7Text;
                                $('#txtOption7').val(Op7txt.unquoted());
                                var Op8txt = data.d[i].Option8Text;
                                $('#txtOption8').val(Op8txt.unquoted());
                                $('#txtExplanation').val(ExplanationText.unquoted());
                                $('#txtReference').val(Reference.unquoted());
                                if (data.d[i].Option1Correct == true) {
                                    $("#chkOption1").prop("checked", true);

                                }
                                else {

                                    $("#chkOption1").prop("checked", false);

                                }
                                if (data.d[i].Option2Correct == 1) {
                                    $("#chkOption2").prop("checked", true);

                                }
                                else {
                                    $("#chkOption2").prop("checked", false);

                                }
                                if (data.d[i].Option3Correct == 1) {
                                    $("#chkOption3").prop("checked", true);

                                }
                                else {
                                    $("#chkOption3").prop("checked", false);

                                }
                                if (data.d[i].Option4Correct == 1) {
                                    $("#chkOption4").prop("checked", true);

                                }
                                else {
                                    $("#chkOption4").prop("checked", false);

                                }
                                if (data.d[i].Option5Correct == 1) {
                                    $("#chkOption5").prop("checked", true);

                                }
                                else {
                                    $("#chkOption5").prop("checked", false);

                                }
                                if (data.d[i].Option6Correct == 1) {
                                    $("#chkOption6").prop("checked", true);

                                }
                                else {
                                    $("#chkOption6").prop("checked", false);

                                }
                                if (data.d[i].Option7Correct == 1) {
                                    $("#chkOption7").prop("checked", true);

                                }
                                else {
                                    $("#chkOption7").prop("checked", false);

                                }
                                if (data.d[i].Option8Correct == 1) {
                                    $("#chkOption8").prop("checked", true);

                                }
                                else {
                                    $("#chkOption8").prop("checked", false);

                                }

                                var CorrectOp1 = data.d[i].Option1Correct;
                                var CorrectOp2 = data.d[i].Option2Correct;
                                var CorrectOp3 = data.d[i].Option3Correct;
                                var CorrectOp4 = data.d[i].Option4Correct;
                                var CorrectOp5 = data.d[i].Option5Correct;
                                var CorrectOp6 = data.d[i].Option6Correct;
                                var CorrectOp7 = data.d[i].Option7Correct;
                                var CorrectOp8 = data.d[i].Option8Correct;
                                var jop1 = data.d[i].op1;
                                // alert(jop1);
                                var jop2 = data.d[i].op2;
                                var jop3 = data.d[i].op3;
                                var jop4 = data.d[i].op4;
                                var jop5 = data.d[i].op5;
                                var jop6 = data.d[i].op6;
                                var jop7 = data.d[i].op7;
                                var jop8 = data.d[i].op8;
                                //alert(Op1txt);
                                //alert(Op2txt);
                                $('#lblShowQuestion').html(QuestionText.unquoted());
                               


                                var SubjectName = data.d[i].SubjectName;

                                var TestName = data.d[i].TestName;
                                var points = data.d[i].Points;



                                // $('#quest').html((txtQuest.unquoted()));
                                $('#SubjectName').append(SubjectName);
                                $('#TestName').append(TestName);
                                $('#QuestionPoints').append(points);

                            }

                        },
                        error: function (Result) {
                            alert("Show Mcqs Error");
                        }
                    });
                    $('#divMcqsQuestion').show(1000);

                })
                function Scroll_top() {
                    $("html, body").animate({ scrollTop: 1 });

                }
                // Insert User 
                $('.insertUser').click(function () {
                    hide_all();
                    $('#divAddUser').show(1000);
                    Scroll_top();
                    return false;
                })
                // Edit User
                $('.editUser').click(function () {
                    hide_all();
                    $('#divEditUsers').show(1000);
                    Scroll_top();
                    return false;
                })
                // Delete User
                $('.DelUser').click(function () {
                    hide_all();
                    $('#divDeleteUsers').show(1000);
                    Scroll_top();
                    return false;
                })
                // Show User
                $('.UserShow').click(function () {
                    hide_all();
                    $('#divAddedUserTable').show(1000);
                    Scroll_top();
                    return false;
                })

                // Insert Subject 
                $('.insertSub').click(function () {
                    hide_all();
                    $('#divSubjectSetteings').show(1000);
                    $('#divAddMoreSubjects').show(1000);
                    Scroll_top();
                    return false;
                })

                //Edit Subject
                $('.editSub').click(function () {
                    hide_all();
                    $('#divSubjectSetteings').show(1000);
                    $('.editSub').show(1000);
                    Scroll_top();
                    return false;
                })
                // Delete Subject
                $('.DelSub').click(function () {
                    hide_all();
                    $('#divSubjectSetteings').show(1000);
                    $('.DelSub').show(1000);
                    Scroll_top();
                    return false;
                })
                // Show Subject
                $('.SubShow').click(function () {
                    hide_all();
                    $('#divSubjectSetteings').show(1000);
                    $('.SubShow').show(1000);
                    Scroll_top();
                    return false;
                })
                // Insert Test
                $('.insertTest').click(function () {
                    hide_all();
                    $('#AddNewTest').show(1000);
                    Scroll_top();
                    return false;
                })
                // Edit Test
                $('.editTest').click(function () {
                    hide_all();
                    $('#divEditTest').show(1000);
                    Scroll_top();
                    return false;
                })
                // Delete Test
                $('.DelTest').click(function () {
                    hide_all();
                    $('#divDeleteTest').show(1000);
                    Scroll_top();
                    return false;
                })
                // Merge Test
                $('#linkMergeTest').click(function () {
                    hide_all();
                    $('#divMergeTest').show(1000);
                    Scroll_top();
                    return false;
                })
                // Show Test
                $('.TestShow').click(function () {
                    hide_all();
                    $('#divShowTestMcqs').show(1000);
                    Scroll_top();
                    return false;
                })
               
        
                $('.insertmcqs').click(function () {
                    IsEdit = 0;
                    hide_all();
                    $('#divCommonSubTestNumb').show(100);
         
                    $('#divMcqsQuestion').show(1000);
                    $('#btnSave').show();
                    $('#divCommonSubTestNumb').show(1000);
                    Scroll_top();
                    $('#MainHeading').html('Insert Multiple choice Question(s) <small>Questions</small>');
                    $('#breadcrumbpath').text('Insert Mcqs');
                    $('.insertmcqs').attr('href', '#divMcqsQuestion');
                    return false;

                })
                $('#linkLoadMainQuestion').click(function () {
                    $("#ddlSubject").empty();
                    $("#ddlTest").empty();
                    var subName = $('#txtTestName').val();
                    var lblName = $('#lblTest');
                    var AdminId = $('');
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlSubject",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            $("#ddlSubject").append($("<option></option>").val(0).html('Select Subject'));
                            $.each(Result.d, function (key, value) {
                                $("#ddlSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));

                            });

                        },
                        error: function (Result) {
                            alert('Heloo I am Error');

                        }
                    });
                    $("#ddlTest").append($("<option></option>").val(0).html('Select Test'));
                    //var subId = $("#ddlSubject").val();
                    //alert(subId);
                    //$.ajax({

                    //    type: "POST",
                    //    contentType: "application/json; charset=utf-8",
                    //    url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                    //    data: "{'SubId':'" + subId + "'}",
                    //    dataType: "json",
                    //    success: function (Result) {
                    //        $.each(Result.d, function (key, value) {
                    //            // $("#ddlTest").empty();

                    //            $("#ddlTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                    //            $("#ddlTest").trigger("chosen:updated");

                    //        });
                    //    },
                    //    error: function (Result) {
                    //        alert("Error Hello I am error 2 ");
                    //    }
                    //});

                })
                var IsUpdateShortQuest = 0;
                $('.insertShortQ').click(function () {
                    hide_all();
                    $('#ShortQuestion').show(1000);
                    $('#divCommonSubTestNumb').show(1000);
                    Scroll_top();
                    $('#MainHeading').html('Insert Short Question(s) <small>Questions</small>');
                    $('#breadcrumbpath').text('Insert Short Questions');
                    $('.insertShortQ').attr('href', '#ShortQuestion');
                    IsUpdateShortQuest = 0;
                    return false;
                })
                $('#btnShowShortQuestion').click(function () {
                    var SubjectId = $('#ddlShowShortQuestionSubject').val();
                    var TestId = $('#ddlShowShortQuestionTest').val();
                    var QuestionId = $("#ddlShowShortQuestion").val();

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadShortQuestionsWithAllOptions",
                        data: "{'shortQuestionId':'" + QuestionId + "'}",
                        dataType: "json",
                        success: function (data) {

                            for (var i = 0; i < data.d.length; i++) {
                                $('#ddlPoints').val(data.d[i].ShortQuestionPoints).change();
                                CKEDITOR.replace('txtShortQuestion');
                                CKEDITOR.replace('txtShortAnswer');
                                CKEDITOR.replace('txtShortQuestionExplanation');
                                CKEDITOR.replace('txtShortQuestionReference');
                                var QuestionText = data.d[i].ShortQuestionText;
                               // alert(QuestionText);
                                $('#txtShortQuestion').val(QuestionText.unquoted());
                                var AnswerText = data.d[i].ShortQuestionAnswer;
                                //alert(AnswerText);
                                $('#txtShortAnswer').val(AnswerText.unquoted());
                                var txtShortQuestionReference = data.d[i].ShortQuestionExplanationReference;
                                $('#txtShortQuestionReference').val(txtShortQuestionReference.unquoted());
                                var txtShortQuestionExplanation = data.d[i].ShortQuestionExplanationText;
                                $('#txtShortQuestionExplanation').val(txtShortQuestionExplanation.unquoted());
                                CKEDITOR.instances.txtQuestion.setData(QuestionText.unquoted());
                                CKEDITOR.instances.txtQuestion.setData(AnswerText.unquoted());
                                CKEDITOR.instances.txtQuestion.setData(txtShortQuestionReference.unquoted());
                                CKEDITOR.instances.txtQuestion.setData(txtShortQuestionExplanation.unquoted());
                                $('#lblShowQuestion').html(QuestionText.unquoted());
                                var SubjectName = data.d[i].SubjectName;
                                var TestName = data.d[i].TestName;
                                var points = data.d[i].Points;
                                $('#ddlSubject').append(SubjectName);
                                $('#ddlTest').append(TestName);
                                $('#ddlPoints').append(points);
                            }

                        },
                        error: function (Result) {
                            alert("Show Short Question Error");
                        }
                    });
                    $('#ShortQuestion').show(1000);
                    $('#divCommonSubTestNumb').show(1000);

                })
                $('#btnShowLongQuestion').click(function () {
                    var SubjectId = $('#ddlShowLongQuestionSubject').val();
                    var TestId = $('#ddlShowLongQuestionTest').val();
                    var QuestionId = $("#ddlShowLongQuestion").val();

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadLongQuestionWithAllOption",
                        data: "{'LongQuestionId':'" + QuestionId + "'}",
                        dataType: "json",
                        success: function (data) {

                            for (var i = 0; i < data.d.length; i++) {
                                $('#ddlPoints').val(data.d[i].LongQuestionPoints).change();
                                CKEDITOR.replace('txtLongQuestion');
                                CKEDITOR.replace('txtLongAnswer');
                                CKEDITOR.replace('txtLongQuestionExplanation');
                                CKEDITOR.replace('txtLongQuestionReference');
                                var QuestionText = data.d[i].LongQuestionText;
                               // alert(QuestionText);
                                $('#txtLongQuestion').val(QuestionText.unquoted());
                                var AnswerText = data.d[i].LongQuestionAnswer;
                                //alert(AnswerText);
                                $('#txtLongAnswer').val(AnswerText.unquoted());
                                var txtLongQuestionReference = data.d[i].LongQuestionExplanationReference;
                                $('#txtLongQuestionReference').val(txtLongQuestionReference.unquoted());
                                var txtLongQuestionExplanation = data.d[i].LongQuestionExplanationText;
                                $('#txtLongQuestionExplanation').val(txtLongQuestionExplanation.unquoted());
                                CKEDITOR.instances.txtQuestion.setData(QuestionText.unquoted());
                                CKEDITOR.instances.txtQuestion.setData(AnswerText.unquoted());
                                CKEDITOR.instances.txtQuestion.setData(txtLongQuestionReference.unquoted());
                                CKEDITOR.instances.txtQuestion.setData(txtLongQuestionExplanation.unquoted());
                                $('#lblShowQuestion').html(QuestionText.unquoted());
                                var SubjectName = data.d[i].SubjectName;
                                var TestName = data.d[i].TestName;
                                var points = data.d[i].Points;
                                $('#ddlSubject').append(SubjectName);
                                $('#ddlTest').append(TestName);
                                $('#ddlPoints').append(points);
                            }

                        },
                        error: function (Result) {
                            alert("Show Long Question Error");
                        }
                    });
                    $('#LongQuestion').show(1000);
                    $('#divCommonSubTestNumb').show(1000);

                })
                $('#btnMoreOptions').click(function () {

                    $('#MoreOptions').toggle(1000);

                })
                $('#btnReferenceShortQuestion').click(function () {
                    $('#ShortQuestionreference').toggle(1000);
                })
                $('#btnExplanationShortQuestion').click(function () {
                    $('#ShortQuestionExplanation').toggle(1000);
                })
                $('#btnReferenceLongQuestion').click(function () {
                    $('#LongQuestionreference').toggle(1000);
                })
                $('#btnExplanationLongQuestion').click(function () {
                    $('#LongQuestionExplanation').toggle(1000);
                })

                // Insert Long questions
                $('.insertLongQ').click(function () {
                    hide_all();
                    $('#LongQuestion').show(1000);
                    $('#divCommonSubTestNumb').show(1000);
                    Scroll_top();
                    $('#MainHeading').html('Insert Long Question(s) <small>Questions</small>');
                    $('#breadcrumbpath').text('Insert Long Questions');
                    $('.insertLongQ').attr('href', '#LongQuestion');
                    return false;
                })

                $('#btnShowLongQuestions').click(function () {

                    $('#LongQuestion').show(1000);
                    $('#divMcqsQuestion').hide();
                    $('#ShortQuestion').hide();
                    $('#heading').html('<u>Long Questions.</u>');

                })
                $('#btnReference').click(function () {
                    $('#reference').toggle();
                })


                $('#home').click(function () {
                    hide_all();
                    $('#divdashboard').show(1000);
                    Scroll_top();
                    $('#MainHeading').html('Home <small>Dashboard</small>');
                    $('#breadcrumbpath').text('Home');
                   

                })

                // delete Mcqs
                $('.deletemcqs').click(function () {

                    hide_all();
                    $('#divDeleteMcqsQuestion').show(1000);
                    Scroll_top();
                    $('#MainHeading').html('Delete Multiple choice Question(s) <small>Questions</small>');
                    $('#breadcrumbpath').text('Delete Mcqs');
                    $('#linkInsertMcqs').attr('href', '#divDeleteMcqsQuestion');


                    $("#ddlDeleteMcqsQuestion").empty();
                    $("#ddlDeleteMcqsQuestionTest").empty();
                    $("#ddlDeleteMcqsQuestionSubject").empty();
                    $("#ddlDeleteMcqsQuestionSubject").append($("<option></option>").val(0).html('Select Subject'));
                    $("#ddlDeleteMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlDeleteMcqsQuestion").append($("<option></option>").val(0).html('Select Question'));
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlSubject",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                //  $("#ddlDeleteMcqsQuestionSubject").empty();

                                $("#ddlDeleteMcqsQuestionSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                $("#ddlDeleteMcqsQuestionSubject").trigger("chosen:updated");
                              //  $("#ddlDeleteMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                                var subId = $("#ddlDeleteMcqsQuestionSubject").val();

                                $.ajax({

                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                                    data: "{'SubId':'" + subId + "'}",
                                    dataType: "json",
                                    success: function (Result) {
                                        $.each(Result.d, function (key, value) {
                                            // $("#ddlDeleteMcqsQuestionTest").empty();

                                            $("#ddlDeleteMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                          //  $("#ddlDeleteMcqsQuestionTest").trigger("chosen:updated");

                                        });
                                    },
                                    error: function (Result) {
                                        alert("Error");
                                    }
                                });

                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                    return false;
                })
                // when subject dropdown change in Show mcqs
                $('#ddlShowMcqsQuestionSubject').change(function () {
                    $("#ddlShowMcqsQuestion").empty();
                    //$("#ddlShowMcqsQuestionSubject").empty();
                    $("#ddlShowMcqsQuestionTest").empty();

                    $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlShowMcqsQuestion").append($("<option></option>").val(0).html('Select Question'));
                    var subId = $("#ddlShowMcqsQuestionSubject").val();
                  //  alert(subId);
                    $.ajax({

                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "'}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                $("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

                            });
                        },
                        error: function (Result) {
                            alert("Error");
                        }
                    });
                })
                // when test dropdown change in Show Mcqs
                $('#ddlShowMcqsQuestionTest').change(function () {
                    $("#ddlShowMcqsQuestion").empty();
                    $("#ddlShowMcqsQuestion").append($("<option></option>").val(0).html('Select Question'));
                    var SubId = $('#ddlShowMcqsQuestionSubject').val();
                    var TestId = $('#ddlShowMcqsQuestionTest').val();

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadMcqsQuestions",
                        data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "'}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlShowMcqsQuestion").append($("<option></option>").val(value.McqsQuestionId).html(value.McqsQuestion));
                                $("#ddlShowMcqsQuestion").trigger("chosen:updated");
                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                })
                // when subject dropdown change in delete mcqs
                $('#ddlDeleteMcqsQuestionSubject').change(function () {
                    $("#ddlDeleteMcqsQuestion").empty();
                    //$("#ddlDeleteMcqsQuestionSubject").empty();
                    $("#ddlDeleteMcqsQuestionTest").empty();

                    $("#ddlDeleteMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlDeleteMcqsQuestion").append($("<option></option>").val(0).html('Select Question'));
                    var subId = $("#ddlDeleteMcqsQuestionSubject").val();
                 //   alert(subId);
                    $.ajax({

                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "'}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlDeleteMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                $("#ddlDeleteMcqsQuestionTest").trigger("chosen:updated");

                            });
                        },
                        error: function (Result) {
                            alert("Error");
                        }
                    });
                })
                // When subject dropdown change in insert questions
                $('#ddlSubject').change(function () {
                    //$("#ddlSubject").empty();
                    $("#ddlTest").empty();
                    $("#ddlTest").append($("<option></option>").val(0).html('Select Test'));
                    var subId = $("#ddlSubject").val();
                    //alert(subId);
                    $.ajax({

                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "'}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                $("#ddlTest").trigger("chosen:updated");

                            });
                        },
                        error: function (Result) {
                            alert("Error");
                        }
                    });
                })
                // when test dropdown change in delete mcqs
                $('#ddlDeleteMcqsQuestionTest').change(function () {
                    $("#ddlDeleteMcqsQuestion").empty();
                    $("#ddlDeleteMcqsQuestion").append($("<option></option>").val(0).html('Select Question'));
                    var SubId = $('#ddlDeleteMcqsQuestionSubject').val();
                    var TestId = $('#ddlDeleteMcqsQuestionTest').val();

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadMcqsQuestions",
                        data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "'}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlDeleteMcqsQuestion").append($("<option></option>").val(value.McqsQuestionId).html(value.McqsQuestion));
                                $("#ddlDeleteMcqsQuestion").trigger("chosen:updated");
                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                })
                // Show Mcqs with all options

                $('#btnDeleteMcqsQuestion').click(function () {
                    var result = confirm("Are you sure to delete this Question?");
                    if (result) {
                        var SubjectId = $('#ddlDeleteMcqsQuestionSubject').val();
                        var TestId = $('#ddlDeleteMcqsQuestionTest').val();
                        var QuestionId = $("#ddlDeleteMcqsQuestion").val();
                        //Logic to delete the item
                       // alert('You said Yes');
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "AddQuestions.aspx/Delet_McqsQuestion",
                            data: "{'TestId':'" + TestId + "','SubjectId':'" + SubjectId + "','QuestionId':'" + QuestionId + "'}",
                            dataType: "json",
                            success: function (Result) {
                                alert('Question Deleted Successfully!');
                                $("#ddlDeleteMcqsQuestion").empty();
                                var SubId = $('#ddlDeleteMcqsQuestionSubject').val();
                                var TestId = $('#ddlDeleteMcqsQuestionTest').val();

                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "AddQuestions.aspx/LoadMcqsQuestions",
                                    data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "'}",
                                    dataType: "json",
                                    success: function (Result) {
                                        $.each(Result.d, function (key, value) {
                                            $("#ddlDeleteMcqsQuestion").append($("<option></option>").val(value.McqsQuestionId).html(value.McqsQuestion));
                                            $("#ddlDeleteMcqsQuestion").trigger("chosen:updated");
                                        });
                                    },
                                    error: function (Result) {
                                        alert("Error to load Subject drop down lists");
                                    }
                                });
                            },
                            error: function (Result) {
                                alert("Error to load Subject drop down lists");
                            }
                        });
                    }
                    else {
                        alert('you said no');
                    }

                })

                // delete Short Questions
                $('.DeleteShortQ').click(function () {

                    hide_all();
                    $('#divDeleteShortQuestion').show(1000);
                    Scroll_top();
                    $('#MainHeading').html('Delete Short Question(s) <small>Questions</small>');
                    $('#breadcrumbpath').text('Delete Short Questions');
                    $('.DeleteShortQ').attr('href', '#divDeleteShortQuestion');


                    $("#ddlDeleteShortQuestion").empty();
                    $("#ddlDeleteShortQuestionTest").empty();
                    $("#ddlDeleteShortQuestionSubject").empty();
                    $("#ddlDeleteShortQuestionSubject").append($("<option></option>").val(0).html('Select Subject'));
                    $("#ddlDeleteShortQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlDeleteShortQuestion").append($("<option></option>").val(0).html('Select Question'));
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlSubject",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                //  $("#ddlDeleteMcqsQuestionSubject").empty();

                                $("#ddlDeleteShortQuestionSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                $("#ddlDeleteShortQuestionSubject").trigger("chosen:updated");
                                $("#ddlDeleteShortQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                                var subId = $("#ddlDeleteShortQuestionSubject").val();

                                $.ajax({

                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                                    data: "{'SubId':'" + subId + "'}",
                                    dataType: "json",
                                    success: function (Result) {
                                        $.each(Result.d, function (key, value) {
                                            // $("#ddlDeleteMcqsQuestionTest").empty();

                                            $("#ddlDeleteShortQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                            $("#ddlDeleteShortQuestionTest").trigger("chosen:updated");

                                        });
                                    },
                                    error: function (Result) {
                                        alert("Error");
                                    }
                                });

                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                    return false;
                })
               // linkEditLongQuestion
                $('.ShortQShow').click(function () {

                    hide_all();
                   // $('#divCommonSubTestNumb').show(100);
                    $('#divShowShortQuestion').show(1000);
                    $('#btnSaveShortQuestion').hide();
                    Scroll_top();
                    $('#MainHeading').html('Show Short Question(s) <small>Questions</small>');
                    $('#breadcrumbpath').text('Show Short Questions');
                    $('.ShortQShow').attr('href', '#divShowShortQuestion');


                    $("#ddlShowShortQuestion").empty();
                    $("#ddlShowShortQuestionTest").empty();
                    $("#ddlShowShortQuestionSubject").empty();
                    $("#ddlShowShortQuestionSubject").append($("<option></option>").val(0).html('Select Subject'));
                    $("#ddlShowShortQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlShowShortQuestion").append($("<option></option>").val(0).html('Select Question'));
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlSubject",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                //  $("#ddlShowMcqsQuestionSubject").empty();

                                $("#ddlShowShortQuestionSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                $("#ddlShowShortQuestionSubject").trigger("chosen:updated");
                                $("#ddlShowShortQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                                var subId = $("#ddlShowShortQuestionSubject").val();

                                $.ajax({

                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                                    data: "{'SubId':'" + subId + "'}",
                                    dataType: "json",
                                    success: function (Result) {
                                        $.each(Result.d, function (key, value) {
                                            // $("#ddlShowMcqsQuestionTest").empty();

                                            $("#ddlShowShortQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                            $("#ddlShowShortQuestionTest").trigger("chosen:updated");

                                        });
                                    },
                                    error: function (Result) {
                                        alert("Error");
                                    }
                                });

                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                    return false;
                })
                $('.editShortQ').click(function () {
                    IsUpdateShortQuest = 1;
                    hide_all();
                   // $('#divCommonSubTestNumb').show(100);
                    $('#divShowShortQuestion').show(1000);
                    $('#btnSaveShortQuestion').show();
                    Scroll_top();
                    $('#MainHeading').html('Edit Short Question(s) <small>Questions</small>');
                    $('#breadcrumbpath').text('Edit Short Questions');
                    $('.editShortQ').attr('href', '#divShowShortQuestion');


                    $("#ddlShowShortQuestion").empty();
                    $("#ddlShowShortQuestionTest").empty();
                    $("#ddlShowShortQuestionSubject").empty();
                    $("#ddlShowShortQuestionSubject").append($("<option></option>").val(0).html('Select Subject'));
                    $("#ddlShowShortQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlShowShortQuestion").append($("<option></option>").val(0).html('Select Question'));
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlSubject",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                //  $("#ddlShowMcqsQuestionSubject").empty();

                                $("#ddlShowShortQuestionSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                $("#ddlShowShortQuestionSubject").trigger("chosen:updated");
                                $("#ddlShowShortQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                                var subId = $("#ddlShowShortQuestionSubject").val();

                                $.ajax({

                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                                    data: "{'SubId':'" + subId + "'}",
                                    dataType: "json",
                                    success: function (Result) {
                                        $.each(Result.d, function (key, value) {
                                            // $("#ddlShowMcqsQuestionTest").empty();

                                            $("#ddlShowShortQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                            $("#ddlShowShortQuestionTest").trigger("chosen:updated");

                                        });
                                    },
                                    error: function (Result) {
                                        alert("Error");
                                    }
                                });

                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                    return false;
                })
                $('.LongQShow').click(function () {

                    hide_all();
                    $('#divShowLongQuestion').show(1000);
                    $('#btnSaveLongQuestion').hide();
                    Scroll_top();
                    $('#MainHeading').html('Show Long Question(s) <small>Questions</small>');
                    $('#breadcrumbpath').text('Show Long Questions');
                    $('.LongQShow').attr('href', '#divShowLongQuestion');


                    $("#ddlShowLongQuestion").empty();
                    $("#ddlShowLongQuestionTest").empty();
                    $("#ddlShowLongQuestionSubject").empty();
                    $("#ddlShowLongQuestionSubject").append($("<option></option>").val(0).html('Select Subject'));
                    $("#ddlShowLongQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlShowLongQuestion").append($("<option></option>").val(0).html('Select Question'));
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlSubject",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                //  $("#ddlShowMcqsQuestionSubject").empty();

                                $("#ddlShowLongQuestionSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                $("#ddlShowLongQuestionSubject").trigger("chosen:updated");
                                $("#ddlShowLongQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                                var subId = $("#ddlShowLongQuestionSubject").val();

                                $.ajax({

                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                                    data: "{'SubId':'" + subId + "'}",
                                    dataType: "json",
                                    success: function (Result) {
                                        $.each(Result.d, function (key, value) {
                                            // $("#ddlShowMcqsQuestionTest").empty();

                                            $("#ddlShowLongQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                            $("#ddlShowLongQuestionTest").trigger("chosen:updated");

                                        });
                                    },
                                    error: function (Result) {
                                        alert("Error");
                                    }
                                });

                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                    return false;
                })
                $('.EditLongQ').click(function () {

                    hide_all();
                    $('#divShowLongQuestion').show(1000);
                    $('#btnSaveLongQuestion').show();
                   // $('#divCommonSubTestNumb').show(100);
                    Scroll_top();
                    $('#MainHeading').html('Show Long Question(s) <small>Questions</small>');
                    $('#breadcrumbpath').text('Show Long Questions');
                    $('.EditLongQ').attr('href', '#divShowLongQuestion');


                    $("#ddlShowLongQuestion").empty();
                    $("#ddlShowLongQuestionTest").empty();
                    $("#ddlShowLongQuestionSubject").empty();
                    $("#ddlShowLongQuestionSubject").append($("<option></option>").val(0).html('Select Subject'));
                    $("#ddlShowLongQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlShowLongQuestion").append($("<option></option>").val(0).html('Select Question'));
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlSubject",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                //  $("#ddlShowMcqsQuestionSubject").empty();

                                $("#ddlShowLongQuestionSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                $("#ddlShowLongQuestionSubject").trigger("chosen:updated");
                                $("#ddlShowLongQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                                var subId = $("#ddlShowLongQuestionSubject").val();

                                $.ajax({

                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                                    data: "{'SubId':'" + subId + "'}",
                                    dataType: "json",
                                    success: function (Result) {
                                        $.each(Result.d, function (key, value) {
                                            // $("#ddlShowMcqsQuestionTest").empty();

                                            $("#ddlShowLongQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                            $("#ddlShowLongQuestionTest").trigger("chosen:updated");

                                        });
                                    },
                                    error: function (Result) {
                                        alert("Error");
                                    }
                                });

                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                    return false;
                })
                // Delete Long Questions.
                $('.DeleteLongQ').click(function () {

                    hide_all();
                    $('#divDeleteLongQuestion').show(1000);
                    Scroll_top();
                    $('#MainHeading').html('Delete Long Question(s) <small>Questions</small>');
                    $('#breadcrumbpath').text('Delete Long Questions');
                    $('.DeleteLongQ').attr('href', '#divDeleteLongQuestion');


                    $("#ddlDeleteLongQuestion").empty();
                    $("#ddlDeleteLongQuestionTest").empty();
                    $("#ddlDeleteLongQuestionSubject").empty();
                    $("#ddlDeleteLongQuestionSubject").append($("<option></option>").val(0).html('Select Subject'));
                    $("#ddlDeleteLongQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlDeleteLongQuestion").append($("<option></option>").val(0).html('Select Question'));
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlSubject",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                //  $("#ddlDeleteMcqsQuestionSubject").empty();

                                $("#ddlDeleteLongQuestionSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                $("#ddlDeleteLongQuestionSubject").trigger("chosen:updated");
                                $("#ddlDeleteLongQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                                var subId = $("#ddlDeleteLongQuestionSubject").val();
                              //  alert(subId);
                                $.ajax({

                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                                    data: "{'SubId':'" + subId + "'}",
                                    dataType: "json",
                                    success: function (Result) {
                                        $.each(Result.d, function (key, value) {
                                            // $("#ddlDeleteMcqsQuestionTest").empty();

                                            $("#ddlDeleteLongQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                            $("#ddlDeleteLongQuestionTest").trigger("chosen:updated");

                                        });
                                    },
                                    error: function (Result) {
                                        alert("Error");
                                    }
                                });

                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                    return false;
                })
                // Load Subject to insert Questions


                // when subject dropdown change in delete Short Questions
                $('#ddlDeleteShortQuestionSubject').change(function () {
                    $("#ddlDeleteShortQuestion").empty();
                    //$("#ddlDeleteMcqsQuestionSubject").empty();
                    $("#ddlDeleteShortQuestionTest").empty();

                    $("#ddlDeleteShortQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlDeleteShortQuestion").append($("<option></option>").val(0).html('Select Question'));
                    var subId = $("#ddlDeleteShortQuestionSubject").val();
                  //  alert(subId);
                    $.ajax({

                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "'}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlDeleteShortQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                $("#ddlDeleteShortQuestionTest").trigger("chosen:updated");

                            });
                        },
                        error: function (Result) {
                            alert("Error");
                        }
                    });
                })
                $('#ddlShowShortQuestionSubject').change(function () {
                    $("#ddlShowShortQuestion").empty();
                    //$("#ddlShowMcqsQuestionSubject").empty();
                    $("#ddlShowShortQuestionTest").empty();

                    $("#ddlShowShortQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlShowShortQuestion").append($("<option></option>").val(0).html('Select Question'));
                    var subId = $("#ddlShowShortQuestionSubject").val();
                 //   alert(subId);
                    $.ajax({

                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "'}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlShowShortQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                $("#ddlShowShortQuestionTest").trigger("chosen:updated");

                            });
                        },
                        error: function (Result) {
                            alert("Error");
                        }
                    });
                })
                $('#ddlShowLongQuestionSubject').change(function () {
                    $("#ddlShowLongQuestion").empty();
                    //$("#ddlShowMcqsQuestionSubject").empty();
                    $("#ddlShowLongQuestionTest").empty();

                    $("#ddlShowLongQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlShowLongQuestion").append($("<option></option>").val(0).html('Select Question'));
                    var subId = $("#ddlShowLongQuestionSubject").val();
                   // alert(subId);
                    $.ajax({

                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "'}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlShowLongQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                $("#ddlShowLongQuestionTest").trigger("chosen:updated");

                            });
                        },
                        error: function (Result) {
                            alert("Error");
                        }
                    });
                })
                // When Subject dropdown change in delete Long questions
                $('#ddlDeleteLongQuestionSubject').change(function () {
                    $("#ddlDeleteLongQuestion").empty();
                    //$("#ddlDeleteMcqsQuestionSubject").empty();
                    $("#ddlDeleteLongQuestionTest").empty();

                    $("#ddlDeleteLongQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    $("#ddlDeleteLongQuestion").append($("<option></option>").val(0).html('Select Question'));
                    var subId = $("#ddlDeleteLongQuestionSubject").val();
                  //  alert(subId);
                    $.ajax({

                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "'}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlDeleteLongQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                $("#ddlDeleteLongQuestionTest").trigger("chosen:updated");

                            });
                        },
                        error: function (Result) {
                            alert("Error");
                        }
                    });
                })
                // when test dropdown change in delete Short Questions
                $('#ddlDeleteShortQuestionTest').change(function () {
                   // alert('heree');
                    $("#ddlDeleteShortQuestion").empty();
                    $("#ddlDeleteShortQuestion").append($("<option></option>").val(0).html('Select Question'));
                    var SubId = $('#ddlDeleteShortQuestionSubject').val();
                    var TestId = $('#ddlDeleteShortQuestionTest').val();
                   // alert('Subject id  ' + SubId);
                  //  alert('Subject id  ' + TestId);

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadShortQuestions",
                        data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "'}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlDeleteShortQuestion").append($("<option></option>").val(value.ShortQuestionId).html(value.ShortQuestion));
                                $("#ddlDeleteShortQuestion").trigger("chosen:updated");
                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                })
                $('#ddlShowShortQuestionTest').change(function () {
                    $("#ddlShowShortQuestion").empty();
                    $("#ddlShowShortQuestion").append($("<option></option>").val(0).html('Select Question'));
                    var SubId = $('#ddlShowShortQuestionSubject').val();
                    var TestId = $('#ddlShowShortQuestionTest').val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadShortQuestions",
                        data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "'}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlShowShortQuestion").append($("<option></option>").val(value.ShortQuestionId).html(value.ShortQuestion));
                                $("#ddlShowShortQuestion").trigger("chosen:updated");
                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                })
                $('#ddlShowLongQuestionTest').change(function () {
                    //alert('heree');
                    $("#ddlShowLongQuestion").empty();
                    $("#ddlShowLongQuestion").append($("<option></option>").val(0).html('Select Question'));
                    var SubId = $('#ddlShowLongQuestionSubject').val();
                    var TestId = $('#ddlShowLongQuestionTest').val();
                    //alert('Subject id  ' + SubId);
                  //  alert('Subject id  ' + TestId);

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadLongQuestions",
                        data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "'}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlShowLongQuestion").append($("<option></option>").val(value.LongQuestionId).html(value.LongQuestion));
                                $("#ddlShowLongQuestion").trigger("chosen:updated");
                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                })
                // When test dropdown change in Delete Long Questions
                $('#ddlDeleteLongQuestionTest').change(function () {

                    $("#ddlDeleteLongQuestion").empty();
                    $("#ddlDeleteLongQuestion").append($("<option></option>").val(0).html('Select Question'));
                    var SubId = $('#ddlDeleteLongQuestionSubject').val();
                    var TestId = $('#ddlDeleteLongQuestionTest').val();
                   // alert('Subject id  ' + SubId);
                   // alert('Subject id  ' + TestId);

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadLongQuestions",
                        data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "'}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlDeleteLongQuestion").append($("<option></option>").val(value.LongQuestionId).html(value.LongQuestion));
                                $("#ddlDeleteLongQuestion").trigger("chosen:updated");
                            });
                        },
                        error: function (Result) {
                            alert("Error to load Subject drop down lists");
                        }
                    });
                })
                // Delete Short Questions
                $('#btnDeleteShortQuestion').click(function () {
                    var result = confirm("Are you sure to delete this Question?");
                    if (result) {
                        var SubjectId = $('#ddlDeleteShortQuestionSubject').val();
                        var TestId = $('#ddlDeleteShortQuestionTest').val();
                        var QuestionId = $("#ddlDeleteShortQuestion").val();
                        //Logic to delete the item
                       // alert('You said Yes');
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "AddQuestions.aspx/Delet_ShortQuestion",
                            data: "{'TestId':'" + TestId + "','SubjectId':'" + SubjectId + "','QuestionId':'" + QuestionId + "'}",
                            dataType: "json",
                            success: function (Result) {
                                alert('Question Deleted Successfully!');
                                $("#ddlDeleteShortQuestion").empty();
                                var SubId = $('#ddlDeleteShortQuestionSubject').val();
                                var TestId = $('#ddlDeleteShortQuestionTest').val();

                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "AddQuestions.aspx/LoadShortQuestions",
                                    data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "'}",
                                    dataType: "json",
                                    success: function (Result) {
                                        $.each(Result.d, function (key, value) {
                                            $("#ddlDeleteShortQuestion").append($("<option></option>").val(value.ShortQuestionId).html(value.ShortQuestion));
                                            $("#ddlDeleteShortQuestion").trigger("chosen:updated");
                                        });
                                    },
                                    error: function (Result) {
                                        alert("Error to load Subject drop down lists");
                                    }
                                });
                            },
                            error: function (Result) {
                                alert("Error to load Subject drop down lists");
                            }
                        });
                    }
                    else {
                        alert('you said no');
                    }

                })
                // Delete Long Questions
                $('#btnDeleteLongQuestion').click(function () {
                    var result = confirm("Are you sure to delete this Question?");
                    if (result) {
                        var SubjectId = $('#ddlDeleteLongQuestionSubject').val();
                        var TestId = $('#ddlDeleteLongQuestionTest').val();
                        var QuestionId = $("#ddlDeleteLongQuestion").val();
                        //Logic to delete the item
                       // alert('You said Yes');
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "AddQuestions.aspx/Delet_LongQuestion",
                            data: "{'TestId':'" + TestId + "','SubjectId':'" + SubjectId + "','QuestionId':'" + QuestionId + "'}",
                            dataType: "json",
                            success: function (Result) {
                                alert('Question Deleted Successfully!');
                                $("#ddlDeleteLongQuestion").empty();
                                var SubId = $('#ddlDeleteLongQuestionSubject').val();
                                var TestId = $('#ddlDeleteLongQuestionTest').val();

                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "AddQuestions.aspx/LoadLongQuestions",
                                    data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "'}",
                                    dataType: "json",
                                    success: function (Result) {
                                        $.each(Result.d, function (key, value) {
                                            $("#ddlDeleteLongQuestion").append($("<option></option>").val(value.LongQuestionId).html(value.LongQuestion));
                                            $("#ddlDeleteLongQuestion").trigger("chosen:updated");
                                        });
                                    },
                                    error: function (Result) {
                                        alert("Error to load Subject drop down lists");
                                    }
                                });
                            },
                            error: function (Result) {
                                alert("Error to load Subject drop down lists");
                            }
                        });
                    }
                    else {
                        alert('you said no');
                    }

                })


                $('#btnExplanation').click(function () {
                    //  $('#MoreOptions').hide();
                    $('#Explanation').toggle();

                })
                var txtbtnQuestionSimpleBoxbit = 0;
                $('#btnQuestionSimpleBox').click(function () {

                    if (SaveStatus = 1) {
                        CKEDITOR.instances.txtQuestion.destroy(true);
                    }
                    else {
                        $('#txtQuestion').val('');
                        txtbtnQuestionSimpleBoxbit = 1
                    }


                    SaveStatus = 0;
                });

                $('#btnQuestionckeditor').click(function () {


                    CKEDITOR.replace('txtQuestion');
                    txtbtnQuestionSimpleBoxbit = 0;


                })

                $('#btnShowHidetxtQuestion').click(function () {

                    $('#divtxtQuestion').toggle();
                })
                var txtOption1bit = 0;
                var txtOption2bit = 0;
                var txtOption3bit = 0;
                var txtOption4bit = 0;
                var txtOption5bit = 0;
                var txtOption6bit = 0;
                var txtOption7bit = 0;
                var txtOption8bit = 0;


                // Option 1 extra options. 


                $('#btnOption1SimpleBox').click(function () {

                    CKEDITOR.instances.txtOption1.destroy(true);
                    txtOption1bit = 1;
                })
                $('#btnOption1ckeditor').click(function () {
                    CKEDITOR.replace('txtOption1');
                    txtOption1bit = 0;

                })
                $('#btnShowHidetxtOption1').click(function () {

                    $('#divtxtOption1').toggle();

                })

                // Option 2 extra options.
                $('#btnOption2SimpleBox').click(function () {
                    CKEDITOR.instances.txtOption2.destroy(true);
                    txtOption2bit = 1;
                })
                $('#btnOption2ckeditor').click(function () {
                    CKEDITOR.replace('txtOption2');
                    txtOption2bit = 0;
                })
                $('#btnShowHidetxtOption2').click(function () {

                    $('#divtxtOption2').toggle();
                })

                // Option 3 extra options.
                $('#btnOption3SimpleBox').click(function () {
                    CKEDITOR.instances.txtOption3.destroy(true);
                    txtOption3bit = 1;
                })
                $('#btnOption3ckeditor').click(function () {
                    CKEDITOR.replace('txtOption3');
                    txtOption3bit = 0;
                })
                $('#btnShowHidetxtOption3').click(function () {

                    $('#divtxtOption3').toggle();
                })

                // Option 4 extra options.
                $('#btnOption4SimpleBox').click(function () {
                    CKEDITOR.instances.txtOption4.destroy(true);
                    txtOption4bit = 1;
                })
                $('#btnOption4ckeditor').click(function () {
                    CKEDITOR.replace('txtOption4');
                    txtOption4bit = 0;
                })
                $('#btnShowHidetxtOption4').click(function () {

                    $('#divtxtOption4').toggle();
                })
                // Option 5 extra options.
                $('#btnOption5SimpleBox').click(function () {
                    CKEDITOR.instances.txtOption5.destroy(true);
                    txtOption5bit = 1;
                })
                $('#btnOption5ckeditor').click(function () {
                    CKEDITOR.replace('txtOption5');
                    txtOption5bit = 0;
                })
                $('#btnShowHidetxtOption5').click(function () {

                    $('#divtxtOption5').toggle();
                })
                // Option 6 extra options.
                $('#btnOption6SimpleBox').click(function () {
                    CKEDITOR.instances.txtOption6.destroy(true);
                    txtOption6bit = 1;
                })
                $('#btnOption6ckeditor').click(function () {
                    CKEDITOR.replace('txtOption6');
                    txtOption6bit = 0;
                })
                $('#btnShowHidetxtOption6').click(function () {

                    $('#divtxtOption6').toggle();
                })
                // Option 7 extra options.
                $('#btnOption7SimpleBox').click(function () {
                    CKEDITOR.instances.txtOption7.destroy(true);
                    txtOption7bit = 1;
                })
                $('#btnOption7ckeditor').click(function () {
                    CKEDITOR.replace('txtOption7');
                    txtOption7bit = 0;
                })
                $('#btnShowHidetxtOption7').click(function () {

                    $('#divtxtOption7').toggle();
                })
                // Option 8 extra options.
                $('#btnOption8SimpleBox').click(function () {
                    CKEDITOR.instances.txtOption8.destroy(true);
                    txtOption8bit = 1;
                })
                $('#btnOption8ckeditor').click(function () {
                    CKEDITOR.replace('txtOption8');
                    txtOption8bit = 0;
                })
                $('#btnShowHidetxtOption8').click(function () {

                    $('#divtxtOption8').toggle();
                })
                $('#btnAddMoreUserDetail').click(function () {
                    $('#UserPrimaryInfo').toggle();
                })
                $('#btnAddUserTestTiming').click(function () {
                    $('#UserSecondaryInfo').toggle();
                })
                $('#btnAddUserAdvancedSetting').click(function () {
                    $('#UserAdvancedInfo').toggle();
                })
                var chkCertificateCustomDesignbit = false;
                var chkResultCardCustomDesignbit = false;
                var chkUserEmailResultbit = false;
                var chkUserPracticeModebit = false;
                var chkRandomizeQuestionsInTestbit = false;
                var chkEmailTestResultToAdminbit = false;
                var chkUserSeeOtherUsersResultbit = false;
                $("#chkCertificateCustomDesign").click(function () {
                    if ($("#chkCertificateCustomDesign").is(":checked")) {
                        chkCertificateCustomDesignbit = true;
                    }
                    else {
                        chkCertificateCustomDesignbit = false;
                    }
                })
                $("#chkResultCardCustomDesign").click(function () {
                    if ($("#chkResultCardCustomDesign").is(":checked")) {
                        chkResultCardCustomDesignbit = true;
                    }
                    else {
                        chkResultCardCustomDesignbit = false;
                    }
                })
                $("#chkUserEmailResult").click(function () {
                    if ($("#chkUserEmailResult").is(":checked")) {
                        chkUserEmailResultbit = true;
                    }
                    else {
                        chkUserEmailResultbit = false;
                    }
                })
                $("#chkUserPracticeMode").click(function () {
                    if ($("#chkUserPracticeMode").is(":checked")) {
                        chkUserPracticeModebit = true;
                    }
                    else {
                        chkUserPracticeModebit = false;
                    }
                })
                $("#chkRandomizeQuestionsInTest").click(function () {
                    if ($("#chkRandomizeQuestionsInTest").is(":checked")) {
                        chkRandomizeQuestionsInTestbit = true;
                    }
                    else {
                        chkRandomizeQuestionsInTestbit = false;
                    }
                })
                $("#chkEmailTestResultToAdmin").click(function () {
                    if ($("#chkEmailTestResultToAdmin").is(":checked")) {
                        chkEmailTestResultToAdminbit = true;
                    }
                    else {
                        chkEmailTestResultToAdminbit = false;
                    }
                })
                $("#chkUserSeeOtherUsersResult").click(function () {
                    if ($("#chkUserSeeOtherUsersResult").is(":checked")) {
                        chkUserSeeOtherUsersResultbit = true;
                    }
                    else {
                        chkUserSeeOtherUsersResultbit = false;
                    }
                })
                $('#txtUserDOB').datepicker({
                    timepicker: false,
                    format: 'd.m.Y'
                });
                $('#txtUserTestStartDateTime').datepicker();
                $('#txtUserTestEndDateTime').datepicker();
                $('#btnAddUser').click(function () {
                    var ddlUserRoleId = $('#ddlUserRoleId').val();
                    var txtUserName = $('#txtUserName').val();
                    var txtUserEmail = $('#txtUserEmail').val();
                    var txtUserPassword = $('#txtUserPassword').val();
                    var txtUserParentEmail = $('#txtUserParentEmail').val();
                    var txtUserParentName = $('#txtUserParentName').val();
                    var txtUserRollNo = $('#txtUserRollNo').val();
                    var txtUserFirstName = $('#txtUserFirstName').val();
                    var txtUserLastName = $('#txtUserLastName').val();
                    var txtUserDepartment = $('#txtUserDepartment').val();
                    var txtUserRegion = $('#txtUserRegion').val();
                    var txtUserTelephoneNo = $('#txtUserTelephoneNo').val();
                    var txtUserDOB = $('#txtUserDOB').val();
                    var txtUserGroup = $('#ddlUserGroup').val();
                    var txtUserImage = $('#txtUserImage').val();
                    var txtUserCity = $('#txtUserCity').val();
                    var txtUserGender = $('#ddlUserGender').val();
                    var chkCertificateCustomDesign = chkCertificateCustomDesignbit;
                    var chkResultCardCustomDesign = chkResultCardCustomDesignbit;
                    var chkUserEmailResult = chkUserEmailResultbit
                    var txtUserCountry = $('#txtUserCountry').val();
                    var txtUserTermsAndConditions = '"' + CKEDITOR.instances.txtUserTermsAndConditions.getData() + '"';
                    var chkUserPracticeMode = chkUserPracticeModebit
                    var chkRandomizeQuestionsInTest = chkRandomizeQuestionsInTestbit;
                    var ddlTotalUserAttempts = $('#ddlTotalUserAttempts').val();
                    var chkEmailTestResultToAdmin = chkEmailTestResultToAdminbit;
                    var chkUserSeeOtherUsersResult = chkUserSeeOtherUsersResultbit;
                    var txtUserTestStartDateTime = $('#txtUserTestStartDateTime').val();
                    var txtUserTestEndDateTime = $('#txtUserTestEndDateTime').val();
                    //debugger;
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        complete: function () {
                            //$('#lblQuestionBefore').html('');
                            // $('#lblQuestionComplete').html("Saved");
                        },
                        beforeSend: function () {
                            // $('#lblQuestionComplete').html('Saving...');
                            //$('#lblQuestionBefore').html("Saving...");
                        },
                        url: "AddQuestions.aspx/tblSubUser_Insert",
                        data: "{'UserEmail':'" + txtUserEmail + "','UserPassword':'" + txtUserPassword + "','UserRoleId':'" + ddlUserRoleId +
                                "','UserName':'" + txtUserName + "','UserParrentEmail':'" + txtUserParentEmail + "','UserParentName':'" + txtUserParentName +
                                "', 'UserRollNo':'" + txtUserRollNo + "','UserFirstName':'" + txtUserFirstName + "','UserLastName':'" + txtUserLastName +
                                "','UserDepartment':'" + txtUserDepartment + "','UserRegion':'" + txtUserRegion + "','TelephoneNo':'" + txtUserTelephoneNo +
                                "','UserDOB':'" + txtUserDOB + "','UserGroup':'" + txtUserGroup + "','UserImage':'" + txtUserImage +
                                "','UserCountry':'" + txtUserCountry + "','UserCity':'" + txtUserCity + "','UserGender':'" + txtUserGender +
                                "','UserCertificateDesignCustomize':'" + chkCertificateCustomDesign +
                                "','UserResultCardDesignCustomize':'" + chkResultCardCustomDesign + "','EmailResultToUser':'" + chkUserEmailResult +
                                "','TermsAndConditionsForUsers':'" + txtUserTermsAndConditions + "','UserPracticeMode':'" + chkUserPracticeMode + "','UserRandomizeQuestions':'" + chkRandomizeQuestionsInTest +
                                "','TotalAttemptsForUsers':'" + ddlTotalUserAttempts + "','EmailTestResultToAdmin':'" + chkEmailTestResultToAdmin + "','AllResult':'" + chkUserSeeOtherUsersResult +
                                "','UserTestStartDateTime':'" + txtUserTestStartDateTime + "','UserTestEndDateTime':'" + txtUserTestEndDateTime +
                                "'}",
                        dataType: "json",
                        success: function (data) {
                            var obj = data.d;
                            if (obj == 'true') {
                                alert('Congrats! User Saved Successfully!');
                                //$('#lblQuestionStatus').html('<h4>Your question is Saved now :) </h4>');
                                //$('#lblQuestionStatus').hide(2000);
                            }
                        },
                        error: function (result) {
                            alert(result);
                        }
                    })
                })
                $('#btnAddUserGroup').click(function () {
                    $('#divAddUserGroups').toggle();
                })
                $('#btnAddUserGroupName').click(function () {
                    var txtGroupName = $('#txtUserGroupName').val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/InsertUserGroupName",
                        data: "{'UserGroupName':'" + txtGroupName + "'}",
                        dataType: "json",
                        success: function (data) {
                            var obj = data.d;
                            if (obj == 'true') {
                                // $('#divSubjectName').hide();
                                // $('#divTestName').show();
                                // alert('Your Group Name is added successfully');
                                $('#divddlUserGroup').show((function () {
                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: "AddQuestions.aspx/LoadddlUserGroup",
                                        data: "{}",
                                        dataType: "json",
                                        success: function (Result) {
                                            $.each(Result.d, function (key, value) {
                                                $("#ddlUserGroup").append($("<option></option>").val(value.UserGroupId).html(value.UserGroupName));
                                            });
                                        },
                                        error: function (Result) {
                                            alert("Error");
                                        }
                                    });
                                }));
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })
                })
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "AddQuestions.aspx/LoadddlSubject",
                    data: "{}",
                    dataType: "json",
                    success: function (Result) {
                        $.each(Result.d, function (key, value) {
                            $("#ddlSubjectNameList").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                            $("#ddlSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                            $("#ddlEditSubjectNames").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                            $("#ddlDeleteSubjectNames").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                            $("#ddlSubjectAdvancedSettings").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                            $("#ddlDeleteReplaceSubjectWithExistingSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));

                            $("#ddlDeleteOnlySubjectSettings").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                            $("#ddlSubjectlistForEditTest").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                            $("#ddlSubjectlistForDeleteTest").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                            $("#ddlSubjectlistToMergeTest").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                            $("#ddlNewSubjectlistForMergeTest").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                            $("#ddlSubjectlistShowTestQuestions").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                            $("#ddlSubjectlistForAddTest").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                        });
                    },
                    error: function (Result) {
                        alert("Error to load Subject drop down lists");
                    }
                });
                var SubjectId = $('#ddlSubject').val();
                var txtShortQuestionbit = 0;
                var txtShortAnswerbit = 0;
                var txtShortQuestionExpbit = 0;
                var txtShortQuestionRefbit = 0;
                var txtShortQuestion = "";
                var txtShortAnswer = "";
                var txtShortExp = "";
                var txtShortRef = "";
                var txtShortQuestionbit = 0;
                var txtShortAnswerbit = 0;
                var txtLongQuestionbit = 0;
                // short question extra options.
                $('#btnShortQuestionSimpleBox').click(function () {

                    CKEDITOR.instances.txtShortQuestion.destroy(true);
                    txtShortQuestionbit = 0;
                  //  alert(txtShortQuestionbit);
                })
                $('#btnShortQuestionckeditor').click(function () {

                    CKEDITOR.replace('txtShortQuestion');
                    txtShortQuestionbit = 1;
                   // alert(txtShortQuestionbit);
                })
                $('#btnShowHidetxtShortQuestion').click(function () {
                    $('#divShortQuestion').toggle();
                })
                // short answer options
                $('#btnShortAnswerSimpleBox').click(function () {
                    CKEDITOR.instances.txtShortAnswer.destroy(true);
                    txtShortAnswerbit = 0;

                })
                $('#btnShortAnswerckeditor').click(function () {

                    CKEDITOR.replace('txtShortAnswer');
                    txtShortAnswerbit = 1;
                })
                $('#btnShowHidetxtShortAnswer').click(function () {
                    $('#divShortAnswer').toggle();
                })
                // short explanation and reference

                // Long question extra options.
                $('#btnLongQuestionSimpleBox').click(function () {
                    CKEDITOR.instances.txtLongQuestion.destroy(true);
                    txtLongQuestionbit = 1;
                })
                $('#btnLongQuestionckeditor').click(function () {
                    CKEDITOR.replace('txtLongQuestion');
                    txtLongQuestionbit = 0;
                })
                $('#btnShowHidetxtLongQuestions').click(function () {
                    $('#divLongQuestion').toggle();
                })

                // Long answer options
                $('#btnLongAnswerSimpleBox').click(function () {
                    CKEDITOR.instances.txtLongAnswer.destroy(true);
                    txtLongAnswerbit = 1;
                })
                $('#btnLongAnswerckeditor').click(function () {

                    CKEDITOR.replace('txtLongAnswer');
                    txtLongAnswerbit = 0;
                })
                $('#btnShowHidetxtLongAnswer').click(function () {
                    $('#divLongAnswer').toggle();
                })

                $('#btnSaveShortQuestion').click(function () {

                    txtShortRef = $('#txtShortQuestionReference').val();
                    txtShortExp = $('#txtShortQuestionExplanation').val();
                    if (txtShortQuestionbit == 1) {
                        // '"' + CKEDITOR.instances.txtUserTermsAndConditions.getData() + '"';
                        txtShortQuestion = '"' + CKEDITOR.instances.txtShortQuestion.getData() + '"';

                    }
                    else {
                        txtShortQuestion = $('#txtShortQuestion').val();
                    }

                    if (txtShortAnswerbit == 1) {
                        // '"' + CKEDITOR.instances.txtUserTermsAndConditions.getData() + '"';
                        txtShortAnswer = '"' + CKEDITOR.instances.txtShortAnswer.getData() + '"';

                    }
                    else {
                        txtShortAnswer = $('#txtShortAnswer').val();
                    }
                    var UpdateShortReference = '"' + CKEDITOR.instances.txtShortQuestionReference.getData() + '"';
                    var UpdateShortExplanation = '"' + CKEDITOR.instances.txtShortQuestionExplanation.getData() + '"';
                    var UpdateTestId = $('#ddlShowShortQuestionTest').val();
                    var UpdateSubjectId = $('#ddlShowShortQuestionSubject').val();

                    var SubjectId = $('#ddlSubject').val();
                    var TestId = $('#ddlTest').val();
                    var points = $('#ddlPoints').val();
                    var ShortQuestionId = $('#ddlShowShortQuestion').val();
                    if (IsUpdateShortQuest == 0) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "AddQuestions.aspx/Insert_ShortQuestions",
                            data: "{'SubId':'" + SubjectId + "','TestId':'" + TestId + "','QuestionText':'" + txtShortQuestion + "','AnswerText':'" + txtShortAnswer +
                                    "','ExpText':'" + txtShortExp + "','ReferenceText':'" + txtShortRef + "','points':'" + points +
                                    "'}",
                            dataType: "json",
                            success: function (data) {
                                var obj = data.d;
                                if (obj == 'true') {
                                    alert("Saved Short Question Successfully!");
                                }
                            },
                            error: function (result) {
                                alert("Error");
                            }
                        })
                    }
                    else {
                        //alert('Subject Id = ' + UpdateSubjectId);
                       // alert('test Id = ' + UpdateTestId);
                       // alert('question = ' + txtShortQuestion);
                        //alert('answer = ' + txtShortAnswer);
                        //alert('QuestionId = ' + ShortQuestionId);
                        //alert('points = ' + points);
                        //alert('Ref = ' + UpdateShortReference);
                        //alert('Exp = ' + UpdateShortExplanation);

                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "AddQuestions.aspx/Update_ShortQuestion_WithAllOptions",
                            data: "{'SubjectId':'" + UpdateSubjectId + "','TestId':'" + UpdateTestId + "','QuestionText':'" + txtShortQuestion + "','AnswerText':'" + txtShortAnswer +
                                    "','ExplanationText':'" + UpdateShortExplanation + "','ReferenceText':'" + UpdateShortReference + "','Points':'" + points + "'ShortQuestionId':'" + ShortQuestionId +
                                    "'}",
                            dataType: "json",
                            success: function (data) {
                                var obj = data.d;
                                if (obj == 'true') {
                                    alert("Updated Short Question Successfully!");
                                }
                            },
                            error: function (result) {
                                alert("Error");
                            }
                        })

                    }



                })

                // Insert Long Question Block ------------------------


                var SubjectId = $('#ddlSubject').val();
                var txtLongQuestionbit = 0;
                var txtLongAnswerbit = 0;
                var txtLongQuestionExpbit = 0;
                var txtLongQuestionRefbit = 0;
                var txtLongQuestion = "";
                var txtLongAnswer = "";
                var txtLongExp = "";
                var txtLongRef = "";
                var txtLongQuestionbit = 0;
                var txtLongAnswerbit = 0;
                var txtLongQuestionbit = 0;
                // Long question extra options.
                $('#btnLongQuestionSimpleBox').click(function () {

                    CKEDITOR.instances.txtLongQuestion.destroy(true);
                    txtLongQuestionbit = 0;
                 //   alert(txtLongQuestionbit);
                })
                $('#btnLongQuestionckeditor').click(function () {

                    CKEDITOR.replace('txtLongQuestion');
                    txtLongQuestionbit = 1;
                   // alert(txtLongQuestionbit);
                })
                $('#btnShowHidetxtLongQuestion').click(function () {
                    $('#divLongQuestion').toggle();
                })
                // Long answer options
                $('#btnLongAnswerSimpleBox').click(function () {
                    CKEDITOR.instances.txtLongAnswer.destroy(true);
                    txtLongAnswerbit = 0;

                })
                $('#btnLongAnswerckeditor').click(function () {

                    CKEDITOR.replace('txtLongAnswer');
                    txtLongAnswerbit = 1;
                })
                $('#btnShowHidetxtLongAnswer').click(function () {
                    $('#divLongAnswer').toggle();
                })
                // Long explanation and reference

                // Long question extra options.
                $('#btnLongQuestionSimpleBox').click(function () {
                    CKEDITOR.instances.txtLongQuestion.destroy(true);
                    txtLongQuestionbit = 1;
                })
                $('#btnLongQuestionckeditor').click(function () {
                    CKEDITOR.replace('txtLongQuestion');
                    txtLongQuestionbit = 0;
                })
                $('#btnShowHidetxtLongQuestions').click(function () {
                    $('#divLongQuestion').toggle();
                })

                // Long answer options
                $('#btnLongAnswerSimpleBox').click(function () {
                    CKEDITOR.instances.txtLongAnswer.destroy(true);
                    txtLongAnswerbit = 1;
                })
                $('#btnLongAnswerckeditor').click(function () {

                    CKEDITOR.replace('txtLongAnswer');
                    txtLongAnswerbit = 0;
                })
                $('#btnShowHidetxtLongAnswer').click(function () {
                    $('#divLongAnswer').toggle();
                })

                $('#btnSaveLongQuestion').click(function () {

                    txtLongRef = $('#txtLongQuestionReference').val();
                    txtLongExp = $('#txtLongQuestionExplanation').val();
                  //  alert('exp  ' + txtLongExp);
                  //  alert('ref ' + txtLongRef);
                    if (txtLongQuestionbit == 1) {
                        // '"' + CKEDITOR.instances.txtUserTermsAndConditions.getData() + '"';
                        txtLongQuestion = '"' + CKEDITOR.instances.txtLongQuestion.getData() + '"';

                    }
                    else {
                        txtLongQuestion = $('#txtLongQuestion').val();
                    }

                    if (txtLongAnswerbit == 1) {
                        // '"' + CKEDITOR.instances.txtUserTermsAndConditions.getData() + '"';
                        txtLongAnswer = '"' + CKEDITOR.instances.txtLongAnswer.getData() + '"';

                    }
                    else {
                        txtLongAnswer = $('#txtLongAnswer').val();
                    }


                    var SubjectId = $('#ddlSubject').val();
                    var TestId = $('#ddlTest').val();
                    var points = $('#ddlPoints').val();


                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/Insert_LongQuestions",
                        data: "{'SubId':'" + SubjectId + "','TestId':'" + TestId + "','QuestionText':'" + txtLongQuestion + "','AnswerText':'" + txtLongAnswer +
                                "','ExpText':'" + txtLongExp + "','ReferenceText':'" + txtLongRef + "','points':'" + points +
                                "'}",
                        dataType: "json",
                        success: function (data) {
                            var obj = data.d;
                            if (obj == 'true') {
                                alert("Saved Long Question Successfully!");
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })
                })




                // --------------------- Insert Long Question block End

                //$('#divEditSubjectName').hide();
                //$('#divDeleteSubjectName').hide();
                //$('#divAddMoreSubjects').hide();
                //$('#divSubjectAdvancedSettings').hide();
                $('#ddlEditSubjectNames').change(function () {
                    var selectSubName = $('#ddlEditSubjectNames').val();
                    //alert(selectSubName);
                    var txteditName = $('#txtEditSubjectNames').val(selectSubName);
                })
                $('#btnEditSubjectName').click(function () {
                    var selectSubName = $('#ddlEditSubjectNames').text();
                    //alert(selectSubName);
                    var txteditName = $('#txtEditSubjectNames').val(selectSubName);
                    $('#divEditSubjectName').toggle();
                })
                $('#btnDeleteSubjectName').click(function () {
                    $('#divDeleteSubjectName').toggle();
                })
                $('#btnAddMoreSubjects').click(function () {
                    $('#divAddMoreSubjects').toggle();
                })
                $('#btnSubjectAdvancedSettings').click(function () {
                    $('#divSubjectAdvancedSettings').toggle();
                })
                $('#btnSaveEditSubjectName').click(function () {
                    var subName = $('#txtEditSubjectNames').val();
                    var SubjectId = $('#ddlEditSubjectNames').val();
                    if (subName == '') {
                        lblName.html('Please Enter Subject Name First !');
                        lblName.removeClass();
                        lblName.addClass('required');
                    }
                    else {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "AddQuestions.aspx/Update_SubjectName",
                            data: "{'SubjectName':'" + subName + "','SubjectId':'" + SubjectId + "'}",
                            dataType: "json",
                            success: function (data) {
                                var obj = data.d;
                                function updateDropdown() {
                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: "AddQuestions.aspx/LoadddlSubject",
                                        data: "{}",
                                        dataType: "json",
                                        success: function (Result) {
                                            $.each(Result.d, function (key, value) {
                                                $("#ddlSubjectNameList").empty();
                                                $("#ddlEditSubjectNames").empty();
                                                $("#ddlDeleteSubjectNames").empty();
                                                $("#ddlSubjectAdvancedSettings").empty();
                                                $("#ddlDeleteReplaceSubjectWithExistingSubject").empty();
                                                $("#ddlDeleteOnlySubjectSettings").empty();
                                                $("#ddlSubjectNameList").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                                $("#ddlEditSubjectNames").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                                $("#ddlDeleteSubjectNames").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                                $("#ddlSubjectAdvancedSettings").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                                $("#ddlDeleteReplaceSubjectWithExistingSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                                $("#ddlDeleteOnlySubjectSettings").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                            });
                                        },
                                        error: function (Result) {
                                            alert("Error to load Subject drop down lists");
                                        }
                                    });
                                }
                            },
                            error: function (result) {
                                alert("Error");
                            }
                        })
                    }
                })
                // Subject Delete options
                $('#btnDeleteSubjectWithAllrelatedMaterial').click(function () {
                    var SubjectId = $('#ddlDeleteSubjectNames').val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/Delete_SubjectName",
                        data: "{'SubjectId':'" + SubjectId + "'}",
                        dataType: "json",
                        success: function (data) {
                            var obj = data.d;
                            if (obj == 'true') {
                                alert('All Changes Saved');
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })
                })
                $('#btnReplaceSubjectWithExistingSubject').click(function () {
                    alert('hel');
                    var oldSubjectId = $('#ddlDeleteSubjectNames').val();
                    var NewSubjectId = $('#ddlDeleteReplaceSubjectWithExistingSubject').val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/Replace_Subject",
                        data: "{'OlSubjectId':'" + oldSubjectId + "','NewSubjectId':'" + NewSubjectId + "'}",
                        dataType: "json",
                        success: function (data) {
                            var obj = data.d;
                            if (obj == 'true') {
                                alert('All Changes Saved');
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })
                })
                $('#btnDeleteOnlySubjectSettings').click(function () {
                    var SubjectId = $('#ddlDeleteOnlySubjectSettings').val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/Delete_Subject_Settings",
                        data: "{'SubjectId':'" + SubjectId + "'}",
                        dataType: "json",
                        success: function (data) {
                            var obj = data.d;

                            alert('All Settings of this subject Deleted');

                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })
                })
                // Subject Add options
                $('#btnAddSubjectNameOnly').click(function () {
                    var subName = $('#txtAddNewSubject').val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/InsertSubject",
                        data: "{'subjectName':'" + subName + "'}",
                        dataType: "json",
                        success: function (data) {
                            var obj = data.d;
                            if (obj == 'true') {
                                alert("Subject Added Successfully");
                                function updateDropdown() {
                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: "AddQuestions.aspx/LoadddlSubject",
                                        data: "{}",
                                        dataType: "json",
                                        success: function (Result) {
                                            $.each(Result.d, function (key, value) {
                                                $("#ddlSubjectNameList").empty();
                                                $("#ddlEditSubjectNames").empty();
                                                $("#ddlDeleteSubjectNames").empty();
                                                $("#ddlSubjectAdvancedSettings").empty();
                                                $("#ddlDeleteReplaceSubjectWithExistingSubject").empty();
                                                $("#ddlDeleteOnlySubjectSettings").empty();
                                                $("#ddlSubjectNameList").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                                $("#ddlEditSubjectNames").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                                $("#ddlDeleteSubjectNames").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                                $("#ddlSubjectAdvancedSettings").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                                $("#ddlDeleteReplaceSubjectWithExistingSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                                $("#ddlDeleteOnlySubjectSettings").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                                            });
                                        },
                                        error: function (Result) {
                                            alert("Error to load Subject drop down lists");
                                        }
                                    });
                                }
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })
                })
                // Save Subject Advanced Settings
                $('#btnSaveSubjectAdvanceSettings').click(function () {

                    var txtSubjectObjective = $('#txtSubjectObjective').val();
                    var txtSubjectTestChapters = $('#txtSubjectTestChapters').val();
                    var txtSubjectExplanation = $('#txtSubjectExplanation').val();
                    var txtSubjectReferenceBooks = $('#txtSubjectReferenceBooks').val();
                    var txtSubjectCode = $('#txtSubjectCode').val();
                    // include File upload Subject Image also
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/InsertSubject",
                        data: "{'subjectName':'" + subName + "'}",
                        dataType: "json",
                        success: function (data) {
                            var obj = data.d;
                            if (obj == 'true') {
                                alert("Subject Added Successfully");
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })
                })
                var chkTestAlwaysOpen = false;
                var chkTestStatus = false;
                var chkTestPracticeSession = false;

                $("#chkTestAlwaysOpen").click(function () {
                    if ($("#chkTestAlwaysOpen").is(":checked")) {
                        chkTestAlwaysOpen = true;
                    }
                    else {
                        chkTestAlwaysOpen = false;
                    }
                })
                $("#chkTestStatus").click(function () {
                    if ($("#chkTestStatus").is(":checked")) {
                        chkTestStatus = true;
                    }
                    else {
                        chkTestStatus = false;
                    }
                })
                $("#chkTestPracticeSession").click(function () {
                    if ($("#chkTestPracticeSession").is(":checked")) {
                        chkTestPracticeSession = true;
                    }
                    else {
                        chkTestPracticeSession = false;
                    }
                })
                $("#btnSaveNewTest").click(function () {
                    var ddlSubjectlistForAddTest = $('#ddlSubjectlistForAddTest').val();
                    var txtAddTestName = $('#txtAddTestName').val();
                    var txtTestDescription = $('#txtTestDescription').val();
                    var txtTestInstructions = $('#txtTestInstructions').val();
                    var txtTestStartDateTime = $('#txtTestStartDateTime').val();
                    var txtTestDueDateTime = $('#txtTestDueDateTime').val();
                    if ($('#txtTestTotalAttempts').val() == '') {
                        var txtTestTotalAttempts = 0;
                    }
                    else {
                        var txtTestTotalAttempts = $('#txtTestTotalAttempts').val();
                    }
                  //  alert(txtTestTotalAttempts);
                    var txtTestExtendedDateTime = $('#txtTestExtendedDateTime').val();
                    var ddlTestPassingPercentage = $('#ddlTestPassingPercentage').val();
                    var testimage = 'imagepath';
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/Insert_Test_With_All_Options",
                        data: "{'ddlSubjectId':'" + ddlSubjectlistForAddTest + "','TestName':'" + txtAddTestName + "','TestDescription':'" + txtTestDescription +
                                "','TestStatus':'" + chkTestStatus + "','PractiseSession':'" + chkTestPracticeSession +
                                "','PassingPercentage':'" + ddlTestPassingPercentage + "','TestImage':'" + testimage +
                                "','TestInstructions':'" + txtTestInstructions + "','TestStartDateTime':'" + txtTestStartDateTime +
                                "','TestDueDateTime':'" + txtTestDueDateTime + "','TestAttempts':'" + txtTestTotalAttempts +
                                "','TestExtendedDateTime':'" + txtTestExtendedDateTime + "','TestAlwaysOpen':'" + chkTestAlwaysOpen +
                                "'}",
                        dataType: "json",
                        success: function (data) {
                            alert('Test Saved successfully');

                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(xhr.status);
                        },
                    })

                })

                $('#btnAddMoreTestSettings').click(function () {

                    $("#divAddMoreTestsettings").toggle();
                })

                $('#btnEditMoreTestSettings').click(function () {

                    $('#divEditMoreTestsettings').toggle();
                })
                var chkEditTestAlwaysOpen = false;
                var chkEditTestStatus = false;
                var chkEditTestPracticeSession = false;
                $("#chkEditTestAlwaysOpen").click(function () {
                    if ($("#chkEditTestAlwaysOpen").is(":checked")) {
                        chkEditTestAlwaysOpen = true;
                    }
                    else {
                        chkEditTestAlwaysOpen = false;
                    }
                })
                $("#chkEditTestStatus").click(function () {
                    if ($("#chkEditTestStatus").is(":checked")) {
                        chkEditTestStatus = true;
                    }
                    else {
                        chkEditTestStatus = false;
                    }
                })
                $("#chkEditTestPracticeSession").click(function () {
                    if ($("#chkEditTestPracticeSession").is(":checked")) {
                        chkEditTestPracticeSession = true;
                    }
                    else {
                        chkEditTestPracticeSession = false;
                    }
                })

                $('#ddlTestlistForEditTest').change(function () {
                    var subjectid = $('#ddlSubjectlistForEditTest').val();
                    var testid = $('#ddlTestlistForEditTest').val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/ddlTestSettings_GetSelectedTestId",
                        data: "{'SubjectId':'" + subjectid + "','TestId':'" + testid + "'}",
                        dataType: "json",
                        success: function (data) {
                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "AddQuestions.aspx/Load_Test_Setting",
                                data: "{}",
                                dataType: "json",
                                success: function (data) {
                                    var len = data.d.length;
                                    var txt = "";
                                    if (len > 0) {
                                        for (var i = 0; i < len; i++) {
                                           // alert(data.d[i].TestName);
                                            $('#txtEditTestName').val(data.d[i].TestName);
                                            $('#txtEditTestDescription').val(data.d[i].TestDescription);
                                            $('#txtEditTestInstructions').val(data.d[i].TestInstructions);
                                            $('#txtEditTestStartDateTime').val(data.d[i].TestStartTiming);
                                            $('#txtEditTestDueDateTime').val(data.d[i].TestDueTiming);
                                            $('#txtEditTestTotalAttempts').val(data.d[i].TestAttempts);
                                            $('#txtEditTestExtendedDateTime').val(data.d[i].TestExtendableDateTime);
                                            //txt += '<tbody><tr><td>' + data.d[i].SubjectName + '</td><td>' + data.d[i].TestName + '</td><td>' + data.d[i].TestStartingDate + '</td><td>' + data.d[i].TestEndingDate + '</td><td>' + data.d[i].TestStatus + '</td></tr></tbody>';
                                        }

                                        //if (txt != '') {
                                        //    $("#tableShowUserMcqs").append(txt).removeClass("hidden");
                                        //    $("#tableShowUserMcqs").DataTable();
                                        //    alert(txt);
                                        //}
                                    }

                                },
                                error: function (data) {
                                    alert("Error");
                                }
                            });

                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })
                })
                $('#btnShowTestMcqs').click(function () {
                    var SubjId = $('#ddlSubjectlistShowTestQuestions').val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/Load_Test_Setting",
                        data: "{'subjectId':'" + SubjId + "'}",
                        dataType: "json",
                        success: function (data) {
                            var len = data.d.length;
                            var txt = "";
                            if (len > 0) {
                                for (var i = 0; i < len; i++) {
                                    //$('#txtEditTestName').val(data.d[i].TestName);
                                    //$('#txtEditTestDescription').val(data.d[i].TestDescription);
                                    //$('#txtEditTestInstructions').val(data.d[i].TestInstructions);
                                    //$('#txtEditTestStartDateTime').val(data.d[i].TestStartTiming);
                                    //$('#txtEditTestDueDateTime').val(data.d[i].TestDueTiming);
                                    //$('#txtEditTestTotalAttempts').val(data.d[i].TestAttempts);
                                    //$('#txtEditTestExtendedDateTime').val(data.d[i].TestExtendableDateTime);
                                    txt += '<tbody><tr><td>' + data.d[i].TestName + '</td><td>' + data.d[i].TestAttempts + '</td><td>' + data.d[i].TestStatus + '</td><td>' + data.d[i].TestPassingPercentage + '</td><td>' + data.d[i].TestDescription + '</td></tr></tbody>';
                                }

                                if (txt != '') {
                                    $("#tblShowTest").empty();
                                    var tblHeading = '<tr><th>Name</th><th>Total Attempts</th><th>Status</th><th>Passing Percentage</th><th>Description</th></tr>';
                                    $("#tblShowTest").append(tblHeading);
                                    $("#tblShowTest").append(txt).removeClass("hidden");
                                    $("#tblShowTest").DataTable();

                                }
                            }

                        },
                        error: function (data) {
                            alert("Error");
                        }
                    });
                })
                $('#btnSaveEditTestSettings').click(function () {
                    var ddlSubjectlistForAddTest = $('#ddlSubjectlistForEditTest').val();
                    var Testid = $('#ddlTestlistForEditTest').val();
                    var txtAddTestName = $('#txtEditTestName').val();
                    var txtTestDescription = $('#txtEditTestDescription').val();
                    var txtTestInstructions = $('#txtEditTestInstructions').val();
                    var txtTestStartDateTime = $('#txtEditTestStartDateTime').val();
                    var txtTestDueDateTime = $('#txtEditTestDueDateTime').val();
                    var txtTestTotalAttempts = $('#txtEditTestTotalAttempts').val();
                    var txtTestExtendedDateTime = $('#txtEditTestExtendedDateTime').val();
                    var ddlTestPassingPercentage = $('#ddlEditTestPassingPercentage').val();
                    var testimg = 'testimagepath';
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/Update_Test_With_All_Options",
                        data: "{'ddlSubjectId':'" + ddlSubjectlistForAddTest + "','TestName':'" + txtAddTestName + "','TestDescription':'" + txtTestDescription +
                                "','TestStatus':'" + chkEditTestStatus + "','TestPracticeSession':'" + chkEditTestPracticeSession +
                                "','TestPassingPercentage':'" + ddlTestPassingPercentage + "','TestImage':'" + testimg +
                                "','TestInstructions':'" + txtTestInstructions + "','TestStartTiming':'" + txtTestStartDateTime +
                                "','TestDueTiming':'" + txtTestDueDateTime + "','TestAttempts':'" + txtTestTotalAttempts +
                                "','TestExtendedDateTime':'" + txtTestExtendedDateTime + "','TestAlwaysOpen':'" + chkEditTestAlwaysOpen +
                                "','TestId':'" + Testid +
                                "'}",
                        dataType: "json",
                        success: function (data) {
                            alert('Test Updated successfully');

                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })
                })

                $('#btnDeleteTest').click(function () {
                    var ddlSubjectlistForDeleteTest = $('#ddlSubjectlistForDeleteTest').val();
                    var ddlTestlistForDeleteTest = $('#ddlTestlistForDeleteTest').val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/Delete_Test",
                        data: "{'ddlSubjectId':'" + ddlSubjectlistForDeleteTest + "','TestId':'" + ddlTestlistForDeleteTest + "'}",
                        dataType: "json",
                        success: function (data) {
                            alert('Test Deleted successfully');

                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })

                })

                $('#btnMergeTest').click(function () {
                    var ddlSubjectlistToMergeTest = $('#ddlSubjectlistToMergeTest').val();
                    var ddlTestlistForDeleteTest = $('#ddlTestlistToMergeTest').val();
                    var ddlNewSubjectId = $('#ddlNewSubjectlistForMergeTest').val();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/Merge_Test",
                        data: "{'ddlSubjectId':'" + ddlSubjectlistToMergeTest + "','TestId':'" + ddlTestlistForDeleteTest +
                               "','ddlNewSubjectId':'" + ddlNewSubjectId +
                            "'}",
                        dataType: "json",
                        success: function (data) {
                            alert('Test Merged successfully');

                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })

                })




                //$('#divAddedUserTable').show((function showUserDetails() {
                //     alert('I am divadduser');
                //     $.ajax({
                //         type: "POST",
                //         contentType: "application/json; charset=utf-8",
                //         url: "AddQuestions.aspx/UserDetail",
                //         data: "{}",
                //         dataType: "json",
                //         success: function (data) {
                //             alert(data.d);
                //             //$.each(Result.d, function (key, value) {
                //             //    alert(value.SubjectName);
                //             //    alert(value.TestName);
                //             //    // var table = $('<table></table>').addClass('foo');
                //             //    var table = ('<table></table>');
                //             //    for (i = 0; i < Result.d.length; i++) {
                //             //        //var row = $('<tr></tr>').addClass('bar').text('result ' + i);
                //             //        var row = $('<tr></tr>').text(value.SubjectName);
                //             //        var row1 = $('<tr></tr>').text(value.SubjectName);
                //             //        var row2 = $('<tr></tr>').text(value.SubjectName);
                //             //        var row3 = $('<tr></tr>').text(value.SubjectName);
                //             //        var row4 = $('<tr></tr>').text(value.SubjectName);
                //             //        table.append(row);
                //             //    }
                //             //    $('#divtableUsersDashboardmcqs').append(table);
                //             //});

                //             var len = data.d.length;
                //             var txt = "";
                //             alert(len);
                //             if (len > 0) {
                //                 for (var i = 0; i < len; i++) {
                //                     //alert(data.length);
                //                     //alert(data.d[i].SubjectName);
                //                     // if (data.d[i].SubjectName )//&& data[i].TestName && data[i].TestStartingDate && data[i].TestEndingDate && data[i].TestStatus)
                //                     //  {
                //                     txt += '<tbody><tr><td>' + data.d[i].UserName + '</td><td>' + data.d[i].UserEmail + '</td><td>' + data.d[i].UserPassword + '</td><td>' + data.d[i].UserTotalAttempts + '</td><td>' + + '</td></tr></tbody>';
                //                     //  }
                //                     //alert(txt);
                //                 }



                //                 if (txt != '') {
                //                     $("#tblShowUsers").append(txt).removeClass("hidden");
                //                     $("#tblShowUsers").DataTable({
                //                     });
                //                     alert(txt);
                //                 }
                //             }

                //         },
                //         error: function (data) {
                //             alert("Error to display your users.");
                //         }
                //     });

                // }));

                var table = $('#tblShowUsers').DataTable();

                $('#btnEditUserDetail').click(function () {

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/LoadddlUsers",
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlEditUsers").append($("<option></option>").val(value.UserId).html(value.UserEmail));

                            });
                        },
                        error: function (Result) {
                            alert("Error to load Users drop down lists");
                        }
                    });
                })


                $('#ddlEditUsers').change(function () {

                    var UserId = $('#ddlEditUsers').val();
                  //  alert(UserId);
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddQuestions.aspx/ddlUserDetails_GetSelectedUserId",
                        data: "{'UserId':'" + UserId + "'}",
                        dataType: "json",
                        success: function (data) {
                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "AddQuestions.aspx/UserDetail",
                                data: "{}",
                                dataType: "json",
                                success: function (data) {
                                    var len = data.d.length;
                                    var txt = "";
                                    if (len > 0) {
                                        for (var i = 0; i < len; i++) {
                                         //   alert(data.d[i].UserEmail);
                                            $('#ddlUserRoleId').val(data.d[i].UserRole);
                                            $('#txtUserName').val(data.d[i].UserName);
                                            $('#txtUserEmail').val(data.d[i].UserEmail);
                                            $('#txtUserPassword').val(data.d[i].UserPassword);
                                            $('#txtUserParentEmail').val(data.d[i].UserParrentEmail);
                                            $('#txtUserParentName').val(data.d[i].UserParrentName);
                                            $('#txtUserRollNo').val(data.d[i].UserRollNo);
                                            $('#txtUserFirstName').val(data.d[i].UserFirstName);
                                            //$('#txtUserLastName').val(data.d[i].UserLastName);
                                            //$('#txtUserDepartment').val(data.d[i].UserDepartment);
                                            //$('#txtUserRegion').val(data.d[i].UserRegion);
                                            //$('#txtUserTelephoneNo').val(data.d[i].UserPhoneNo);
                                            //$('#txtUserDOB').val(data.d[i].UserDateOfBirth);
                                            //$('#ddlUserGroup').val();
                                            //$('#txtUserImage').val(data.d[i].UserPicture);
                                            //$('#txtUserCity').val(data.d[i].UserCity);
                                            //$('#ddlUserGender').val(data.d[i].UserGender);
                                            //chkCertificateCustomDesignbit;
                                            //chkResultCardCustomDesignbit;
                                            //chkUserEmailResultbit
                                            //$('#txtUserCountry').val(data.d[i].UserCountry);
                                            //var txtUserTermsAndConditions = '"' + CKEDITOR.instances.txtUserTermsAndConditions.getData() + '"';
                                            //chkUserPracticeModebit
                                            //chkRandomizeQuestionsInTestbit;
                                            //$('#ddlTotalUserAttempts').val(data.d[i].UserTotalAttempts);
                                            //chkEmailTestResultToAdminbit;
                                            //chkUserSeeOtherUsersResultbit;
                                            //$('#txtUserTestStartDateTime').val(data.d[i].UserTestStartingDatetime);
                                            //$('#txtUserTestEndDateTime').val(data.d[i].UserTestDueDateTime);


                                            //txt += '<tbody><tr><td>' + data.d[i].SubjectName + '</td><td>' + data.d[i].TestName + '</td><td>' + data.d[i].TestStartingDate + '</td><td>' + data.d[i].TestEndingDate + '</td><td>' + data.d[i].TestStatus + '</td></tr></tbody>';
                                        }

                                        //if (txt != '') {
                                        //    $("#tableShowUserMcqs").append(txt).removeClass("hidden");
                                        //    $("#tableShowUserMcqs").DataTable();
                                        //    alert(txt);
                                        //}
                                    }

                                },
                                error: function (data) {
                                    alert("Error");
                                }
                            });

                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })
                })



            }


        });
    </script>
    <title>AdminLTE 2 | Dashboard</title>
    <style type="text/css">
        input[type=checkbox] + label {
            color: #808080;
            font-style: italic;
            display: inline;
        }

        input[type=checkbox]:checked + label {
            color: #054609;
            font-style: normal;
            display: inline;
            font-weight: bold;
            font-size: large;
        }

        label.radio-inline, label.checkbox-inline {
            background-color: #dcdfd4;
            cursor: pointer;
            font-weight: 400;
            margin-bottom: 10px !important;
            margin-right: 2%;
            margin-left: 0;
            padding: 10px 10px 10px 30px;
        }

            label.radio-inline.checked, label.checkbox-inline.checked {
                background-color: #266c8e;
                color: #fff !important;
                text-shadow: 1px 1px 2px #000 !important;
            }

        .checkbox-inline + .checkbox-inline, .radio-inline + .radio-inline {
            margin-left: 0;
        }

        .columns label.radio-inline, .columns label.checkbox-inline {
            min-width: 190px;
            vertical-align: top;
            width: 30%;
        }

        .additional-info-wrap {
            display: inline-block;
            margin: 0 2% 0 0;
            min-width: 190px;
            position: relative;
            vertical-align: top;
            width: 30%;
        }

            .additional-info-wrap label.checkbox-inline, .additional-info-wrap label.radio-inline {
                width: 100% !important;
            }

            .additional-info-wrap .additional-info {
                background-color: #266c8e;
                clear: both;
                color: #fff !important;
                margin-top: -10px;
                padding: 0 10px 10px;
                text-shadow: 1px 1px 2px #000 !important;
                width: 100%;
            }
            .insertmcqs {}
            .editmcqs { }
            .deletemcqs {}
            .insertShortQ{}
            .editShortQ{}
            .DeleteShortQ{}
            .insertLongQ{}
            .EditLongQ{}
            .DeleteLongQ{}
            .mcqsShow{

            }
            .ShortQShow{}
            .LongQShow{}
        .SubShow {
        }
        .TestShow{}
        .UserShow{}

        .insertSub{}
        .insertTest{}
        .insertUser{}
        .editSub{}
        .editTest{}
        .editUser{}
        .DelSub{}
        .DelTest{}
        .DelUser{}

    </style> 

</head>
<body>
    <!-- class="bodyBackground"> -->
    <form id="form1" runat="server" method="post">

        <div id="subUser" class="hidden">
            <table class="table" border="1">
                <thead>
                    <tr>
                        <td class="col-xs-12">
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

<div class="wrapper" >

            <header class="main-header">
                <!-- Logo -->
                <a href="index2.html" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>F</b>Mcq</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Free</b>MCQS</span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top" role="navigation">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <div class="navbar-custom-menu">

                        <style>
                        #dash_QuestionsLink { width: 150px; height: 150px; padding: 0.5em; }
                        #dash_QuestionsLink h3 { text-align: center; margin: 0; }
                    </style>
           <%--          <div id="dash_QuestionsLink">
                            <div class="form-group">

                                <div class="row col-md-12" style="    background-color: cornflowerblue;">
                                <label class="col-md-4 text-bold h4" >Multiple Choice Questions (MCQ's)</label>
                                    <a href="#divMcqsQuestion" class="col-md-1 myhref insertmcqs">Add</a>
                                    <a href="#showMcqs_Questions" class="col-md-1 myhref mcqsShow">Show</a>
                                    <a href="#linkEditMcqs" class="col-md-1 myhref editmcqs">Edit</a>
                                    <a href="#" class="col-md-1 myhref deletemcqs">Delete</a>
                                </div>
                            </div>
                             <div class="form-group">

                                <div class="row col-md-12" style="    background-color: #3588fb;">
                                <label class="col-md-4 text-bold h4" >Short Questions</label>
                                    <a href="#ShortQuestion" class="col-md-1 myhref insertShortQ">Add</a>
                                    <a href="#divShowShortQuestion" class="col-md-1 myhref ShortQShow">Show</a>
                                    <a href="#divShowShortQuestion" class="col-md-1 myhref editShortQ">Edit</a>
                                    <a href="#" class="col-md-1 myhref DeleteShortQ">Delete</a>
                                </div>
                            </div>
                             <div class="form-group">

                                <div class="row col-md-12" style="    background-color: #61b5e0;">
                                <label class="col-md-4 text-bold h4" >Long Questions</label>
                                    <a href="#LongQuestion" class="col-md-1 myhref insertLongQ">Add</a>
                                    <a href="#divShowLongQuestion" class="col-md-1 myhref LongQShow">Show</a>
                                    <a href="#linkEditLongQuestion" class="col-md-1 myhref EditLongQ">Edit</a>
                                    <a href="#" class="col-md-1 myhref DeleteLongQ">Delete</a>
                                </div>
                            </div>
                             <div class="form-group">

                                <div class="row col-md-12" style="    background-color: cornflowerblue;">
                                <label class="col-md-4 text-bold h4" >Subject's</label>
                                    <a href="#" class="col-md-1 myhref insertSub">Add</a>
                                    <a href="#" class="col-md-1 myhref SubShow">Show</a>
                                    <a href="#" class="col-md-1 myhref editSub">Edit</a>
                                    <a href="#" class="col-md-1 myhref DelSub">Delete</a>
                                </div>
                            </div>
                             <div class="form-group">

                                <div class="row col-md-12" style="    background-color: #3588fb;">
                                <label class="col-md-4 text-bold h4" >Test's</label>
                                    <a href="#" class="col-md-1 myhref insertTest">Add</a>
                                    <a href="#" class="col-md-1 myhref TestShow">Show</a>
                                    <a href="#" class="col-md-1 myhref editTest">Edit</a>
                                    <a href="#" class="col-md-1 myhref DelTest">Delete</a>
                                </div>
                            </div>
                             <div class="form-group">

                                <div class="row col-md-12" style="    background-color: #61b5e0;">
                                <label class="col-md-4 text-bold h4" >User's</label>
                                    <a href="#" class="col-md-1 myhref insertUser">Add</a>
                                    <a href="#" class="col-md-1 myhref UserShow">Show</a>
                                    <a href="#" class="col-md-1 myhref editUser">Edit</a>
                                    <a href="#" class="col-md-1 myhref DelUser">Delete</a>
                                </div>
                            </div>
                        </div>
                <div class="row col-md-12" style="    background-color: cornflowerblue;">
                                <label class="col-md-4 text-bold h4" >Multiple Choice Questions (MCQ's)</label>
                                    <a href="#divMcqsQuestion" class="col-md-1 myhref insertmcqs">Add</a>
                                    <a href="#showMcqs_Questions" class="col-md-1 myhref mcqsShow">Show</a>
                                    <a href="#linkEditMcqs" class="col-md-1 myhref editmcqs">Edit</a>
                                    <a href="#" class="col-md-1 myhref deletemcqs">Delete</a>
                                </div>
               --%>
                        <ul class="nav navbar-nav">
                            <li class="dropdown-menu">
                                <ul>
                                    <li class="header">Mcq's</li>
                                <a href="#divMcqsQuestion" class="col-md-1 myhref insertmcqs">Add</a>
                                </ul>
                                
                            </li>
                            <!-- Messages: style can be found in dropdown.less-->
                            <li class="dropdown messages-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-envelope-o"></i>
                                    <span class="label label-success">4</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">You have 4 messages</li>
                                    <li>
                                        <!-- inner menu: contains the actual data -->
                                        <ul class="menu">
                                            <li>
                                                <!-- start message -->
                                                <a href="#">
                                                    <div class="pull-left">
                                                        <img src="../theme_AdminLTE/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                                    </div>
                                                    <h4>Support Team
                           
                                                        <small><i class="fa fa-clock-o"></i>5 mins</small>
                                                    </h4>
                                                    <p>Why not buy a new awesome theme?</p>
                                                </a>
                                            </li>
                                            <!-- end message -->
                                            <li>
                                                <a href="#">
                                                    <div class="pull-left">
                                                        <img src="../theme_AdminLTE/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                                    </div>
                                                    <h4>AdminLTE Design Team
                           
                                                        <small><i class="fa fa-clock-o"></i>2 hours</small>
                                                    </h4>
                                                    <p>Why not buy a new awesome theme?</p>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="pull-left">
                                                        <img src="../theme_AdminLTE/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                                    </div>
                                                    <h4>Developers
                           
                                                        <small><i class="fa fa-clock-o"></i>Today</small>
                                                    </h4>
                                                    <p>Why not buy a new awesome theme?</p>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="pull-left">
                                                        <img src="../theme_AdminLTE/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                                    </div>
                                                    <h4>Sales Department
                           
                                                        <small><i class="fa fa-clock-o"></i>Yesterday</small>
                                                    </h4>
                                                    <p>Why not buy a new awesome theme?</p>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="pull-left">
                                                        <img src="../theme_AdminLTE/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                                    </div>
                                                    <h4>Reviewers
                           
                                                        <small><i class="fa fa-clock-o"></i>2 days</small>
                                                    </h4>
                                                    <p>Why not buy a new awesome theme?</p>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="footer"><a href="#">See All Messages</a></li>
                                </ul>
                            </li>
                            <!-- Notifications: style can be found in dropdown.less -->
                            <li class="dropdown notifications-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-bell-o"></i>
                                    <span class="label label-warning">10</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">You have 10 notifications</li>
                                    <li>
                                        <!-- inner menu: contains the actual data -->
                                        <ul class="menu">
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-users text-aqua"></i>5 new members joined today
                        </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-warning text-yellow"></i>Very long description here that may not fit into the page and may cause design problems
                        </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-users text-red"></i>5 new members joined
                        </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-shopping-cart text-green"></i>25 sales made
                        </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-user text-red"></i>You changed your username
                        </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="footer"><a href="#">View all</a></li>
                                </ul>
                            </li>
                            <!-- Tasks: style can be found in dropdown.less -->
                            <li class="dropdown tasks-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-flag-o"></i>
                                    <span class="label label-danger">9</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">You have 9 tasks</li>
                                    <li>
                                        <!-- inner menu: contains the actual data -->
                                        <ul class="menu">
                                            <li>
                                                <!-- Task item -->
                                                <a href="#">
                                                    <h3>Design some buttons
                           
                                                        <small class="pull-right">20%</small>
                                                    </h3>
                                                    <div class="progress xs">
                                                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">20% Complete</span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <!-- end task item -->
                                            <li>
                                                <!-- Task item -->
                                                <a href="#">
                                                    <h3>Create a nice theme
                           
                                                        <small class="pull-right">40%</small>
                                                    </h3>
                                                    <div class="progress xs">
                                                        <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">40% Complete</span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <!-- end task item -->
                                            <li>
                                                <!-- Task item -->
                                                <a href="#">
                                                    <h3>Some task I need to do
                           
                                                        <small class="pull-right">60%</small>
                                                    </h3>
                                                    <div class="progress xs">
                                                        <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">60% Complete</span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <!-- end task item -->
                                            <li>
                                                <!-- Task item -->
                                                <a href="#">
                                                    <h3>Make beautiful transitions
                           
                                                        <small class="pull-right">80%</small>
                                                    </h3>
                                                    <div class="progress xs">
                                                        <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">80% Complete</span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <!-- end task item -->
                                        </ul>
                                    </li>
                                    <li class="footer">
                                        <a href="#">View all tasks</a>
                                    </li>
                                </ul>
                            </li>
                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="../theme_AdminLTE/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                                    <span class="hidden-xs">Alexander Pierce</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="../theme_AdminLTE/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                        <p>
                                            Alexander Pierce - Web Developer
                     
                                            <small>Member since Nov. 2012</small>
                                        </p>
                                    </li>
                                    <!-- Menu Body -->
                                    <li class="user-body">
                                        <div class="row">
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Followers</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Sales</a>
                                            </div>
                                            <div class="col-xs-4 text-center">
                                                <a href="#">Friends</a>
                                            </div>
                                        </div>
                                        <!-- /.row -->
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-default btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- Control Sidebar Toggle Button -->
                            <li>
                                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="../theme_AdminLTE/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Alexander Pierce</p>
                            <a href="#"><i class="fa fa-circle text-success"></i>Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active treeview">
                            <a href="#">
                                <i class="fa fa-dashboard"></i><span>Dashboard</span> <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            
                        </li>
                        <li class="treeview">
                            <a href="#" id="linkLoadMainQuestion">
                                <i class="fa fa-graduation-cap"></i>
                                <span>Questions</span>
                                <span class="label label-primary pull-right">4</span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#" id="linkInsertMcqs"><i class="fa fa-floppy-o insertmcqs"></i><b>Insert</b> Mcqs</a></li>
                                <li><a href="#" id="linkInsertShortQuestions"><i class="fa fa-floppy-o insertShortQ"></i><b>Insert</b> Short Questions</a></li>
                                <li><a href="#" id="linkInsertLongQuestions"><i class="fa fa-floppy-o insertLongQ"></i><b>Insert</b> Long Questions</a></li>
                                <li><a href="#" id="linkShowMcqs"><i class="fa  fa-info-circle mcqsShow "></i><b>Show</b> Mcqs</a></li>
                                <li><a href="#" id="linkShowShortQuestions"><i class="fa fa-info-circle ShortQShow "></i><b>Show</b> Short Questions</a></li>
                                <li><a href="#" id="linkShowLongQuestion"><i class="fa fa-info-circle LongQShow "></i><b>Show</b> Long Questions</a></li>
                                <li><a href="#" id="linkEditMcqs"><i class="fa fa-edit editmcqs "></i><b>Edit</b> Mcqs</a></li>
                                <li><a href="#" id="linkEditShortQuestion"><i class="fa fa-edit editShortQ"></i><b>Edit</b> Short Questions</a></li>
                                <li><a href="#" id="linkEditLongQuestion"><i class="fa fa-edit EditLongQ"></i><b>Edit</b> Long Questions</a></li>
                                <li><a href="#" id="linkDeleteMcqs"><i class="fa fa-remove deletemcqs"></i><b>Delete</b> Mcqs</a></li>
                                <li><a href="#" id="linkDeleteShortQuestions"><i class="fa fa-remove DeleteShortQ"></i><b>Delete</b> Short Questions</a></li>
                                <li><a href="#" id="linkDeleteLongQuestions"><i class="fa fa-remove DeleteLongQ"></i><b>Delete</b> Long Questions</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-filter"></i>
                                <span>Test</span>
                                <span class="label label-primary pull-right">4</span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#" id="linkInsertTest"><i class="fa fa-circle-o insertTest"></i><b>Insert</b> New Test</a></li>
                                <li><a href="#" id="linkDeleteTest"><i class="fa fa-circle-o DelTest"></i><b>Delete</b> Test</a></li>
                                <li><a href="#" id="linkEditTest"><i class="fa fa-circle-o editTest"></i><b>Edit</b> Test</a></li>
                                <li><a href="#" id="linkShowTest"><i class="fa fa-circle-o TestShow"></i><b>Show</b> Test</a></li>
                                <li><a href="#" id="linkMergeTest"><i class="fa fa-circle-o"></i><b>Merge</b> Test</a></li>

                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-files-o"></i>
                                <span>Subject</span>
                                <span class="label label-primary pull-right">4</span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#" id="linkInsertSubject"><i class="fa fa-circle-o insertSub"></i><b>Insert</b> New Subject</a></li>
                                <li><a href="#" id="linkDeleteSubject"><i class="fa fa-circle-o DelSub"></i><b>Delete</b> Subject</a></li>
                                <li><a href="#" id="linkEditSubject"><i class="fa fa-circle-o editSub"></i><b>Edit</b> Subject</a></li>
                                <li><a href="#" id="linkShowSubject"><i class="fa fa-circle-o SubShow"></i><b>Show</b> Subject</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-user"></i>
                                <span>Users</span>
                                <span class="label label-primary pull-right">4</span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#" id="linkInsertUser"><i class="fa fa-circle-o insertUser"></i><b>Insert</b> New User(s)</a></li>
                                <li><a href="#" id="linkDeleteUser"><i class="fa fa-circle-o DelUser"></i><b>Delete</b> User(s)</a></li>
                                <li><a href="#" id="linkEditUser"><i class="fa fa-circle-o editUser"></i><b>Edit</b> User(s)</a></li>
                                <li><a href="#" id="linkShowUser"><i class="fa fa-circle-o UserShow"></i><b>Show</b> User(s)</a></li>
                            </ul>
                        </li>
                        
                       
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1 id="MainHeading">Dashboard
           
                        <small>Control panel</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard" id="home"></i>Home</a></li>
                        <li class="active" id="breadcrumbpath">Dashboard</li>
                    </ol>
                   
                </section>
                <section class="content">
                    

                    <div id="divSubjectName">
                        <h1>Subject Name</h1>
                        <div class="form-horizontal col-md-8 col-md-offset-2 panel-group">
                            <div class="form-group panelbg">
                                <br />
                                <br />
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2">
                                        <input type="text" class="input-lg" autofocus="autofocus" placeholder="Subject Name" id="txtSubjectName" />
                                        <label id="lblName"></label>
                                    </div>
                                    <div class="col-md-4 text-left">

                                        <div class="panel panel-info">
                                            <div class="panel-heading panel-info">
                                                <h4>What is it ?</h4>
                                            </div>
                                            <div class="panel-body text-justify">

                                                <label id="SubjectInformationHelp" class="labelForError available" title="What is it?">
                                                    You can choose your Subject Name i.e History, Mathematics, Science, Business Statistics, MCAT, ECAT, Medical or Also you can Choose Subject code there i.e. CS201, MTH101
                                                </label>
                                            </div>
                                            <div class="panel-footer">
                                                Select appropriate name please.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-4 text-left col-md-offset-8">
                                        <input type="button" value="NEXT" class="btn-info btn-lg" id="btnSubjectNext" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-4">
                                        <label id="lblmsg" />
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="divTestName">
                        <h1>Test Name</h1>
                        <div class="form-horizontal col-md-8 col-md-offset-2 panel-group">
                            <div class="form-group panelbg">
                                <br />
                                <br />
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-2">
                                        <input type="text" class="input-lg" autofocus="autofocus" placeholder="Test Name" id="txtTestName" />
                                        <label id="lblTest"></label>
                                    </div>
                                    <div class="col-md-4 text-left">

                                        <div class="panel panel-info">
                                            <div class="panel-heading panel-info">
                                                <h4>What is it ?</h4>
                                            </div>
                                            <div class="panel-body text-justify">

                                                <label id="TesttInformationHelp" class="labelForError available" title="What is it?">
                                                    A Subject has multiple Tests, so you must choose unique name for each test i.e. MCAT_2015, PAST PAPER 2014, GUESS PAPER 2016, MIDTERM 2015, CHAPTER NO 14 TO 20 etc.
                                                </label>
                                            </div>
                                            <div class="panel-footer">
                                                Select appropriate name please.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-4 text-left col-md-offset-8">
                                        <input type="button" value="NEXT" class="btn-info btn-lg" id="btnTestNext" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-md-offset-4">
                                        <label id="lblTestmsg" />
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <%--                    <div class="row" id="divShowAllQuestions">
                        <div class="col-md-3">
                            <label id="heading" class="h2 available  "><span></span></label>
                        </div>
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">

                            <input type="button" id="btnShowMcqss" class="btn btn-xs btn-group" value="Insert Mcqs" />
                            <input type="button" id="btnShowShortQuestions" class="btn btn-xs  btn-group" value="Insert Short Questions" />
                            <input type="button" id="btnShowLongQuestions" class="btn btn-xs  btn-group" value="Insert Long Questions" />
                        </div>
                    </div>--%>




                    <%--  <div class="row">
                                <div class="col-md-6">
                                    <label class="h3"><span>Question</span></label>
                                </div>
                                <div class="col-md-6">
                                    <label class="h3"><span">Options.</span></label><br />
                                        <label class="label text-info label-primary" ><span >Please Check the leftside checkbox in case of each correct answer.</span></label>
                                </div>
                                </div>--%>
                    <div id="divCommonSubTestNumb">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <label id="lblSubjectName" class="control-label" for="ddlSubject"><span>Subject</span></label>
                                    <select id="ddlSubject" name="ddlSubject" class="form-control form-group-sm btn-sm"></select>
                                </div>

                                <div class="col-md-3">
                                    <label id="lblTestName" class="control-label" for="ddlTest"><span>Test</span></label>
                                    <select id="ddlTest" name="ddlTest" class=" form-control"></select>
                                </div>

                                <div class="col-md-3">
                                    <label class="control-label" for="ddlPoints"><span>Points</span></label>
                                    <select id="ddlPoints" class=" form-control">
                                        <option value="1">1 Point</option>
                                        <option value="2">2 Points</option>
                                        <option value="3">3 Points</option>
                                        <option value="4">4 Points</option>
                                        <option value="5">5 Points</option>
                                        <option value="6">6 Points</option>
                                        <option value="7">7 Points</option>
                                        <option value="8">8 Points</option>
                                        <option value="9">9 Points</option>
                                        <option value="10">10 Points</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="showMcqs_Questions">
                         <div class="form-group">
                            <label style="width: 100%;">Select Subject</label>
                            <select id="ddlShowMcqsQuestionSubject" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Test</label>
                            <select id="ddlShowMcqsQuestionTest" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Question</label>
                            <select id="ddlShowMcqsQuestion" class="form-control"></select>
                        </div>
                        <div class="row" id="divbtnMcqsQuestionShow">
                            <div class="col-md-12 ">
                                <a class="btn btn-info btn-app" id="btnShowMcqsQuestion">
                                    <i class="fa-caret-square-o-right"></i>Show
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="divShowMcqsQuestion">
                       <%-- <div class="form-group">
                            <label style="width: 100%;">Select Subject</label>
                            <select id="ddlShowMcqsQuestionSubject" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Test</label>
                            <select id="ddlShowMcqsQuestionTest" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Question</label>
                            <select id="ddlShowMcqsQuestion" class="form-control"></select>
                        </div>
                        <div class="row" id="divbtnMcqsQuestionShow">
                            <div class="col-md-12 ">
                                <a class="btn btn-info btn-app" id="btnShowMcqsQuestion">
                                    <i class="fa-caret-square-o-right"></i>Show
                                </a>
                            </div>
                        </div>--%>
                    </div>
                    <style>
                        .myhref{
                            padding-top: 16px;
                            color:papayawhip;
                        }
                        a.myhref:hover{
                            background-color:black;
                        }
                        a.myhref:active{
                            background-color:white;
                        }
                       
                        a.myhref::before{
                            background-color:darkgreen;
                        }

                    </style>
                
                    <div id="divMcqsQuestion" style="display: block">

                        <div class="row">
                            <div class="col-md-12">
                                <input type="button" id="btnQuestionSimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />
                                <input type="button" id="btnQuestionckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                <input type="button" id="btnShowHidetxtQuestion" class="btn btn-xs btn-info" value="Show/Hide Question" />
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-4 col-md-offset-8">
                                <label id="lblQuestionComplete" class="available "></label>
                            </div>
                            <div class="col-md-4 text-right">
                                <label id="lblQuestionBefore" class="available"></label>
                            </div>
                        </div>
                        <div class="row">
                            <div id="divtxtQuestion" class="col-md-12">
                                <br />
                                <textarea name="txtQuestion" id="txtQuestion" style="width: 100%"></textarea>
                            </div>

                        </div>

                        <hr />
                        <div class="row">

                            <div class="col-md-6">
                                <input type="button" id="btnOption1SimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />
                                <input type="button" id="btnOption1ckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                <input type="button" id="btnShowHidetxtOption1" class="btn btn-xs btn-info" value="Show/Hide Option 1" />
                            </div>
                            <div class="col-md-6">
                                <input type="button" id="btnOption2SimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />
                                <input type="button" id="btnOption2ckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                <input type="button" id="btnShowHidetxtOption2" class="btn btn-xs btn-info" value="Show/Hide Option 2" />
                            </div>


                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div id="divtxtOption1">
                                    <div class="form-group">
                                        <label style="width: 100%; display: inline-flex;">
                                            <div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                                                <input type="checkbox" id="chkOption1" value="1" class="minimal" style="position: relative; opacity: 25;" />
                                                <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                            </div>
                                            This Option 1 is Correct!
                                        </label>

                                        <textarea name="content" id="txtOption1" style="width: 100%"></textarea>
                                    </div>
                                </div>

                            </div>
                            <div id="divtxtOption2" class="col-md-6">
                                <div class="form-group">
                                    <label style="width: 100%; display: inline-flex;">
                                        <div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                                            <input type="checkbox" id="chkOption2" value="1" class="minimal" style="position: relative; opacity: 25;" />
                                            <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                        </div>
                                        This Option 2 is Correct!
                                    </label>

                                    <textarea name="content" id="txtOption2" style="width: 100%"></textarea>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-md-6">
                                <input type="button" id="btnOption3SimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />
                                <input type="button" id="btnOption3ckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                <input type="button" id="btnShowHidetxtOption3" class="btn btn-xs btn-info" value="Show/Hide Option 3" />
                            </div>
                            <div class="col-md-6">
                                <input type="button" id="btnOption4SimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />
                                <input type="button" id="btnOption4ckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                <input type="button" id="btnShowHidetxtOption4" class="btn btn-xs btn-info" value="Show/Hide Option 4" />
                            </div>


                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div id="divtxtOption3">
                                    <div class="form-group">
                                        <label style="width: 100%; display: inline-flex;">
                                            <div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                                                <input type="checkbox" id="chkOption3" value="1" class="minimal" style="position: relative; opacity: 25;" />
                                                <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                            </div>
                                            This Option 3 is Correct!
                                        </label>
                                        <textarea name="content" id="txtOption3" style="width: 100%"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div id="divtxtOption4" class="col-md-6">
                                <div class="form-group">
                                    <label style="width: 100%; display: inline-flex;">
                                        <div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                                            <input type="checkbox" id="chkOption4" value="1" class="minimal" style="position: relative; opacity: 25;" />
                                            <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                        </div>
                                        This Option 4 is Correct!
                                    </label>
                                    <textarea name="content" id="txtOption4" style="width: 100%"></textarea>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-md-6">
                                <input type="button" id="btnMoreOptions" class="btn btn-success" value="More Options" />
                                <input type="button" id="btnReference" class="btn btn-success" value="Reference" />
                                <input type="button" id="btnExplanation" class="btn btn-success" value="Explanation" />
                            </div>
                        </div>

                        <div id="MoreOptions">
                            <hr />
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="button" id="btnOption5SimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />
                                    <input type="button" id="btnOption5ckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                    <input type="button" id="btnShowHidetxtOption5" class="btn btn-xs btn-info" value="Show/Hide Option 5" />
                                </div>
                                <div class="col-md-6 ">
                                    <input type="button" id="btnOption6SimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />
                                    <input type="button" id="btnOption6ckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                    <input type="button" id="btnShowHidetxtOption6" class="btn btn-xs btn-info" value="Show/Hide Option 6" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div id="divtxtOption5">
                                        <div class="form-group">
                                            <label style="width: 100%; display: inline-flex;">
                                                <div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                                                    <input type="checkbox" id="chkOption5" value="1" class="minimal" style="position: relative; opacity: 25;" />
                                                    <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                                </div>
                                                This Option 5 is Correct!
                                            </label>
                                            <textarea name="content" id="txtOption5" style="width: 100%"></textarea>
                                        </div>
                                    </div>

                                </div>
                                <div id="divtxtOption6" class="col-md-6">
                                    <div class="form-group">
                                        <label style="width: 100%; display: inline-flex;">
                                            <div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                                                <input type="checkbox" id="chkOption6" value="1" class="minimal" style="position: relative; opacity: 25;" />
                                                <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                            </div>
                                            This Option 6 is Correct!
                                        </label>
                                        <textarea name="content" id="txtOption6" style="width: 100%"></textarea>
                                    </div>

                                </div>
                            </div>
                            <hr />
                            <div class="row">

                                <div class="col-md-6">
                                    <input type="button" id="btnOption7SimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />
                                    <input type="button" id="btnOption7ckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                    <input type="button" id="btnShowHidetxtOption7" class="btn btn-xs btn-info" value="Show/Hide Option 7" />
                                </div>
                                <div class="col-md-6 ">
                                    <input type="button" id="btnOption8SimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />
                                    <input type="button" id="btnOption8ckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                    <input type="button" id="btnShowHidetxtOption8" class="btn btn-xs btn-info" value="Show/Hide Option 8" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div id="divtxtOption7">
                                        <div class="form-group">
                                            <label style="width: 100%; display: inline-flex;">
                                                <div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                                                    <input type="checkbox" id="chkOption7" value="1" class="minimal" style="position: relative; opacity: 25;" />
                                                    <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                                </div>
                                                This Option 7 is Correct!
                                            </label>
                                            <textarea name="content" id="txtOption7" style="width: 100%"></textarea>
                                        </div>
                                    </div>

                                </div>
                                <div id="divtxtOption8" class="col-md-6">
                                    <div class="form-group">
                                        <label style="width: 100%; display: inline-flex;">
                                            <div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                                                <input type="checkbox" id="chkOption8" value="1" class="minimal" style="position: relative; opacity: 25;" />
                                                <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                            </div>
                                            This Option 8 is Correct!
                                        </label>
                                        <textarea name="content" id="txtOption8" style="width: 100%"></textarea>
                                    </div>
                                </div>

                            </div>

                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div id="reference">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="col-md-12"><span class="h3">Reference:</span></label>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <textarea name="content" id="txtReference" style="width: 100%"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div id="Explanation">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="col-md-12"><span class="h3">Explanation:</span></label>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <textarea name="content" id="txtExplanation" style="width: 100%"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-md-offset-10" style="display: block; width: 150px; height: 125px; overflow: hidden; position: fixed; top: 350px; left: 20px; right: 20px; z-index: 20000;">
                                <input type="button" id="btnSave" name="btnSave" class="btn btn-group-justified bodyBackground"  value="Save" />
                            </div>
                        </div>
                    </div>
                    <div id="divDeleteMcqsQuestion">
                        <div class="form-group">
                            <label style="width: 100%;">Select Subject</label>
                            <select id="ddlDeleteMcqsQuestionSubject" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Test</label>
                            <select id="ddlDeleteMcqsQuestionTest" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Question</label>
                            <select id="ddlDeleteMcqsQuestion" class="form-control"></select>
                        </div>
                        <div class="row" id="divbtnMcqsQuestionDelete">
                            <div class="col-md-12 ">
                                <a class="btn btn-danger btn-app" id="btnDeleteMcqsQuestion" name="btnSaveLongQuestion">
                                    <i class="fa fa-remove"></i>Delete
                                </a>
                            </div>
                        </div>
                    </div>

                    <div id="divDeleteShortQuestion">
                        <div class="form-group">
                            <label style="width: 100%;">Select Subject</label>
                            <select id="ddlDeleteShortQuestionSubject" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Test</label>
                            <select id="ddlDeleteShortQuestionTest" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Question</label>
                            <select id="ddlDeleteShortQuestion" class="form-control"></select>
                        </div>
                        <div class="row">
                            <div class="col-md-12 ">
                                <a class="btn btn-danger btn-app" id="btnDeleteShortQuestion" name="btnDeleteShortQuestion">
                                    <i class="fa fa-remove"></i>Delete
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="divShowShortQuestion">
                        <div class="form-group">
                            <label style="width: 100%;">Select Subject</label>
                            <select id="ddlShowShortQuestionSubject" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Test</label>
                            <select id="ddlShowShortQuestionTest" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Question</label>
                            <select id="ddlShowShortQuestion" class="form-control"></select>
                        </div>
                        <div class="row">
                            <div class="col-md-12 ">
                                <a class="btn btn-info btn-app" id="btnShowShortQuestion" name="btnShowShortQuestion">
                                    <i class="fa  fa-info-circle"></i>Show
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="divShowLongQuestion">
                        <div class="form-group">
                            <label style="width: 100%;">Select Subject</label>
                            <select id="ddlShowLongQuestionSubject" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Test</label>
                            <select id="ddlShowLongQuestionTest" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Question</label>
                            <select id="ddlShowLongQuestion" class="form-control"></select>
                        </div>
                        <div class="row">
                            <div class="col-md-12 ">
                                <a class="btn btn-info btn-app" id="btnShowLongQuestion" name="btnShowLongQuestion">
                                    <i class="fa  fa-info-circle"></i>Show
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="divDeleteLongQuestion">
                        <div class="form-group">
                            <label style="width: 100%;">Select Subject</label>
                            <select id="ddlDeleteLongQuestionSubject" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Test</label>
                            <select id="ddlDeleteLongQuestionTest" class="form-control"></select>
                        </div>
                        <div class="form-group">
                            <label style="width: 100%;">Select Question</label>
                            <select id="ddlDeleteLongQuestion" class="form-control"></select>
                        </div>
                        <div class="row">
                            <div class="col-md-12 ">
                                <a class="btn btn-danger btn-app" id="btnDeleteLongQuestion" name="btnDeleteLongQuestion">
                                    <i class="fa fa-remove"></i>Delete
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="ShortQuestion">
                        <div class="row">
                            <div class="col-md-12">
                                <input type="button" id="btnShortQuestionSimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />
                                <input type="button" id="btnShortQuestionckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                <input type="button" id="btnShowHidetxtShortQuestion" class="btn btn-xs btn-info" value="Show/Hide Question" />
                            </div>
                        </div>
                        <div class="row" id="divShortQuestion">
                            <div class="col-md-12">
                                <textarea name="txtShortQuestion" id="txtShortQuestion" style="width: 90%"></textarea>
                            </div>
                        </div>

                        <div>
                            <div class="row col-md-12">
                                <label class="col-md-12"><span class="h3">Answer.</span></label>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <input type="button" id="btnShortAnswerSimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />
                                    <input type="button" id="btnShortAnswerckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                    <input type="button" id="btnShowHidetxtShortAnswer" class="btn btn-xs btn-info" value="Show/Hide Answer" />
                                </div>
                            </div>
                            <div class="row" id="divShortAnswer">
                                <div class="col-md-12">
                                    <textarea name="content" id="txtShortAnswer" style="width: 90%"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="button" id="btnReferenceShortQuestion" class="btn btn-success" value="Reference" />
                                    <input type="button" id="btnExplanationShortQuestion" class="btn btn-success" value="Explanation" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div id="ShortQuestionreference">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="col-md-12"><span class="h3">Reference:</span></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-11">
                                                <textarea name="content" id="txtShortQuestionReference" style="width: 90%"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div id="ShortQuestionExplanation">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="col-md-12"><span class="h3">Explanation:</span></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-11">
                                                <textarea name="content" id="txtShortQuestionExplanation" style="width: 90%"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr />
                        </div>
                        <div class="row">
                            <div class="col-md-12 ">
                                <a class="btn btn-app btn-success" id="btnSaveShortQuestion" name="btnSaveShortQuestion">
                                    <i class="fa fa-save"></i>Save and Next
                                </a>

                            </div>
                        </div>
                    </div>
                    <!-- Insert Long Question Block start --------------------------------------->

                    <div id="LongQuestion">
                        <div class="row">
                            <div class="col-md-12">
                                <input type="button" id="btnLongQuestionSimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />
                                <input type="button" id="btnLongQuestionckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                <input type="button" id="btnShowHidetxtLongQuestion" class="btn btn-xs btn-info" value="Show/Hide Question" />
                            </div>
                        </div>
                        <div class="row" id="divLongQuestion">
                            <div class="col-md-12">
                                <textarea name="txtLongQuestion" id="txtLongQuestion" style="width: 90%"></textarea>
                            </div>
                        </div>

                        <div>
                            <div class="row col-md-12">
                                <label class="col-md-12"><span class="h3">Answer.</span></label>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <input type="button" id="btnLongAnswerSimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />
                                    <input type="button" id="btnLongAnswerckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                    <input type="button" id="btnShowHidetxtLongAnswer" class="btn btn-xs btn-info" value="Show/Hide Answer" />
                                </div>
                            </div>
                            <div class="row" id="divLongAnswer">
                                <div class="col-md-12">
                                    <textarea name="content" id="txtLongAnswer" style="width: 90%"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="button" id="btnReferenceLongQuestion" class="btn btn-success" value="Reference" />
                                    <input type="button" id="btnExplanationLongQuestion" class="btn btn-success" value="Explanation" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div id="LongQuestionreference">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="col-md-12"><span class="h3">Reference:</span></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-11">
                                                <textarea name="content" id="txtLongQuestionReference" style="width: 90%"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div id="LongQuestionExplanation">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="col-md-12"><span class="h3">Explanation:</span></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-11">
                                                <textarea name="content" id="txtLongQuestionExplanation" style="width: 90%"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr />
                        </div>
                        <div class="row">
                            <div class="col-md-12 ">
                                <a class="btn btn-app btn-success" id="btnSaveLongQuestion" name="btnSaveLongQuestion">
                                    <i class="fa fa-save"></i>Save and Next
                                </a>

                            </div>
                        </div>
                    </div>


                    <!-- Insert Long Question Block End ---------------------------------------->
                    <div class="form-horizontal" id="divreporting">
                        <div class="form-group">
                            <label class="col-md-2 control-label" for="Checkboxes">Show/Hide Options in given Table</label>
                            <div class="col-md-10 columns">
                                <label class="checkbox-inline" for="chkSrNoToggle">
                                    <input type="checkbox" id="chkSrNoToggle" />Sr.No.</label>
                                <label class="checkbox-inline" for="chkQuestionTextToggle">
                                    <input type="checkbox" id="chkQuestionTextToggle" />Question</label>
                                <label class="checkbox-inline" for="chkPointsToggle">
                                    <input type="checkbox" id="chkPointsToggle" />Points</label>
                                <label class="checkbox-inline" for="chkOption1TextToggle">
                                    <input type="checkbox" id="chkOption1TextToggle" />Option 1</label>
                                <label class="checkbox-inline" for="chkOption2TextToggle">
                                    <input type="checkbox" id="chkOption2TextToggle" />Option 2</label>
                                <label class="checkbox-inline" for="chkOption3TextToggle">
                                    <input type="checkbox" id="chkOption3TextToggle" />Option 3</label>
                                <label class="checkbox-inline" for="chkOption4TextToggle">
                                    <input type="checkbox" id="chkOption4TextToggle" />Option 4</label>
                                <label class="checkbox-inline" for="chkOption5TextToggle">
                                    <input type="checkbox" id="chkOption5TextToggle" />Option 5</label>
                                <label class="checkbox-inline" for="chkOption6TextToggle">
                                    <input type="checkbox" id="chkOption6TextToggle" />Option 6</label>
                                <label class="checkbox-inline" for="chkOption7TextToggle">
                                    <input type="checkbox" id="chkOption7TextToggle" />Option 7</label>
                                <label class="checkbox-inline" for="chkOption8TextToggle">
                                    <input type="checkbox" id="chkOption8TextToggle" />Option 8</label>
                                <label class="checkbox-inline" for="chkReferenceTextToggle">
                                    <input type="checkbox" id="chkReferenceTextToggle" />Reference</label>
                                <label class="checkbox-inline" for="chkExplanationTextToggle">
                                    <input type="checkbox" id="chkExplanationTextToggle" />Explanation</label>
                            </div>
                        </div>
                    </div>


                    <table class="table table-bordered" id="mytable" style="width: 100%;">

                        <thead>
                            <tr>
                                <th>Sr.No</th>
                                <th>Question</th>
                                <th>Points</th>
                                <th>Option 1</th>
                                <th>Option 2</th>
                                <th>Option 3</th>
                                <th>Option 4</th>
                                <th>Option 5</th>
                                <th>Option 6</th>
                                <th>Option 7</th>
                                <th>Option 8</th>
                                <th>Explanation</th>
                                <th>Reference</th>
                            </tr>
                        </thead>
                        <tr>
                            <td id="tdSrNo"></td>
                            <td id="tdQuestion"></td>
                            <td id="tdPoints"></td>
                            <td id="tdOption1"></td>
                            <td id="tdOption2"></td>
                            <td id="tdOption3"></td>
                            <td id="tdOption4"></td>
                            <td id="tdOption5"></td>
                            <td id="tdOption6"></td>
                            <td id="tdOption7"></td>
                            <td id="tdOption8"></td>
                            <td id="tdExplanation"></td>
                            <td id="tdReference"></td>
                        </tr>
                    </table>

                    <div id="divInsertMcqs">
                        <div id="ShowHeader">
                            <div class="row">
                                <div class="col-md-4">
                                    <div id="UserPic">
                                        <img id="imgUserPic" height="60" width="40" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label id="UserName"><span>User Name:</span></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <img id="imgUserSubject" height="60" width="40" />
                                </div>
                                <div class="col-md-4">
                                    <label id="SubjectName"><span>Subject Name:</span></label>
                                </div>
                            </div>
                            <div id="row">
                                <div class="col-md-4">
                                    <img id="imgUserTest" height="60" width="40" />
                                </div>
                                <div class="col-md-4">
                                    <label id="TestName"><span>Test Name:</span></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div id="divTotalPoints">
                                        <label id="lblTotalPoints"><span>Total Points:</span></label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label id="QuestionPoints"><span>This question point(s):</span></label>
                                </div>
                            </div>
                        </div>
                        <div id="ShowQuestion">
                            <div class="row">
                                <div class="col-md-8">
                                    <label id="lblShowQuestion"><span></span></label>
                                </div>
                            </div>
                        </div>
                        <div id="ShowOptions">
                            <div class="row" id="divoption1">
                                <div class="col-md-4">
                                    <input id="ChOption1" type="radio" />
                                </div>
                                <div class="col-md-8">
                                    <label id="option1"><span></span></label>
                                </div>
                            </div>
                            <div class="row" id="divoption2">
                                <div class="col-md-4">
                                    <input id="ChOption2" type="radio" />
                                </div>
                                <div class="col-md-8">
                                    <label id="option2"><span></span></label>
                                </div>
                            </div>
                            <div class="row" id="divoption3">
                                <div class="col-md-4">
                                    <input id="ChOption3" type="radio" />
                                </div>
                                <div class="col-md-8">
                                    <label id="option3"><span></span></label>
                                </div>
                            </div>
                            <div class="row" id="divoption4">
                                <div class="col-md-4">
                                    <input id="ChOption4" type="radio" />
                                </div>
                                <div class="col-md-8">
                                    <label id="option4"><span></span></label>
                                </div>
                            </div>
                            <div class="row" id="divoption5">
                                <div class="col-md-4">
                                    <input id="ChOption5" type="radio" />
                                </div>
                                <div class="col-md-8">
                                    <label id="option5"><span></span></label>
                                </div>
                            </div>
                            <div class="row" id="divoption6">
                                <div class="col-md-4">
                                    <input id="ChOption6" type="radio" />
                                </div>
                                <div class="col-md-8">
                                    <label id="option6"><span></span></label>
                                </div>
                            </div>
                            <div class="row" id="divoption7">
                                <div class="col-md-4">
                                    <input id="ChOption7" type="radio" />
                                </div>
                                <div class="col-md-8">
                                    <label id="option7"><span></span></label>
                                </div>
                            </div>
                            <div class="row" id="divoption8">
                                <div class="col-md-4">
                                    <input id="ChOption8" type="radio" />
                                </div>
                                <div class="col-md-8">
                                    <label id="option8"><span></span></label>
                                </div>
                            </div>
                        </div>
                        <div id="ShowFooter">
                            <div class="row">
                                <div class="col-md-6">
                                    <label id="TimeLeft"><span>Time Left</span></label>
                                </div>
                                <div class="col-md-6">
                                    <img id="imgTimeLeft" />
                                </div>

                            </div>
                            <input type="button" value="Save" id="btnShowMcqsNext" />

                        </div>
                    </div>
                    <div id="divEditMcqs">
                    </div>
                    <div id="divTestSettings">
                        <div id="AddNewTest">
                            <select id="ddlSubjectlistForAddTest"></select>
                            <input type="text" id="txtAddTestName" placeholder="Test Name" />
                            <input type="button" id="btnAddMoreTestSettings" value="More Settings" />
                            <div id="divAddMoreTestsettings">
                                <input type="text" id="txtTestDescription" placeholder="Test Description" />
                                <input type="text" id="txtTestInstructions" placeholder="Test Instruction" />
                                <input type="text" id="txtTestStartDateTime" placeholder="Start Date time" />
                                <input type="text" id="txtTestDueDateTime" placeholder="Due Date Time" />
                                <input type="text" id="txtTestTotalAttempts" placeholder="Total Attempts" />
                                <input type="text" id="txtTestExtendedDateTime" placeholder="Extended Date Time" />
                                <input type="checkbox" id="chkTestAlwaysOpen" />
                                <input type="checkbox" id="chkTestStatus" />
                                <input type="checkbox" id="chkTestPracticeSession" />
                                <select id="ddlTestPassingPercentage">
                                    <option value="33">33%</option>
                                    <option value="40">40%</option>
                                    <option value="50">50%</option>
                                    <option value="60">60%</option>
                                    <option value="70">70%</option>
                                    <option value="75">75%</option>
                                    <option value="80">80%</option>
                                    <option value="85">85%</option>
                                    <option value="90">90%</option>
                                    <option value="95">95%</option>
                                    <option value="98">98%</option>
                                    <option value="100">100%</option>
                                </select>

                                <input type="file" id="fuTestImage" />
                            </div>
                            <input type="button" id="btnSaveNewTest" value="Add New Test" />
                        </div>
                        <div id="divEditTest">
                            <select id="ddlSubjectlistForEditTest"></select>
                            <select id="ddlTestlistForEditTest"></select>
                            <input type="text" id="txtEditTestName" placeholder="Test Name" />
                            <input type="button" id="btnEditMoreTestSettings" value="More Settings" />
                            <div id="divEditMoreTestsettings">
                                <input type="text" id="txtEditTestDescription" placeholder="Test Description" />
                                <input type="text" id="txtEditTestInstructions" placeholder="Test Instruction" />
                                <input type="text" id="txtEditTestStartDateTime" placeholder="TestStartDateTime" />
                                <input type="text" id="txtEditTestDueDateTime" placeholder="Test DueDate Time" />
                                <input type="text" id="txtEditTestTotalAttempts" placeholder="Total Attempts" />
                                <input type="text" id="txtEditTestExtendedDateTime" placeholder="Extended Date" />
                                <input type="checkbox" id="chkEditTestAlwaysOpen" />
                                <input type="checkbox" id="chkEditTestStatus" />
                                <input type="checkbox" id="chkEditTestPracticeSession" />
                                <select id="ddlEditTestPassingPercentage">
                                    <option value="33">33%</option>
                                    <option value="40">40%</option>
                                    <option value="50">50%</option>
                                    <option value="60">60%</option>
                                    <option value="70">70%</option>
                                    <option value="75">75%</option>
                                    <option value="80">80%</option>
                                    <option value="85">85%</option>
                                    <option value="90">90%</option>
                                    <option value="95">95%</option>
                                    <option value="98">98%</option>
                                    <option value="100">100%</option>
                                </select>
                                <input type="file" id="fuEditTestImage" />
                            </div>
                            <input type="button" id="btnSaveEditTestSettings" value="Update Test Changes" />
                        </div>
                        <div id="divDeleteTest">
                            <select id="ddlSubjectlistForDeleteTest"></select>
                            <select id="ddlTestlistForDeleteTest"></select>
                            <input type="button" id="btnDeleteTest" value="Delete Test" />
                        </div>
                        <div id="divMergeTest">
                            <select id="ddlSubjectlistToMergeTest"></select>
                            <select id="ddlTestlistToMergeTest"></select>
                            <select id="ddlNewSubjectlistForMergeTest"></select>
                            <input type="button" id="btnMergeTest" value="Merge Test" />
                        </div>
                        <div id="divShowTestMcqs">
                            <select id="ddlSubjectlistShowTestQuestions"></select>
                            <%--    <select id="ddlTestlistShowTestQuestions"></select>
                            <input type="checkbox" id="chkShowTestSubject" />
                            <input type="checkbox" id="chkShowTestQuestion" />
                            <input type="checkbox" id="chkShowTestOption1" />
                            <input type="checkbox" id="chkShowTestOption2" />
                            <input type="checkbox" id="chkShowTestOption3" />
                            <input type="checkbox" id="chkShowTestOption4" />
                            <input type="checkbox" id="chkShowTestOption5" />
                            <input type="checkbox" id="chkShowTestOption6" />
                            <input type="checkbox" id="chkShowTestOption7" />
                            <input type="checkbox" id="chkShowTestOption8" />
                            <input type="checkbox" id="chkShowTestAnswer" />
                            <input type="checkbox" id="chkShowTestExplanation" />
                            <input type="checkbox" id="chkShowTestShortQuestion" />
                            <input type="checkbox" id="chkShowTestShortAnswer" />
                            <input type="checkbox" id="chkShowTestLongQuestion" />
                            <input type="checkbox" id="chkShowTestLongAnswer" />--%>
                            <input type="button" id="btnShowTestMcqs" value="Show Test Mcqs" />
                            <table id="tblShowTest"></table>
                        </div>

                    </div>
                    <div id="divSubjectSetteings">
                       <!-- <select id="ddlSubjectNameList"></select> -->
                        <div>
                           
                            <div id="divEditSubjectName">
                                <label id="lblEditSubjectName">Subject Name</label>
                                <select id="ddlEditSubjectNames"></select>
                                <input type="text" id="txtEditSubjectNames" />
                                <input type="button" id="btnSaveEditSubjectName" value="Save" />
                            </div>
                            <div id="divDeleteSubjectName">
                                <select id="ddlDeleteSubjectNames"></select>
                                <div id="divDeleteReplaceSubjectWithExistingSubject">
                                    <select id="ddlDeleteReplaceSubjectWithExistingSubject"></select>
                                </div>
                                <div id="divDeleteOnlySubjectSettings">
                                    <select id="ddlDeleteOnlySubjectSettings"></select>
                                </div>
                                <input type="button" id="btnDeleteSubjectWithAllrelatedMaterial" value="Delete Subject With All its Tests and Mcqs" />
                                <input type="button" id="btnReplaceSubjectWithExistingSubject" value="Delete Current Subject and Merge it with other Existing Subject" />
                                <input type="button" id="btnDeleteOnlySubjectSettings" value="Delete only Subject Settings" />
                            </div>
                            <div id="divAddMoreSubjects">
                                <input type="text" id="txtAddNewSubject" placeholder="Subject Name" />
                                <input type="button" id="btnAddSubjectNameOnly" value="Add New Subject" />
                                 <input type="button" value="Advanced Settings" id="btnSubjectAdvancedSettings" />
                            </div>
                            <div id="divSubjectAdvancedSettings">
                                <!--  <select id="ddlSubjectAdvancedSettings"></select> -->
                                <input type="text" id="txtSubjectObjective" placeholder="Subject Objective" />
                                <input type="text" id="txtSubjectTestChapters" placeholder="Sub. Chapters" />
                                <input type="text" id="txtSubjectExplanation" placeholder="Sub. Explanation" />
                                <input type="text" id="txtSubjectReferenceBooks" placeholder="Sub. References" />
                                <input type="text" id="txtSubjectCode" placeholder="Subj. Code" />
                                <input type="text" id="fuSubjectImageUpload" placeholder="Sub. Image" />
                                <input type="button" id="btnSaveSubjectAdvanceSettings" value="Save" />
                            </div>
                            <div id="divShowSubjects">
                                <table id="tblShowSubjects"></table>
                            </div>
                             <div>
                                <input type="button" value="Edit Subject Name" id="btnEditSubjectName" />
                                <input type="button" value="Delete Subject" id="btnDeleteSubjectName" />
                                <input type="button" value="Add More Subjects" id="btnAddMoreSubjects" />
                               
                            </div>
                        </div>
                    </div>
                    <div id="divAddUser">
                        <div class="form-inline">
                            <div id="divEditUserDropDown">
                                <select id="ddlEditUsers"></select>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                    <input type="text" id="txtUserEmail" class="form-control" placeholder="User Email" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                    <input type="text" id="txtUserPassword" class="form-control" placeholder="User Password" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <button type="button" class="btn btn-link" id="btnAddMoreUserDetail">Add More User Detail</button>
                                </div>
                                <div class="col-md-4">
                                    <button type="button" class="btn btn-link" id="btnAddUserTestTiming">User Test Timing</button>
                                </div>
                                <div class="col-md-4">
                                    <button type="button" class="btn btn-link" id="btnAddUserAdvancedSetting">User Advanced Settings</button>
                                </div>
                            </div>
                            <div id="divAddMoreUserDetail">
                                <div id="UserPrimaryInfo">
                                    <h3>Primary Information</h3>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserName" class="form-control" placeholder="User Name" />
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserParentName" class="form-control" placeholder="User Parent Name" />
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserParentEmail" class="form-control" placeholder="User Parents Email" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserRollNo" class="form-control" placeholder="User Roll No." />
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserFirstName" class="form-control" placeholder="User First Name" />
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserLastName" class="form-control" placeholder="User Last Name" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserDepartment" class="form-control" placeholder="User Department" />
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserRegion" class="form-control" placeholder="User Region" />
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserTelephoneNo" class="form-control" placeholder="User Phone No." />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserDOB" class="form-control" placeholder="User Date Of Birth" />
                                        </div>
                                        <div class="col-md-4">
                                            <select id="ddlUserGender" class="dropdown">
                                                <option value="0">Select Gender</option>
                                                <option value="1">Male</option>
                                                <option value="2">Female</option>
                                                <option value="3">Shemale</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserCity" class="form-control" placeholder="User City" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <button type="button" id="btnAddUserGroup" class="btn-link btn-sm">Add User Groups</button>
                                        </div>
                                        <div id="divAddUserGroups">
                                            <div class="col-md-4">
                                                <input type="text" id="txtUserGroupName" placeholder="Group Name" />
                                            </div>
                                            <div class="col-md-3">
                                                <input type="button" id="btnAddUserGroupName" class="btn btn-sm" value="Add" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" id="divddlUserGroup">
                                        <div class="col-md-12">
                                            <label for="ddlUserGroup" class="dropdown dropdown-toggle">
                                                User Groups.
                                                    <select id="ddlUserGroup">
                                                        <option value="1">Students</option>
                                                    </select>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserImage" class="form-control" placeholder="User Picture" />
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserCountry" class="form-control" placeholder="User Country" />
                                        </div>
                                    </div>
                                </div>
                                <div id="UserSecondaryInfo">
                                    <h3>User Test Timing Information</h3>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <input type="text" id="txtUserTestStartDateTime" class="form-control" placeholder="Start Test Date & Time " />
                                        </div>
                                        <div class="col-md-4">
                                            <input type="datetime" id="txtUserTestEndDateTime" class="form-control" placeholder="End Test Date & Time " />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="UserAdvancedInfo">
                                <h3>Users Advance Settings</h3>
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-12 columns">
                                                <label class="checkbox-inline" for="chkUserEmailResult">
                                                    <input type="checkbox" id="chkUserEmailResult" />Email Result To the User.</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 columns">
                                                <label class="checkbox-inline" for="chkUserPracticeMode">
                                                    <input type="checkbox" id="chkUserPracticeMode" />User Practice Mode
                                                </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 columns">
                                                <label class="checkbox-inline" for="chkRandomizeQuestionsInTest">
                                                    <input type="checkbox" id="chkRandomizeQuestionsInTest" />Randmomiz Questions in Test</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 columns">
                                                <label class="checkbox-inline" for="chkEmailTestResultToAdmin">
                                                    <input type="checkbox" id="chkEmailTestResultToAdmin" />Email User Test Result to Admin When a User Completing Test.</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label for="ddlTotalUserAttempts" class="dropdown dropdown-toggle">
                                                    Total User Try Attempts.
                                                        <select id="ddlTotalUserAttempts">
                                                            <option value="1">1 Attempt</option>
                                                            <option value="3">3 Attempts</option>
                                                            <option value="5">5 Attempts</option>
                                                            <option value="7">7 Attempts</option>
                                                            <option value="10">10 Attempts</option>
                                                            <option value="20">20 Attempts</option>
                                                            <option value="50">50 Attempts</option>
                                                            <option value="100">100 Attempts</option>
                                                            <option value="1000">1000 Attempts</option>
                                                            <option value="10000">Unlimited Attempts</option>
                                                        </select>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label for="ddlUserRoleId" class="dropdown dropdown-toggle">
                                                    User Role:
                                                        <select id="ddlUserRoleId">
                                                            <option value="1">Examiner</option>
                                                            <option value="2">Teacher</option>
                                                            <option value="3" selected="selected">Student</option>
                                                            <option value="4">Paper Checker</option>
                                                            <option value="5">Paper Rechecker</option>
                                                            <option value="6">Super Checker</option>
                                                            <option value="7">Question Maker</option>
                                                        </select>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 columns">
                                                <label class="checkbox-inline" for="chkUserSeeOtherUsersResult">
                                                    <input type="checkbox" id="chkUserSeeOtherUsersResult" />User can see other User's Result of a specifice Test/Subject.</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 columns">
                                                <label class="checkbox-inline" for="chkCertificateCustomDesign">
                                                    <input type="checkbox" id="chkCertificateCustomDesign" />User can customize Certificate Design/Fields.</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 columns">
                                                <label class="checkbox-inline" for="chkResultCardCustomDesign">
                                                    <input type="checkbox" id="chkResultCardCustomDesign" />User can customize Result Card Design/Fields.</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">

                                                <label>Terms and Conditions for Users</label>
                                                <textarea id="txtUserTermsAndConditions" name="txtUserTermsAndConditions" style="width: 100%"></textarea>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <button type="button" id="btnAddUser" class="btn btn-lg">Add User</button>
                                </div>
                            </div>
                        </div>

                        <div id="menu3" class="tab-pane fade">
                            <h3>Menu 3</h3>
                            <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                        </div>
                    </div>
                    <div id="divEditUsers">
                        <input type="button" id="btnEditUserDetail" value="Edit User Details" />
                    </div>
                    <div id="divDeleteUsers">
                        <select id="ddlDeleteUsers"></select>
                        <input type="button" value="Delete " />
                    </div>
                    <div id="divAddedUserTable">
                        <table id="tblShowUsers" class="display">
                            <thead>
                                <tr>
                                    <th>Name
                                    </th>
                                    <th>Email Address
                                    </th>
                                    <th>Password
                                    </th>
                                    <th>Total Attempts
                                    </th>
                                    <th>Action
                                    </th>
                                </tr>
                            </thead>
                        </table>

                    </div>
            </div>
        </div>

        <%--<div id="TestSettings" class="tab-pane fade in active ">
            <h3>User Settings.</h3>
            <div id="UserSettings">
            </div>
        </div>--%>

        <div id="divUser" >
            <div class="form-horizontal col-md-8 col-md-offset-2 panel-group">
                <div class="form-group panelbg">
                    <div id="divMyTodos">
                        <div class="table" id="divtableUsersDashboardmcqs">
                            <table id="tableShowUserMcqs" class="display">
                                <thead>
                                    <tr>
                                        <th>Subject Name</th>
                                        <th>Test Name</th>
                                        <th>Test Open Date</th>
                                        <th>Test Due Date</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <div id="divUserMcqsTestBegin">
                </div>
            </div>

            </section>
        <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Create the tabs -->
                <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                    <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
                    <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- Home tab content -->
                    <div class="tab-pane" id="control-sidebar-home-tab">
                        <h3 class="control-sidebar-heading">Recent Activity</h3>
                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="javascript::;">
                                    <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                                        <p>Will be 23 on April 24th</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript::;">
                                    <i class="menu-icon fa fa-user bg-yellow"></i>
                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>
                                        <p>New phone +1(800)555-1234</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript::;">
                                    <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>
                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>
                                        <p>nora@example.com</p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript::;">
                                    <i class="menu-icon fa fa-file-code-o bg-green"></i>
                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>
                                        <p>Execution time 5 seconds</p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- /.control-sidebar-menu -->

                        <h3 class="control-sidebar-heading">Tasks Progress</h3>
                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="javascript::;">
                                    <h4 class="control-sidebar-subheading">Custom Template Design
                   
                                    <span class="label label-danger pull-right">70%</span>
                                    </h4>
                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript::;">
                                    <h4 class="control-sidebar-subheading">Update Resume
                   
                                    <span class="label label-success pull-right">95%</span>
                                    </h4>
                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript::;">
                                    <h4 class="control-sidebar-subheading">Laravel Integration
                   
                                    <span class="label label-warning pull-right">50%</span>
                                    </h4>
                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript::;">
                                    <h4 class="control-sidebar-subheading">Back End Framework
                   
                                    <span class="label label-primary pull-right">68%</span>
                                    </h4>
                                    <div class="progress progress-xxs">
                                        <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- /.control-sidebar-menu -->

                    </div>
                    <!-- /.tab-pane -->
                    <!-- Stats tab content -->
                    <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
                    <!-- /.tab-pane -->
                    <!-- Settings tab content -->
                    <div class="tab-pane" id="control-sidebar-settings-tab">
                        <form method="post">
                            <h3 class="control-sidebar-heading">General Settings</h3>
                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Report panel usage
                 
                                <input type="checkbox" class="pull-right" checked>
                                </label>
                                <p>
                                    Some information about this general settings option
               
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Allow mail redirect
                 
                                <input type="checkbox" class="pull-right" checked>
                                </label>
                                <p>
                                    Other sets of options are available
               
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Expose author name in posts
                 
                                <input type="checkbox" class="pull-right" checked />
                                </label>
                                <p>
                                    Allow the user to show his name in blog posts
               
                                </p>
                            </div>
                            <!-- /.form-group -->

                            <h3 class="control-sidebar-heading">Chat Settings</h3>

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Show me as online
                 
                                <input type="checkbox" class="pull-right" checked>
                                </label>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Turn off notifications
                 
                                <input type="checkbox" class="pull-right">
                                </label>
                            </div>
                            <!-- /.form-group -->

                            <div class="form-group">
                                <label class="control-sidebar-subheading">
                                    Delete chat history
                 
                                <a href="javascript::;" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                                </label>
                            </div>
                            <!-- /.form-group -->
                        </form>
                    </div>
                    <!-- /.tab-pane -->
                </div>
            </aside>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->
          <script>
              var SaveStatus = 0;
              CKEDITOR.replace('txtQuestion', {
                  on: {
                      instanceReady: function () {
                          // Autosave but no more frequent than 5 sec.
                          var buffer = CKEDITOR.tools.eventsBuffer(3000, function () {
                              console.log('Autosave!');
                              var SubjectId = $('#ddlSubject').val();
                              var TestId = $('#ddlTest').val();
                              var QuestionText1 = CKEDITOR.instances.txtQuestion.getData();
                              // alert(QuestionText1);
                              var QuestionText = JSON.stringify(QuestionText1);
                              // alert(QuestionText);
                              var Points = $('#ddlPoints').val();
                              $.ajax({
                                  type: "POST",
                                  contentType: "application/json; charset=utf-8",
                                  complete: function () {
                                      //$('#lblQuestionBefore').html('');
                                      $('#lblQuestionComplete').html("Saved");
                                  },
                                  beforeSend: function () {
                                      $('#lblQuestionComplete').html('Saving...');
                                      //$('#lblQuestionBefore').html("Saving...");
                                  },
                                  url: "AddQuestions.aspx/McqsQuestion_Insert",
                                  data: "{'SubjectId':'" + SubjectId + "','TestId':'" + TestId + "','QuestionText':'" + QuestionText + "','points':'" + Points + "','SaveStatus':'" + SaveStatus + "'}",
                                  dataType: "json",
                                  success: function (data) {
                                      var obj = data.d;
                                      if (obj == 'true') {
                                          SaveStatus = 1;
                                          $('#lblQuestionStatus').html('<h4>Your question is Saved now :) </h4>');
                                          //$('#lblQuestionStatus').hide(2000);
                                      }
                                  },
                                  error: function (result) {
                                      SaveStatus = 0;
                                      alert("Error");
                                  }
                              })
                          });
                          this.on('change', buffer.input);
                      }
                  }
              }
      );
              CKEDITOR.replace('txtOption1');
              CKEDITOR.replace('txtOption2');
              CKEDITOR.replace('txtOption3');
              CKEDITOR.replace('txtOption4');
              CKEDITOR.replace('txtOption5');
              CKEDITOR.replace('txtOption6');
              CKEDITOR.replace('txtOption7');
              CKEDITOR.replace('txtOption8');
              CKEDITOR.replace('txtShortQuestion');
              CKEDITOR.replace('txtShortAnswer');
              CKEDITOR.replace('txtLongQuestion');
              CKEDITOR.replace('txtLongAnswer');
              CKEDITOR.replace('txtReference');
              CKEDITOR.replace('txtExplanation');
              CKEDITOR.replace('txtUserTermsAndConditions');
        </script>
        <!-- jQuery 2.1.4 -->
        <!-- <script src="../theme_AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js"></script> -->
        <!-- jQuery UI 1.11.4 -->
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
       <%-- <script>
            $.widget.bridge('uibutton', $.ui.button);
    </script>--%>
        <!-- Bootstrap 3.3.5 -->
        <script src="../theme_AdminLTE/bootstrap/js/bootstrap.min.js"></script>
        <!-- Morris.js charts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
      <%--  <script src="../theme_AdminLTE/plugins/morris/morris.min.js"></script>--%>
        <!-- Sparkline -->
        <script src="../theme_AdminLTE/plugins/sparkline/jquery.sparkline.min.js"></script>
        <!-- jvectormap -->
        <script src="../theme_AdminLTE/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="../theme_AdminLTE/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <!-- jQuery Knob Chart -->
        <script src="../theme_AdminLTE/plugins/knob/jquery.knob.js"></script>
        <!-- daterangepicker -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
        <script src="../theme_AdminLTE/plugins/daterangepicker/daterangepicker.js"></script>
        <!-- datepicker -->
        <script src="../theme_AdminLTE/plugins/datepicker/bootstrap-datepicker.js"></script>
        <!-- Bootstrap WYSIHTML5 -->
        <script src="../theme_AdminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
        <!-- Slimscroll -->
        <script src="../theme_AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="../theme_AdminLTE/plugins/fastclick/fastclick.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../theme_AdminLTE/dist/js/app.min.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="../theme_AdminLTE/dist/js/pages/dashboard.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../theme_AdminLTE/dist/js/demo.js"></script>


    </form>
</body>
</html>
