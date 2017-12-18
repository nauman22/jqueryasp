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
    $('#divcontactus').hide();
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
    $('#divcontactus').hide();
    $('#divAddedUserTable').hide();
    $('#divDeleteUsers').hide();
    $('#divEditUsers').hide();
    $('#divSubjectAdvancedSettings').hide();
    $('#LoadMcqsAllQuestion').hide();
    $('#btnUpdate_mcqs').hide(); //divEditUserDetails
    $('#divEditUserDetails').hide();
    $('#divDeleteUserDetails').hide();
    $('#divReportUser').hide();
    $('#divMcqsAddNonRegUser').hide();
    $('#divAddcat').hide();
    $('#divAddStaff').hide();
    $('#divAddedStaffTable').hide();
    $('#divEditStaff').hide();
    $('#divEditStaffDetails').hide();
    $('#divDeleteStaff').hide();
    $('#divAddCatNew').hide();
    $('#divEditCat').hide();
    $('#divDeleteCat').hide();
    $('#divAddedCatTable').hide();
    $('#userDashboard').hide();
}
$body = $("body");

$(document).on({
    ajaxStart: function () { $body.addClass("loading"); },
    ajaxStop: function () { $body.removeClass("loading"); },
    ajaxComplete: function () { $body.removeClass("loading"); }
});
$(document).ready(function () {

    $('#focusguard-2').on('focus', function () {
        $('#btnShowHidetxtQuestion').focus();
    });
    $('#focusguard-1').on('focus', function () {
        $('#btnSave').focus();
    });
    $(document).ajaxStart(function () {
        $('#loading').show();
    }).ajaxStop(function () {
        $('#loading').hide();
    }).ajaxComplete(function () { $body.removeClass("loading"); $('#loading').hide(); });
    var Emyadminid = $('input[name=Dadminid]').val();
    var Emyadminuserrole = $('input[name=Dadminuserrole]').val();
    String.prototype.unquoted = function () { return this.replace(/(^")|("$)/g, '') } //|(\\)
    String.prototype.notBackSlash = function () { return this.replace(/\\/g, '\\\\') };
    String.prototype.withBackSlash = function () { return this.replace(/\\\\/g, '\\') };
    //var sts = '\\frac{1}{3} = \\frac{5}{8} \\sum 5 6 + 7 = 99';
    //console.log(sts);
    //var c_sts = sts.notBackSlash();
    //console.log(c_sts);
    //var a_sts = c_sts.withBackSlash();
    //console.log(a_sts);


    var allstring = '';
    var totalmcqs = parseInt(0);
    var totalshortq = parseInt(0);
    var totalLongq = parseInt(0);
    var totalSubject = parseInt(0);
    var totalTest = parseInt(0);
    var totalUsers = parseInt(0);

    var subuserid = 0;
    hide_all();
    $('#btnSubjectNext').click(function () {
        debugger;
        var catid = $('#ddlCatlist').val();
        var subName = $('#txtAddNewSubjectName').val();
        var txtSubjectObjective = $('#txtSubjectObjective').val();
        var txtSubjectTestChapters = $('#txtSubjectTestChapters').val();
        var txtSubjectExplanation = $('#txtSubjectExplanation').val();
        var txtSubjectReferenceBooks = $('#txtSubjectReferenceBooks').val();
        var txtSubjectCode = $('#txtSubjectCode').val();
        var fuCatImg = $('#fuSubImg').get(0).files;
        SaveSubImg(fuCatImg);
        var imgCatimg = $("#imgSubimg").attr("src");
        var fileNameIndex = imgCatimg.lastIndexOf("/") + 1;
        var filename = imgCatimg.substr(fileNameIndex);
        if (filename == "") {
            alertify.error("select image first!");
            return false;
        }


        var lblName = $('#lblName');
        var AdminId = $('');


        if (subName == '') {
            alertify.error('Please Enter Subject Name First !');
            lblName.html('Please Enter Subject Name First !');

            lblName.removeClass();
            lblName.addClass('required');
        }
        if (catid == 0) {
            alertify.error("Please select category");
        }
        else {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "myindex.aspx/InsertSubject",
                data: "{'subjectName':'" + subName + "','Emyadminid':'" + Emyadminid +
                    "','catid':'" + catid + "','txtSubjectObjective':'" + txtSubjectObjective + "','txtSubjectTestChapters':'" +
                    txtSubjectTestChapters + "','txtSubjectExplanation':'" + txtSubjectExplanation +
                    "','txtSubjectReferenceBooks':'" + txtSubjectReferenceBooks + "','txtSubjectCode':'" + txtSubjectCode +
                    "','filename':'" + filename + "'}",
                timeout: 90000, dataType: "json",
                success: function (data) {
                    var obj = data.d;
                    if (obj == 'true') {
                        $('#ddlCatlist').val(0);
                        $('#txtAddNewSubjectName').val('');
                        $('#txtSubjectObjective').val('');
                        $('#txtSubjectTestChapters').val('');
                        $('#txtSubjectExplanation').val('');
                        $('#txtSubjectReferenceBooks').val('');
                        $('#txtSubjectCode').val('');
                        $('#divSubjectName').hide();
                        $('#divTestName').show();
                    }
                },
                error: function (result) {
                    alertify.error("Error");
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

    //$('#dash_QuestionsLink').resizable();
    //$('#dash_QuestionsLink').click(function () {

    //    alert('i am clicked');
    //})

    var IsEdit = 0;
    $('#btnSave').click(function () {
        ////debugger;
        // alert('Hello i am clicked');
        // Sys.Net.WebRequestManager.set_defaultTimeout(600000);
        var SubjectId = $('#ddlSubject').val();
        var TestId = $('#ddlTest').val();
        if ((SubjectId == 'undefined' || SubjectId == 0) || (TestId == 'undefined' || TestId == 0)) {
            alertify.error("Please Select Subject and Test first !");
            return true;
        }

        var SubjectId_Edit = $('#ddlShowMcqsQuestionSubject').val();
        var TestId_Edit = $('#ddlShowMcqsQuestionTest').val();
        var McqsId = $('#ddlShowMcqsQuestion').val();
        var exp_staff_id = $('#ddlStaff_exp').val();
        var QuestionText1 = $('#txtQuestion').val().replace(/["']/g, "");
        var QuestionText = '"' + QuestionText1 + '"';
        var StaffId = $("#ddlStaff_exp").val();
        if (txtbtnQuestionSimpleBoxbit == 0) {

            QuestionText = '"' + QuestionText1 + '"';

        }
        else {
            QuestionText = '"' + CKEDITOR.instances.txtQuestion.getData().notBackSlash() + '"';

        }
        if (QuestionText.length == 2) {
            QuestionText = '"' + CKEDITOR.instances.txtQuestion.getData().notBackSlash() + '"';
            // console.log(QuestionText);
        }
        //if (QuestionText.length == 2) {
        //    QuestionText = '"' + QuestionText1 + '"';
        //}

        //alert(QuestionText1);



        var Points = $('#ddlPoints').val();
        var ReferenceText = CKEDITOR.instances.txtReference.getData().notBackSlash();  //$('#txtReference').val();
        var ExplanationText = CKEDITOR.instances.txtExplanation.getData().notBackSlash();// $('#txtExplanation').val();
        var txtOption1 = 0;
        var txtOption2 = 0;
        var txtOption3 = 0;
        var txtOption4 = 0;
        var txtOption5 = 0;
        var txtOption6 = 0;
        var txtOption7 = 0;
        var txtOption8 = 0;


        if (txtOption1bit == 0) {
            txtOption1 = '"' + CKEDITOR.instances.txtOption1.getData().notBackSlash() + '"';
        }
        else {
            txtOption1 = $('#txtOption1').val().replace(/["']/g, "");
        }

        // option 2
        if (txtOption2bit == 0) {
            txtOption2 = '"' + CKEDITOR.instances.txtOption2.getData().notBackSlash() + '"';
        }
        else {
            txtOption2 = $('#txtOption2').val().replace(/["']/g, "");
        }
        // otpion 3
        if (txtOption3bit == 0) {

            txtOption3 = '"' + CKEDITOR.instances.txtOption3.getData().notBackSlash() + '"';
        }
        else {
            txtOption3 = $('#txtOption3').val().replace(/["']/g, "");
        }
        // option4
        if (txtOption4bit == 0) {

            txtOption4 = '"' + CKEDITOR.instances.txtOption4.getData().notBackSlash() + '"';
        }
        else {
            txtOption4 = $('#txtOption4').val().replace(/["']/g, "");
        }
        if (txtOption5bit == 0) {
            txtOption5 = '"' + CKEDITOR.instances.txtOption5.getData().notBackSlash() + '"';
        }
        else {
            txtOption5 = $('#txtOption5').val().replace(/["']/g, "");
        }
        //
        if (txtOption6bit == 0) {
            txtOption6 = '"' + CKEDITOR.instances.txtOption6.getData().notBackSlash() + '"';
        }
        else {
            txtOption6 = $('#txtOption6').val().replace(/["']/g, "");
        }
        //
        if (txtOption7bit == 0) {
            txtOption7 = '"' + CKEDITOR.instances.txtOption7.getData().notBackSlash() + '"';
        }
        else {
            txtOption7 = $('#txtOption7').val().replace(/["']/g, "");
        }
        //
        if (txtOption8bit == 0) {
            txtOption8 = '"' + CKEDITOR.instances.txtOption8.getData().notBackSlash() + '"';
        }
        else {
            txtOption8 = $('#txtOption8').val().replace(/["']/g, "");

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
        // //debugger;
        //QuestionText.replace(/"/g, '\\"');



        txtOption1
        txtOption2
        txtOption3
        txtOption4
        txtOption5
        txtOption6
        txtOption7
        txtOption8
        var itotal = 0;
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            complete: function () {

            },
            beforeSend: function () {
                $('#lblQuestionComplete').html('Saving options...');
                alertify.log("Saving options... Please wait");
            },
            timeout: 90000,
            url: "myindex.aspx/Mcqs_Options_Insert",
            data: "{'SubjectId':'" + SubjectId + "','TestId':'" + TestId + "','QuestionText':'" + QuestionText + "','points':'" + Points +
                "','txtOption1':'" + txtOption1 + "','txtOption2':'" + txtOption2 + "','txtOption3':'" + txtOption3 +
                "','txtOption4':'" + txtOption4 + "','txtOption5':'" + txtOption5 + "','txtOption6':'" + txtOption6 +
                "','txtOption7':'" + txtOption7 + "','txtOption8':'" + txtOption8 + "','chkOption1':'" + chkOption1 +
                "','chkOption2':'" + chkOption2 + "','chkOption3':'" + chkOption3 + "','chkOption4':'" + chkOption4 +
                "','chkOption5':'" + chkOption5 + "','chkOption6':'" + chkOption6 + "','chkOption7':'" + chkOption7 +
                "','chkOption8':'" + chkOption8 +
                "','ExplanationText':'" + ExplanationText + "','exp_staff_id':'" + exp_staff_id +
                "','ReferenceTexts':'" + ReferenceText +
                "','Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var obj = data.d;
                itotal = data.d;
                $('#lblQuestionComplete').html('Question with All Options saved...    ' + itotal);
                alertify.success("Mcqs Saved. " + itotal);
                Scroll_top();
                if (txtbtnQuestionSimpleBoxbit == 0) {

                    QuestionText = '"' + QuestionText1 + '"';
                    $('#txtQuestion').val("");

                }
                else {
                    QuestionText = '"' + CKEDITOR.instances.txtQuestion.setData('') + '"';

                }
                if (QuestionText.length == 2) {
                    QuestionText = '"' + CKEDITOR.instances.txtQuestion.setData('') + '"';
                }
                if (QuestionText.length == 2) {
                    QuestionText = '"' + QuestionText1 + '"';
                }
                if (txtOption1bit == 0) {
                    txtOption1 = '"' + CKEDITOR.instances.txtOption1.setData('') + '"';
                }
                else {
                    txtOption1 = $('#txtOption1').val();
                    $('#txtOption1').val("");
                }

                // option 2
                if (txtOption2bit == 0) {
                    txtOption2 = '"' + CKEDITOR.instances.txtOption2.setData('') + '"';
                }
                else {
                    txtOption2 = $('#txtOption2').val();
                    $('#txtOption2').val("");
                }
                // otpion 3
                if (txtOption3bit == 0) {

                    txtOption3 = '"' + CKEDITOR.instances.txtOption3.setData('') + '"';
                }
                else {
                    txtOption3 = $('#txtOption3').val();
                    $('#txtOption3').val("");
                }
                // option4
                if (txtOption4bit == 0) {

                    txtOption4 = '"' + CKEDITOR.instances.txtOption4.setData('') + '"';
                }
                else {
                    txtOption4 = $('#txtOption4').val();
                    $('#txtOption4').val("");
                }
                if (txtOption5bit == 0) {
                    txtOption5 = '"' + CKEDITOR.instances.txtOption5.setData('') + '"';
                }
                else {
                    txtOption5 = $('#txtOption5').val();
                    $('#txtOption5').val("");
                }
                //
                if (txtOption6bit == 0) {
                    txtOption6 = '"' + CKEDITOR.instances.txtOption6.setData('') + '"';
                }
                else {
                    txtOption6 = $('#txtOption6').val();
                    $('#txtOption6').val("");
                }
                //
                if (txtOption7bit == 0) {
                    txtOption7 = '"' + CKEDITOR.instances.txtOption7.setData('') + '"';
                }
                else {
                    txtOption7 = $('#txtOption7').val();
                    $('#txtOption7').val("");
                }
                //
                if (txtOption8bit == 0) {
                    txtOption8 = '"' + CKEDITOR.instances.txtOption8.setData('') + '"';
                }
                else {
                    txtOption8 = $('#txtOption8').val();
                    $('#txtOption8').val("");

                }
                CKEDITOR.instances.txtExplanation.setData('');
                CKEDITOR.instances.txtReference.setData('');
                $('#divMcqsQuestion :checked').removeAttr('checked');
                chkoption1bit = 0;
                chkoption2bit = 0;
                chkoption3bit = 0;
                chkoption4bit = 0;
                chkoption5bit = 0;
                chkoption6bit = 0;
                chkoption7bit = 0;
                chkoption8bit = 0;
                $('#btnShowHidetxtQuestion').focus();
                if ($("#chkreloadpage").is(':checked')) {
                    location.reload();
                }

                //var focusManager = new CKEDITOR.focusManager(txtQuestion);
                //focusManager.focus();
                //focusManager.focus();
                // alert('data.d =  ' + data.d)
                if (obj == 'false') {
                    $('#lblQuestionComplete').html('Error in Saving Question with All Options...');
                    alertify.error("Mcqs Not Saved");
                    //SaveStatus = 0;

                }

            },
            error: function (jqXHR, exception) {
                var msg = '';
                if (jqXHR.status === 0) {
                    msg = 'Not connect.\n Verify Network.';
                } else if (jqXHR.status == 404) {
                    msg = 'Requested page not found. [404]';
                } else if (jqXHR.status == 500) {
                    msg = 'Internal Server Error [500].';
                } else if (exception === 'parsererror') {
                    msg = 'Requested JSON parse failed.';
                } else if (exception === 'timeout') {
                    msg = 'Time out error.';
                } else if (exception === 'abort') {
                    msg = 'Ajax request aborted.';
                } else {
                    msg = 'Uncaught Error.\n' + jqXHR.responseText;
                }
                $('#lblQuestionComplete').html(msg);
                alertify.error(msg);
            }
        })
        //if (IsEdit == 0) {
        //    SaveStatus;

        //    if ((SaveStatus == 0) || (SaveStatus == 2)) {


        //        $.ajax({
        //            type: "POST",
        //            contentType: "application/json; charset=utf-8",
        //            complete: function () {
        //                //$('#lblQuestionBefore').html('');
        //                $('#lblQuestionComplete').html("Saved");


        //            },
        //            beforeSend: function () {
        //                $('#lblQuestionComplete').html('Saving...');
        //                //$('#lblQuestionBefore').html("Saving...");



        //            },
        //            url: "myindex.aspx/McqsQuestion_Insert",
        //            data: "{'SubjectId':'" + SubjectId + "','TestId':'" + TestId + "','QuestionText':'" + QuestionText + "','points':'" + Points + "','SaveStatus':'" + SaveStatus + "'}",
        //            timeout: 90000,dataType: "json",
        //            success: function (data) {
        //                var obj = data.d;

        //                if (obj == 'true') {
        //                    if (txtbtnQuestionSimpleBoxbit == 1) {
        //                        SaveStatus = 2;
        //                    }
        //                    else {
        //                        SaveStatus = 1;
        //                    }
        //                    $('#lblQuestionStatus').html('<h4>Your question is Saved now :) </h4>');

        //                }
        //            },
        //            error: function (result) {
        //                SaveStatus = 0;
        //                $('#lblQuestionComplete').html('Error Occour to saving Question Text...');
        //            }
        //        })
        //    }





        //    if (SaveStatus = 0) {
        //        CKEDITOR.instances.txtQuestion.setData('');
        //    }
        //    else {
        //        $('#txtQuestion').val('');
        //    }
        //    $("html, body").animate({ scrollTop: 1 }, "slow");


        //    if (ReferenceText != "&quot;&quot;") {
        //        $.ajax({
        //            type: "POST",
        //            contentType: "application/json; charset=utf-8",
        //            complete: function () {
        //                //$('#lblQuestionBefore').html('');
        //                $('#lblQuestionComplete').html("Saved");


        //            },
        //            beforeSend: function () {
        //                $('#lblQuestionComplete').html('Saving...');
        //                //$('#lblQuestionBefore').html("Saving...");



        //            },
        //            url: "myindex.aspx/McqsQuestionReference_Insert",
        //            data: "{'SubjectId':'" + SubjectId + "','TestId':'" + TestId + "','ReferenceText':'" + ReferenceText + "'}",
        //            timeout: 90000,dataType: "json",
        //            success: function (data) {
        //                var obj = data.d;

        //                if (obj == 'true') {

        //                }
        //            },
        //            error: function (result) {

        //                $('#lblQuestionComplete').html('Error in saving Reference...');
        //            }
        //        })
        //    }

        //    if (ExplanationText == "&quot;&quot;") {
        //        $.ajax({
        //            type: "POST",
        //            contentType: "application/json; charset=utf-8",
        //            complete: function () {
        //                //$('#lblQuestionBefore').html('');
        //                $('#lblQuestionComplete').html("Saved");


        //            },
        //            beforeSend: function () {
        //                $('#lblQuestionComplete').html('Saving...');
        //                //$('#lblQuestionBefore').html("Saving...");



        //            },
        //            url: "myindex.aspx/McqsQuestionExplanation_Insert",
        //            data: "{'SubjectId':'" + SubjectId + "','TestId':'" + TestId + "','ExplanationText':'" + ExplanationText + "'}",
        //            timeout: 90000,dataType: "json",
        //            success: function (data) {
        //                var obj = data.d;

        //                if (obj == 'true') {

        //                }
        //            },
        //            error: function (result) {

        //                $('#lblQuestionComplete').html('Error in saving Question Explanations...');
        //            }
        //        })
        //    }

        //}
        //else {

        //    $.ajax({
        //        type: "POST",
        //        contentType: "application/json; charset=utf-8",
        //        complete: function () {
        //            //$('#lblQuestionBefore').html('');
        //            $('#lblQuestionComplete').html("Updated");


        //        },
        //        beforeSend: function () {
        //            $('#lblQuestionComplete').html('Saving...');
        //            //$('#lblQuestionBefore').html("Saving...");



        //        },
        //        url: "myindex.aspx/Edit_Mcqs",
        //        data: "{'SubjectId':'" + SubjectId_Edit + "','TestId':'" + TestId_Edit + "','QuestionId':'" + McqsId +
        //                "','QuestionText':'" + QuestionText + "','points':'" + Points + "','txtOption1':'" + txtOption1 +
        //                "','txtOption2':'" + txtOption2 + "','txtOption3':'" + txtOption3 + "','txtOption4':'" + txtOption4 +
        //                "','txtOption5':'" + txtOption5 + "','txtOption6':'" + txtOption6 + "','txtOption7':'" + txtOption7 +
        //                "','txtOption8':'" + txtOption8 + "','chkOption1':'" + chkOption1 + "','chkOption2':'" + chkOption2 +
        //                "','chkOption3':'" + chkOption3 + "','chkOption4':'" + chkOption4 + "','chkOption5':'" + chkOption5 +
        //                "','chkOption6':'" + chkOption6 + "','chkOption7':'" + chkOption7 + "','chkOption8':'" + chkOption8 +
        //                "','ReferenceText':'" + ReferenceText + "','ExplanationText':'" + ExplanationText +
        //                "','Emyadminid':'" + Emyadminid + "'}",
        //        timeout: 90000,dataType: "json",
        //        success: function (data) {
        //            var obj = data.d;

        //            if (obj == 'true') {

        //            }
        //        },
        //        error: function (result) {

        //            $('#lblQuestionComplete').html('Error in Editing Questions...');
        //        }
        //})
        //}




    })

    $('#btncontact').click(function () {
        ////debugger;
        var name = $('#contactname').val();
        var email = $('#contactemail').val();
        var phone = $('#contactphone').val();
        var message = $('#contactmessage').val();


        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            complete: function () {
                $('#contactusStatus').html('');
                //   $('#contactusStatus').html("Your Comments send Successfully! , Thank You " + name);


            },
            beforeSend: function () {
                // $('#lblQuestionComplete').html('Saving...');
                //$('#lblQuestionBefore').html("Saving...");



            },
            url: "myindex.aspx/contactus",
            data: "{'name':'" + name + "','email':'" + email + "','phone':'" + phone + "','message':'" + message + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var obj = data.d;
                alertify.success("Thank You for your Precious feedback we will contact you via email sooon.");
                if (obj == 'true') {

                }
            },
            error: function (result) {

                alertify.error("Reference Error");
            }
        })
    })

    function showmcqs(Emyadminid) {
        hide_all();
        $('#tblLoadMcqsAllQuestion tbody').empty();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadMcqsQuestions",

            data: "{'Emyadminid':'" + Emyadminid + "'}",
            timeout: 190000, dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var txt = "";

                if (len > 0) {
                    //$('#tbodytblLoadMcqsAllQuestion').find('tr').remove();
                    // $("#tbodytblLoadMcqsAllQuestion").remove();
                    var Srno = 1;
                    for (var i = 0; i < len; i++) {
                        console.log(data.d[i].QuestionText);
                        txt += '<tr ><td><img class="questionimg" src="../acme-free/img/question_balloon.png" /></td><td style="background-color: #FFFFFF !important;"><b><label style="font-size: 20px; width:1009px; color:black;">' + $.trim(data.d[i].QuestionText.withBackSlash().unquoted()) + '</label></b></td></tr>'; //  <td>' + data.d[i].Points + '</td></tr>';
                        // alert("data.d[i].op1 = "+data.d[i].op1)
                        if (data.d[i].op1 == true) {
                            // alert("txt = " + txt);
                            if (data.d[i].Option1Correct == true) {

                                txt += '<tr><td><img class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall"colspan="2">' + $.trim(data.d[i].Option1Text.withBackSlash().unquoted()) + '</td></tr>';

                            }
                            else {
                                txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" colspan="2"><label class="pop">' + $.trim(data.d[i].Option1Text.withBackSlash().unquoted()) + '</label></td></tr>';
                            }

                        }
                        if (data.d[i].op2 == true) {
                            if (data.d[i].Option2Correct == true) {
                                txt += '<tr ><td><img  class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall" colspan="2">' + $.trim(data.d[i].Option2Text.withBackSlash().unquoted()) + '</td></tr>';
                            }
                            else {
                                txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" colspan="2"><label class="pop">' + $.trim(data.d[i].Option2Text.withBackSlash().unquoted()) + '</label></td></tr>';
                            }

                        }


                        if (data.d[i].op3 == true) {
                            if (data.d[i].Option3Correct == true) {
                                txt += '<tr class=""><td><img  class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall"  colspan="2">' + $.trim(data.d[i].Option3Text.withBackSlash().unquoted()) + '</td></tr>';
                            }
                            else {
                                txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" colspan="2"><label class="pop">' + $.trim(data.d[i].Option3Text.withBackSlash().unquoted()) + '</label></td></tr>';
                            }

                        }


                        if (data.d[i].op4 == true) {
                            if (data.d[i].Option4Correct == true) {
                                txt += '<tr class=""><td><img class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall" colspan="2">' + $.trim(data.d[i].Option4Text.withBackSlash().unquoted()) + '</td></tr>';
                            }
                            else {
                                txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" colspan="2"><label class="pop">' + $.trim(data.d[i].Option4Text.withBackSlash().unquoted()) + '</label></td></tr>';
                            }

                        }


                        if (data.d[i].op5 == true) {
                            if (data.d[i].Option5Correct == true) {
                                txt += '<tr class=""><td><img class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall"colspan="2">' + $.trim(data.d[i].Option5Text.withBackSlash().unquoted()) + '</td></tr>';
                            }
                            else {
                                txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" colspan="2"><label class="pop">' + $.trim(data.d[i].Option5Text.withBackSlash().unquoted()) + '</label></td></tr>';
                            }

                        }


                        if (data.d[i].op6 == true) {
                            if (data.d[i].Option6Correct == true) {
                                txt += '<tr class=""><td><img class="checkimg" src="../acme-free/img/check3.png" /></td><td class=" clscorrectop clsloadmcqsall"  colspan="2">' + $.trim(data.d[i].Option6Text.withBackSlash().unquoted()) + '</td></tr>';
                            }
                            else {
                                txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" colspan="2"><label class="pop">' + $.trim(data.d[i].Option6Text.withBackSlash().unquoted()) + '</label></td></tr>';
                            }

                        }


                        if (data.d[i].op7 == true) {
                            if (data.d[i].Option7Correct == true) {
                                txt += '<tr class=""><td><img class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall"  colspan="2">' + $.trim(data.d[i].Option7Text.withBackSlash().unquoted()) + '</td></tr>';
                            }
                            else {
                                txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" colspan="2"><label class="pop">' + $.trim(data.d[i].Option7Text.withBackSlash().unquoted()) + '</label></td></tr>';
                            }

                        }


                        if (data.d[i].op8 == true) {
                            if (data.d[i].Option8Correct == true) {
                                txt += '<tr class=""><td><img class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall"    colspan="2">' + $.trim(data.d[i].Option8Text.withBackSlash().unquoted()) + '</td></tr>';
                            }
                            else {
                                txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" colspan="2"><label class="pop">' + $.trim(data.d[i].Option8Text.withBackSlash().unquoted()) + '</label></td></tr>';
                            }


                        }
                        txt += '<tr><td colspan="2" ><img style="width: 52%;margin-left: 223px;" src="../acme-free/img/divider2.gif" /></td></tr>';




                    }

                    if (txt != '') {
                        $("#tblLoadMcqsAllQuestion").append(txt + '</tbody>');
                        // $("#tblLoadMcqsAllQuestion").DataTable();
                        //  alert(txt);
                    }
                }

            },
            error: function (Result) {
                alertify.error("Error to load Mcqs! ");
            }
        });
        $('#LoadMcqsAllQuestion').show(1000);
        // $('#btnSave').hide();
        Scroll_top();
        return false;

    }

    $('.mcqsShow').click(function () {


        //#divMcqsQuestion
        showmcqs(Emyadminid);


        //$('#divShowMcqsQuestion').show(100);

        //$('#MainHeading').html('Show Multiple choice Question(s) <small>Questions</small>');
        //$('#breadcrumbpath').text('Show Mcqs');
        //$('.mcqsShow').attr('href', '#showMcqs_Questions');
        //$("#ddlShowMcqsQuestion").empty();
        //$("#ddlShowMcqsQuestionTest").empty();
        //$("#ddlShowMcqsQuestionSubject").empty();
        //$("#ddlShowMcqsQuestionSubject").append($("<option></option>").val(0).html('Select Subject'));
        //$("#ddlShowMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
        //$("#ddlShowMcqsQuestion").append($("<option></option>").val(0).html('Select Question'));
        //$.ajax({
        //    type: "POST",
        //    contentType: "application/json; charset=utf-8",
        //    url: "myindex.aspx/LoadddlSubject",
        //    data: "{'dadminid':'" + Emyadminid + "'}",
        //    timeout: 90000,dataType: "json",
        //    success: function (Result) {
        //        $.each(Result.d, function (key, value) {
        //            //  $("#ddlShowMcqsQuestionSubject").empty();

        //            $("#ddlShowMcqsQuestionSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
        //            $("#ddlShowMcqsQuestionSubject").trigger("chosen:updated");
        //            $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
        //            var subId = $("#ddlShowMcqsQuestionSubject").val();

        //            $.ajax({

        //                type: "POST",
        //                contentType: "application/json; charset=utf-8",
        //                url: "myindex.aspx/LoadddlTestForSpecificSub",
        //                data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "'}",
        //                timeout: 90000,dataType: "json",
        //                success: function (Result) {
        //                    $.each(Result.d, function (key, value) {
        //                        // $("#ddlShowMcqsQuestionTest").empty();

        //                        $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
        //                        $("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

        //                    });
        //                },
        //                error: function (Result) {
        //                    alert("Error");
        //                }
        //            });

        //        });
        //    },
        //    error: function (Result) {
        //        alert("Error to load Subject drop down lists");
        //    }
        //});



    })
    $('.McqsPreview').click(function () {
        $.ajax({

            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlTestForSpecificSub",
            data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            dataType: "json",
            timeout: 90000,
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    // $("#ddlShowMcqsQuestionTest").empty();
                    '<tr><td>' + key.McqsQuestion;
                    $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                    $("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

                });
            },
            error: function (Result) {
                alertify.error("There is an Error Please try again later. Thank You");
            }
        });
    })
    $('.editmcqs').click(function () {
        IsEdit = 1;
        //  alert(IsEdit);
        hide_all();
        $('#showMcqs_Questions').show(100);
        $('#btnUpdate_mcqs').show();
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
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
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
                        url: "myindex.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
                        timeout: 90000, dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                // $("#ddlShowMcqsQuestionTest").empty();

                                $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                                $("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

                            });
                        },
                        error: function (Result) {
                            alertify.error("There is an Error Please try later");
                        }
                    });

                });
            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists");
            }
        });

        return false;


    })
    $('#btnUpdate_mcqs').click(function () {
        ////debugger;
        // alert('Hello i am clicked');
        var result = confirm("Are you sure to Update this Question ?");
        if (result) {
            var SubjectId = $('#ddlSubject').val();
            var TestId = $('#ddlTest').val();
            var SubjectId_Edit = $('#ddlShowMcqsQuestionSubject').val();
            var TestId_Edit = $('#ddlShowMcqsQuestionTest').val();
            var McqsId = $('#ddlShowMcqsQuestion').val();
            var QuestionText1 = $('#txtQuestion').val();
            var QuestionText = '"' + QuestionText1 + '"';
            if (txtbtnQuestionSimpleBoxbit == 0) {

                QuestionText = '"' + QuestionText1 + '"';

            }
            else {
                QuestionText = '"' + CKEDITOR.instances.txtQuestion.getData() + '"';

            }
            if (QuestionText.length == 2) {
                QuestionText = '"' + CKEDITOR.instances.txtQuestion.getData() + '"';
            }
            if (QuestionText.length == 2) {
                QuestionText = '"' + QuestionText1 + '"';
            }

            //alert(QuestionText1);



            var Points = $('#ddlPoints').val();
            var ReferenceText = '"' + CKEDITOR.instances.txtReference.getData() + '"';  //$('#txtReference').val();
            var ExplanationText = '"' + CKEDITOR.instances.txtExplanation.getData() + '"';// $('#txtExplanation').val();
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
            ////debugger;

            var chkOption1 = 0;
            var chkOption2 = 0;
            var chkOption3 = 0;
            var chkOption4 = 0;
            var chkOption5 = 0;
            var chkOption6 = 0;
            var chkOption7 = 0;
            var chkOption8 = 0;



            if ($("#chkOption1").prop("checked") == true) {
                chkOption1 = 1;
            }
            else {
                chkOption1 = 0;
            }
            //
            if ($("#chkOption2").prop("checked") == true) {
                chkOption2 = 1;
            }
            else {
                chkOption2 = 0;
            }
            //
            if ($("#chkOption3").prop("checked") == true) {
                chkOption3 = 1;
            }
            else {
                chkOption3 = 0;
            }
            //
            if ($("#chkOption4").prop("checked") == true) {
                chkOption4 = 1;
            }
            else {
                chkOption4 = 0;
            }
            //
            if ($("#chkOption5").prop("checked") == true) {
                chkOption5 = 1;
            }
            else {
                chkOption5 = 0;
            }
            //
            if ($("#chkOption6").prop("checked") == true) {
                chkOption6 = 1;
            }
            else {
                chkOption6 = 0;
            }
            //
            if ($("#chkOption7").prop("checked") == true) {
                chkOption7 = 1;
            }
            else {
                chkOption7 = 0;
            }
            //
            if ($("#chkOption8").prop("checked") == true) {
                chkOption8 = 1;
            }
            else {
                chkOption8 = 0;
            }
            var exp_staff_id = $("#ddlStaff_exp").val();
            // //debugger;
            var itotal = 0;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                complete: function () {
                    $('#lblQuestionComplete').html('Question with All Options Updated Successfully...    ' + itotal);
                    Scroll_top();
                    if (txtbtnQuestionSimpleBoxbit == 0) {

                        QuestionText = '"' + QuestionText1 + '"';

                    }
                    else {
                        QuestionText = '"' + CKEDITOR.instances.txtQuestion.setData('') + '"';

                    }
                    if (QuestionText.length == 2) {
                        QuestionText = '"' + CKEDITOR.instances.txtQuestion.setData('') + '"';
                    }
                    if (QuestionText.length == 2) {
                        QuestionText = '"' + QuestionText1 + '"';
                    }
                    if (txtOption1bit == 0) {
                        txtOption1 = '"' + CKEDITOR.instances.txtOption1.setData('') + '"';
                    }
                    else {
                        txtOption1 = $('#txtOption1').val();
                    }

                    // option 2
                    if (txtOption2bit == 0) {
                        txtOption2 = '"' + CKEDITOR.instances.txtOption2.setData('') + '"';
                    }
                    else {
                        txtOption2 = $('#txtOption2').val();
                    }
                    // otpion 3
                    if (txtOption3bit == 0) {

                        txtOption3 = '"' + CKEDITOR.instances.txtOption3.setData('') + '"';
                    }
                    else {
                        txtOption3 = $('#txtOption3').val();
                    }
                    // option4
                    if (txtOption4bit == 0) {

                        txtOption4 = '"' + CKEDITOR.instances.txtOption4.setData('') + '"';
                    }
                    else {
                        txtOption4 = $('#txtOption4').val();
                    }
                    if (txtOption5bit == 0) {
                        txtOption5 = '"' + CKEDITOR.instances.txtOption5.setData('') + '"';
                    }
                    else {
                        txtOption5 = $('#txtOption5').val();
                    }
                    //
                    if (txtOption6bit == 0) {
                        txtOption6 = '"' + CKEDITOR.instances.txtOption6.setData('') + '"';
                    }
                    else {
                        txtOption6 = $('#txtOption6').val();
                    }
                    //
                    if (txtOption7bit == 0) {
                        txtOption7 = '"' + CKEDITOR.instances.txtOption7.setData('') + '"';
                    }
                    else {
                        txtOption7 = $('#txtOption7').val();
                    }
                    //
                    if (txtOption8bit == 0) {
                        txtOption8 = '"' + CKEDITOR.instances.txtOption8.setData('') + '"';
                    }
                    else {
                        txtOption8 = $('#txtOption8').val();

                    }

                    CKEDITOR.instances.txtExplanation.setData('');
                    CKEDITOR.instances.txtReference.setData('');
                    $('#divMcqsQuestion :checked').removeAttr('checked');
                    chkoption1bit = 0;
                    chkoption2bit = 0;
                    chkoption3bit = 0;
                    chkoption4bit = 0;
                    chkoption5bit = 0;
                    chkoption6bit = 0;
                    chkoption7bit = 0;
                    chkoption8bit = 0;
                },
                beforeSend: function () {
                    $('#lblQuestionComplete').html('Updating options...');
                },
                timeout: 90000,
                url: "myindex.aspx/Edit_Mcqs ",
                data: "{'SubjectId':'" + SubjectId_Edit + "','TestId':'" + TestId_Edit + "','QuestionId':'" + McqsId +
                            "','QuestionText':'" + QuestionText + "','points':'" + Points + "','txtOption1':'" + txtOption1 +
                            "','txtOption2':'" + txtOption2 + "','txtOption3':'" + txtOption3 + "','txtOption4':'" + txtOption4 +
                            "','txtOption5':'" + txtOption5 + "','txtOption6':'" + txtOption6 + "','txtOption7':'" + txtOption7 +
                            "','txtOption8':'" + txtOption8 + "','chkOption1':'" + chkOption1 + "','chkOption2':'" + chkOption2 +
                            "','chkOption3':'" + chkOption3 + "','chkOption4':'" + chkOption4 + "','chkOption5':'" + chkOption5 +
                            "','chkOption6':'" + chkOption6 + "','chkOption7':'" + chkOption7 + "','chkOption8':'" + chkOption8 +
                            "','ReferenceText':'" + ReferenceText + "','ExplanationText':'" + ExplanationText + "','exp_staff_id':'" + exp_staff_id +
                            "','Emyadminid':'" + Emyadminid + "'}",
                timeout: 90000, dataType: "json",
                success: function (data) {
                    var obj = data.d;
                    itotal = data.d;
                    alertify.success("Updated Successfully ")
                    // alert('data.d =  ' + data.d)
                    if (obj == 'false') {
                        $('#lblQuestionComplete').html('Error in Updating Question with All Options...');
                        alertify.error('Error in Updating Question with All Options...');
                        //SaveStatus = 0;

                    }

                },
                error: function (jqXHR, exception) {
                    var msg = '';
                    if (jqXHR.status === 0) {
                        msg = 'Not connect.\n Verify Network.';
                    } else if (jqXHR.status == 404) {
                        msg = 'Requested page not found. [404]';
                    } else if (jqXHR.status == 500) {
                        msg = 'Internal Server Error [500].';
                    } else if (exception === 'parsererror') {
                        msg = 'Requested JSON parse failed.';
                    } else if (exception === 'timeout') {
                        msg = 'Time out error.';
                    } else if (exception === 'abort') {
                        msg = 'Ajax request aborted.';
                    } else {
                        msg = 'Uncaught Error.\n' + jqXHR.responseText;
                    }
                    $('#lblQuestionComplete').html(msg);
                }
            })
        }

        //    $.ajax({
        //        type: "POST",
        //        contentType: "application/json; charset=utf-8",
        //        complete: function () {
        //            //$('#lblQuestionBefore').html('');
        //            $('#lblQuestionComplete').html("Updated");


        //        },
        //        beforeSend: function () {
        //            $('#lblQuestionComplete').html('Saving...');
        //            //$('#lblQuestionBefore').html("Saving...");



        //        },
        //        url: "myindex.aspx/Edit_Mcqs",
        //        data: "{'SubjectId':'" + SubjectId_Edit + "','TestId':'" + TestId_Edit + "','QuestionId':'" + McqsId +
        //                "','QuestionText':'" + QuestionText + "','points':'" + Points + "','txtOption1':'" + txtOption1 +
        //                "','txtOption2':'" + txtOption2 + "','txtOption3':'" + txtOption3 + "','txtOption4':'" + txtOption4 +
        //                "','txtOption5':'" + txtOption5 + "','txtOption6':'" + txtOption6 + "','txtOption7':'" + txtOption7 +
        //                "','txtOption8':'" + txtOption8 + "','chkOption1':'" + chkOption1 + "','chkOption2':'" + chkOption2 +
        //                "','chkOption3':'" + chkOption3 + "','chkOption4':'" + chkOption4 + "','chkOption5':'" + chkOption5 +
        //                "','chkOption6':'" + chkOption6 + "','chkOption7':'" + chkOption7 + "','chkOption8':'" + chkOption8 +
        //                "','ReferenceText':'" + ReferenceText + "','ExplanationText':'" + ExplanationText +
        //                "','Emyadminid':'" + Emyadminid + "'}",
        //        timeout: 90000,dataType: "json",
        //        success: function (data) {
        //            var obj = data.d;

        //            if (obj == 'true') {

        //            }
        //        },
        //        error: function (result) {

        //            $('#lblQuestionComplete').html('Error in Editing Questions...');
        //        }
        //})





    })
    $('#btnShowMcqsQuestion').click(function () {

        parseInt(checkbitforexpandrefckeditor++);
        if (checkbitforexpandrefckeditor == 1) {


            CKEDITOR.replace('txtQuestion', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption1', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption2', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption3', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption4', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption5', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption6', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption7', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption8', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtReference', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtExplanation', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
        }
        $("#btnSave").hide();
        $("#btnUpdate_mcqs").show();
        var SubjectId = $('#ddlShowMcqsQuestionSubject').val();
        var TestId = $('#ddlShowMcqsQuestionTest').val();
        var QuestionId = $("#ddlShowMcqsQuestion").val();

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/ShowMcqs",
            //url: "myindex.aspx/DateTimes",
            data: "{'McqsId':'" + QuestionId + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                // alert('hhee');
                //alert("hello this is your data is " + data.d);
                for (var i = 0; i < data.d.length; i++) {

                    $('#ddlPoints').val(data.d[i].Points).change();
                    var QuestionText = data.d[i].QuestionText.withBackSlash().unquoted();
                    //  alert(QuestionText)
                    if (txtbtnQuestionSimpleBoxbit == 0) {
                        // CKEDITOR.instances.txtQuestion.destroy(true);
                        CKEDITOR.instances.txtQuestion.setData(QuestionText.withBackSlash().unquoted());

                    }
                    else {

                        $('#txtQuestion').val(QuestionText.unquoted());
                    }
                    var txtOption1 = 0;
                    var txtOption2 = 0;
                    var txtOption3 = 0;
                    var txtOption4 = 0;
                    var txtOption5 = 0;
                    var txtOption6 = 0;
                    var txtOption7 = 0;
                    var txtOption8 = 0;
                    var Op1txt = data.d[i].Option1Text;
                    // $('#txtOption1').val(Op1txt.unquoted());
                    var Op2txt = data.d[i].Option2Text;
                    //$('#txtOption2').val(Op2txt.unquoted());
                    var Op3txt = data.d[i].Option3Text;
                    //$('#txtOption3').val(Op3txt.unquoted());
                    var Op4txt = data.d[i].Option4Text;
                    //$('#txtOption4').val(Op4txt.unquoted());
                    var Op5txt = data.d[i].Option5Text;
                    //$('#txtOption5').val(Op5txt.unquoted());
                    var Op6txt = data.d[i].Option6Text;
                    //$('#txtOption6').val(Op6txt.unquoted());
                    var Op7txt = data.d[i].Option7Text;
                    //$('#txtOption7').val(Op7txt.unquoted());
                    var Op8txt = data.d[i].Option8Text;
                    //$('#txtOption8').val(Op8txt.unquoted());
                    var ExplanationText = data.d[i].ExplanationText;
                    var Reference = data.d[i].Reference;
                    var op1 = data.d[i].op1;
                    var op2 = data.d[i].op2;
                    var op3 = data.d[i].op3;
                    var op4 = data.d[i].op4;
                    var op5 = data.d[i].op5;
                    var op6 = data.d[i].op6;
                    var op7 = data.d[i].op7;
                    var op8 = data.d[i].op8;
                    if (txtOption1bit == 0) {
                        //CKEDITOR.instances.txtOption1.destroy(true);
                        if (op1 == true) {
                            CKEDITOR.instances.txtOption1.setData(Op1txt.withBackSlash().unquoted());
                        }
                        else {
                            CKEDITOR.instances.txtOption1.setData("");
                        }

                    }
                    else {
                        if (op1 == true) {
                            $('#txtOption1').val(Op1txt.unquoted());
                        }
                        else {
                            $('#txtOption1').val("");
                        }

                    }

                    // option 2
                    if (txtOption2bit == 0) {
                        if (op2 == true) {
                            CKEDITOR.instances.txtOption2.setData(Op2txt.withBackSlash().unquoted());
                        }
                        else {
                            CKEDITOR.instances.txtOption2.setData("");
                        }
                        // CKEDITOR.instances.txtOption2.destroy(true);

                    }
                    else {
                        if (op2 == true) {
                            $('#txtOption2').val(Op2txt.withBackSlash().unquoted());
                        }
                        else {
                            $('#txtOption2').val("");
                        }

                    }
                    // otpion 3
                    if (txtOption3bit == 0) {
                        if (op3 == true) {
                            CKEDITOR.instances.txtOption3.setData(Op3txt.withBackSlash().unquoted());
                        }
                        else {
                            CKEDITOR.instances.txtOption3.setData("");
                        }
                        // CKEDITOR.instances.txtOption3.destroy(true);

                    }
                    else {
                        if (op3 == true) {
                            $('#txtOption3').val(Op3txt.withBackSlash().unquoted());
                        }
                        else {
                            $('#txtOption3').val("");
                        }

                    }
                    // option4
                    if (txtOption4bit == 0) {
                        if (op4 == true) {
                            CKEDITOR.instances.txtOption4.setData(Op4txt.withBackSlash().unquoted());
                        }

                        else {
                            CKEDITOR.instances.txtOption4.setData("");
                        }
                    }
                        // CKEDITOR.instances.txtOption4.destroy(true);

                    else {
                        if (op4 == true) {
                            $('#txtOption4').val(Op4txt.withBackSlash().unquoted());
                        }
                        else {
                            $('#txtOption4').val("");
                        }

                    }
                    if (txtOption5bit == 0) {
                        if (op5 == true) {
                            CKEDITOR.instances.txtOption5.setData(Op5txt.withBackSlash().unquoted());
                        }

                        else {
                            CKEDITOR.instances.txtOption5.setData("");
                        }
                        //  CKEDITOR.instances.txtOption5.destroy(true);

                    }
                    else {
                        if (op5 == true) {
                            $('#txtOption5').val(Op5txt.withBackSlash().unquoted());
                        }
                        else {
                            $('#txtOption5').val("");
                        }

                    }
                    //
                    if (txtOption6bit == 0) {
                        if (op6 == true) {
                            CKEDITOR.instances.txtOption6.setData(Op6txt.withBackSlash().unquoted());
                        }

                        else {
                            CKEDITOR.instances.txtOption6.setData("");
                        }
                        // CKEDITOR.instances.txtOption6.destroy(true);

                    }
                    else {
                        if (op6 == true) {
                            $('#txtOption6').val(Op6txt.withBackSlash().unquoted());
                        }
                        else {
                            $('#txtOption6').val("");
                        }

                    }
                    //
                    if (txtOption7bit == 0) {
                        if (op7 == true) {
                            CKEDITOR.instances.txtOption7.setData(Op7txt.withBackSlash().unquoted());
                        }

                        else {
                            CKEDITOR.instances.txtOption7.setData("");
                        }
                        // CKEDITOR.instances.txtOption7.destroy(true);

                    }
                    else {
                        if (op7 == true) {
                            $('#txtOption7').val(Op7txt.withBackSlash().unquoted());
                        }
                        else {
                            $('#txtOption7').val("");
                        }

                    }
                    //
                    if (txtOption8bit == 0) {
                        if (op8 == true) {
                            CKEDITOR.instances.txtOption8.setData(Op8txt.withBackSlash().unquoted());
                        }

                        else {
                            CKEDITOR.instances.txtOption8.setData("");
                        }
                        //  CKEDITOR.instances.txtOption8.destroy(true);

                    }
                    else {
                        if (op8 == true) {
                            $('#txtOption8').val(Op8txt.withBackSlash().unquoted());
                        }
                        else {
                            $('#txtOption8').val("");
                        }


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
                    // CKEDITOR.replace('txtQuestion');
                    //CKEDITOR.replace('txtOption1');
                    //CKEDITOR.replace('txtOption2');
                    //CKEDITOR.replace('txtOption3');
                    //CKEDITOR.replace('txtOption4');
                    //CKEDITOR.replace('txtOption5');
                    //CKEDITOR.replace('txtOption6');
                    //CKEDITOR.replace('txtOption7');
                    //CKEDITOR.replace('txtOption8');
                    // CKEDITOR.replace('txtExplanation');
                    //CKEDITOR.replace('txtReference');

                    CKEDITOR.instances.txtExplanation.setData(ExplanationText.unquoted());
                    CKEDITOR.instances.txtReference.setData(Reference.unquoted());
                    //CKEDITOR.instances.txtQuestion.setData(QuestionText.unquoted());

                    // $('#txtExplanation').val(ExplanationText.unquoted());
                    //$('#txtReference').val(Reference.unquoted());
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
                    //var jop1 = data.d[i].op1;
                    //// alert(jop1);
                    //var jop2 = data.d[i].op2;
                    //var jop3 = data.d[i].op3;
                    //var jop4 = data.d[i].op4;
                    //var jop5 = data.d[i].op5;
                    //var jop6 = data.d[i].op6;
                    //var jop7 = data.d[i].op7;
                    //var jop8 = data.d[i].op8;
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
                    $("#ddlStaff_exp").val(data.d[i].staff_exp_id);
                    alertify.success("Loaded Successfully ");
                }

            },
            error: function (Result) {
                alertify.error("There is an Error to Show Mcqs. Please try again later.");
            }
        });
        $('#divMcqsQuestion').show(1000);


    })
    function Scroll_top() {
        $("html, body").animate({ scrollTop: 1 });

    }
    //contactus
    $('.contactus').click(function () {
        hide_all();
        $('#divcontactus').show(1000);
        Scroll_top();
        return false;
    })

    // User's Dashboard
    function updateinfo_dashboard() {
        $.ajax({

            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/Load_userdashboard",
            data: "{'Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000,
            dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    // $("#ddlShowMcqsQuestionTest").empty();
                    $("#lbldashboardtoday").text(value.today);
                    $("#lbldashboardyesterday").text(value.yesterday);
                    $("#lbldashboardmonth").text(value.thismonth);
                    $("#lbldashboard_total").text(value.usersum);
                    // $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                    //$("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

                });
            },
            error: function (Result) {
                alertify.error("There is an Error to load Dashboard. Please try later");
            }
        });
    }
    $('.userDashboard').click(function () {
        hide_all();
        updateinfo_dashboard();
        $('#userDashboard').show(1000);

        Scroll_top();
        return false;
    })

    // Insert User
    $('.insertUser').click(function () {
        hide_all();
        var editor = CKEDITOR.instances["txtUserTermsAndConditions"];
        if (editor) {
            // editor.destroy(true);
        }
        else {
            CKEDITOR.replace('txtUserTermsAndConditions', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
        }
        // Insert Staff


        //$.ajax({
        //    type: "POST",
        //    contentType: "application/json; charset=utf-8",
        //    url: "myindex.aspx/LoadddlUsers",
        //    data: "{'Emyadminid':'" + Emyadminid + "'}",
        //    timeout: 90000, dataType: "json",
        //    success: function (Result) {
        //        $.each(Result.d, function (key, value) {
        //            $("#ddlEditUsers").append($("<option></option>").val(value.UserId).html(value.UserEmail));

        //        });
        //    },
        //    error: function (Result) {
        //        alert("Error to load Users drop down lists");
        //    }
        //});
        $('#btnAddUser').val('Add User'); //.html('Add User'); //.button("refresh");
        $('#divAddUser').show(1000);
        Scroll_top();
        return false;
    })
    // Insert Staff
    $('.insertStaff').click(function () {
        hide_all();
        $('#divAddStaff').show(1000);
        Scroll_top();
        return false;
    })
    $('.insertcatlink').click(function () {
        hide_all();
        $('#divAddCatNew').show(1000);
        Scroll_top();
        return false;
    })
    $('.editcat').click(function () {
        hide_all();

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlCat",
            data: "{'dadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $("#ddlEditCat").empty();
                $("#ddlEditCat").append($("<option></option>").val("0").html("Select One"))
                $.each(Result.d, function (key, value) {
                    $("#ddlEditCat").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));

                });
            },
            error: function (Result) {
                alert("Error to load Users drop down lists");
            }
        });

        $('#divEditCat').show(1000);
        Scroll_top();
        return false;
    })
    // Edit User
    $('.editUser').click(function () {
        hide_all();
        $("#ddlEditUsers").empty();
        $("#ddlEditUsers").append($("<option></option>").val("0").html("Select One"))
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlUsers",
            data: "{'Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlEditUsers").append($("<option></option>").val(value.UserId).html(value.UserEmail));

                });
            },
            error: function (Result) {
                alert("Error to load Users drop down lists");
            }
        });

        $('#divEditUsers').show(1000);
        Scroll_top();
        return false;
    })
    // Delete User
    $('.DelUser').click(function () {
        hide_all();
        $("#ddlDeleteUsers").empty();
        $("#ddlDeleteUsers").append($("<option></option>").val("0").html("Select One"))
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlUsers",
            data: "{'Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlDeleteUsers").append($("<option></option>").val(value.UserId).html(value.UserEmail));

                });
            },
            error: function (Result) {
                alert("Error to load Users drop down lists");
            }
        });
        $('#divDeleteUsers').show(1000);
        Scroll_top();
        return false;
    })
    $('.delcat').click(function () {
        hide_all();

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlCat",
            data: "{'dadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $("#ddlDeleteCat").empty();
                $("#ddlDeleteCat").append($("<option></option>").val("0").html("Select One"))
                $.each(Result.d, function (key, value) {
                    $("#ddlDeleteCat").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));

                });
            },
            error: function (Result) {
                alert("Error to load Users drop down lists");
            }
        });

        $('#divDeleteCat').show(1000);
        Scroll_top();
        return false;
    })
    // Delete Staff member
    $('.DellStaff').click(function () {
        hide_all();
        $("#ddlDeleteStaff").empty();
        $("#ddlDeleteStaff").append($("<option></option>").val("0").html("Select One"))
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlStaffs",
            data: "{}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlDeleteStaff").append($("<option></option>").val(value.StaffId).html(value.Name));

                });
            },
            error: function (Result) {
                alert("Error to load Staff members dropdown lists");
            }
        });
        $('#divDeleteStaff').show(1000);
        Scroll_top();
        return false;
    })
    //Delete users 
    $("#btnDeleteUser").click(function () {
        var result = confirm("Are you sure to Delete this Users ?");
        if (result) {
            var u_name = $("#txtDeleteUserName").val();
            var u_email = $("#txtDeleteUserEmail").val();
            var u_pawd = $("#txtDeleteUserpwd").val();
            var u_uid = $("#lblDeleteuserid").text()
            var isdelete = 0;

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "myindex.aspx/Update_userinfoPwd",
                data: "{'Emyadminid':'" + Emyadminid + "','u_name':'" + u_name + "','u_email':'" + u_email + "','u_pawd':'" + u_pawd + "','u_uid':'" + u_uid + "','isdelete':'" + isdelete + "'}",
                timeout: 90000, dataType: "json",
                success: function (Result) {
                    if (Result.d == "1") {
                        alertify.success("User Deleted Successfully! ");
                        $("#txtDeleteUserName").val("");
                        $("#txtDeleteUserEmail").val("");
                        $("#txtDeleteUserpwd").val("");
                        $("#lblDeleteuserid").text("");

                        $("#ddlDeleteUsers").empty();
                        $("#ddlDeleteUsers").append($("<option></option>").val("0").html("Select One"))
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "myindex.aspx/LoadddlUsers",
                            data: "{'Emyadminid':'" + Emyadminid + "'}",
                            timeout: 90000, dataType: "json",
                            success: function (Result) {
                                $.each(Result.d, function (key, value) {
                                    $("#ddlDeleteUsers").append($("<option></option>").val(value.UserId).html(value.UserEmail));

                                });
                            },
                            error: function (Result) {
                                alert("Error to load Users drop down lists");
                            }
                        });


                    }
                },
                error: function (Result) {
                    alertify.error("Error to Delete Users Information. Please Try again later.");
                }
            });
        }
        else {
            alertify.log("User not Deleted.");
        }

    })
    //Delete Staff 
    $("#btnDeleteStaff").click(function () {
        var result = confirm("Are you sure to Delete this Staff member ?");
        if (result) {
            var u_name = $("#txtDeleteStaffName").val();
            var u_qual = $("#txtDeleteStaffQual").val();
            var u_Mob = $("#txtDeleteMob").val();
            var u_uid = $("#lblDeleteStaffid").text()
            var isdelete = 0;

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "myindex.aspx/Update_Staffinfo",
                data: "{'u_name':'" + u_name + "','u_qual':'" + u_qual + "','u_Mob':'" + u_Mob + "','u_uid':'" + u_uid + "','isdelete':'" + isdelete + "'}",
                timeout: 90000, dataType: "json",
                success: function (Result) {
                    if (Result.d == "1") {
                        alertify.success("Staff member Deleted Successfully! ");
                        $("#txtDeleteStaffName").val("");
                        $("#txtDeleteStaffQual").val("");
                        $("#txtDeleteMob").val("");
                        $("#lblDeleteStaffid").text("");

                        $("#ddlDeleteStaff").empty();
                        $("#ddlDeleteStaff").append($("<option></option>").val("0").html("Select One"))
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "myindex.aspx/LoadddlStaffs",
                            data: "{}",
                            timeout: 90000, dataType: "json",
                            success: function (Result) {
                                $.each(Result.d, function (key, value) {
                                    $("#ddlDeleteStaff").append($("<option></option>").val(value.StaffId).html(value.Name));

                                });
                            },
                            error: function (Result) {
                                alert("Error to load Staff members drop down lists");
                            }
                        });


                    }
                },
                error: function (Result) {
                    alertify.error("Error to Delete Staff Information. Please Try again later.");
                }
            });
        }
        else {
            alertify.log("Staff not Deleted.");
        }

    })

    //Delete Category
    $("#btnDeleteCat").click(function () {
        var result = confirm("Are you sure to Delete this Category ?");
        if (result) {

            var u_uid = $("#lblDeleteCatid").text()

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "myindex.aspx/Update_Categoryinfo",
                data: "{'u_uid':'" + u_uid + "'}",
                timeout: 90000, dataType: "json",
                success: function (Result) {
                    if (Result.d == "1") {
                        alertify.success("Category Deleted Successfully! ");
                        $("#txtDeleteCatName").val("");
                        $("#txtDeleteCatDes").val("");
                        $("#txtDeleteCatPurpose").val("");
                        $("#lblDeleteStaffid").text("");

                        $("#ddlDeleteCat").empty();
                        $("#ddlDeleteCat").append($("<option></option>").val("0").html("Select One"))
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "myindex.aspx/LoadddlCat",
                            data: "{'dadminid':'" + Emyadminid + "'}",
                            timeout: 90000, dataType: "json",
                            success: function (Result) {
                                $("#ddlDeleteCat").empty();
                                $("#ddlDeleteCat").append($("<option></option>").val("0").html("Select One"))
                                $.each(Result.d, function (key, value) {
                                    $("#ddlDeleteCat").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));

                                });
                            },
                            error: function (Result) {
                                alert("Error to load drop down lists");
                            }
                        });


                    }
                },
                error: function (Result) {
                    alertify.error("Error to Delete Category Information. Please Try again later.");
                }
            });
        }
        else {
            alertify.log("Staff not Deleted.");
        }

    })
    // Show User
    $('.UserShow').click(function () {
        hide_all();

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/UserDetail",
            data: "{'Emyadminid':'" + Emyadminid + "','userid':'" + "" + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var totallen = data.d.length;
                var txt = "";
                var totalmcqs = 0;
                //alert(len);
                if (len > 0) {
                    for (var i = 0; i < len; i++) {

                        txt += '<tr><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].UserName +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].UserEmail +
                            '</td><td data-hidden="1">' + data.d[i].UserId +
                             '</td><td data-hidden="1">' + data.d[i].UserRole +
                            '</td><td style="font-size: 10px;">' + data.d[i].UserPassword +
                            '</td><td><label style="font-size: 12px;">' + data.d[i].UserTotalAttempts +
                            '</label></td><td> <input type="checkbox" class=" Practice" value="' + data.d[i].UserId + '" name="alluserids[]" id="alluserids[]"> </td></tr>';
                        // totalmcqs = totalmcqs + data.d[i].TotalMcqs;
                    }

                    if (txt != '') {

                        if ($.fn.DataTable.isDataTable('#tblShowUsers')) {
                            $('#tblShowUsers').DataTable().destroy();
                        }




                        $('#tblShowUsers tbody').empty();
                        $("#tblShowUsers").append(txt);
                        // $("#totalmcqs").text("Total Number of Mcqs is " + totalmcqs + "  Approximately");
                        example_tbl = $("#tblShowUsers").DataTable(
                             {
                                 paging: true,
                                 responsive: false,
                                 columnDefs: [
                                { responsivePriority: 1, targets: 0 },
                                { responsivePriority: 2, targets: 1 },
                                 { responsivePriority: 4, targets: 4 },
                                 { responsivePriority: 5, targets: 5 }
                                 ],
                                 "columnDefs": [
                                     {
                                         "targets": [2],
                                         "visible": false,
                                         "searchable": false
                                     },
                                     {
                                         "targets": [3],
                                         "visible": false,
                                         "searchable": false
                                     }
                                 ],
                                 select: {
                                     style: 'multi'
                                 }
                             }
                            );

                    }
                }
                //  setTimeout($.unblockUI, 1000);

            },
            error: function (data) {
                alert("Error");
            }
        });
        //$.ajax({
        //    type: "POST",
        //    contentType: "application/json; charset=utf-8",
        //    url: "/default.aspx/LoadHomePages",
        //    data: "{}",
        //    dataType: "json",
        //    timeout: (2 * 1000000),
        //    beforeSend: function () {
        //        //blockui();
        //        //  $('#divloading').html('Please Wait while loading your requested contents...');
        //        //$('#lblQuestionBefore').html("Saving...");



        //    },
        //    complete: function () {
        //        $('#divloading').html('');
        //        //$('#lblQuestionBefore').html('');
        //        // $('#lblQuestionComplete').html("Saved");


        //    },
        //    success: function (data) {
        //        var len = data.d.length;
        //        var totallen = data.d.length;
        //        var txt = "";
        //        var totalmcqs = 0;
        //        //alert(len);
        //        if (len > 0) {
        //            for (var i = 0; i < len; i++) {

        //                txt += '<tr><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].SubjectName +
        //                    '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].TestName +
        //                    '</td><td data-hidden="1">' + data.d[i].TestId +
        //                     '</td><td data-hidden="1">' + data.d[i].SubId +
        //                    '</td><td style="font-size: 10px;">' + data.d[i].AdminName +
        //                    '</td><td><label style="font-size: 12px;">' + data.d[i].TotalMcqs +
        //                    '</label></td><td> <input type="checkbox" class=" Practice" value="' + data.d[i].TestId + '" name="alltestids[]" id="alltestids[]"> </td></tr>';
        //                totalmcqs = totalmcqs + data.d[i].TotalMcqs;
        //            }

        //            if (txt != '') {
        //                $('#example tbody').empty();
        //                $("#example").append(txt);
        //                // $("#totalmcqs").text("Total Number of Mcqs is " + totalmcqs + "  Approximately");
        //                example_tbl = $("#example").DataTable(
        //                     {
        //                         paging: false,
        //                         responsive: true,
        //                         columnDefs: [
        //                        { responsivePriority: 1, targets: 0 },
        //                        { responsivePriority: 2, targets: 1 },
        //                         { responsivePriority: 4, targets: 4 },
        //                         { responsivePriority: 5, targets: 5 }
        //                         ],
        //                         "columnDefs": [
        //                             {
        //                                 "targets": [2],
        //                                 "visible": true,
        //                                 "searchable": false
        //                             },
        //                             {
        //                                 "targets": [3],
        //                                 "visible": true,
        //                                 "searchable": false
        //                             }
        //                         ],
        //                         select: {
        //                             style: 'multi'
        //                         }
        //                     }
        //                    );

        //            }
        //        }
        //        //  setTimeout($.unblockUI, 1000);

        //    },
        //    error: function (result) {

        //        alertify.error("Error occour in Loading Mcqs Please try again letter ! ");
        //        // setTimeout($.unblockUI, 1000);
        //    }
        //})
        $('#divAddedUserTable').show(1000);
        Scroll_top();
        return false;
    })
    $('.showcat').click(function () {
        hide_all();

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/CatDetail",
            data: "{'Emyadminid':'" + Emyadminid + "','userid':'" + "" + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var totallen = data.d.length;
                var txt = "";
                var totalmcqs = 0;
                //alert(len);
                var status = "Active";
                var mynu = 0;
                if (len > 0) {
                    for (var i = 0; i < len; i++) {
                        mynu++;

                        if (data.d[i].CatDeletebit == 1) {
                            status = "Active";
                        }
                        else {
                            status = "De-Active"
                        }
                        txt += '<tr><td>' + mynu + '</td><td data-hidden="1">' + data.d[i].catid +
                           // '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].UserEmail +

                            '</td><td  style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].CatName +
                            '</td><td  style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].TotalSub +
                            '</td><td  style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].TotalTest +
                            '</td><td  style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].TotalMcqs +
                            // '</td><td data-hidden="1">' + data.d[i].UserRole +
                          //  '</td><td style="font-size: 10px;">' + data.d[i].UserPassword +
                          //  '</td><td><label style="font-size: 12px;">' + status +
                            '</label></td><td  class="alert alert-success">Active</td></tr>';
                        // totalmcqs = totalmcqs + data.d[i].TotalMcqs;
                    }

                    if (txt != '') {

                        if ($.fn.DataTable.isDataTable('#tblCat')) {
                            $('#tblCat').DataTable().destroy();
                        }
                        $('#tblCat tbody').empty();
                        $("#tblCat").append(txt);
                        // $("#totalmcqs").text("Total Number of Mcqs is " + totalmcqs + "  Approximately");
                        example_tbl = $("#tblCat").DataTable(
                             {
                                 footerCallback: function (row, data, start, end, display) {
                                     var api = this.api(), data;

                                     // Remove the formatting to get integer data for summation
                                     var intVal = function (i) {
                                         return typeof i === 'string' ?
                                             i.replace(/[\$,]/g, '') * 1 :
                                             typeof i === 'number' ?
                                             i : 0;
                                     };

                                     // Total over all pages
                                     total = api
                                         .column(4)
                                         .data()
                                         .reduce(function (a, b) {
                                             return intVal(a) + intVal(b);
                                         }, 0);

                                     // Total over this page
                                     pageTotals = api
                                         .column(3, { page: 'current' })
                                         .data()
                                         .reduce(function (a, b) {
                                             return intVal(a) + intVal(b);
                                         }, 0);

                                     // Total over this page
                                     pageTotalt = api
                                         .column(4, { page: 'current' })
                                         .data()
                                         .reduce(function (a, b) {
                                             return intVal(a) + intVal(b);
                                         }, 0);
                                     // Total over this page
                                     pageTotalm = api
                                         .column(5, { page: 'current' })
                                         .data()
                                         .reduce(function (a, b) {
                                             return intVal(a) + intVal(b);
                                         }, 0);

                                     // Update footer
                                     $(api.column(3).footer()).html(
                                         pageTotals
                                     );
                                     $(api.column(4).footer()).html(
                                       pageTotalt
                                     );
                                     $(api.column(5).footer()).html(
                                        pageTotalm
                                     );
                                 },
                                 paging: true,
                                 responsive: false,
                                 columnDefs: [
                                { responsivePriority: 0, targets: 0 },
                                { responsivePriority: 2, targets: 2 }
                                 ],
                                 "columnDefs": [
                                     {
                                         "targets": [1],
                                         "visible": false,
                                         "searchable": false
                                     }
                                 ],
                                 select: {
                                     style: 'multi'
                                 }
                             }

                            );

                    }
                }

            },
            error: function (data) {
                alert("Error");
            }
        });

        $('#divAddedCatTable').show(1000);
        Scroll_top();
        return false;
    })
    // Show Staff
    $('.StaffShow').click(function () {
        hide_all();
        var id = "";
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/StaffDetail",
            data: "{'id':'" + id + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var totallen = data.d.length;
                var txt = "";
                var totalmcqs = 0;
                var index_no = 1;
                var isactive_ = "";
                //alert(len);
                if (len > 0) {
                    for (var i = 0; i < len; i++) {

                        if (data.d[i].isactive == 0) {
                            isactive_ = "Not Active";
                        }
                        else {
                            isactive_ = "Active";
                        }
                        txt += '<tr><td>' + index_no++ + '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].Name +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].Qual +
                            '</td><td >' + data.d[i].Mobno +
                             '</td><td >' + data.d[i].TotalMcqs +
                            '</td><td style="font-size: 10px;">' + data.d[i].TotalExp +
                            '</td><td><label style="font-size: 12px;">' + isactive_ +
                            '</label></td><td>' + data.d[i].JoinDate + '</td></tr>';
                        // totalmcqs = totalmcqs + data.d[i].TotalMcqs;
                    }

                    if (txt != '') {

                        if ($.fn.DataTable.isDataTable('#tblStaff')) {
                            $('#tblStaff').DataTable().destroy();
                        }




                        $('#tblStaff tbody').empty();
                        $("#tblStaff").append(txt);
                        // $("#totalmcqs").text("Total Number of Mcqs is " + totalmcqs + "  Approximately");
                        example_tbl = $("#tblStaff").DataTable(
                             {
                                 paging: true,
                                 responsive: true,
                                 columnDefs: [
                                { responsivePriority: 1, targets: 0 },
                                { responsivePriority: 2, targets: 1 },
                                 { responsivePriority: 4, targets: 4 },
                                 { responsivePriority: 5, targets: 5 }
                                 ],

                             }
                            );

                    }
                }
                //  setTimeout($.unblockUI, 1000);

            },
            error: function (data) {
                alert("Error");
            }
        });

        $('#divAddedStaffTable').show(1000);
        Scroll_top();
        return false;
    })



    // Edit User
    $('.editStaff').click(function () {
        hide_all();
        $("#ddlEditStaff").empty();
        $("#ddlEditStaff").append($("<option></option>").val("0").html("Select One"))
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlStaffs",
            data: "{}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlEditStaff").append($("<option></option>").val(value.StaffId).html(value.Name));

                });
            },
            error: function (Result) {
                alert("Error to load Users drop down lists");
            }
        });

        $('#divEditStaff').show(1000);
        Scroll_top();
        return false;
    })
    $("#tblShowUsers").on("click", '.viewUserAllmcqs ', function (event) {

        // alert('I am detail :)');
        // var id = myTable.data(this)[0];
        //var result = confirm("Are you sure to Clear this Objection ?");
        // if (result) {
        var tr = $(this).closest('tr');
        var row = example_tbl.row(tr);
        var AdminId = example_tbl.row(row[0][0]).data()[1];
        showmcqs(AdminId)




        // Scroll_top();
        //  hide_all();
        // alert('hello    == id is = ' + Id + ' and row = ' + row + ' tr = ' + tr);
        // showPractice(Id);
        // $("#mainheader").hide();
        //  $("#testheader").show();
        // goToByScroll();
        // $(window).scrollTop($('#tblLoadMcqsAllQuestion').offset().top);
        //$('#btnShowResultdiv').show(200);

        //displayUserInfo(id);
    });
    $("#tblReportUser").on("click", '.viewMcqsReportedDetail ', function (event) {
        ////debugger;
        // alert('I am detail :)');
        // var id = myTable.data(this)[0];
        //var result = confirm("Are you sure to Clear this Objection ?");
        // if (result) {
        var tr = $(this).closest('tr');
        var row = example_tbl.row(tr);
        var McqsId = example_tbl.row(row[0][0]).data()[11];
        var subId = example_tbl.row(row[0][0]).data()[12];
        var testId = example_tbl.row(row[0][0]).data()[13];
        // alert("subid " + subId +"  and testid " + testId)
        $("#ddlShowMcqsQuestion").empty();
        $('#ddlSubject').empty();
        $('#ddlTest').empty();
        $('#ddlShowMcqsQuestionSubject').empty();
        $('#ddlShowMcqsQuestionTest').empty();

        $("#ddlShowMcqsQuestion").append($("<option></option>").val(McqsId).html(McqsId));
        $("#ddlShowMcqsQuestion").trigger("chosen:updated");

        //$("#ddlSubject").append($("<option></option>").val(subId).html(subId));
        //$("#ddlSubject").trigger("chosen:updated");

        //$("#ddlTest").append($("<option></option>").val(testId).html(testId));
        //$("#ddlTest").trigger("chosen:updated");

        $("#ddlShowMcqsQuestionSubject").append($("<option></option>").val(subId).html(subId));
        $("#ddlShowMcqsQuestionSubject").trigger("chosen:updated");

        $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(testId).html(testId));
        $("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

        $("#ddlShowMcqsQuestion").val(McqsId);
        //$('#ddlSubject').val(subId);
        //$('#ddlTest').val(testId);
        $('#ddlShowMcqsQuestionSubject').val(subId);
        $('#ddlShowMcqsQuestionTest').val(testId);
        //  $("#lblTestNamed").html("Test Name: " + example_tbl.row(row[0][0]).data()[0] + "-" + example_tbl.row(row[0][0]).data()[1]);
        // $("#totr").html('');
        //$("#totr_text").html('');
        $("#btnShowMcqsQuestion").click();

        // Scroll_top();
        //  hide_all();
        // alert('hello    == id is = ' + Id + ' and row = ' + row + ' tr = ' + tr);
        // showPractice(Id);
        // $("#mainheader").hide();
        //  $("#testheader").show();
        // goToByScroll();
        // $(window).scrollTop($('#tblLoadMcqsAllQuestion').offset().top);
        //$('#btnShowResultdiv').show(200);

        //displayUserInfo(id);
    });
    $("#tblShowMcqsAddNonRegUser").on("click", '.viewAddMcqsDetail ', function (event) {
        ////debugger;
        // alert('I am detail :)');
        // var id = myTable.data(this)[0];
        //var result = confirm("Are you sure to Clear this Objection ?");
        // if (result) {

        var tr = $(this).closest('tr');
        var row = example_tbl.row(tr);
        var McqsId = example_tbl.row(row[0][0]).data()[1];
        var subId = example_tbl.row(row[0][0]).data()[4];
        var testId = example_tbl.row(row[0][0]).data()[3];
        // alert("subid " + subId +"  and testid " + testId)
        $("#ddlShowMcqsQuestion").empty();
        $('#ddlSubject').empty();
        $('#ddlTest').empty();
        $('#ddlShowMcqsQuestionSubject').empty();
        $('#ddlShowMcqsQuestionTest').empty();

        $("#ddlShowMcqsQuestion").append($("<option></option>").val(McqsId).html(McqsId));
        $("#ddlShowMcqsQuestion").trigger("chosen:updated");

        //$("#ddlSubject").append($("<option></option>").val(subId).html(subId));
        //$("#ddlSubject").trigger("chosen:updated");

        //$("#ddlTest").append($("<option></option>").val(testId).html(testId));
        //$("#ddlTest").trigger("chosen:updated");

        $("#ddlShowMcqsQuestionSubject").append($("<option></option>").val(subId).html(subId));
        $("#ddlShowMcqsQuestionSubject").trigger("chosen:updated");

        $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(testId).html(testId));
        $("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

        $("#ddlShowMcqsQuestion").val(McqsId);
        //$('#ddlSubject').val(subId);
        //$('#ddlTest').val(testId);
        $('#ddlShowMcqsQuestionSubject').val(subId);
        $('#ddlShowMcqsQuestionTest').val(testId);
        //  $("#lblTestNamed").html("Test Name: " + example_tbl.row(row[0][0]).data()[0] + "-" + example_tbl.row(row[0][0]).data()[1]);
        // $("#totr").html('');
        //$("#totr_text").html('');
        $("#btnShowMcqsQuestion").click();

        // Scroll_top();
        //  hide_all();
        // alert('hello    == id is = ' + Id + ' and row = ' + row + ' tr = ' + tr);
        // showPractice(Id);
        // $("#mainheader").hide();
        //  $("#testheader").show();
        // goToByScroll();
        // $(window).scrollTop($('#tblLoadMcqsAllQuestion').offset().top);
        //$('#btnShowResultdiv').show(200);

        //displayUserInfo(id);
    });
    $("#tblReportUser").on("click", '.viewMcqsReportedClear ', function (event) {
        // //debugger;
        // alert('I am detail :)');
        // var id = myTable.data(this)[0];
        var tr = $(this).closest('tr');
        var row = example_tbl.row(tr);
        var ReportId = example_tbl.row(row[0][0]).data()[10];



        // alert("subid " + subId +"  and testid " + testId)
        var result = confirm("Are you sure to Clear this Objection ?");
        if (result) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "myindex.aspx/InsertReportStatus",
                data: "{'ReportId':'" + ReportId + "','Emyadminid':'" + Emyadminid + "'}",
                timeout: 90000, dataType: "json",
                success: function (data) {
                    example_tbl.row(row).remove().draw(false);
                    alertify.success("Reported Done Successfully")

                },
                error: function (data) {
                    alert("Some Error occoured. Please Try again later.");
                }
            });
        }

        // Scroll_top();
        //  hide_all();
        // alert('hello    == id is = ' + Id + ' and row = ' + row + ' tr = ' + tr);
        // showPractice(Id);
        // $("#mainheader").hide();
        //  $("#testheader").show();
        // goToByScroll();
        // $(window).scrollTop($('#tblLoadMcqsAllQuestion').offset().top);
        //$('#btnShowResultdiv').show(200);

        //displayUserInfo(id);
    });
    $('.ReportUser').click(function () {
        hide_all();
        // 
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadUserReportedMcqs",
            data: "{'Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var totallen = data.d.length;
                var txt = "";
                var totalmcqs = 0;
                var reprt_type = "";
                var reprt_meaning = "";
                //alert(len);
                if (len > 0) {
                    for (var i = 0; i < len; i++) {

                        reprt_type = data.d[i].Report_Type;
                        console.log(reprt_type)
                        switch (parseInt(reprt_type)) {
                            case 1:
                                reprt_meaning = "The Answer is Incorrect.";
                                break;
                            case 2:
                                reprt_meaning = "The Question is Incomplete.";
                                break;
                            case 3:
                                reprt_meaning = "The Option is not clear.";
                                break;
                            case 4:
                                reprt_meaning = "I only doubt in it.";
                                break;
                            default:
                                reprt_meaning = "No option selected";
                                break;

                        }
                        var orderdate = new Date(parseInt(data.d[i].ReportTime.replace("/Date(", "").replace(")/", ""), 10));


                        txt += '<tr><td></td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].SubName +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].TestName +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].mcqstext +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].Report_OptionText +
                            '</label></td><td><label style="font-size: 12px;">' + reprt_meaning +
                            '</td><td><label style="font-size: 12px;">' + orderdate.toDateString('d/m/yyyy') +
                             '</td><td><a href="#" class="btn btn-info viewMcqsReportedDetail">View Detail</a>' +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].ReporterName +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].ReporterEmail +
                            '</td><td data-hidden="1">' + data.d[i].ReportId +
                             '</td><td data-hidden="1">' + data.d[i].Report_McqsId +
                              '</td><td data-hidden="1">' + data.d[i].subid +
                               '</td><td data-hidden="1">' + data.d[i].testid +
                                '</td><td><a href="#" class="btn btn-success viewMcqsReportedClear">Issue Resolved</a>' + ' </td></tr>';



                        // totalmcqs = totalmcqs + data.d[i].TotalMcqs; viewMcqsReportedClear
                    }

                    if (txt != '') {

                        if ($.fn.DataTable.isDataTable('#tblReportUser')) {
                            $('#tblReportUser').DataTable().destroy();
                        }




                        $('#tblReportUser tbody').empty();
                        $("#tblReportUser").append(txt);
                        // $("#totalmcqs").text("Total Number of Mcqs is " + totalmcqs + "  Approximately");
                        example_tbl = $("#tblReportUser").DataTable(
                             {
                                 "columnDefs": [

                                   {
                                       "targets": 0,
                                       "searchable": false,
                                       "orderable": false,

                                   }],
                                 "order": [[1, 'asc']],
                                 paging: true,
                                 responsive: false,
                                 columnDefs: [
                                { responsivePriority: 1, targets: 2 },
                                { responsivePriority: 2, targets: 1 },
                                 { responsivePriority: 4, targets: 4 },
                                 { responsivePriority: 5, targets: 5 }
                                 ],
                                 "columnDefs": [

                                     {
                                         "targets": [10],
                                         "visible": false,
                                         "searchable": false
                                     },
                                      {
                                          "targets": [11],
                                          "visible": false,
                                          "searchable": false
                                      },
                                       {
                                           "targets": [12],
                                           "visible": false,
                                           "searchable": false
                                       },
                                     {
                                         "targets": [13],
                                         "visible": false,
                                         "searchable": false
                                     }
                                 ],




                                 select: {
                                     style: 'multi'
                                 }
                             }

                            );

                        example_tbl.on('order.dt search.dt', function () {
                            example_tbl.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                                cell.innerHTML = i + 1;
                            });
                        }).draw()

                    }
                }
                //  setTimeout($.unblockUI, 1000);

            },
            error: function (data) {
                alert("Error");
            }
        });
        $('#divReportUser').show(1000);
        Scroll_top();
        return false;
    })
    $('.UserSummary').click(function () {
        hide_all();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/UserSummary",
            data: "{'Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var totallen = data.d.length;
                var txt = "";
                var totalmcqs = 0;
                var reprt_type = "";
                var reprt_meaning = "";
                //alert(len);
                if (len > 0) {
                    for (var i = 0; i < len; i++) {


                        // var orderdate = new Date(parseInt(data.d[i].ReportTime.replace("/Date(", "").replace(")/", ""), 10));


                        txt += '<tr><td></td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].AdminId +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].UserRoleId +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].AdminImage +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].AdminName +
                            '</td><td><label style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].AdminEmail +
                            '</label></td><td><label style="font-size: 12px;">' + data.d[i].AdminPassword +

                            '</label></td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].Total_Sub_Users +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].RoleName +
                            '</td><td >' + data.d[i].Total_Admin_Mcqs +
                             '</td><td  >' + data.d[i].Report_McqsId +
                              '</td><td><a href="#" class="btn btn-info viewUserAllmcqs">View Detail</a>' +
                             ' </td></tr>';



                        // totalmcqs = totalmcqs + data.d[i].TotalMcqs; viewMcqsReportedClear
                    }

                    if (txt != '') {

                        if ($.fn.DataTable.isDataTable('#tblShowUsers')) {
                            $('#tblShowUsers').DataTable().destroy();
                        }




                        $('#tblShowUsers tbody').empty();
                        $("#tblShowUsers").append(txt);
                        // $("#totalmcqs").text("Total Number of Mcqs is " + totalmcqs + "  Approximately");
                        example_tbl = $("#tblShowUsers").DataTable(
                             {
                                 "autoWidth": false,
                                 "columnDefs": [
                                     // { "width": "20%", "targets": 5 },
                                   {
                                       "targets": 0,
                                       "searchable": false,
                                       "orderable": false,

                                   }],
                                 "order": [[1, 'asc']],
                                 paging: true,
                                 responsive: false,

                                 "columnDefs": [

                                     {
                                         "targets": [1],
                                         "visible": false,
                                         "searchable": false
                                     },
                                      {
                                          "targets": [2],
                                          "visible": false,
                                          "searchable": false
                                      }
                                      ,
                                      {
                                          "targets": [10],
                                          "visible": false,
                                          "searchable": false
                                      }

                                 ],




                                 select: {
                                     style: 'multi'
                                 }
                             }

                            );

                        example_tbl.on('order.dt search.dt', function () {
                            example_tbl.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                                cell.innerHTML = i + 1;
                            });
                        }).draw()

                    }
                }
                //  setTimeout($.unblockUI, 1000);

            },
            error: function (data) {
                alert("Error");
            }
        });
        $('#divAddedUserTable').show(1000);
        Scroll_top();
        return false;
    })
    // Non Reg Users Added Mcqs
    $('.Non_Reg_Users_Add_Mcqs').click(function () {
        hide_all();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/UserAddedMcqs",
            data: "{'Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var totallen = data.d.length;
                var txt = "";
                var totalmcqs = 0;
                var reprt_type = "";
                var reprt_meaning = "";
                //alert(len);
                if (len > 0) {
                    for (var i = 0; i < len; i++) {


                        // var orderdate = new Date(parseInt(data.d[i].ReportTime.replace("/Date(", "").replace(")/", ""), 10));
                        var dateString = data.d[i].InsertedDate.substr(6);
                        var currentTime = new Date(parseInt(dateString));
                        var month = currentTime.getMonth() + 1;
                        var day = currentTime.getDate();
                        var year = currentTime.getFullYear();
                        //  var curTime = currentTime.getTimezoneOffset();
                        var date = day + "-" + month + "-" + year;

                        txt += '<tr><td></td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].McqsId +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].TestId +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].SubjectId +
                            '</td><td><label style="font-size: 12px; font-weight: bold; ">' + data.d[i].CatName +
                            '</label></td><td><label style="font-size: 12px;">' + data.d[i].SubjectName +

                            '</label></td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].TestName +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + date +
                            '</td><td><a href="#" class="btn btn-info viewAddMcqsDetail">View Detail</a>' +
                             ' </td></tr>';



                        // totalmcqs = totalmcqs + data.d[i].TotalMcqs; viewMcqsReportedClear
                    }

                    if (txt != '') {

                        if ($.fn.DataTable.isDataTable('#tblShowMcqsAddNonRegUser')) {
                            $('#tblShowMcqsAddNonRegUser').DataTable().destroy();
                        }




                        $('#tblShowMcqsAddNonRegUser tbody').empty();
                        $("#tblShowMcqsAddNonRegUser").append(txt);
                        // $("#totalmcqs").text("Total Number of Mcqs is " + totalmcqs + "  Approximately");
                        example_tbl = $("#tblShowMcqsAddNonRegUser").DataTable(
                             {
                                 "autoWidth": false,
                                 "columnDefs": [
                                     // { "width": "20%", "targets": 5 },
                                   {
                                       "targets": 0,
                                       "searchable": false,
                                       "orderable": false,

                                   }],
                                 "order": [[1, 'asc']],
                                 paging: true,
                                 responsive: false,

                                 "columnDefs": [

                                     {
                                         "targets": [1],
                                         "visible": false,
                                         "searchable": false
                                     },
                                      {
                                          "targets": [2],
                                          "visible": false,
                                          "searchable": false
                                      }
                                      ,
                                      {
                                          "targets": [3],
                                          "visible": false,
                                          "searchable": false
                                      },
                                      {
                                          "targets": [4],
                                          "visible": false,
                                          "searchable": false
                                      }

                                 ],




                                 select: {
                                     style: 'multi'
                                 }
                             }

                            );

                        example_tbl.on('order.dt search.dt', function () {
                            example_tbl.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                                cell.innerHTML = i + 1;
                            });
                        }).draw()

                    }
                }
                //  setTimeout($.unblockUI, 1000);

            },
            error: function (data) {
                alert("Error");
            }
        });
        $('#divMcqsAddNonRegUser').show(1000);
        Scroll_top();
        return false;
    })
    // Insert Subject
    $('.insertSub').click(function () {
        hide_all();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlCat",
            data: "{'dadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    //  $("#ddlShowMcqsQuestionSubject").empty();

                    $("#ddlCatlist").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    $("#ddlCatlist").trigger("chosen:updated");
                    // $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    //  var subId = $("#ddlShowMcqsQuestionSubject").val();

                    //$.ajax({

                    //    type: "POST",
                    //    contentType: "application/json; charset=utf-8",
                    //    url: "myindex.aspx/LoadddlTestForSpecificSub",
                    //    data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
                    //    timeout: 90000, dataType: "json",
                    //    success: function (Result) {
                    //        $.each(Result.d, function (key, value) {
                    //            // $("#ddlShowMcqsQuestionTest").empty();

                    //            $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                    //            $("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

                    //        });
                    //    },
                    //    error: function (Result) {
                    //        alertify.error("There is an Error Please try later");
                    //    }
                    //});

                });
            },
            error: function (Result) {
                alertify.error("Error to load Category drop down lists");
            }
        });
        $('#ddlCatlist').show(1000);
        $('#divSubjectSetteings').show(1000);
        $('#divAddMoreSubjects').show(1000);
        Scroll_top();
        return false;
    })
    $('.insertCat').click(function () {
        hide_all();
        $('#divSubjectSetteings').show(1000);
        $('#divAddMoreSubjects').show(1000);
        Scroll_top();
        return false;
    })

    // Show cat


    //Edit Subject
    $('.editSub').click(function () {
        hide_all();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlCat",
            data: "{'dadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    //  $("#ddlShowMcqsQuestionSubject").empty();

                    $("#ddlEditCatlist").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    $("#ddlEditCatlist").trigger("chosen:updated");
                    // $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    //  var subId = $("#ddlShowMcqsQuestionSubject").val();

                    //$.ajax({

                    //    type: "POST",
                    //    contentType: "application/json; charset=utf-8",
                    //    url: "myindex.aspx/LoadddlTestForSpecificSub",
                    //    data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
                    //    timeout: 90000, dataType: "json",
                    //    success: function (Result) {
                    //        $.each(Result.d, function (key, value) {
                    //            // $("#ddlShowMcqsQuestionTest").empty();

                    //            $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                    //            $("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

                    //        });
                    //    },
                    //    error: function (Result) {
                    //        alertify.error("There is an Error Please try later");
                    //    }
                    //});

                });
            },
            error: function (Result) {
                alertify.error("Error to load Category drop down lists");
            }
        });
        $('#ddlEditCatlist').show(1000);
        $('#divSubjectSetteings').show(1000);
        $('.editSub').show(1000);
        $("#ddlEditSubjectNames").empty();
        $("#ddlEditSubjectNames").append($("<option></option>").val(0).html('Select Subject'));


        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    //  $("#ddlShowMcqsQuestionSubject").empty();

                    $("#ddlEditSubjectNames").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    $("#ddlEditSubjectNames").trigger("chosen:updated");
                    // $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    //  var subId = $("#ddlShowMcqsQuestionSubject").val();

                    //$.ajax({

                    //    type: "POST",
                    //    contentType: "application/json; charset=utf-8",
                    //    url: "myindex.aspx/LoadddlTestForSpecificSub",
                    //    data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
                    //    timeout: 90000, dataType: "json",
                    //    success: function (Result) {
                    //        $.each(Result.d, function (key, value) {
                    //            // $("#ddlShowMcqsQuestionTest").empty();

                    //            $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                    //            $("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

                    //        });
                    //    },
                    //    error: function (Result) {
                    //        alertify.error("There is an Error Please try later");
                    //    }
                    //});

                });
            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists");
            }
        });
        Scroll_top();
        return false;
    })

    $("#btnLoadUserSub").click(function () {
        $("#ddlsubassigned").empty();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    //  $("#ddlShowMcqsQuestionSubject").empty();

                    $("#ddlsubassigned").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    //  $("#ddlsubassigned").trigger("chosen:updated");
                });
                alertify.success("Updated Subjects Loaded Successfully :)");
                //  //debugger;


                var list = $("#hiduserselectedsub").val().split(",");


                if (list.length > 1) {
                    // for (i = 0; i < list.length; i++) {
                    $("#ddlsubassigned").val(list);
                    //}


                }
                else {
                    $("#ddlsubassigned").val();
                }
                // $("#ddlsubassigned").multiSelect('deselect_all');
                $("#ddlsubassigned").multiSelect({

                    selectableHeader: "<div class='custom-header'  style='background: darkblue;color: white;'>Please select given below Subject To Show the Users</div>",
                    selectionHeader: "<div class='custom-header' style='background: darkgreen;color: beige;'>Only given below Subject's Show to the this users</div>",
                    // selectableFooter: "<div class='custom-header'></div>",
                    //selectionFooter: "<div class='custom-header'>Selection footer</div>"
                }).multiSelect('deselect_all').multiSelect('select', list);
            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists");
            }
        });

    })
    $("#btnLoadUserTest").click(function () {

        $("#ddltestassigned").empty();
        $.ajax({

            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlTestForUser",
            data: "{'Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddltestassigned").append($("<option></option>").val(value.TestId).html(value.TestName));
                    $("#ddltestassigned").trigger("chosen:updated");

                });

                var list = $("#hiduserselectedtest").val().split(",");


                if (list.length > 1) {
                    // for (i = 0; i < list.length; i++) {
                    $("#ddltestassigned").val(list);
                    //}


                }
                else {
                    $("#ddltestassigned").val();
                }

                // $("#ddltestassigned").val(loadedtest);
                $("#ddltestassigned").multiSelect({
                    selectableHeader: "<div class='custom-header' style='background: darkblue;color: white;'>Please select given below TEST To Show the Users</div>",
                    selectionHeader: "<div class='custom-header' style='background: darkgreen;color: beige;'>Only given below TEST's Show to the this users</div>",
                    // selectableFooter: "<div class='custom-header'></div>",
                    //selectionFooter: "<div class='custom-header'>Selection footer</div>"
                }).multiSelect('deselect_all').multiSelect('select', list);;
                alertify.success("Updated Test Loaded Successfully :)");
            },
            error: function (Result) {
                alertify.error("There is an Error.Please try again later");
            }

        });
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
        $("#ddlSubjectNameList").empty();
        $("#ddlSubject").empty();
        $("#ddlEditSubjectNames").empty();
        $("#ddlDeleteSubjectNames").empty();
        $("#ddlSubjectAdvancedSettings").empty();
        $("#ddlDeleteReplaceSubjectWithExistingSubject").empty();
        $("#ddlDeleteOnlySubjectSettings").empty();
        $("#ddlSubjectlistForEditTest").empty();
        $("#ddlSubjectlistForEditTest").empty();
        $("#ddlSubjectlistForDeleteTest").empty();
        $("#ddlSubjectlistToMergeTest").empty();
        $("#ddlNewSubjectlistForMergeTest").empty();
        $("#ddlSubjectlistShowTestQuestions").empty();
        $("#ddlSubjectlistForAddTest").empty();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
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
                alertify.success("Loaded Successfully ");
            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists");
            }
        });
        $('#AddNewTest').show(1000);
        Scroll_top();
        return false;
    })
    // Edit Test
    $('.editTest').click(function () {
        hide_all();
        $("#ddlSubjectNameList").empty();
        $("#ddlSubject").empty();
        $("#ddlEditSubjectNames").empty();
        $("#ddlDeleteSubjectNames").empty();
        $("#ddlSubjectAdvancedSettings").empty();
        $("#ddlDeleteReplaceSubjectWithExistingSubject").empty();
        $("#ddlDeleteOnlySubjectSettings").empty();
        $("#ddlSubjectlistForEditTest").empty();
        // $("#ddlSubjectlistForEditTest").empty();
        $("#ddlSubjectlistForEditTest").append($("<option></option>").val('0').html('Select Subject'));
        $("#ddlSubjectlistForDeleteTest").empty();
        $("#ddlSubjectlistToMergeTest").empty();
        $("#ddlNewSubjectlistForMergeTest").empty();
        $("#ddlSubjectlistShowTestQuestions").empty();
        $("#ddlSubjectlistForAddTest").empty();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
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
                alertify.success("Loaded Successfully ");
            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists");
            }
        });
        $('#divEditTest').show(1000);

        Scroll_top();
        return false;
    })
    // Delete Test
    $('.DelTest').click(function () {
        hide_all();

        $("#ddlSubjectlistForDeleteTest").empty();
        $("#ddlSubjectlistForDeleteTest").append($("<option></option>").val('0').html('Select Subject'));

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlSubjectlistForDeleteTest").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));


                });
                alertify.success("Loaded Successfully ");
            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists");
            }
        });
        $('#divDeleteTest').show(1000);
        Scroll_top();
        return false;
    })

    //Merge Test MergeTest
    var example_tbl = "";
    var checkbitforMergeTestExplanation = 0;
    $('.MergeTest').click(function () {
        hide_all();
        if ($.fn.DataTable.isDataTable('#example')) {
            $('#example').DataTable().destroy();
        }

        $('#example tbody').empty();
        if (checkbitforMergeTestExplanation == 0) {
            checkbitforMergeTestExplanation = 1;

            CKEDITOR.replace('MergeTestInstructions', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            }).setData("Add Test Instructions!");
        }
        $('#divMergeTest').show(1000);
        var CurrentTestid = 0;
        var myTable;
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/default.aspx/LoadHomePages",
            data: "{'subid':'-1'}",
            dataType: "json",
            timeout: (2 * 1000000),
            beforeSend: function () {
                //blockui();
                //  $('#divloading').html('Please Wait while loading your requested contents...');
                //$('#lblQuestionBefore').html("Saving...");



            },
            complete: function () {
                $('#divloading').html('');
                //$('#lblQuestionBefore').html('');
                // $('#lblQuestionComplete').html("Saved");


            },
            success: function (data) {
                var len = data.d.length;
                var totallen = data.d.length;
                var txt = "";
                var totalmcqs = 0;
                //alert(len);
                if (len > 0) {
                    for (var i = 0; i < len; i++) {

                        txt += '<tr><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].SubjectName +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].TestName +
                            '</td><td data-hidden="1" >' + data.d[i].TestId +
                             '</td><td data-hidden="1" >' + data.d[i].SubId +
                            '</td><td style="font-size: 10px;">' + data.d[i].AdminName +
                            '</td><td><label style="font-size: 12px;">' + data.d[i].TotalMcqs +
                            '</label></td><td> <input type="checkbox" class=" Practice" value="' + data.d[i].TestId + '" data-subid="' + data.d[i].SubId + '" name="alltestids[]" id="alltestids[]"> </td>' +
                            '<td><select id=' + data.d[i].TestId + "_ddlMergeTestSeclist" + ' class="ddlMergeTestSeclist"></select></td><td><input id=' + data.d[i].TestId + "_gettotalqMergeTest" + ' class="gettotalqMergeTest" type="number"></td></tr>';
                        totalmcqs = totalmcqs + data.d[i].TotalMcqs;
                    }

                    if (txt != '') {

                        $('#example tbody').empty();
                        $("#example").append(txt);
                        // $("#totalmcqs").text("Total Number of Mcqs is " + totalmcqs + "  Approximately");
                        example_tbl = $("#example").DataTable(
                             {
                                 paging: false,
                                 responsive: true,
                                 columnDefs: [
                                { responsivePriority: 1, targets: 0 },
                                { responsivePriority: 2, targets: 1 },
                                 { responsivePriority: 4, targets: 4 },
                                 { responsivePriority: 5, targets: 5 }
                                 ],
                                 "columnDefs": [
                                     {
                                         "targets": [2],
                                         "visible": true,
                                         "searchable": false
                                     },
                                     {
                                         "targets": [3],
                                         "visible": true,
                                         "searchable": false
                                     }
                                 ],
                                 select: {
                                     style: 'multi'
                                 }
                             }
                            );

                    }



                }
                //  setTimeout($.unblockUI, 1000);

            },
            error: function (result) {

                alertify.error("Error occour in Loading Mcqs Please try again letter ! ");
                // setTimeout($.unblockUI, 1000);
            }
        })
        $("#ddlSubjectlistForMergeTest").empty();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlSubjectlistForMergeTest").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));


                });
                //alertify.success("Loaded Successfully ");
            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists");
            }
        });
        Scroll_top();
        return false;
    })
    //$("#example").on("click", '.Practice ', function (event) {

    //    // alert('I am Pracitce :)');
    //    // var id = myTable.data(this)[0];
    //    var tr = $(this).closest('tr');
    //    var row = myTable.row(tr);
    //    var Id = myTable.row(row[0][0]).data()[2];
    //    $("#lblTestNamed").html("Test Name: " + myTable.row(row[0][0]).data()[0] + "-" + myTable.row(row[0][0]).data()[1]);
    //    $("#totr").html('');
    //    $("#totr_text").html('');


    //    // Scroll_top();
    //    hide_all();
    //    // alert('hello    == id is = ' + Id + ' and row = ' + row + ' tr = ' + tr);
    //    showPractice(Id);
    //    $("#mainheader").hide();
    //    $("#testheader").show();
    //    // goToByScroll();
    //    // $(window).scrollTop($('#tblLoadMcqsAllQuestion').offset().top);
    //    //$('#btnShowResultdiv').show(200);

    //    //displayUserInfo(id);
    //});
    // Merge Test
    var MergeTestSecCounter = 0;
    $('#linkMergeTest').click(function () {
        hide_all();
        MergeTestSecCounter = 0;
        $("#diveMergeAddSection").html('');
        $('#divMergeTest').show(1000);
        Scroll_top();
        return false;
    })
    // Merge Test Add Section
    $('#MergeTestAddSection').click(function () {
        //hide_all();MergeTestSecCounter = 0;
        MergeTestSecCounter++;
        var secHtml = " <div class='row' id='divMergeTestAddSec" + MergeTestSecCounter + "' >" +
                                  "<div class='col-lg-3'><label text='" + MergeTestSecCounter + "' id='lblSecMergeTest" + MergeTestSecCounter + "' class='label-info '>" + MergeTestSecCounter + "</label>" +
                                  "<input type='text' id='MergeTestSec" + MergeTestSecCounter + "Name' placeholder='Sec Name' class='input-sm insertedMergeTestSec' />" +
                                   "</div> " +
                                   "<div class='col-lg-3'>" +
                                   "<input type='text' placeholder='Sec Detail' id='MergeTestSec" + MergeTestSecCounter + "Detail' class='input-sm' />" +
                                   "</div>" +
                                   "<div class='col-lg-3'>" +
                                   "<input type='text' placeholder='Sec Total Questions.' id='MergeTestSec" + MergeTestSecCounter + "TotalQuestions' class='input-sm'  />" +
                                   "</div>" +
                                  "<div class='col-lg-3'>" +
                                  "<input type='text' placeholder='Sec Priority.' id='MergeTestSec" + MergeTestSecCounter + "Priority' class='input-sm' />" +
                                  "</div> " +
                                  "</div></div>";
        $("#diveMergeAddSection").append(secHtml);
        //$('#divMergeTest').show(1000);
        //Scroll_top();
        return false;
    })
    $(document.body).on("focusout", ".insertedMergeTestSec", function event() {
        //alert('hello hi');
        //  debugger;
        var searchIDs = $("#example input:checkbox:checked").map(function () {
            var id = $(this).val();
            // var subid = $(this).data('subid');
            var secid = $("#" + id + "_ddlMergeTestSeclist").val();
            // var testTotalQ = $("#" + id + "_gettotalqMergeTest").val();
            return { id: id, secid: secid };
        }).get();

        $(".ddlMergeTestSeclist").empty();
        $(".ddlMergeTestSeclist").append($("<option></option>").val('0').html('Select One').val());
        for (i = 1; i <= MergeTestSecCounter; i++) {

            $(".ddlMergeTestSeclist").append($("<option></option>").val(i).html($('#MergeTestSec' + i + 'Name').val()));
        };
        for (i = 0; i < searchIDs.length; i++) {
            $("#" + searchIDs[i]['id'] + "_ddlMergeTestSeclist").val(searchIDs[i]['secid']);
        }


        //$(".ddlMergeTestSeclist").val(MergeTestSecCounter);

    })
    $('#MergeTestDelSection').click(function () {
        //hide_all();MergeTestSecCounter = 0;
        if (MergeTestSecCounter == 0) {
            alertify.error("No more Sections to Remove");
            return false;
        }
        var removeid = '#divMergeTestAddSec' + MergeTestSecCounter;
        $(removeid).remove();

        $(".ddlMergeTestSeclist option[value=" + MergeTestSecCounter + "]").remove();
        MergeTestSecCounter--;
        //$('#divMergeTest').show(1000);
        //Scroll_top();
        return false;
    })

    // Show Test
    $('.TestShow').click(function () {
        hide_all();
        $('#divShowTestMcqs').show(1000);
        Scroll_top();
        return false;
    })

    var checkbitforexpandrefckeditor = 0;
    parseInt(checkbitforexpandrefckeditor++);
    console.log(checkbitforexpandrefckeditor);
    // //debugger;
    if (checkbitforexpandrefckeditor == 1) {


        CKEDITOR.replace('txtQuestion', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
        CKEDITOR.replace('txtOption1', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
        CKEDITOR.replace('txtOption2', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
        CKEDITOR.replace('txtOption3', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
        CKEDITOR.replace('txtOption4', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
        CKEDITOR.replace('txtOption5', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
        CKEDITOR.replace('txtOption6', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
        CKEDITOR.replace('txtOption7', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
        CKEDITOR.replace('txtOption8', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
        CKEDITOR.replace('txtReference', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
        CKEDITOR.replace('txtExplanation', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
    }
    //if (checkbitforexpandrefckeditor > 1) {
    //      CKEDITOR.instances.txtReference.destroy(true);
    //      CKEDITOR.instances.txtExplanation.destroy(true);
    //}


    // On the pages that have the select box
    ////debugger;
    var loadedPickup = JSON.parse(localStorage.getItem('ddlSubject'));
    var loadedtest = JSON.parse(localStorage.getItem('ddlTest'));
    updateinfo_dashboard();

    //  $("#userDashboard").show();

    $("#ddlSubject").empty();
    $("#ddlTest").empty();
    //$.ajax({
    //    type: "POST",
    //    contentType: "application/json; charset=utf-8",
    //    url: "myindex.aspx/LoadddlSubject",
    //    timeout: 90000,
    //    data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
    //    timeout: 90000, dataType: "json",
    //    success: function (Result) {
    //        var lengths = Result.d.length;
    //        if (lengths > 0) {

    //            $("#ddlSubject").append($("<option></option>").val(0).html('Select Subject'));
    //            $.each(Result.d, function (key, value) {
    //                $("#ddlSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
    //            });
    //            if (loadedPickup != null) {
    //                $('#ddlSubject').val(loadedPickup);

    //                $.ajax({

    //                    type: "POST",
    //                    contentType: "application/json; charset=utf-8",
    //                    url: "myindex.aspx/LoadddlTestForSpecificSub",
    //                    data: "{'SubId':'" + loadedPickup + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
    //                    timeout: 90000, dataType: "json",
    //                    success: function (Result) {
    //                        $.each(Result.d, function (key, value) {
    //                            $("#ddlTest").append($("<option></option>").val(value.TestId).html(value.TestName));
    //                            $("#ddlTest").trigger("chosen:updated");

    //                        });
    //                        $("#ddlTest").val(loadedtest);
    //                        alertify.success("Test Loaded Successfully :)");
    //                    },
    //                    error: function (Result) {
    //                        alertify.error("There is an Error.Please try again later");
    //                    }

    //                });
    //            }
    //        }
    //        else {
    //            alertify.log(" Step 1 is Add a Subject name and Step 2 is Add a Test name, if you fulfill both then login again or contact to Admin");
    //        }
    //    },
    //    error: function (jqXHR, exception) {
    //        var msg = '';
    //        if (jqXHR.status === 0) {
    //            msg = 'Not connect.\n Verify Network.';
    //        } else if (jqXHR.status == 404) {
    //            msg = 'Requested page not found. [404]';
    //        } else if (jqXHR.status == 500) {
    //            msg = 'Internal Server Error [500].';
    //        } else if (exception === 'parsererror') {
    //            msg = 'Requested JSON parse failed.';
    //        } else if (exception === 'timeout') {
    //            msg = 'Time out error.';
    //        } else if (exception === 'abort') {
    //            msg = 'Ajax request aborted.';
    //        } else {
    //            msg = 'Uncaught Error.\n' + jqXHR.responseText;
    //        }
    //        alertify.error(msg);
    //    }
    //});
    $("#ddlStaff_exp").empty();

    $("#ddlStaff_exp").append($("<option></option>").val("0").html("Select One"))
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "myindex.aspx/LoadddlStaffs",
        data: "{}",
        timeout: 90000, dataType: "json",
        success: function (Result) {
            $.each(Result.d, function (key, value) {
                $("#ddlStaff_exp").append($("<option></option>").val(value.StaffId).html(value.Name));

            });
        },
        error: function (Result) {
            alert("Error to load Staff drop down lists");
        }
    });


    $("#ddlTest").append($("<option></option>").val(0).html('Select Test'));
    IsEdit = 0;
    hide_all();
    //$('#divCommonSubTestNumb').show(100);

    //$('#divMcqsQuestion').show(1000);
    //$('#btnSave').show();
    //$('#divCommonSubTestNumb').show(1000);
    $('#userDashboard').show(1000);
    Scroll_top();


    $('#MainHeading').html('Insert Multiple choice Question(s) <small>Questions</small>');
    $('#breadcrumbpath').text('Insert Mcqs');
    $('#btnShowHidetxtQuestion').focus();
    $('.insertmcqs').click(function () {
        parseInt(checkbitforexpandrefckeditor++);
        // console.log(checkbitforexpandrefckeditor);
        // //debugger;
        if (checkbitforexpandrefckeditor == 1) {


            CKEDITOR.replace('txtQuestion', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption1', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption2', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption3', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption4', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption5', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption6', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption7', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtOption8', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtReference', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtExplanation', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
        }
        //if (checkbitforexpandrefckeditor > 1) {
        //      CKEDITOR.instances.txtReference.destroy(true);
        //      CKEDITOR.instances.txtExplanation.destroy(true);
        //}


        $("#ddlSubject").empty();
        $("#ddlTest").empty();

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlSubject",
            timeout: 90000,
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                var lengths = Result.d.length;
                if (lengths > 0) {

                    $("#ddlSubject").append($("<option></option>").val(0).html('Select Subject'));
                    $.each(Result.d, function (key, value) {
                        $("#ddlSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    });

                }
                else {
                    alertify.log(" Step 1 is Add a Subject name and Step 2 is Add a Test name, if you fulfill both then login again or contact to Admin");
                }
            },
            error: function (jqXHR, exception) {
                var msg = '';
                if (jqXHR.status === 0) {
                    msg = 'Not connect.\n Verify Network.';
                } else if (jqXHR.status == 404) {
                    msg = 'Requested page not found. [404]';
                } else if (jqXHR.status == 500) {
                    msg = 'Internal Server Error [500].';
                } else if (exception === 'parsererror') {
                    msg = 'Requested JSON parse failed.';
                } else if (exception === 'timeout') {
                    msg = 'Time out error.';
                } else if (exception === 'abort') {
                    msg = 'Ajax request aborted.';
                } else {
                    msg = 'Uncaught Error.\n' + jqXHR.responseText;
                }
                alertify.error(msg);
            }
        });
        $("#ddlStaff_exp").empty();

        $("#ddlStaff_exp").append($("<option></option>").val("0").html("Select One"))
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlStaffs",
            data: "{}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlStaff_exp").append($("<option></option>").val(value.StaffId).html(value.Name));

                });
            },
            error: function (Result) {
                alert("Error to load Staff drop down lists");
            }
        });
        $("#ddlTest").append($("<option></option>").val(0).html('Select Test'));
        IsEdit = 0;
        hide_all();
        $('#divCommonSubTestNumb').show(100);

        $('#divMcqsQuestion').show(1000);
        $('#btnSave').show();
        $('#divCommonSubTestNumb').show(1000);
        Scroll_top();


        $('#MainHeading').html('Insert Multiple choice Question(s) <small>Questions</small>');
        $('#breadcrumbpath').text('Insert Mcqs');
        //$('.insertmcqs').attr('href', '#divMcqsQuestion');
        //  return false;

    })

    var IsUpdateShortQuest = 0;
    var IsUpdateLongQuest = 0;

    var checkbitforshortQ = 0;
    var checkbitforlongQ = 0;

    $('.insertShortQ').click(function () {
        hide_all();
        parseInt(checkbitforshortQ++);
        if (checkbitforshortQ == 1) {
            CKEDITOR.replace('txtShortQuestion', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtShortAnswer', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
        }
        $('#ShortQuestion').show(1000);
        $('#divCommonSubTestNumb').show(1000);
        Scroll_top();
        $('#MainHeading').html('Insert Short Question(s) <small>Questions</small>');
        $('#breadcrumbpath').text('Insert Short Questions');
        $('.insertShortQ').attr('href', '#ShortQuestion');
        IsUpdateShortQuest = 0;
        return false;
    })
    function UploadPic() {
        ////debugger;

        var data = ("#fuStaffImg");//.toDataURL("image/png");
        data = data.replace(/^data:image\/(png|jpg);base64,/, "");
        $.ajax({
            timeout: 90000,
            type: 'POST',
            url: 'default.aspx/UploadPic',
            data: '{ "imageData" : "' + data + '"}',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (msg) {
                var picName_ser = msg.d;
                // var pic_paths = "http://www.freemcqs.com/facebook/" + picName_ser; $('#testimg').html('<img src="Facebook/' + picName_ser + '" height="275" width="526">');
                //document.body.removeChild(canvas);
                //FB.ui({ method: 'share', app_id: '1652596581731791', name: testName, href: 'http://www.freemcqs.com', link: 'http://www.freemcqs.com/', picture: pic_paths, caption: 'For more Free Mcqs Please visit www.Freemcqs.Com', description: 'Total MCQS of this ' + testName + ' is aproximately ' + TotalQuestions, message: '' });
                //Router.navigate(oldurl);
            }
        });
    };

    $('#btnShowShortQuestion').click(function () {
        var SubjectId = $('#ddlShowShortQuestionSubject').val();
        var TestId = $('#ddlShowShortQuestionTest').val();
        var QuestionId = $("#ddlShowShortQuestion").val();

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadShortQuestionsWithAllOptions",
            data: "{'shortQuestionId':'" + QuestionId + "','Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {

                for (var i = 0; i < data.d.length; i++) {
                    $('#ddlPoints').val(data.d[i].ShortQuestionPoints).change();
                    CKEDITOR.replace('txtShortQuestion', {
                        filebrowserBrowseUrl: '/FileBrowser',
                        filebrowserWindowWidth: 800,
                        filebrowserWindowHeight: 600

                    });
                    CKEDITOR.replace('txtShortAnswer', {
                        filebrowserBrowseUrl: '/FileBrowser',
                        filebrowserWindowWidth: 800,
                        filebrowserWindowHeight: 600

                    });
                    CKEDITOR.replace('txtShortQuestionExplanation', {
                        filebrowserBrowseUrl: '/FileBrowser',
                        filebrowserWindowWidth: 800,
                        filebrowserWindowHeight: 600

                    });
                    CKEDITOR.replace('txtShortQuestionReference', {
                        filebrowserBrowseUrl: '/FileBrowser',
                        filebrowserWindowWidth: 800,
                        filebrowserWindowHeight: 600

                    });
                    var QuestionText = data.d[i].ShortQuestionText.withBackSlash().unquoted();
                    if (QuestionText != "") {
                        CKEDITOR.instances.txtShortQuestion.setData(QuestionText.withBackSlash().unquoted());
                    }

                    // alert(QuestionText);
                    $('#txtShortQuestion').val(QuestionText.unquoted());
                    var AnswerText = data.d[i].ShortQuestionAnswer.withBackSlash().unquoted();
                    //alert(AnswerText);
                    $('#txtShortAnswer').val(AnswerText.unquoted());
                    var txtShortQuestionReference = data.d[i].ShortQuestionExplanationReference.withBackSlash().unquoted();
                    if (AnswerText != "") {
                        CKEDITOR.instances.txtShortAnswer.setData(AnswerText.withBackSlash().unquoted());
                    }

                    $('#txtShortQuestionReference').val(txtShortQuestionReference.unquoted());
                    if (txtShortQuestionReference != "") {
                        CKEDITOR.instances.txtShortRef.setData(txtShortQuestionReference.withBackSlash().unquoted());
                    }

                    var txtShortQuestionExplanation = data.d[i].ShortQuestionExplanationText.withBackSlash().unquoted();
                    if (txtShortQuestionExplanation != "") {
                        CKEDITOR.instances.txtShortExp.setData(txtShortQuestionExplanation.withBackSlash().unquoted());
                    }
                    $('#txtShortQuestionExplanation').val(txtShortQuestionExplanation.unquoted());


                    //CKEDITOR.instances.txtQuestion.setData(QuestionText.unquoted());
                    //CKEDITOR.instances.txtQuestion.setData(AnswerText.unquoted());
                    //CKEDITOR.instances.txtQuestion.setData(txtShortQuestionReference.unquoted());
                    //CKEDITOR.instances.txtQuestion.setData(txtShortQuestionExplanation.unquoted());
                    $('#lblShowQuestion').html(QuestionText.unquoted());
                    var SubjectName = data.d[i].SubjectName;
                    var TestName = data.d[i].TestName;
                    var points = data.d[i].Points;
                    $('#ddlSubject').append(SubjectName);
                    $('#ddlTest').append(TestName);
                    $('#ddlPoints').append(points);
                    alertify.success("Loadded Successfully");
                }

            },
            error: function (Result) {
                alertify.error("Show Short Question Error. Please Try again later");
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
            url: "myindex.aspx/LoadLongQuestionWithAllOption",
            data: "{'LongQuestionId':'" + QuestionId + "','Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {

                for (var i = 0; i < data.d.length; i++) {
                    $('#ddlPoints').val(data.d[i].LongQuestionPoints).change();
                    CKEDITOR.replace('txtLongQuestion', {
                        filebrowserBrowseUrl: '/FileBrowser',
                        filebrowserWindowWidth: 800,
                        filebrowserWindowHeight: 600

                    });
                    CKEDITOR.replace('txtLongAnswer', {
                        filebrowserBrowseUrl: '/FileBrowser',
                        filebrowserWindowWidth: 800,
                        filebrowserWindowHeight: 600

                    });
                    CKEDITOR.replace('txtLongQuestionExplanation', {
                        filebrowserBrowseUrl: '/FileBrowser',
                        filebrowserWindowWidth: 800,
                        filebrowserWindowHeight: 600

                    });
                    CKEDITOR.replace('txtLongQuestionReference', {
                        filebrowserBrowseUrl: '/FileBrowser',
                        filebrowserWindowWidth: 800,
                        filebrowserWindowHeight: 600

                    });
                    var QuestionText = data.d[i].LongQuestionText.withBackSlash();
                    // alert(QuestionText);
                    $('#txtLongQuestion').val(QuestionText.unquoted());
                    var AnswerText = data.d[i].LongQuestionAnswer.withBackSlash();
                    //alert(AnswerText);
                    $('#txtLongAnswer').val(AnswerText.unquoted());
                    var txtLongQuestionReference = data.d[i].LongQuestionExplanationReference.withBackSlash();
                    $('#txtLongQuestionReference').val(txtLongQuestionReference.unquoted());
                    var txtLongQuestionExplanation = data.d[i].LongQuestionExplanationText.withBackSlash();
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
                    alertify.success("Loaded Successfully");
                }

            },
            error: function (Result) {
                alertify.error("Show Long Question Error. Please try again later.");
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

        parseInt(checkbitforlongQ++);
        if (checkbitforlongQ == 1) {
            CKEDITOR.replace('txtLongQuestion', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
            CKEDITOR.replace('txtLongAnswer', {
                filebrowserBrowseUrl: '/FileBrowser',
                filebrowserWindowWidth: 800,
                filebrowserWindowHeight: 600

            });
        }
        $('#LongQuestion').show(1000);
        $('#divCommonSubTestNumb').show(1000);
        Scroll_top();
        $('#MainHeading').html('Insert Long Question(s) <small>Questions</small>');
        $('#breadcrumbpath').text('Insert Long Questions');
        $('.insertLongQ').attr('href', '#LongQuestion');
        IsUpdateLongQuest = 0;
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
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    //  $("#ddlDeleteMcqsQuestionSubject").empty();

                    $("#ddlDeleteMcqsQuestionSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    $("#ddlDeleteMcqsQuestionSubject").trigger("chosen:updated");
                    //  $("#ddlDeleteMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    var subId = $("#ddlDeleteMcqsQuestionSubject").val();
                });
                $.ajax({

                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "myindex.aspx/LoadddlTestForSpecificSub",
                    data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
                    timeout: 90000, dataType: "json",
                    success: function (Result) {
                        $.each(Result.d, function (key, value) {
                            // $("#ddlDeleteMcqsQuestionTest").empty();

                            $("#ddlDeleteMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                            //  $("#ddlDeleteMcqsQuestionTest").trigger("chosen:updated");

                        });
                        alertify.success("Loaded Successfully");
                    },
                    error: function (Result) {
                        alertify.error("There is an Error occoured. Please try again later.");
                    }
                });
            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists");
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
            url: "myindex.aspx/LoadddlTestForSpecificSub",
            data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                    $("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

                });
                alertify.success("Loaded Successfully");
            },
            error: function (Result) {
                alertify.error("There is an Error occoured. Please try again later");
            }
        });
    })
    // when test dropdown change in Show Mcqs
    $('#ddlShowMcqsQuestionTest').change(function () {
        //  alert('called');
        $("#ddlShowMcqsQuestion").empty();
        $("#ddlShowMcqsQuestion").append($("<option></option>").val(0).html('Select Question'));
        var SubId = $('#ddlShowMcqsQuestionSubject').val();
        var TestId = $('#ddlShowMcqsQuestionTest').val();
        //alert('called subid = ' + SubId + 'test id = ' + TestId);
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadMcqsQuestions_",
            data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    // alert('called ' + value.McqsQuestionId);
                    $("#ddlShowMcqsQuestion").append($("<option></option>").val(value.McqsQuestionId).html(value.McqsQuestion));
                    // $("#ddlShowMcqsQuestion").trigger("chosen:updated");
                });
                alertify.success("Loaded Successfully");
            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists. Please try again later.");
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
            url: "myindex.aspx/LoadddlTestForSpecificSub",
            data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlDeleteMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                    // $("#ddlDeleteMcqsQuestionTest").trigger("chosen:updated");

                });
                alertify.success("Loaded Successfully");
            }
            ,
            error: function (Result) {
                alertify.error("There is an Error. Please try again later.");
            }
        });
    })
    // When subject dropdown change in insert questions 
    $('#ddlSubject').change(function () {
        //debugger;
        //$("#ddlSubject").empty();
        $("#ddlTest").empty();
        $("#ddlTest").append($("<option></option>").val(0).html('Select Test'));
        var subId = $("#ddlSubject").val();
        // var pickupdatehour = $('#ddlSubject').val()
        localStorage.setItem('ddlSubject', subId);
        //alert(subId);
        $.ajax({

            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlTestForSpecificSub",
            data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                    $("#ddlTest").trigger("chosen:updated");

                });
                alertify.success("Test Loaded Successfully :)");
            },
            error: function (Result) {
                alertify.error("There is an Error.Please try again later");
            }

        });
    })
    $('#ddlSubjectlistForEditTest').change(function () {
        //debugger;
        //$("#ddlSubject").empty();
        $("#ddlTestlistForEditTest").empty();
        $("#ddlTestlistForEditTest").append($("<option></option>").val(0).html('Select Test'));
        var subId = $("#ddlSubjectlistForEditTest").val();
        // var pickupdatehour = $('#ddlSubject').val()
        localStorage.setItem('ddlSubject', subId);
        //alert(subId);
        $.ajax({

            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlTestForSpecificSub",
            data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlTestlistForEditTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                    $("#ddlTestlistForEditTest").trigger("chosen:updated");

                });
                alertify.success("Test Loaded Successfully :)");
            },
            error: function (Result) {
                alertify.error("There is an Error.Please try again later");
            }

        });
    })
    $('#ddlSubjectlistForDeleteTest').change(function () {
        ////debugger;
        //$("#ddlSubject").empty();
        $("#ddlTestlistForDeleteTest").empty();
        $("#ddlTestlistForDeleteTest").append($("<option></option>").val(0).html('Select Test'));
        var subId = $("#ddlSubjectlistForDeleteTest").val();
        // var pickupdatehour = $('#ddlSubject').val()
        localStorage.setItem('ddlSubject', subId);
        //alert(subId);
        $.ajax({

            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlTestForSpecificSub",
            data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlTestlistForDeleteTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                    $("#ddlTestlistForDeleteTest").trigger("chosen:updated");

                });
                alertify.success("Test Loaded Successfully :)");
            },
            error: function (Result) {
                alertify.error("There is an Error.Please try again later");
            }

        });
    })
    $('#ddlTest').change(function () {
        var TestId = $("#ddlTest").val();
        localStorage.setItem('ddlTest', TestId);
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
            url: "myindex.aspx/LoadMcqsQuestions_",
            data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlDeleteMcqsQuestion").append($("<option></option>").val(value.McqsQuestionId).html(value.McqsQuestion));
                    //  $("#ddlDeleteMcqsQuestion").trigger("chosen:updated");
                });
                alertify.success("Loaded Successfully");
            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists. Please try again later");
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
                url: "myindex.aspx/Delet_McqsQuestion",
                data: "{'TestId':'" + TestId + "','SubjectId':'" + SubjectId + "','QuestionId':'" + QuestionId + "','Emyadminid':'" + Emyadminid + "'}",
                timeout: 90000, dataType: "json",
                success: function (Result) {
                    alertify.success('Question Deleted Successfully!');
                    $("#ddlDeleteMcqsQuestion").empty();
                    var SubId = $('#ddlDeleteMcqsQuestionSubject').val();
                    var TestId = $('#ddlDeleteMcqsQuestionTest').val();

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "myindex.aspx/LoadMcqsQuestions_",
                        data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
                        timeout: 90000, dataType: "json",
                        success: function (Result) {
                            $.each(Result.d, function (key, value) {
                                $("#ddlDeleteMcqsQuestion").append($("<option></option>").val(value.McqsQuestionId).html(value.McqsQuestion));
                                $("#ddlDeleteMcqsQuestion").trigger("chosen:updated");
                            });
                        },
                        error: function (Result) {
                            alertify.error("Error to load Subject drop down lists");
                        }
                    });
                },
                error: function (Result) {
                    alertify.error("Error to load Subject drop down lists");
                }
            });
        }
        else {
            alertify.log('you said no. Thank You :) ');
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
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
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
                        url: "myindex.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
                        timeout: 90000, dataType: "json",
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
                alertify.success("Loaded ");
            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists");
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
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
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
                        url: "myindex.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
                        timeout: 90000, dataType: "json",
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
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
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
                        url: "myindex.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
                        timeout: 90000, dataType: "json",
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
        IsUpdateLongQuest = 0;
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
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
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
                        url: "myindex.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
                        timeout: 90000, dataType: "json",
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
        IsUpdateLongQuest = 1;
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
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
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
                        url: "myindex.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
                        timeout: 90000, dataType: "json",
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
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
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
                        url: "myindex.aspx/LoadddlTestForSpecificSub",
                        data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
                        timeout: 90000, dataType: "json",
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
            url: "myindex.aspx/LoadddlTestForSpecificSub",
            data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
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
            url: "myindex.aspx/LoadddlTestForSpecificSub",
            data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
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
            url: "myindex.aspx/LoadddlTestForSpecificSub",
            data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
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
            url: "myindex.aspx/LoadddlTestForSpecificSub",
            data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
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
            url: "myindex.aspx/LoadShortQuestions",
            data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "','Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
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
            url: "myindex.aspx/LoadShortQuestions",
            data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "','Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
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
            url: "myindex.aspx/LoadLongQuestions",
            data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "','Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
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
            url: "myindex.aspx/LoadLongQuestions",
            data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "','Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
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
                url: "myindex.aspx/Delet_ShortQuestion",
                data: "{'TestId':'" + TestId + "','SubjectId':'" + SubjectId + "','QuestionId':'" + QuestionId + "','Emyadminid':'" + Emyadminid + "'}",
                timeout: 90000, dataType: "json",
                success: function (Result) {
                    alert('Question Deleted Successfully!');
                    $("#ddlDeleteShortQuestion").empty();
                    var SubId = $('#ddlDeleteShortQuestionSubject').val();
                    var TestId = $('#ddlDeleteShortQuestionTest').val();

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "myindex.aspx/LoadShortQuestions",
                        data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "','Emyadminid':'" + Emyadminid + "'}",
                        timeout: 90000, dataType: "json",
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
                url: "myindex.aspx/Delet_LongQuestion",
                data: "{'TestId':'" + TestId + "','SubjectId':'" + SubjectId + "','QuestionId':'" + QuestionId + "','Emyadminid':'" + Emyadminid + "'}",
                timeout: 90000, dataType: "json",
                success: function (Result) {
                    alert('Question Deleted Successfully!');
                    $("#ddlDeleteLongQuestion").empty();
                    var SubId = $('#ddlDeleteLongQuestionSubject').val();
                    var TestId = $('#ddlDeleteLongQuestionTest').val();

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "myindex.aspx/LoadLongQuestions",
                        data: "{'SubId':'" + SubId + "','TestId':'" + TestId + "','Emyadminid':'" + Emyadminid + "'}",
                        timeout: 90000, dataType: "json",
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


        CKEDITOR.replace('txtQuestion', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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
        CKEDITOR.replace('txtOption1', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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
        CKEDITOR.replace('txtOption2', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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
        CKEDITOR.replace('txtOption3', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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
        CKEDITOR.replace('txtOption4', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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
        CKEDITOR.replace('txtOption5', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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
        CKEDITOR.replace('txtOption6', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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
        CKEDITOR.replace('txtOption7', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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
        CKEDITOR.replace('txtOption8', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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
        var txtUserTermsAndConditions = ""; // '"' + CKEDITOR.instances.txtUserTermsAndConditions.getData() + '"';
        var chkUserPracticeMode = chkUserPracticeModebit
        var chkRandomizeQuestionsInTest = chkRandomizeQuestionsInTestbit;
        var ddlTotalUserAttempts = $('#ddlTotalUserAttempts').val();
        var chkEmailTestResultToAdmin = chkEmailTestResultToAdminbit;
        var chkUserSeeOtherUsersResult = chkUserSeeOtherUsersResultbit;
        var txtUserTestStartDateTime = $('#txtUserTestStartDateTime').val();
        var txtUserTestEndDateTime = $('#txtUserTestEndDateTime').val();
        //debugger;
        var txtUserSelectedSubject = $('#ddlsubassigned').val();
        var txtUserSelectedTest = $('#ddltestassigned').val();
        console.log("txtUserSelectedSubject = " + txtUserSelectedSubject);
        console.log("txt User Selected Test = " + txtUserSelectedTest);
        if (txtUserSelectedSubject == "" || txtUserSelectedSubject == null) {
            alertify.error("Please Select Specific Subject First Using User Advanced Settings.");
            return;
        } if (txtUserSelectedTest == "" || txtUserSelectedTest == null) {
            alertify.error("Please Select Specific TEST First Using User Advanced Settings.");
            return;
        }

        if (txtUserEmail == "") {
            alertify.error("Please Enter User Email first.");
            return;
        }
        if (txtUserPassword == "") {
            alertify.error("Please Enter User password first.");
            return;
        }
        // //debugger;
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
            url: "myindex.aspx/tblSubUser_Insert",
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
                    "','Emyadminid':'" + Emyadminid + "' , 'txtUserSelectedSubject':'" + txtUserSelectedSubject + "' , 'txtUserSelectedTest':'" + txtUserSelectedTest + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var obj = data.d;
                if (obj == 'true') {

                    alertify.success('Congrats! User Saved Successfully!');
                    ("#txtUserEmail").val("");
                    $('#txtUserName').val("");
                    //$('#lblQuestionStatus').html('<h4>Your question is Saved now :) </h4>');
                    //$('#lblQuestionStatus').hide(2000);
                }
            },
            error: function (result) {
                alertify.error(result);
            }
        })
    })
    function sendFile(file) {
        // //debugger;
        var formData = new FormData();
        formData.append('file', $('#fuStaffImg')[0].files[0]);
        $.ajax({
            type: 'post',
            url: '../fileUpload.ashx',
            data: formData,
            success: function (status) {
                if (status != 'error') {
                    var my_path = "../MediaUploader/" + status;
                    $("#imgStaffimg").attr("src", my_path);
                }
            },
            processData: false,
            contentType: false,
            error: function () {
                alertify.error("Your Picture is not uploaded Please try again later!");
            }
        });
    }
    $('#btnAddStaff').click(function () {
        // //debugger;
        var txtStaffName = $('#txtStaffName').val();
        var txtStaffQual = $('#txtStaffQual').val();
        var txtStaffMob = $('#txtStaffMob').val();
        var txtStaffJoiningDate = $('#txtStaffjoiningDate').val();
        var staffimg = $("#fuStaffImg");

        //if (txtStaffName == "") {
        //    alertify.error("Please Enter Staff Name First.");
        //    return;
        //}
        //sendFile();
        //return;
        UploadPic();
        //if (txtStaffQual == "") {
        //    alertify.error("Please Enter User password first.");
        //    return;
        //}
        //return;
        // //debugger;
        return false;
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
            url: "myindex.aspx/Insert_Staff",
            data: "{'txtStaffName':'" + txtStaffName + "','txtStaffQual':'" + txtStaffQual + "','txtStaffMob':'" + txtStaffMob +

                    "','txtStaffjoiningDate':'" + txtStaffJoiningDate + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var obj = data.d;
                if (obj == 'true') {

                    alertify.success('Congrats! Staff Saved Successfully!');
                    $("#txtStaffName").val("");
                    $('#txtStaffQual').val("");
                    $('#txtStaffMob').val("");
                    $('#txtStaffjoiningDate').val("");
                    //$('#lblQuestionStatus').html('<h4>Your question is Saved now :) </h4>');
                    //$('#lblQuestionStatus').hide(2000);
                }
            },
            error: function (result) {
                alertify.error(result);
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
            url: "myindex.aspx/InsertUserGroupName",
            data: "{'UserGroupName':'" + txtGroupName + "','Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
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
                            url: "myindex.aspx/LoadddlUserGroup",
                            data: "{'Emyadminid':'" + Emyadminid + "'}",
                            timeout: 90000, dataType: "json",
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

        CKEDITOR.replace('txtShortQuestion', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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

        CKEDITOR.replace('txtShortAnswer', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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
        CKEDITOR.replace('txtLongQuestion', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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

        CKEDITOR.replace('txtLongAnswer', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
        txtLongAnswerbit = 0;
    })
    $('#btnShowHidetxtLongAnswer').click(function () {
        $('#divLongAnswer').toggle();
    })

    $('#btnSaveShortQuestion').click(function () {
        // //debugger;
        txtShortRef = $('#txtShortQuestionReference').val();
        txtShortExp = $('#txtShortQuestionExplanation').val();
        if (txtShortQuestionbit == 0) {
            // '"' + CKEDITOR.instances.txtUserTermsAndConditions.getData() + '"';
            txtShortQuestion = '"' + CKEDITOR.instances.txtShortQuestion.getData().notBackSlash() + '"';

        }
        else {
            txtShortQuestion = $('#txtShortQuestion').val();
        }

        if (txtShortAnswerbit == 0) {
            // '"' + CKEDITOR.instances.txtUserTermsAndConditions.getData() + '"';
            txtShortAnswer = '"' + CKEDITOR.instances.txtShortAnswer.getData().notBackSlash() + '"';

        }
        else {
            txtShortAnswer = $('#txtShortAnswer').val();
        }
        var UpdateShortReference = $('#ShortQuestionreference').val()//  '"' + CKEDITOR.instances.txtShortQuestionReference.getData() + '"';
        var UpdateShortExplanation = $('#ShortQuestionExplanation').val()//'"' + CKEDITOR.instances.txtShortQuestionExplanation.getData() + '"';
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
                url: "myindex.aspx/Insert_ShortQuestions",
                data: "{'SubId':'" + SubjectId + "','TestId':'" + TestId + "','QuestionText':'" + txtShortQuestion + "','AnswerText':'" + txtShortAnswer +
                        "','ExpText':'" + txtShortExp + "','ReferenceText':'" + txtShortRef + "','points':'" + points +
                        "','Emyadminid':'" + Emyadminid + "'}",
                timeout: 90000, dataType: "json",
                success: function (data) {
                    var obj = data.d;
                    if (obj == 'true') {

                        alertify.success("Saved Short Question Successfully!");
                        CKEDITOR.instances.txtShortQuestion.setData('');
                        CKEDITOR.instances.txtShortAnswer.setData('');
                        $("#txtShortQuestion").focus();

                    }
                },
                error: function (result) {
                    alertify.error("Error Short Question No Saved Succefully");
                }
            })

        }
        else {
            //alert(ShortQuestionId)
            //data: "{'SubjectId':'" + UpdateSubjectId + "','TestId':'" + UpdateTestId + "','QuestionText':'" + txtShortQuestion + "','AnswerText':'" + txtShortAnswer +
            //"','ExplanationText':'" + UpdateShortExplanation + "','ReferenceText':'" + UpdateShortReference + "','Points':'" + points + "'ShortQuestionId':'" + ShortQuestionId + "'}",
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "myindex.aspx/Update_ShortQuestion_WithAllOptions_",
                data: "{'SubjectId':'" + UpdateSubjectId + "','TestId':'" + UpdateTestId + "','QuestionText':'" + txtShortQuestion + "','AnswerText':'" + txtShortAnswer + "','ExplanationText':'" + UpdateShortExplanation + "','ReferenceText':'" + UpdateShortReference + "','Points':'" + points + "','ShortQuestionId':'" + ShortQuestionId + "'}",

                timeout: 90000, dataType: "json",
                success: function (data) {
                    var obj = data.d;
                    // alert(obj);
                    if (obj == '1') {
                        alertify.success("Updated Short Question Successfully!");
                    }
                },
                error: function (jqXHR, exception) {
                    var msg = '';
                    if (jqXHR.status === 0) {
                        msg = 'Not connect.\n Verify Network.';
                    } else if (jqXHR.status == 404) {
                        msg = 'Requested page not found. [404]';
                    } else if (jqXHR.status == 500) {
                        msg = 'Internal Server Error [500].';
                    } else if (exception === 'parsererror') {
                        msg = 'Requested JSON parse failed.';
                    } else if (exception === 'timeout') {
                        msg = 'Time out error.';
                    } else if (exception === 'abort') {
                        msg = 'Ajax request aborted.';
                    } else {
                        msg = 'Uncaught Error.\n' + jqXHR.responseText;
                    }
                    // $('#lblQuestionComplete').html(msg);
                    alertify.error(msg + "  Not Updated Successfully");
                    //alert("Error Not Updated Successfully");
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

        CKEDITOR.replace('txtLongQuestion', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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

        CKEDITOR.replace('txtLongAnswer', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
        txtLongAnswerbit = 1;
    })
    $('#btnShowHidetxtLongAnswer').click(function () {
        $('#divLongAnswer').toggle();
    })

    $('#btnLongQuestionSimpleBox').click(function () {
        CKEDITOR.instances.txtLongQuestion.destroy(true);
        txtLongQuestionbit = 1;
    })
    $('#btnLongQuestionckeditor').click(function () {
        CKEDITOR.replace('txtLongQuestion', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
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

        CKEDITOR.replace('txtLongAnswer', {
            filebrowserBrowseUrl: '/FileBrowser',
            filebrowserWindowWidth: 800,
            filebrowserWindowHeight: 600

        });
        txtLongAnswerbit = 0;
    })
    $('#btnShowHidetxtLongAnswer').click(function () {
        $('#divLongAnswer').toggle();
    })

    $('#btnSaveLongQuestion').click(function () {

        //debugger;
        txtLongRef = $('#txtLongQuestionReference').val();
        txtLongExp = $('#txtLongQuestionExplanation').val();
        //  alert('exp  ' + txtLongExp);
        //  alert('ref ' + txtLongRef);
        if (txtLongQuestionbit == 0) {
            // '"' + CKEDITOR.instances.txtUserTermsAndConditions.getData() + '"';
            txtLongQuestion = '"' + CKEDITOR.instances.txtLongQuestion.getData().notBackSlash() + '"';

        }
        else {
            txtLongQuestion = $('#txtLongQuestion').val();
        }

        if (txtLongAnswerbit == 0) {
            // '"' + CKEDITOR.instances.txtUserTermsAndConditions.getData() + '"';
            txtLongAnswer = '"' + CKEDITOR.instances.txtLongAnswer.getData().notBackSlash() + '"';

        }
        else {
            txtLongAnswer = $('#txtLongAnswer').val();
        }


        var SubjectId = $('#ddlSubject').val();
        var TestId = $('#ddlTest').val();
        var points = $('#ddlPoints').val();
        var LongQuestionId = "";

        chk_url = "";
        if (IsUpdateLongQuest == 1) {
            chk_url = "myindex.aspx/Update_LongQuestion_WithAllOptions";
            LongQuestionId = $("#ddlShowLongQuestion").val();
        }
        else if (IsUpdateLongQuest == 0) {
            chk_url = "myindex.aspx/Insert_LongQuestions";
            LongQuestionId = 0;
        }

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: chk_url,
            data: "{'SubId':'" + SubjectId + "','TestId':'" + TestId + "','QuestionText':'" + txtLongQuestion + "','AnswerText':'" + txtLongAnswer +
                    "','ExpText':'" + txtLongExp + "','ReferenceText':'" + txtLongRef + "','points':'" + points +
                    "','Emyadminid':'" + Emyadminid + "','LongQuestionId':'" + LongQuestionId + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var obj = data.d;
                if (obj == 'true') {
                    alertify.success("Saved Long Question Successfully!");
                }
                else if (obj == "1") {
                    alertify.success("Updated Long Question Successfully!");
                }
            },
            error: function (jqXHR, exception) {
                var msg = '';
                if (jqXHR.status === 0) {
                    msg = 'Not connect.\n Verify Network.';
                } else if (jqXHR.status == 404) {
                    msg = 'Requested page not found. [404]';
                } else if (jqXHR.status == 500) {
                    msg = 'Internal Server Error [500].';
                } else if (exception === 'parsererror') {
                    msg = 'Requested JSON parse failed.';
                } else if (exception === 'timeout') {
                    msg = 'Time out error.';
                } else if (exception === 'abort') {
                    msg = 'Ajax request aborted.';
                } else {
                    msg = 'Uncaught Error.\n' + jqXHR.responseText;
                }
                alertify.error(msg);
            }
        })
    })
    var _URL = window.URL || window.webkitURL;
    $("#fuStaffImg").on('change', function () {
        //debugger;
        var file, img;
        if ((file = this.files[0])) {
            img = new Image();
            img.onload = function () {
                sendFile(file);
            };
            img.onerror = function () {
                alert("Not a valid file:" + file.type);
            };
            img.src = _URL.createObjectURL(file);
        }
    });
    $('#ddlEditSubjectNames').change(function () {

        var selectSubName = "";
        var selectSubName = $('#ddlEditSubjectNames').val();

        var selecttext = $('#ddlEditSubjectNames option:selected').text();
        var subid = $('#ddlEditSubjectNames').val();
        //alert(selectSubName);
        var txteditName = "";
        var txteditName = $('#txtEditSubjectNames').val(selecttext);
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlSubjectInfo",
            data: "{'Subid':'" + subid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $('#ddlEditCatlist').val(value.catid);
                    $('#txtEditSubjectNames').val(value.SubjectName);
                    $('#txtEditNewSubjectObjective').val(value.SubjectObjective);
                    $('#txtEditNewSubjectTestChapters').val(value.SubjectTestChapters);
                    $('#txtEditNewSubjectExplanation').val(value.SubjectExplanation);
                    $('#txtEditNewSubjectReferenceBooks').val(value.SubjectReferenceBooks);
                    $('#txtEditNewSubjectCode').val(value.SubjectCode);
                    $('#imgEditSubimg').attr('src', "../../SubImg/" + value.SubjectImage);
                  });
            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists");
            }
        });

    })
    $('#btnEditSubjectName').click(function () {
        var selectSubName = $('#ddlEditSubjectNames option:selected').text();
        //alert(selectSubName);
        var txteditName = $('#txtEditSubjectNames').val(selectSubName);
        $('#divEditSubjectName').toggle();
    })
    $('#btnDeleteSubjectName').click(function () {
        $("#ddlDeleteSubjectNames").empty();
        $("#ddlDeleteReplaceSubjectWithExistingSubject").empty();
        $("#ddlDeleteOnlySubjectSettings").empty();


        $("#ddlDeleteSubjectNames").append($("<option></option>").val(0).html('Select Subject'));
        $("#ddlDeleteReplaceSubjectWithExistingSubject").append($("<option></option>").val(0).html('Select Subject'));
        $("#ddlDeleteOnlySubjectSettings").append($("<option></option>").val(0).html('Select Subject'));


        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    //  $("#ddlShowMcqsQuestionSubject").empty();

                    $("#ddlDeleteSubjectNames").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    $("#ddlDeleteReplaceSubjectWithExistingSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    $("#ddlDeleteOnlySubjectSettings").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));

                    $("#ddlDeleteSubjectNames").trigger("chosen:updated");
                    $("#ddlDeleteReplaceSubjectWithExistingSubject").trigger("chosen:updated");
                    $("#ddlDeleteOnlySubjectSettings").trigger("chosen:updated");

                    // $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(0).html('Select Test'));
                    //  var subId = $("#ddlShowMcqsQuestionSubject").val();

                    //$.ajax({

                    //    type: "POST",
                    //    contentType: "application/json; charset=utf-8",
                    //    url: "myindex.aspx/LoadddlTestForSpecificSub",
                    //    data: "{'SubId':'" + subId + "','Emyadminid':'" + Emyadminid + "'}",
                    //    timeout: 90000, dataType: "json",
                    //    success: function (Result) {
                    //        $.each(Result.d, function (key, value) {
                    //            // $("#ddlShowMcqsQuestionTest").empty();

                    //            $("#ddlShowMcqsQuestionTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                    //            $("#ddlShowMcqsQuestionTest").trigger("chosen:updated");

                    //        });
                    //    },
                    //    error: function (Result) {
                    //        alertify.error("There is an Error Please try later");
                    //    }
                    //});

                });
            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists");
            }
        });
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
        var txtEditNewSubjectObjective = $('#txtEditNewSubjectObjective').val();
        var txtEditNewSubjectTestChapters = $('#txtEditNewSubjectTestChapters').val();
        var txtEditNewSubjectExplanation = $('#txtEditNewSubjectExplanation').val();
        var txtEditNewSubjectReferenceBooks = $('#txtEditNewSubjectReferenceBooks').val();
        var txtEditNewSubjectCode = $('#txtEditNewSubjectCode').val();
        var catid = $('#ddlEditCatlist').val();
       // var catid = $('#imgEditSubimg').val();
        var fuCatImg = $('#fuEditSubImg').get(0).files;
        EditSubImg(fuCatImg);
        var imgCatimg = $("#imgEditSubimg").attr("src");
        var fileNameIndex = imgCatimg.lastIndexOf("/") + 1;
        var filename = imgCatimg.substr(fileNameIndex);
        if (filename == "") {
            alertify.error("select image first!");
            return false;
        }

        if (subName == '') {
            lblName.html('Please Enter Subject Name First !');
            lblName.removeClass();
            lblName.addClass('required');
        }
        else {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "myindex.aspx/Update_SubjectName",
                data: "{'SubjectName':'" + subName + "','SubjectId':'" + SubjectId +
                    "','Emyadminid':'" + Emyadminid + "','catid':'" + catid +
                    "','txtEditNewSubjectObjective':'" + txtEditNewSubjectObjective +
                    "','txtEditNewSubjectTestChapters':'" + txtEditNewSubjectTestChapters + "','txtEditNewSubjectExplanation':'" + txtEditNewSubjectExplanation +
                    "','txtEditNewSubjectReferenceBooks':'" + txtEditNewSubjectReferenceBooks + "','txtEditNewSubjectCode':'" + txtEditNewSubjectCode +
                    "','filename':'" + filename + "'}",
                timeout: 90000, dataType: "json",
                success: function (data) {
                    var obj = data.d;
                    if (obj == "1") {
                        alertify.success("Updated Successfully ! ");
                        function updateDropdown() {
                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "myindex.aspx/LoadddlSubject",
                                data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
                                timeout: 90000, dataType: "json",
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
                                    alertify.error("Error to load Subject drop down lists");
                                }
                            });
                        }
                    }


                },
                error: function (result) {
                    alertify.error("Error Occourced Please Try again later.");
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
            url: "myindex.aspx/Delete_SubjectName",
            data: "{'SubjectId':'" + SubjectId + "','Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var obj = data.d;
                if (obj == 'true') {
                    alertify.success('Subject Deleted Successfully! ');;
                }
            },
            error: function (result) {
                alertify.error("Error");
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
            url: "myindex.aspx/Replace_Subject",
            data: "{'OlSubjectId':'" + oldSubjectId + "','NewSubjectId':'" + NewSubjectId + "','Emyadminid':'" + Emyadminid + "'}",
            timeout: 90000, dataType: "json",
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
            url: "myindex.aspx/Delete_Subject_Settings",
            data: "{'SubjectId':'" + SubjectId + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var obj = data.d;

                alert('All Settings of this subject Deleted');

            },
            error: function (result) {
                alert("Error");
            }
        })
    })
    function updateDropdown() {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/LoadddlSubject",
            data: "{'dadminid':'" + Emyadminid + "','role':'" + Emyadminuserrole + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlSubjectNameList").empty();
                    $("#ddlEditSubjectNames").empty();
                    $("#ddlDeleteSubjectNames").empty();
                    $("#ddlSubjectAdvancedSettings").empty();
                    $("#ddlSubjectlistForAddTest").empty();
                    $("#ddlDeleteReplaceSubjectWithExistingSubject").empty();
                    $("#ddlDeleteOnlySubjectSettings").empty();
                    $("#ddlSubjectNameList").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    $("#ddlEditSubjectNames").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    $("#ddlDeleteSubjectNames").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    $("#ddlSubjectAdvancedSettings").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    $("#ddlDeleteReplaceSubjectWithExistingSubject").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    $("#ddlDeleteOnlySubjectSettings").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                    $("#ddlSubjectlistForAddTest").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));
                });

            },
            error: function (Result) {
                alertify.error("Error to load Subject drop down lists");
            }
        });
    }
    function UploadCatImg(file) {
        // //debugger;
        var formData = new FormData();
        formData.append('file', $('#fuCatImg')[0].files[0]);
        var mypth = "";
        $.ajax({
            type: 'post',
            url: '../CatImg.ashx',
            data: formData,
            success: function (status) {
                if (status != 'error') {
                    var my_path = "../CatImg/" + status;
                    mypth = status;
                    $("#imgCatimg").attr("src", my_path);
                }
                else {
                    alertify.error("Your Picture is not uploaded Please try again later!");
                }
            },
            processData: false,
            async: false,
            contentType: false,
            error: function () {
                alertify.error("Your Picture is not uploaded Please try again later!");
            }
        });

        // return mypth;
    }
    function EditCatImg(file) {
        // //debugger;
        var formData = new FormData();
        formData.append('file', $('#fuCatEditImg')[0].files[0]);
        var mypth = "";
        $.ajax({
            type: 'post',
            url: '../CatImg.ashx',
            data: formData,
            success: function (status) {
                if (status != 'error') {
                    var my_path = "../CatImg/" + status;
                    mypth = status;
                    $("#imgCatEditimg").attr("src", my_path);
                }
                else {
                    alertify.error("Your Picture is not uploaded Please try again later!");
                }
            },
            processData: false,
            async: false,
            contentType: false,
            error: function () {
                alertify.error("Your Picture is not uploaded Please try again later!");
            }
        });

        // return mypth;
    }
    $('#btnAddCatt').click(function () {
        // //debugger;
        var txtCatName = $('#txtCatName').val();
        var txtCatPurpose = $('#txtCatPurpose').val();
        var txtCatTagline = $('#txtCatTagline').val();
        var txtCatDesc = $('#txtCatDesc').val();
        var fuCatImg = $('#fuCatImg').get(0).files;
        UploadCatImg(fuCatImg);
        var imgCatimg = $("#imgCatimg").attr("src");
        var fileNameIndex = imgCatimg.lastIndexOf("/") + 1;
        var filename = imgCatimg.substr(fileNameIndex);


        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/InsertCatt",
            data: "{'txtCatName':'" + txtCatName + "','txtCatTagline':'" + txtCatTagline + "','Emyadminid':'" + Emyadminid + "','txtCatPurpose':'" + txtCatPurpose + "','txtCatDesc':'" + txtCatDesc + "','fuCatImg':'" + filename + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var obj = data.d;
                if (obj == 'true') {


                    updateDropdown();
                    alertify.success("Category Added Successfully");
                    hide_all();
                    $('#AddNewTest').show(1000);
                    Scroll_top();
                }
            },
            error: function (result) {
                alertify.error("Error Login Again Please.");
            }
        })
    })
    // Subject Add options

    $('#btnAddSubjectNameOnly').click(function () {
        debugger;
        var catid = $('#ddlCatlist').val();
        var subName = $('#txtAddNewSubjectName').val();
        var txtSubjectObjective = $('#txtSubjectObjective').val();
        var txtSubjectTestChapters = $('#txtSubjectTestChapters').val();
        var txtSubjectExplanation = $('#txtSubjectExplanation').val();
        var txtSubjectReferenceBooks = $('#txtSubjectReferenceBooks').val();
        var txtSubjectCode = $('#txtSubjectCode').val();
        var fuCatImg = $('#fuSubImg').get(0).files;
        SaveSubImg(fuCatImg);
        var imgCatimg = $("#imgSubimg").attr("src");
        var fileNameIndex = imgCatimg.lastIndexOf("/") + 1;
        var filename = imgCatimg.substr(fileNameIndex);
        if (filename == "") {
            alertify.error("select image first!");
            return false;
        }


        var lblName = $('#lblName');
        var AdminId = $('');


        if (subName == '') {
            alertify.error('Please Enter Subject Name First !');
            lblName.html('Please Enter Subject Name First !');

            lblName.removeClass();
            lblName.addClass('required');
        }
        if (catid == 0) {
            alertify.error("Please select category");
        }
        else {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "myindex.aspx/InsertSubject",
                data: "{'subjectName':'" + subName + "','Emyadminid':'" + Emyadminid +
                    "','catid':'" + catid + "','txtSubjectObjective':'" + txtSubjectObjective + "','txtSubjectTestChapters':'" +
                    txtSubjectTestChapters + "','txtSubjectExplanation':'" + txtSubjectExplanation +
                    "','txtSubjectReferenceBooks':'" + txtSubjectReferenceBooks + "','txtSubjectCode':'" + txtSubjectCode +
                    "','filename':'" + filename + "'}",
                timeout: 90000, dataType: "json",
                success: function (data) {
                    var obj = data.d;
                    if (obj == 'true') {
                        $('#divSubjectName').hide();
                        $('#divTestName').show();
                    }
                },
                error: function (result) {
                    alertify.error("Error");
                }
            })
        }

    })

    function SaveSubImg(file) {
        // //debugger;
        var formData = new FormData();
        formData.append('file', $('#fuSubImg')[0].files[0]);
        var mypth = "";
        $.ajax({
            type: 'post',
            url: '../SubImg.ashx',
            data: formData,
            success: function (status) {
                if (status != 'error') {
                    var my_path = "../SubImg/" + status;
                    mypth = status;
                    $("#imgSubimg").attr("src", my_path);
                }
                else {
                    alertify.error("Your Picture is not uploaded Please try again later!");
                }
            },
            processData: false,
            async: false,
            contentType: false,
            error: function () {
                alertify.error("Your Picture is not uploaded Please try again later!");
            }
        });
    }

    function SaveTestImg(file) {
        // //debugger;
        var formData = new FormData();
        formData.append('file', $('#fuTestImage')[0].files[0]);
        var mypth = "";
        $.ajax({
            type: 'post',
            url: '../TestImg.ashx',
            data: formData,
            success: function (status) {
                if (status != 'error') {
                    var my_path = "../TestImg/" + status;
                    mypth = status;
                    $("#imgTestimg").attr("src", my_path);
                }
                else {
                    alertify.error("Your Picture is not uploaded Please try again later!");
                }
            },
            processData: false,
            async: false,
            contentType: false,
            error: function () {
                alertify.error("Your Picture is not uploaded Please try again later!");
            }
        });
    }

    function EditTestImg(file) {
        // //debugger;
        var formData = new FormData();
        formData.append('file', $('#fuEditTestImage')[0].files[0]);
        var mypth = "";
        $.ajax({
            type: 'post',
            url: '../TestImg.ashx',
            data: formData,
            success: function (status) {
                if (status != 'error') {
                    var my_path = "../TestImg/" + status;
                    mypth = status;
                    $("#imgEditTestimg").attr("src", my_path);
                }
                else {
                    alertify.error("Your Picture is not uploaded Please try again later!");
                }
            },
            processData: false,
            async: false,
            contentType: false,
            error: function () {
                alertify.error("Your Picture is not uploaded Please try again later!");
            }
        });
    }
        // return mypth;
        function EditSubImg(file) {
            // //debugger;
            var formData = new FormData();
            formData.append('file', $('#fuEditSubImg')[0].files[0]);
            var mypth = "";
            $.ajax({
                type: 'post',
                url: '../SubImg.ashx',
                data: formData,
                success: function (status) {
                    if (status != 'error') {
                        var my_path = "../SubImg/" + status;
                        mypth = status;
                        $("#imgEditSubimg").attr("src", my_path);
                    }
                    else {
                        alertify.error("Your Picture is not uploaded Please try again later!");
                    }
                },
                processData: false,
                async: false,
                contentType: false,
                error: function () {
                    alertify.error("Your Picture is not uploaded Please try again later!");
                }
            });

            // return mypth;
        }
    
    // Save Subject Advanced Settings
    $('#btnSaveSubjectAdvanceSettings').click(function () {
        debugger;
        var catid = $('#ddlCatlist').val();
        var subName = $('#txtAddNewSubjectName').val();
        var txtSubjectObjective = $('#txtSubjectObjective').val();
        var txtSubjectTestChapters = $('#txtSubjectTestChapters').val();
        var txtSubjectExplanation = $('#txtSubjectExplanation').val();
        var txtSubjectReferenceBooks = $('#txtSubjectReferenceBooks').val();
        var txtSubjectCode = $('#txtSubjectCode').val();
        var fuCatImg = $('#fuSubImg').get(0).files;
        SaveSubImg(fuCatImg);
        var imgCatimg = $("#imgSubimg").attr("src");
        var fileNameIndex = imgCatimg.lastIndexOf("/") + 1;
        var filename = imgCatimg.substr(fileNameIndex);
        if (filename == "") {
            alertify.error("select image first!");
            return false;
        }


        var lblName = $('#lblName');
        var AdminId = $('');


        if (subName == '') {
            alertify.error('Please Enter Subject Name First !');
            lblName.html('Please Enter Subject Name First !');

            lblName.removeClass();
            lblName.addClass('required');
        }
        if (catid == 0) {
            alertify.error("Please select category");
        }
        else {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "myindex.aspx/InsertSubject",
                data: "{'subjectName':'" + subName + "','Emyadminid':'" + Emyadminid +
                    "','catid':'" + catid + "','txtSubjectObjective':'" + txtSubjectObjective + "','txtSubjectTestChapters':'" +
                    txtSubjectTestChapters + "','txtSubjectExplanation':'" + txtSubjectExplanation +
                    "','txtSubjectReferenceBooks':'" + txtSubjectReferenceBooks + "','txtSubjectCode':'" + txtSubjectCode +
                    "','filename':'" + filename + "'}",
                timeout: 90000, dataType: "json",
                success: function (data) {
                    var obj = data.d;
                    if (obj == 'true') {
                        $('#divSubjectName').hide();
                        $('#divTestName').show();
                    }
                },
                error: function (result) {
                    alertify.error("Error");
                }
            })
        }

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

        var fuCatImg = $('#fuTestImage').get(0).files;
        SaveTestImg(fuCatImg);
        var imgCatimg = $("#imgTestimg").attr("src");
        var fileNameIndex = imgCatimg.lastIndexOf("/") + 1;
        var filename = imgCatimg.substr(fileNameIndex);
        if (filename == "") {
            alertify.error("select image first!");
            return false;
        }

        var testimage = filename;
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/Insert_Test_With_All_Options",
            data: "{'ddlSubjectId':'" + ddlSubjectlistForAddTest + "','TestName':'" + txtAddTestName + "','TestDescription':'" + txtTestDescription +
                    "','TestStatus':'" + chkTestStatus + "','PractiseSession':'" + chkTestPracticeSession +
                    "','PassingPercentage':'" + ddlTestPassingPercentage + "','TestImage':'" + testimage +
                    "','TestInstructions':'" + txtTestInstructions + "','TestStartDateTime':'" + txtTestStartDateTime +
                    "','TestDueDateTime':'" + txtTestDueDateTime + "','TestAttempts':'" + txtTestTotalAttempts +
                    "','TestExtendedDateTime':'" + txtTestExtendedDateTime + "','TestAlwaysOpen':'" + chkTestAlwaysOpen +
                    "','Emyadminid':'" + Emyadminid + "'}",
            timeout: (2 * 100000), dataType: "json",
            success: function (data) {
                alertify.success('Test Saved successfully');
                hide_all();
                $('#divCommonSubTestNumb').show(1000);
                $('#divMcqsQuestion').show(1000);
                $('#btnSave').show();
                $('#divCommonSubTestNumb').show(1000);
                Scroll_top();


            },
            error: function (xhr, ajaxOptions, thrownError) {
                alertify.error(xhr.status);
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
        var test_text = $('#ddlTestlistForEditTest option:selected').text();
        //alert(test_text)
        $("#txtEditTestName").val(test_text);


        //$.ajax({
        //    type: "POST",
        //    contentType: "application/json; charset=utf-8",
        //    url: "myindex.aspx/Load_Test_Setting",
        //    data: "{'subjectId':'" + SubjId + "', 'Emyadminid':'" + Emyadminid + "'}",
        //    timeout: (2 * 100000),dataType: "json",
        //    success: function (data) {
        //        var len = data.d.length;
        //        var txt = "";
        //        if (len > 0) {
        //            for (var i = 0; i < len; i++) {
        //                // alert(data.d[i].TestName);
        //                $('#txtEditTestName').val(data.d[i].TestName);
        //                $('#txtEditTestDescription').val(data.d[i].TestDescription);
        //                $('#txtEditTestInstructions').val(data.d[i].TestInstructions);
        //                $('#txtEditTestStartDateTime').val(data.d[i].TestStartTiming);
        //                $('#txtEditTestDueDateTime').val(data.d[i].TestDueTiming);
        //                $('#txtEditTestTotalAttempts').val(data.d[i].TestAttempts);
        //                $('#txtEditTestExtendedDateTime').val(data.d[i].TestExtendableDateTime);
        //                //txt += '<tbody><tr><td>' + data.d[i].SubjectName + '</td><td>' + data.d[i].TestName + '</td><td>' + data.d[i].TestStartingDate + '</td><td>' + data.d[i].TestEndingDate + '</td><td>' + data.d[i].TestStatus + '</td></tr></tbody>';
        //            }

        //            //if (txt != '') {
        //            //    $("#tableShowUserMcqs").append(txt).removeClass("hidden");
        //            //    $("#tableShowUserMcqs").DataTable();
        //            //    alert(txt);
        //            //}
        //        }

        //    },
        //    error: function (data) {
        //        alert("Error");
        //    }
        //});

        //},
        //error: function (result) {
        //    alert("Error");
        //}
        //})
    })

    $('#btnShowTestMcqs').click(function () {
        var SubjId = $('#ddlSubjectlistShowTestQuestions').val();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/Load_Test_Setting",
            data: "{'subjectId':'" + SubjId + "', 'Emyadminid':'" + Emyadminid + "'}",
            timeout: (2 * 100000), dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var txt = "";
                if (len > 0) {
                    for (var i = 0; i < len; i++) {

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
        // //debugger;
        var ddlSubjectlistForAddTest = $('#ddlSubjectlistForEditTest').val();
        var Testid = $('#ddlTestlistForEditTest').val();
        var txtAddTestName = $('#txtEditTestName').val();
        var txtTestDescription = $('#txtEditTestDescription').val();
        var txtTestInstructions = $('#txtEditTestInstructions').val();
        var txtTestStartDateTime = $('#txtEditTestStartDateTime').val();
        var txtTestDueDateTime = $('#txtEditTestDueDateTime').val();
        var txtTestTotalAttempts = $('#txtEditTestTotalAttempts').val();
        if (txtTestTotalAttempts == "") {
            txtTestTotalAttempts = 0;
        }
        var txtTestExtendedDateTime = $('#txtEditTestExtendedDateTime').val();
        var ddlTestPassingPercentage = $('#ddlEditTestPassingPercentage').val();

        var fuCatImg = $('#fuEditTestImage').get(0).files;
        EditTestImg(fuCatImg);
        var imgCatimg = $("#imgEditTestimg").attr("src");
        var fileNameIndex = imgCatimg.lastIndexOf("/") + 1;
        var filename = imgCatimg.substr(fileNameIndex);
        if (filename == "") {
            alertify.error("select image first!");
            return false;
        }

        var testimg = filename;
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/Update_Test_With_All_Options",
            data: "{'ddlSubjectId':'" + ddlSubjectlistForAddTest + "','TestName':'" + txtAddTestName + "','TestDescription':'" + txtTestDescription +
                    "','TestStatus':'" + chkEditTestStatus + "','TestPracticeSession':'" + chkEditTestPracticeSession +
                    "','TestPassingPercentage':'" + ddlTestPassingPercentage + "','TestImage':'" + testimg +
                    "','TestInstructions':'" + txtTestInstructions + "','TestStartTiming':'" + txtTestStartDateTime +
                    "','TestDueTiming':'" + txtTestDueDateTime + "','TestAttempts':'" + txtTestTotalAttempts +
                    "','TestExtendedDateTime':'" + txtTestExtendedDateTime + "','TestAlwaysOpen':'" + chkEditTestAlwaysOpen +
                    "','TestId':'" + Testid +
                   "','Emyadminid':'" + Emyadminid + "'}",
            timeout: (90000), dataType: "json",
            success: function (data) {
                $('#ddlSubjectlistForEditTest').val("0");
                $('#ddlTestlistForEditTest').val("0");
                $('#txtEditTestName').val("");
                alertify.success('Test Updated successfully');

            },
            error: function (result) {
                alertify.error("Error");
            }
        })
    })

    $('#btnDeleteTest').click(function () {
        var ddlSubjectlistForDeleteTest = $('#ddlSubjectlistForDeleteTest').val();
        var ddlTestlistForDeleteTest = $('#ddlTestlistForDeleteTest').val();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/Delete_Test",
            data: "{'ddlSubjectId':'" + ddlSubjectlistForDeleteTest + "','TestId':'" + ddlTestlistForDeleteTest + "','Emyadminid':'" + Emyadminid + "'}",
            timeout: (2 * 100000), dataType: "json",
            success: function (data) {
                alertify.success('Test Deleted successfully');
                $('#ddlTestlistForDeleteTest').val("0");
                $('#ddlSubjectlistForDeleteTest').val("0");

            },
            error: function (result) {
                alertify.error("Error");
            }
        })

    })

    $('#btnMergeTest').click(function (event) {
        // debugger;
        event.preventDefault();
        var mergeTestName = $("#MergeTestName").val();
        var MergeTestTotalQ = $("#MergeTestTotalQ").val();
        var MergeTestInstructions = '"' + CKEDITOR.instances.MergeTestInstructions.getData().notBackSlash() + '"'; //$("#MergeTestInstructions").val();
        //alert(MergeTestInstructions);
        //return false;
        var ddlMergeTestDifficultyLevel = $("#ddlMergeTestDifficultyLevel").val();
        var isNegativeMarks;
        if ($("#IsNegativeMark").is(":checked")) {
            // alert("Checkbox Checked");
            isNegativeMarks = 1;
            //return false;
        }
        else {
            //alert("Check box not Checked");
            isNegativeMarks = 0;
            //return false;
        }
        var ddlSubjectlistForMergeTest = $("#ddlSubjectlistForMergeTest").val();
        var sec_values = [];
        if (MergeTestSecCounter != undefined || MergeTestSecCounter != 0) {
            for (i = 1; i <= MergeTestSecCounter; i++) {
                sec_values.push({
                    MergeTestSecName: $("#MergeTestSec" + i + "Name").val(),
                    MergeTestSecDetail: $("#MergeTestSec" + i + "Detail").val(),
                    MergeTestSecTotalQuestions: $("#MergeTestSec" + i + "TotalQuestions").val(),
                    MergeTestSecPriority: $("#MergeTestSec" + i + "Priority").val()
                });
            }
        }
        //console.log("MergeTestSecName, MergeTestSecDetail, MergeTestSecTotalQuestions,MergeTestSecPriority: " + sec_values);
        //var MergeTestTotalQ = $("#MergeTestTotalQ").val();
        //var MergeTestSec1Name = $("#MergeTestSec1Name").val();
        //var mergeTestName = $("#MergeTestName").val();
        //var mergeTestName = $("#MergeTestName").val();
        //alertify.success("hello");
        // return;
        var searchIDs = $("#example input:checkbox:checked").map(function () {
            var id = $(this).val();
            var subid = $(this).data('subid');
            var secid = $("#" + id + "_ddlMergeTestSeclist").val();
            var testTotalQ = $("#" + id + "_gettotalqMergeTest").val();
            return { SubId: subid, TestId: id, SecId: secid, TotalQ: testTotalQ };
        }).get(); // <----

        var subId = searchIDs.length;
        //return;

        if (subId == "" || searchIDs == "") {
            alertify.error("Please Select two or more Tests");
        }
        if (mergeTestName == "") {
            alertify.error("Please select Your New Test name");
        }

        //var myarrayj = JSON.stringify(searchIDs);
        var thise = "";
        var SpecMarks = $("#SpecMarks").val();
        if (SpecMarks == "") {
            SpecMarks = 0;
        }


        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/InsertTestName_Multiple",
            data: "{'TestName':'" + mergeTestName + "','MergeTestInstructions':'" + MergeTestInstructions + "','TestTotQ':'" + MergeTestTotalQ + "','TestLevel':'" + ddlMergeTestDifficultyLevel + "','TestInsertionSubId':'" + ddlSubjectlistForMergeTest + "','Emyadminid':'" + Emyadminid +
                   "','listData':'" + JSON.stringify(searchIDs) + "','listSec':'" + JSON.stringify(sec_values) + "','isNegativeMarks':'" + isNegativeMarks + "','SpecMarks':'" + SpecMarks + "'}",
            timeout: 900000, dataType: "json",
            success: function (data_succ) {
                alertify.success('Test Merged successfully');

            },
            error: function (result) {
                alertify.error("Error");
            }
        })

    })

    var table = $('#tblShowUsers').DataTable();

    $('#btnEditUserDetail').click(function () {

        var result = confirm("Are you sure to Update this Users Detail?");
        if (result) {
            var u_name = $("#txtEditUserName").val();
            var u_email = $("#txtEditUserEmail").val();
            var u_pawd = $("#txtEditUserpwd").val();
            var u_uid = $("#lbledituserid").text()
            var isdelete = 1;

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "myindex.aspx/Update_userinfoPwd",
                data: "{'Emyadminid':'" + Emyadminid + "','u_name':'" + u_name + "','u_email':'" + u_email + "','u_pawd':'" + u_pawd + "','u_uid':'" + u_uid + "','isdelete':'" + isdelete + "'}",
                timeout: 90000, dataType: "json",
                success: function (Result) {
                    if (Result.d == "1") {
                        alertify.success("User Details Updated Successfully! ");
                        $("#txtEditUserName").val("");
                        $("#txtEditUserEmail").val("");
                        $("#txtEditUserpwd").val("");
                        $("#lbledituserid").text("");

                        $("#ddlEditUsers").empty();
                        $("#ddlEditUsers").append($("<option></option>").val("0").html("Select One"))
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "myindex.aspx/LoadddlUsers",
                            data: "{'Emyadminid':'" + Emyadminid + "'}",
                            timeout: 90000, dataType: "json",
                            success: function (Result) {
                                $.each(Result.d, function (key, value) {
                                    $("#ddlEditUsers").append($("<option></option>").val(value.UserId).html(value.UserEmail));

                                });
                            },
                            error: function (Result) {
                                alert("Error to load Users drop down lists");
                            }
                        });


                    }
                },
                error: function (Result) {
                    alert("Error to Updade Users Information. Please Try again later.");
                }
            });
        }
        else {
            alertify.log("No Changes Occoured!");
        }
    })

    $('#btnEditStaffDetail').click(function () {

        var result = confirm("Are you sure to Update this Detail?");
        if (result) {
            var u_name = $("#txtEditStaffName").val();
            var u_qual = $("#txtEditStaffQual").val();
            var u_Mob = $("#txtEditStaffMob").val();
            var u_uid = $("#lbleditStaffid").text()
            var isdelete = 1;

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "myindex.aspx/Update_Staffinfo",
                data: "{'u_name':'" + u_name + "','u_qual':'" + u_qual + "','u_Mob':'" + u_Mob + "','u_uid':'" + u_uid + "','isdelete':'" + isdelete + "'}",
                timeout: 90000, dataType: "json",
                success: function (Result) {
                    if (Result.d == "1") {
                        alertify.success("Staff Details Updated Successfully! ");
                        $("#txtEditStaffName").val("");
                        $("#txtEditStaffQual").val("");
                        $("#txtEditStaffMob").val("");
                        $("#lbleditStaffid").text("");

                        $("#ddlEditStaff").empty();
                        $("#ddlEditStaff").append($("<option></option>").val("0").html("Select One"))
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "myindex.aspx/LoadddlStaffs",
                            data: "{}",
                            timeout: 90000, dataType: "json",
                            success: function (Result) {
                                $.each(Result.d, function (key, value) {
                                    $("#ddlEditStaff").append($("<option></option>").val(value.StaffId).html(value.Name));

                                });
                            },
                            error: function (Result) {
                                alert("Error to load Staff drop down lists");
                            }
                        });


                    }
                },
                error: function (Result) {
                    alert("Error to Updade Staff Information. Please Try again later.");
                }
            });
        }
        else {
            alertify.log("No Changes Occoured!");
        }
    })
    $('#btnEditCat').click(function () {

        var result = confirm("Are you sure to Update this Detail?");
        if (result) {
            var txtEditCatName = $("#txtEditCatName").val();
            var txtEditCatTagline = $("#txtEditCatTagline").val();
            var txtEditCatPurpose = $("#txtEditCatPurpose").val();
            var txtEditCatDes = $("#txtEditCatDes").val();
            // debugger;
            var fuCatImg = $('#fuCatEditImg').get(0).files;
            EditCatImg(fuCatImg);
            var imgCatimg = $("#imgCatEditimg").attr("src");
            var fileNameIndex = imgCatimg.lastIndexOf("/") + 1;
            var filename = imgCatimg.substr(fileNameIndex);
            if (filename == "") {
                alertify.error("select image first!");
                return false;
            }
            var lbleditCatid = $("#lbleditCatid").text()
            var isdelete = 1;

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "myindex.aspx/Update_Catinfo",
                data: "{'txtEditCatName':'" + txtEditCatName + "','txtEditCatTagline':'" + txtEditCatTagline + "','txtEditCatPurpose':'" + txtEditCatPurpose + "','txtEditCatDes':'" + txtEditCatDes + "','filename':'" + filename + "','catid':'" + lbleditCatid + "'}",
                timeout: 90000, dataType: "json",
                success: function (Result) {
                    if (Result.d == "1") {
                        alertify.success("Category Details Updated Successfully! ");
                        $("#txtEditCatName").val("");
                        $("#txtEditCatTagline").val("");
                        $("#txtEditCatPurpose").val("");
                        $("#txtEditCatDes").text("");
                        $("#imgCatimg").attr("src", "");
                        $("#ddlEditCat").empty();  //editcat
                        $("#ddlEditCat").append($("<option></option>").val("0").html("Select One"))
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "myindex.aspx/LoadddlCat",
                            data: "{}",
                            timeout: 90000, dataType: "json",
                            success: function (Result) {
                                $.each(Result.d, function (key, value) {
                                    $("#ddlEditCat").append($("<option></option>").val(value.SubjectId).html(value.SubjectName));

                                });
                            },
                            error: function (Result) {
                                alert("Error to load Category drop down lists");
                            }
                        });


                    }
                },
                error: function (Result) {
                    alert("Error to Updade Staff Information. Please Try again later.");
                }
            });
        }
        else {
            alertify.log("No Changes Occoured!");
        }
    })
    $('#ddlEditUsers').change(function () {
        var UserId = $('#ddlEditUsers option:selected').val();
        //$.ajax({
        //    type: "POST",
        //    contentType: "application/json; charset=utf-8",
        //    url: "myindex.aspx/UserDetail",
        //    data: "{'Emyadminid':'" + Emyadminid + "','userid':'" + UserId + "'}",
        //    timeout: 90000, dataType: "json",
        //    success: function (data) {
        //        var len = data.d.length;
        //        var totallen = data.d.length;
        //        var txt = "";
        //        var totalmcqs = 0;
        //        //alert(len);
        //        if (len > 0) {
        //            $("#txtEditUserName").val(data.d[0].UserName);
        //            $("#txtEditUserEmail").val(data.d[0].UserEmail);
        //            $("#txtEditUserpwd").val(data.d[0].UserPassword);
        //            $("#lbledituserid").text(data.d[0].UserId)


        //            }

        //        //  setTimeout($.unblockUI, 1000);

        //    },
        //    error: function (data) {
        //        alert("Error");
        //    }
        //});

        //  alert(UserId);

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/UserDetail",
            data: "{'Emyadminid':'" + Emyadminid + "','userid':'" + UserId + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var txt = "";
                if (len > 0) {
                    for (var i = 0; i < len; i++) {
                        // alert(data.d[i].UserEmail);
                        $('#ddlUserRoleId').val(data.d[i].UserRole);
                        $('#txtUserName').val(data.d[i].UserName);
                        $('#txtUserEmail').val(data.d[i].UserEmail);
                        $('#txtUserPassword').val(data.d[i].UserPassword);
                        $('#txtUserParentEmail').val(data.d[i].UserParrentEmail);
                        $('#txtUserParentName').val(data.d[i].UserParrentName);
                        $('#txtUserRollNo').val(data.d[i].UserRollNo);
                        $('#txtUserFirstName').val(data.d[i].UserFirstName);
                        $('#txtUserLastName').val(data.d[i].UserLastName);
                        $('#txtUserDepartment').val(data.d[i].UserDepartment);
                        $('#txtUserRegion').val(data.d[i].UserRegion);
                        $('#txtUserTelephoneNo').val(data.d[i].UserPhoneNo);
                        $('#txtUserDOB').val(data.d[i].UserDateOfBirth);
                        $('#ddlUserGroup').val();
                        $('#txtUserImage').val(data.d[i].UserPicture);
                        $('#txtUserCity').val(data.d[i].UserCity);
                        $('#ddlUserGender').val(data.d[i].UserGender);
                        chkCertificateCustomDesignbit;
                        chkResultCardCustomDesignbit;
                        chkUserEmailResultbit
                        $('#txtUserCountry').val(data.d[i].UserCountry);
                        // var txtUserTermsAndConditions = '"' + CKEDITOR.instances.txtUserTermsAndConditions.getData() + '"';
                        chkUserPracticeModebit
                        chkRandomizeQuestionsInTestbit;
                        $('#ddlTotalUserAttempts').val(data.d[i].UserTotalAttempts);
                        chkEmailTestResultToAdminbit;
                        chkUserSeeOtherUsersResultbit;
                        $('#txtUserTestStartDateTime').val(data.d[i].UserTestStartingDatetime);
                        $('#txtUserTestEndDateTime').val(data.d[i].UserTestDueDateTime);
                        //alert("data.d[i].selectedsub = " + data.d[i].selectedsub);
                        $("#hiduserselectedsub").val(data.d[i].selectedsub);
                        $("#hiduserselectedtest").val(data.d[i].selectedtest);

                        //                        txt += '<tbody><tr><td>' + data.d[i].SubjectName + '</td><td>' + data.d[i].TestName + '</td><td>' + data.d[i].TestStartingDate + '</td><td>' + data.d[i].TestEndingDate + '</td><td>' + data.d[i].TestStatus + '</td></tr></tbody>';
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



        $("#divAddUser").show();
        //$("#btnAddUser").text("Update User Detail");
        // $('#btnAddUser').button();//make it nice
        //var text = "new caption";
        //  $('#btnAddUser').children().first().html(text)
        $('#btnAddUser').val('Update User Detail');//.html('Update User Detail').button("refresh");
    })
    $('#ddlEditStaff').change(function () {
        var UserId = $('#ddlEditStaff option:selected').val();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/StaffDetail",
            data: "{'id':'" + UserId + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var totallen = data.d.length;
                var txt = "";
                var totalmcqs = 0;
                //alert(len);
                if (len > 0) {
                    $("#txtEditStaffName").val(data.d[0].Name);
                    $("#txtEditStaffQual").val(data.d[0].Qual);
                    $("#txtEditStaffMob").val(data.d[0].Mobno);
                    $("#lbleditStaffid").text(UserId)


                }

                //  setTimeout($.unblockUI, 1000);

            },
            error: function (data) {
                alert("Error");
            }
        });


        $("#divEditStaffDetails").show();
    })
    $('#ddlEditCat').change(function () {
        var UserId = $('#ddlEditCat option:selected').val();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/CategoryList",
            data: "{'userid':'" + UserId + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var totallen = data.d.length;
                var txt = "";
                var totalmcqs = 0;
                //alert(len);
                if (len > 0) {
                    $("#txtEditCatName").val(data.d[0].CatName);
                    $("#txtEditCatPurpose").val(data.d[0].CatPurpose);
                    $("#txtEditCatTagline").val(data.d[0].Tagline);
                    $("#txtEditCatDes").val(data.d[0].CatDesc);
                    $("#imgCatEditimg").attr("src", "../../CatImg/" + data.d[0].CatImg);

                    $("#lbleditCatid").text(UserId);


                }

                //  setTimeout($.unblockUI, 1000);

            },
            error: function (data) {
                alert("Error");
            }
        });


        $("#divEditStaffDetails").show();
    })
    $('#ddlDeleteUsers').change(function () {
        var UserId = $('#ddlDeleteUsers option:selected').val();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/UserDetail",
            data: "{'Emyadminid':'" + Emyadminid + "','userid':'" + UserId + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var totallen = data.d.length;
                var txt = "";
                var totalmcqs = 0;
                //alert(len);
                if (len > 0) {
                    $("#txtDeleteUserName").val(data.d[0].UserName);
                    $("#txtDeleteUserEmail").val(data.d[0].UserEmail);
                    $("#txtDeleteUserpwd").val(data.d[0].UserPassword);
                    $("#lblDeleteuserid").text(data.d[0].UserId)


                }

                //  setTimeout($.unblockUI, 1000);

            },
            error: function (data) {
                alert("Error");
            }
        });

        //  alert(UserId);

        //        $.ajax({
        //            type: "POST",
        //            contentType: "application/json; charset=utf-8",
        //            url: "myindex.aspx/UserDetail",
        //            data: "{'Emyadminid':'" + Emyadminid + "'}",
        //            timeout: 90000,dataType: "json",
        //            success: function (data) {
        //                var len = data.d.length;
        //                var txt = "";
        //                if (len > 0) {
        //                    for (var i = 0; i < len; i++) {
        //                           alert(data.d[i].UserEmail);
        //                        $('#ddlUserRoleId').val(data.d[i].UserRole);
        //                        $('#txtUserName').val(data.d[i].UserName);
        //                        $('#txtUserEmail').val(data.d[i].UserEmail);
        //                        $('#txtUserPassword').val(data.d[i].UserPassword);
        //                        $('#txtUserParentEmail').val(data.d[i].UserParrentEmail);
        //                        $('#txtUserParentName').val(data.d[i].UserParrentName);
        //                        $('#txtUserRollNo').val(data.d[i].UserRollNo);
        //                        $('#txtUserFirstName').val(data.d[i].UserFirstName);
        //                        $('#txtUserLastName').val(data.d[i].UserLastName);
        //                        $('#txtUserDepartment').val(data.d[i].UserDepartment);
        //                        $('#txtUserRegion').val(data.d[i].UserRegion);
        //                        $('#txtUserTelephoneNo').val(data.d[i].UserPhoneNo);
        //                        $('#txtUserDOB').val(data.d[i].UserDateOfBirth);
        //                        $('#ddlUserGroup').val();
        //                        $('#txtUserImage').val(data.d[i].UserPicture);
        //                        $('#txtUserCity').val(data.d[i].UserCity);
        //                        $('#ddlUserGender').val(data.d[i].UserGender);
        //                        chkCertificateCustomDesignbit;
        //                        chkResultCardCustomDesignbit;
        //                        chkUserEmailResultbit
        //                        $('#txtUserCountry').val(data.d[i].UserCountry);
        //                        var txtUserTermsAndConditions = '"' + CKEDITOR.instances.txtUserTermsAndConditions.getData() + '"';
        //                        chkUserPracticeModebit
        //                        chkRandomizeQuestionsInTestbit;
        //                        $('#ddlTotalUserAttempts').val(data.d[i].UserTotalAttempts);
        //                        chkEmailTestResultToAdminbit;
        //                        chkUserSeeOtherUsersResultbit;
        //                        $('#txtUserTestStartDateTime').val(data.d[i].UserTestStartingDatetime);
        //                        $('#txtUserTestEndDateTime').val(data.d[i].UserTestDueDateTime);


        //                        txt += '<tbody><tr><td>' + data.d[i].SubjectName + '</td><td>' + data.d[i].TestName + '</td><td>' + data.d[i].TestStartingDate + '</td><td>' + data.d[i].TestEndingDate + '</td><td>' + data.d[i].TestStatus + '</td></tr></tbody>';
        //                    }

        //                    if (txt != '') {
        //                        $("#tableShowUserMcqs").append(txt).removeClass("hidden");
        //                        $("#tableShowUserMcqs").DataTable();
        //                        alert(txt);
        //                    }
        //                }

        //            },
        //            error: function (data) {
        //                alert("Error");
        //            }
        //        });



        $("#divDeleteUserDetails").show();
    })
    $('#ddlDeleteStaff').change(function () {
        var UserId = $('#ddlDeleteStaff option:selected').val();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/StaffDetail",
            data: "{'id':'" + UserId + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var totallen = data.d.length;
                var txt = "";
                var totalmcqs = 0;
                //alert(len);
                if (len > 0) {
                    $("#txtDeleteStaffName").val(data.d[0].Name);
                    $("#txtDeleteStaffQual").val(data.d[0].Qual);
                    $("#txtDeleteMob").val(data.d[0].Mobno);
                    $("#lblDeleteStaffid").text(UserId)


                }


            },
            error: function (data) {
                alert("Error");
            }
        });

        $("#divDeleteStaffDetails").show();
    })
    $('#ddlDeleteCat').change(function () {
        var UserId = $('#ddlDeleteCat option:selected').val();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "myindex.aspx/CategoryList",
            data: "{'userid':'" + UserId + "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var len = data.d.length;
                var totallen = data.d.length;
                var txt = "";
                var totalmcqs = 0;
                //alert(len);
                if (len > 0) {
                    $("#txtDeleteCatName").val(data.d[0].CatName);
                    $("#txtDeleteCatDes").val(data.d[0].CatDesc);
                    $("#txtDeleteCatPurpose").val(data.d[0].CatPurpose);
                    $("#lblDeleteCatid").text(UserId)


                }


            },
            error: function (data) {
                alert("Error");
            }
        });

        $("#divDeleteCat").show();
    })
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

            // Getmcqs(QuestioNo);
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
        //  Getmcqs(QuestioNo);

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
            // Getmcqs(QuestioNo);

            $("#btnNext").prop('disabled', false);
            $("#btnFirst").prop('disabled', false);
            $("#btnEnd").prop('disabled', false);
        }
        else {

            QuestioNo--;
            CurrectQNo -= 2;
            $("#btnNext").prop('disabled', false);
            //  Getmcqs(QuestioNo);
            $("#btnFirst").prop('disabled', false);
            //alert('in minus ' + QuestioNo);
        }
        //alert("This is Quesiton No" + QuestioNo)

    })
    $("#btnEnd").click(function () {
        removeColors();
        QuestioNo = -2;
        //alert("This is Quesiton No" + QuestioNo)
        //  Getmcqs(QuestioNo);
        $("#btnNext").prop('disabled', true);
        $("#btnPrevious").prop('disabled', false);
        $("#btnEnd").prop('disabled', true);
        $("#btnFirst").prop('disabled', false);
    })




});