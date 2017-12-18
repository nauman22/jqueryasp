$(document).ready(function () {
    String.prototype.unquoted = function () { return this.replace(/(^")|("$)/g, '') }
    String.prototype.notBackSlash = function () { return this.replace(/\\/g, '\\\\') };
    function hide_all() {

        //  $('#bgimg').hide();
        $('.btnShowResultdiv').hide();
        $('#LoadMcqsAllQuestion').hide();
        $('.btntestthistest').hide();
        $('.btnPracticethistest').hide();
        $('#maintable').hide(); //allmcqscount
        $('#allmcqscount').hide(); //testheader
        $('#testheader').hide(); //testheader
        $("#divinst").hide();
        $("#MoreOptions").hide();
        $("#reference").hide();
        $("#Explanation").hide();
        $("#divhometbl").hide();
        $("#catbox").hide();
        $("#divCommonSubTestNumb").hide();
        $("#divMcqsQuestion").hide();
        $("#MergeTestResult_New").hide();
    }
    hide_all();
    var pageIndex = 0;
    var pageCount = 0;
    var checkbitforexpandrefckeditor = 0;
    parseInt(checkbitforexpandrefckeditor++);
    //console.log(checkbitforexpandrefckeditor);
    // //debugger;
    if (checkbitforexpandrefckeditor == 1) {


        CKEDITOR.replace('txtQuestion', {});
        CKEDITOR.replace('txtOption1');
        CKEDITOR.replace('txtOption2');
        CKEDITOR.replace('txtOption3');
        CKEDITOR.replace('txtOption4');
        CKEDITOR.replace('txtOption5');
        CKEDITOR.replace('txtOption6');
        CKEDITOR.replace('txtOption7');
        CKEDITOR.replace('txtOption8');
        CKEDITOR.replace('txtReference');
        CKEDITOR.replace('txtExplanation');
    }
    $('#btnExplanation').click(function () {
        //  $('#MoreOptions').hide();
        $('#Explanation').toggle();

    })


    $('#ddlSubject').change(function () {
        //$("#ddlSubject").empty();
        $("#ddlTest").empty();
        $("#ddlTest").append($("<option></option>").val(0).html('Select Test'));
        var subId = $("#ddlSubject").val();
        //alert(subId);
        $.ajax({

            type: "POST",
            cache: false,
            contentType: "application/json; charset=utf-8",
            url: "default.aspx/LoadddlTestForSpecificSub",
            data: "{'SubId':'" + subId + "'}",
            timeout: 90000, dataType: "json",
            success: function (Result) {
                $.each(Result.d, function (key, value) {
                    $("#ddlTest").append($("<option></option>").val(value.TestId).html(value.TestName));
                    $("#ddlTest").trigger("chosen:updated");

                });
                alertify.success("Loaded Successfully :)");
            },
            error: function (Result) {
                alertify.error("There is an Error.Please try again later");
            }

        });
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
    var IsEdit = 0;
    var txtbtnQuestionSimpleBoxbit = 0;
    $('#btnSave').click(function () {
        debugger;
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
        var QuestionText1 = $('#txtQuestion').val();
        var QuestionText = '"' + QuestionText1 + '"';
        if (txtbtnQuestionSimpleBoxbit == 0) {

            QuestionText = '"' + QuestionText1 + '"';

        }
        else {
            QuestionText = '"' + CKEDITOR.instances.txtQuestion.getData().notBackSlash() + '"';

        }
        if (QuestionText.length == 2) {
            QuestionText = '"' + CKEDITOR.instances.txtQuestion.getData().notBackSlash() + '"';
            //console.log(QuestionText);
        }

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
            txtOption1 = $('#txtOption1').val();
        }

        // option 2
        if (txtOption2bit == 0) {
            txtOption2 = '"' + CKEDITOR.instances.txtOption2.getData().notBackSlash() + '"';
        }
        else {
            txtOption2 = $('#txtOption2').val();
        }
        // otpion 3
        if (txtOption3bit == 0) {

            txtOption3 = '"' + CKEDITOR.instances.txtOption3.getData().notBackSlash() + '"';
        }
        else {
            txtOption3 = $('#txtOption3').val();
        }
        // option4
        if (txtOption4bit == 0) {

            txtOption4 = '"' + CKEDITOR.instances.txtOption4.getData().notBackSlash() + '"';
        }
        else {
            txtOption4 = $('#txtOption4').val();
        }
        if (txtOption5bit == 0) {
            txtOption5 = '"' + CKEDITOR.instances.txtOption5.getData().notBackSlash() + '"';
        }
        else {
            txtOption5 = $('#txtOption5').val();
        }
        //
        if (txtOption6bit == 0) {
            txtOption6 = '"' + CKEDITOR.instances.txtOption6.getData().notBackSlash() + '"';
        }
        else {
            txtOption6 = $('#txtOption6').val();
        }
        //
        if (txtOption7bit == 0) {
            txtOption7 = '"' + CKEDITOR.instances.txtOption7.getData().notBackSlash() + '"';
        }
        else {
            txtOption7 = $('#txtOption7').val();
        }
        //
        if (txtOption8bit == 0) {
            txtOption8 = '"' + CKEDITOR.instances.txtOption8.getData().notBackSlash() + '"';
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
            cache: false,
            contentType: "application/json; charset=utf-8",
            complete: function () {

            },
            beforeSend: function () {
                $('#lblQuestionComplete').html('Saving options...');
                alertify.log("Saving options... Please wait");
            },
            timeout: 90000,
            url: "../../../../../default.aspx/Mcqs_Options_Insert",
            data: "{'SubjectId':'" + SubjectId + "','TestId':'" + TestId + "','QuestionText':'" + QuestionText + "','points':'" + Points +
                "','txtOption1':'" + txtOption1 + "','txtOption2':'" + txtOption2 + "','txtOption3':'" + txtOption3 +
                "','txtOption4':'" + txtOption4 + "','txtOption5':'" + txtOption5 + "','txtOption6':'" + txtOption6 +
                "','txtOption7':'" + txtOption7 + "','txtOption8':'" + txtOption8 + "','chkOption1':'" + chkOption1 +
                "','chkOption2':'" + chkOption2 + "','chkOption3':'" + chkOption3 + "','chkOption4':'" + chkOption4 +
                "','chkOption5':'" + chkOption5 + "','chkOption6':'" + chkOption6 + "','chkOption7':'" + chkOption7 +
                "','chkOption8':'" + chkOption8 +
                "','ExplanationText':'" + ExplanationText +
                "','ReferenceTexts':'" + ReferenceText +
                "'}",
            timeout: 90000, dataType: "json",
            success: function (data) {
                var obj = data.d;
                itotal = data.d;
                $('#lblQuestionComplete').html('Question with All Options saved...    ' + itotal);
                alertify.success("Mcqs Saved. " + itotal);
                alertify.log("Mcqs Submitted for Permission Successfully!");
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





    })

    $('#btnMoreOptions').click(function () {

        $('#MoreOptions').toggle(1000);

    })
    $('#btnReference').click(function () {
        $('#reference').toggle();
    })
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


    $(document).ready(function () {
        var CurrentTestid = 0;
        var subname_scroll = "";
        var testname_scroll = "";
        var Srno = 1;
        var mcq = 1;
        var totalmcqs = 0;
        var totalloadedmcqs = 0;
        var exp = "";
        var reff = "";
        var edate = "";
        var myTable;
        var isPractice = 0;
        var isActive = false;
        function blockui() {
            $.blockUI({
                //fadeIn: 7,
                //fadeOut: 7,
                //timeout: 500,
                showOverlay: false,
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

        //if ($('.adsbygoogle').hide()) {
        //   // blockui();


        //    var myhtml = '<div><h2>It Looks Like You Have AdBlocker Enabled</h2>'+
        //    'Please know that Freemcqs.com relies solely on ads to keep producing and offering free content to you. We appreciate if you add our site on whitelist of Adblock to help support our site.'+
        //    '<button id="dismissmsg">Dismiss</button></div>';
        //    $('#divloading').html(myhtml);
        //    $.blockUI({
        //        //    $.blockUI({ 
        //        message: myhtml,
        //        css: { top: '20%', cursor:'pointer' }
        //        //     }); 
        //    })
        //    $(document).on("click", '#dismissmsg ', function () {
        //        window.location.href = "http://localhost:34128/default.aspx";
        //        //alert("i am click");
        //    })
        //    return;
        //    alert("Please Disable Adblock !");
        //}
        //  $.ajaxSetup({ cache: true });
        Router.config({ mode: 'history' });
        var string_formatring_fb = 'Q.2  Diameter of a motor nerve fibre is ' +
                                    'A. 26 m' +
                                    'B. 28 m' +
                                    'C. 38 m' +
                                    'D. None of these ';

        $.fn.randomize = function (a) { (a ? this.find(a) : this).parent().each(function () { $(this).children(a).sort(function () { return Math.random() - 0.5 }).detach().appendTo(this) }); return this };
        $('#allmcqscount').show();
        $('#maintable').show();
        $("#catbox").show();
        var lblCorrectAns = 0;
        var lblWrongAns = 0;
        var lblOverallPercent = 0;
        function shuffle(a) {

            var c = a.length, t, r;
            while (0 !== c) {
                r = Math.floor(Math.random() * c);
                c -= 1; t = a[c]; a[c] = a[r]; a[r] = t;
            }
            return a;
        }

        function findAndReplace(find, replace) {
            find.parentNode.replaceChild(replace, find)
        }

        function goToByScroll(id) {
            // Remove "link" from the ID
            //  id = id.replace("link", "");
            // Scroll

            $('html, body').animate({
                scrollTop: ($("#" + id).offset().top - 91)
            }, 50);


        }
        function onlyUnique(value, index, self) {
            return self.indexOf(value) === index;
        }
        $(window).scroll(function () {
            ////debugger;
            if (!isActive && $(window).scrollTop() == $(document).height() - $(window).height()) {
                isActive = true;
                if (isPractice == 1) {
                    var mytot = $("#totq").text();
                    // alert(mytot + " practice");
                    if (totalloadedmcqs < mytot) {

                        Router.navigate();
                        showPractice(CurrentTestid);
                        Router.navigate('Practice/Online/Mcqs/Practice/FreeMcqs-' + CurrentTestid);
                        //  Router.navigate('Practice/Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/' + subname_scroll + '/' + testname_scroll + '/TestId=' + CurrentTestid);

                    }
                    else {
                        alertify.log("No more Mcqs!");
                        Router.navigate();
                        Router.navigate('Practice/Online/Mcqs/Practice/FreeMcqs-' + CurrentTestid);

                        //  Router.navigate('Practice/Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/' + subname_scroll + '/' + testname_scroll + '/TestId=' + CurrentTestid);

                    }
                }
                else if (isPractice == 2) {
                    var mytot = $("#totq").text();
                    //alert(mytot + " test");
                    if (totalloadedmcqs < mytot) {

                        Router.navigate();
                        showTestdiv(CurrentTestid);
                        Router.navigate('Test/Online/Mcqs/Test/FreeMcqs-' + CurrentTestid);
                        //Router.navigate('Practice/Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/' + subname_scroll + '/' + testname_scroll + '/TestId=' + CurrentTestid);

                    }
                    else {
                        alertify.log("No more Mcqs!");
                        Router.navigate();
                        Router.navigate('Test/Online/Mcqs/Test/FreeMcqs-' + CurrentTestid);


                        //  Router.navigate('Practice/Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/' + subname_scroll + '/' + testname_scroll + '/TestId=' + CurrentTestid);

                    }
                }
                //if ($("#tblLoadMcqsAllQuestion").is(':visible') && ($("#btnShowResultdiv").css('display') == 'none' )) {
                //    //var tr = $(this).closest('tr');
                //    //var row = myTable.row(tr);
                //    //var Id = myTable.row(row[0][0]).data()[3];
                //    //alert("totalmcqs " = totalmcqs + "  totalloadedmcqs " + totalloadedmcqs);

                //    //totq = parseInt(totq) + parseInt(len - 1);

                //}
                //else if ($("#btnShowResultdiv").is(':visible') && $("#tblLoadMcqsAllQuestion").is(':visible'))
                //{

                //}
                // GetRecords();
            }
        });
        function add3Dots(string, limit) {
            var dots = "...";
            if (string.length > limit) {
                // you can also use substr instead of substring
                string = string.substring(0, limit) + dots;
            }

            return string;
        }

        function getSubId() {
            var SubId_test;
            blockui();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "default.aspx/getTestInfo",
                beforeSend: function () {


                    $('#divloading').html('Please Wait while loading your requested contents...');
                    blockui();
                    //$('#lblQuestionBefore').html("Saving...");



                },
                data: "{'TestId':'" + CurrentTestid + "'}",
                async: false,
                timeout: 90000, dataType: "json",
                success: function (data) {
                    if (data.d.length > 0) {
                        for (var i = 0; i < data.d.length; i++) {

                            //TestName_test = data.d[i].TestName;
                            //SubjectName = data.d[i].SubName;
                            //isMultiple = data.d[i].IsMultiple;
                            SubId_test = data.d[i].SubId;
                            //AdminName = data.d[i].AdminName;
                            // Inst = data.d[i].TestInst.unquoted().replace(/\s+/g, " ").replace(/\n/g, " ").notBackSlash();
                            // TestPassingPercentage = data.d[i].TestPassingPercent;
                            //totalmcqs = data.d[i].TotalQ;



                        }
                        setTimeout($.unblockUI, 500);
                    }
                    else {
                        setTimeout($.unblockUI, 500);
                        alertify.error("No Record found Against this query ");
                        return false;
                    }


                },
                error: function (result) {
                    alertify.error("Error");
                    return false;
                }
            })
            setTimeout($.unblockUI, 500);
            return SubId_test;
        }
        function ShowSubjectTests(subid, cat_Fullname) {
            $.ajax({
                type: "POST",
                cache: false,
                contentType: "application/json; charset=utf-8",
                url: "default.aspx/LoadHomePages",
                data: "{'subid':'" + subid + "'}",
                dataType: "json",
                timeout: (2 * 1000000),
                beforeSend: function () {
                    blockui();
                    $('#divloading').html('Please Wait while loading your requested contents...');
                    //$('#lblQuestionBefore').html("Saving...");



                },
                complete: function () {
                    $('#divloading').html('');
                    //$('#lblQuestionBefore').html('');
                    // $('#lblQuestionComplete').html("Saved");


                },
                success: function (data) {
                    value_storage = data;
                    // and save it
                    //  $.jStorage.set(mysubidkeystorage.toString(), value_storage,3000000);
                    var len = data.d.length;
                    var totallen = data.d.length;
                    var txt = "";
                    var totalmcqs = 0;
                    var cat_Fullname = "";
                    //alert(len);
                    if (len > 0) {
                        cat_Fullname = data.d[0].SubjectName;
                        for (var i = 0; i < len; i++) {

                            txt += '<tr><td></td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].SubjectName +
                                '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].TestName +
                                '</td><td data-hidden="1">' + data.d[i].TestId +
                                 '</td><td data-hidden="1">' + data.d[i].SubId +
                                '</td><td style="font-size: 10px;">' + data.d[i].AdminName +
                                '</td><td><label style="font-size: 12px;">' + data.d[i].TotalMcqs +
                                '</label></td><td> <a href="#" class="btn btn-sm btn-primary Practice">Make Practice</a></td><td> <a href="#" class="btn btn-sm btn-danger divUserTest">Take Test</a></td><td style="font-size: 12px;"><a href="#" class="btn btn-link AddUserMcqs">Add Question</a></td>' + '<td data-hidden="1">' + data.d[i].IsMultiple + '</td></tr>';
                            totalmcqs = totalmcqs + data.d[i].TotalMcqs;
                        }

                        if (txt != '') {
                            hide_all();
                            Scroll_top();
                            $("#divhometbl").show();
                            $('#allmcqscount').show();
                            $('#maintable').show();
                            //alert('hello');
                            //  Router.navigate('Category/OnlineMcqs/' + 'CatFreemcqs-' + subid);
                            Router.navigate('Category/Online/Mcqs/Category/FreeMcqs-' + subid);
                            //  Router.navigate('#!Category-' + subid + '-' + cat_Fullname.trim());
                            $("#SPANSubName").text(cat_Fullname + ' with ');
                            if ($.fn.DataTable.isDataTable('#example')) {
                                $('#example').DataTable().destroy();
                                $('#example tbody').empty();
                            }


                            $("#example").append(txt);
                            $("#totalmcqs").text(totalmcqs);
                            myTable = $("#example").DataTable(
                                 {
                                     paging: false,
                                     //responsive: {
                                     //    details: true
                                     //},
                                     //ServerSide: true,

                                     "columnDefs": [
                                          {
                                              "targets": [1],
                                              "visible": false,
                                              "searchable": false
                                          },
                                         {
                                             "targets": [3],
                                             "visible": false,
                                             "searchable": false
                                         },
                                         {
                                             "targets": [4],
                                             "visible": false,
                                             "searchable": false
                                         },
                                          {
                                              "targets": [5],
                                              "visible": false,
                                              "searchable": false
                                          },
                                           {
                                               "targets": [10],
                                               "visible": false,
                                               "searchable": false
                                           },
                                         { responsivePriority: 1, targets: 2 },
                                    { responsivePriority: 2, targets: 7 },
                                     { responsivePriority: 3, targets: 8 }

                                     //{ responsivePriority: 4, targets: 6 },
                                     //{ responsivePriority: 5, targets: 6 }
                                     ]
                                     //select: {
                                     //    style: 'multi'
                                     //}

                                 }
                                );
                            myTable.on('order.dt search.dt', function () {
                                myTable.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                                    cell.innerHTML = i + 1;
                                });
                            }).draw()

                        }
                    }
                    setTimeout($.unblockUI, 1000);

                },
                error: function (result) {

                    alertify.error("Error occour in Loading Mcqs Please try again letter ! ");
                    setTimeout($.unblockUI, 1000);
                }
            })
        }

        // Check if "key" exists in the storage
        var value_storage = $.jStorage.get("homepage");
        value_storage = null;
        function LoadHomePagesAllsub() {
            $.ajax({
                type: "POST",
                cache: false,
                contentType: "application/json; charset=utf-8",
                url: "default.aspx/LoadHomePagesAllsub",
                data: "{}",
                dataType: "json",
                timeout: (2 * 1000000),
                beforeSend: function () {
                    blockui();
                    $('#divloading').html('Please Wait while loading your requested contents...');
                    //$('#lblQuestionBefore').html("Saving...");



                },
                complete: function () {
                    $('#divloading').html('');
                    //$('#lblQuestionBefore').html('');
                    // $('#lblQuestionComplete').html("Saved");


                },
                success: function (data) {
                    value_storage = data;
                    $.jStorage.set("homepage", value_storage, 300000);
                    var len = data.d.length;
                    var totallen = data.d.length;
                    var txt = "";
                    var totalmcqs = 0;
                    var cattotalmcqs = 0;
                    var cattotaltests = 0;
                    var medcattotalmcqs = 0;
                    var medcattotaltests = 0;
                    var enggcattotalmcqs = 0;
                    var enggcattotaltests = 0;
                    var competitivecattotalmcqs = 0;
                    var competitivecattotaltests = 0;
                    var admcattotalmcqs = 0;
                    var admcattotaltests = 0;
                    var jobscattotalmcqs = 0;
                    var jobscattotaltests = 0;
                    var skillcattotalmcqs = 0;
                    var skillcattotaltests = 0;
                    var othercattotalmcqs = 0;
                    var othercattotaltests = 0;


                    $("#divvucat").html("");
                    //alert(len);
                    if (len > 0) {
                        Scroll_top();
                        console.log(data.d);
                        var myCat = [];
                        for (var i = 0; i < len; i++) {
                            myCat.push(data.d[i].catid);
                        }
                        var unique = myCat.filter(onlyUnique);
                        unique.sort(function (a, b) { return a - b });
                        console.log(unique);
                        var catheadinghtml = "";
                        var catsubjectlist = "";
                        for (var i = 0; i < unique.length; i++) {
                            catheadinghtml += "<div id='vu_catbox' class='col-md-6 col-sm-6 text-center wow fadeInUp animated' data-wow-animation-name='fadeInUp' style='border: inherit; visibility: visible; animation-name: fadeInUp;'>" +
                     "<div class='feature-box-heading'>" +
                         "<em>" +
                             "<img src='../../../../../All_Images/logo.png' alt='' width='130' height='78'>" +
                         "</em>" +
                         "<h4>" +
                             "<b>Virtual University</b>" +
                         "</h4>" +
                         "<label><span class='glyphicon glyphicon-flag ' aria-hidden='true'></span>" +
                     "This Category has overall " +
                     "<span id='divvucattotaltests' class='badge bg-blue' aria-hidden='true'>240</span>" +
                         "<span style='color: red;'>Tests</span> and" +
                             "<span id='divvucattotalmcqs' class='badge bg-green' aria-hidden='true'>2933</span>" +
                                 "<span style='color: darkblue;'>MCQS</span>.</label>" +
                     "</div>" +
                     "<div>"
                            for (j = 0; j < len; j++) {

                                catsubjectlist +=
                        "<div id='divvucat' class='list-group' style='font-size: 12px; text-align: left;'>" +
                    " <a href='#' data-value='265' class='list-group-item '> <span class='glyphicon glyphicon-circle-arrow-right' aria-hidden='true'></span>" +
                                "Data Structures CS301 <span class='badge bg-blue'>1 Test </span></a><a href='#' data-value='270' class='list-group-item '>" +
                                " <span class='glyphicon glyphicon-circle-arrow-right' aria-hidden='true'></span>" +
                   " Introduction to Computer Programming CS201 <span class='badge bg-blue'>45 Test's </span></a>" +
                    "<a href='#' data-value='271' class='list-group-item '>" +
                    "</div>"

                                "</div>" +

                            "</div>"
                            }
                        }

                        for (var i = 0; i < len; i++) {
                            //console.log(data.d[i]);
                            ////console.log('catid ' + data.d[i].catid + '    <a href="#" data-value="' + data.d[i].SubId + '" class="list-group-item ">' + data.d[i].SubjectName + '</a>')
                            // Vu 1 

                            if (data.d[i].catid === 1) {

                                cattotalmcqs = cattotalmcqs + parseInt(data.d[i].TotalMcqs);
                                cattotaltests = cattotaltests + parseInt(data.d[i].TotalTest)
                                $("#divvucattotalmcqs").html("" + cattotalmcqs + "");
                                $("#divvucattotaltests").html("" + cattotaltests + "");
                                if (data.d[i].TotalTest > 0) {

                                    var test = "Test";
                                    if (data.d[i].TotalTest > 1) {
                                        test = "Test's"
                                    }
                                    var subNamedoted = "";
                                    if (data.d[i].SubjectName.length > 100) {
                                        subNamedoted = add3Dots(data.d[i].SubjectName, 100);
                                    }
                                    else {
                                        subNamedoted = data.d[i].SubjectName;
                                    }
                                    ////console.log(data.d[i].TotalTest)
                                    $("#divvucat").append('<a href="#" data-value="' + data.d[i].SubId + '" class="list-group-item " > <span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span> ' + subNamedoted + ' <span class="badge bg-blue">' + data.d[i].TotalTest + ' ' + test + ' </span></a>');
                                }
                                else {
                                    $("#vu_catbox").hide();
                                }

                            }
                            // CatId Medical = 3 and MedEngg = 11
                            if (data.d[i].catid == 3 || data.d[i].catid == 11) {
                                medcattotalmcqs = medcattotalmcqs + parseInt(data.d[i].TotalMcqs);
                                medcattotaltests = medcattotaltests + parseInt(data.d[i].TotalTest)
                                $("#divmedcattotalmcqs").html("" + medcattotalmcqs + "");
                                $("#divmedcattotaltests").html("" + medcattotaltests + "");
                                if (data.d[i].TotalTest > 0) {

                                    var test = "Test";
                                    if (data.d[i].TotalTest > 1) {
                                        test = "Test's"
                                    }
                                    var subNamedoted = "";
                                    if (data.d[i].SubjectName.length > 36) {
                                        subNamedoted = add3Dots(data.d[i].SubjectName, 33);
                                    }
                                    else {
                                        subNamedoted = data.d[i].SubjectName;
                                    }
                                    ////console.log(data.d[i].TotalTest)
                                    $("#divmedcat").append('<a href="#" data-value="' + data.d[i].SubId + '" class="list-group-item " > <span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span> ' + subNamedoted + ' <span class="badge bg-blue">' + data.d[i].TotalTest + ' ' + test + ' </span></a>');
                                }
                                else {
                                    if (medcattotaltests < 1) {
                                        $("#med_catbox").hide();
                                    }

                                }
                            }
                            // CatId Engg = 4 and MedEngg =11
                            if (data.d[i].catid == 4 || data.d[i].catid == 11) {
                                enggcattotalmcqs = enggcattotalmcqs + parseInt(data.d[i].TotalMcqs);
                                enggcattotaltests = enggcattotaltests + parseInt(data.d[i].TotalTest)
                                $("#divenggcattotalmcqs").html("" + enggcattotalmcqs + "");
                                $("#divenggcattotaltests").html("" + enggcattotaltests + "");
                                if (data.d[i].TotalTest > 0) {

                                    var test = "Test";
                                    if (data.d[i].TotalTest > 1) {
                                        test = "Test's"
                                    }
                                    var subNamedoted = "";
                                    if (data.d[i].SubjectName.length > 36) {
                                        subNamedoted = add3Dots(data.d[i].SubjectName, 33);
                                    }
                                    else {
                                        subNamedoted = data.d[i].SubjectName;
                                    }
                                    // //console.log(data.d[i].TotalTest)
                                    $("#divengcat").append('<a href="#" data-value="' + data.d[i].SubId + '" class="list-group-item " > <span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span> ' + subNamedoted + ' <span class="badge bg-blue">' + data.d[i].TotalTest + ' ' + test + ' </span></a>');
                                }
                                else {
                                    if (enggcattotaltests < 1) {
                                        $("#engg_catbox").hide();
                                    }

                                }
                            }
                            // CatId  Competitive Test = 5 and CompetitiveAdmissionJobsSkillsothers = 13
                            if (data.d[i].catid == 5 || data.d[i].catid == 13) {
                                competitivecattotalmcqs = competitivecattotalmcqs + parseInt(data.d[i].TotalMcqs);
                                competitivecattotaltests = competitivecattotaltests + parseInt(data.d[i].TotalTest)
                                $("#divcompcattotalmcqs").html("" + competitivecattotalmcqs + "");
                                $("#divcompcattotaltests").html("" + competitivecattotaltests + "");
                                if (data.d[i].TotalTest > 0) {

                                    var test = "Test";
                                    if (data.d[i].TotalTest > 1) {
                                        test = "Test's"
                                    }
                                    var subNamedoted = "";
                                    if (data.d[i].SubjectName.length > 36) {
                                        subNamedoted = add3Dots(data.d[i].SubjectName, 33);
                                    }
                                    else {
                                        subNamedoted = data.d[i].SubjectName;
                                    }
                                    // //console.log(data.d[i].TotalTest)
                                    $("#divcomptcat").append('<a href="#" data-value="' + data.d[i].SubId + '" class="list-group-item " > <span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span> ' + subNamedoted + ' <span class="badge bg-blue">' + data.d[i].TotalTest + ' ' + test + ' </span></a>');
                                }
                                else {
                                    if (competitivecattotaltests < 1) {
                                        $("#compet_catbox").hide();
                                    }

                                }
                            }
                            // Admission Test = 6 and CompetitiveAdmissionJobsSkillsothers = 13
                            if (data.d[i].catid == 6 || data.d[i].catid == 13) {
                                admcattotalmcqs = admcattotalmcqs + parseInt(data.d[i].TotalMcqs);
                                admcattotaltests = admcattotaltests + parseInt(data.d[i].TotalTest)
                                $("#divadmcattotalmcqs").html("" + admcattotalmcqs + "");
                                $("#divadmcattotaltests").html("" + admcattotaltests + "");
                                if (data.d[i].TotalTest > 0) {

                                    var test = "Test";
                                    if (data.d[i].TotalTest > 1) {
                                        test = "Test's"
                                    }
                                    var subNamedoted = "";
                                    if (data.d[i].SubjectName.length > 36) {
                                        subNamedoted = add3Dots(data.d[i].SubjectName, 33);
                                    }
                                    else {
                                        subNamedoted = data.d[i].SubjectName;
                                    }
                                    ////console.log(data.d[i].TotalTest)
                                    $("#divAdmtest").append('<a href="#" data-value="' + data.d[i].SubId + '" class="list-group-item " > <span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span> ' + subNamedoted + ' <span class="badge bg-blue">' + data.d[i].TotalTest + ' ' + test + ' </span></a>');
                                } else {
                                    if (admcattotaltests < 1) {
                                        $("#adm_catbox").hide();
                                    }

                                }
                            }
                            // Jobs Test = 7 , JobsSkillsOthers = 12 and  CompetitiveAdmissionJobsSkillsothers = 13
                            if (data.d[i].catid == 7 || data.d[i].catid == 12 || data.d[i].catid == 13) {
                                jobscattotalmcqs = jobscattotalmcqs + parseInt(data.d[i].TotalMcqs);
                                jobscattotaltests = jobscattotaltests + parseInt(data.d[i].TotalTest)
                                $("#divjobcattotalmcqs").html("" + jobscattotalmcqs + "");
                                $("#divjobcattotaltests").html("" + jobscattotaltests + "");
                                if (data.d[i].TotalTest > 0) {

                                    var test = "Test";
                                    if (data.d[i].TotalTest > 1) {
                                        test = "Test's"
                                    }
                                    var subNamedoted = "";
                                    if (data.d[i].SubjectName.length > 36) {
                                        subNamedoted = add3Dots(data.d[i].SubjectName, 33);
                                    }
                                    else {
                                        subNamedoted = data.d[i].SubjectName;
                                    }
                                    //console.log(data.d[i].TotalTest)
                                    $("#divjobtest").append('<a href="#" data-value="' + data.d[i].SubId + '" class="list-group-item " > <span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span> ' + subNamedoted + ' <span class="badge bg-blue">' + data.d[i].TotalTest + ' ' + test + ' </span></a>');
                                }
                                else {
                                    if (jobscattotaltests < 1) {
                                        $("#job_catbox").hide();
                                    }

                                }
                            }
                            // Skills Test = 8 , JobsSkillsOthers = 12 and  CompetitiveAdmissionJobsSkillsothers = 13
                            if (data.d[i].catid == 8 || data.d[i].catid == 12 || data.d[i].catid == 13) {
                                skillcattotalmcqs = skillcattotalmcqs + parseInt(data.d[i].TotalMcqs);
                                skillcattotaltests = skillcattotaltests + parseInt(data.d[i].TotalTest)
                                $("#divmedskilltotalmcqs").html("" + skillcattotalmcqs + "");
                                $("#divskillcattotaltests").html("" + skillcattotaltests + "");
                                if (data.d[i].TotalTest > 0) {

                                    var test = "Test";
                                    if (data.d[i].TotalTest > 1) {
                                        test = "Test's"
                                    }
                                    var subNamedoted = "";
                                    if (data.d[i].SubjectName.length > 36) {
                                        subNamedoted = add3Dots(data.d[i].SubjectName, 33);
                                    }
                                    else {
                                        subNamedoted = data.d[i].SubjectName;
                                    }
                                    // //console.log(data.d[i].TotalTest)
                                    $("#divskilltest").append('<a href="#" data-value="' + data.d[i].SubId + '" class="list-group-item " > <span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span> ' + subNamedoted + ' <span class="badge bg-blue">' + data.d[i].TotalTest + ' ' + test + ' </span></a>');
                                }
                                else {
                                    if (skillcattotaltests < 1) {
                                        $("#skill_catbox").hide();
                                    }

                                }
                            }
                            // Other Tests = 9 , JobsSkillsOthers = 12 and  CompetitiveAdmissionJobsSkillsothers = 13
                            if (data.d[i].catid == 9 || data.d[i].catid == 12 || data.d[i].catid == 13) {
                                othercattotalmcqs = othercattotalmcqs + parseInt(data.d[i].TotalMcqs);
                                othercattotaltests = othercattotaltests + parseInt(data.d[i].TotalTest)
                                $("#divmisccattotalmcqs").html("" + othercattotalmcqs + "");
                                $("#divmisccattotaltests").html("" + othercattotaltests + "");
                                if (data.d[i].TotalTest > 0) {

                                    var test = "Test";
                                    if (data.d[i].TotalTest > 1) {
                                        test = "Test's"
                                    }
                                    var subNamedoted = "";
                                    if (data.d[i].SubjectName.length > 36) {
                                        subNamedoted = add3Dots(data.d[i].SubjectName, 33);
                                    }
                                    else {
                                        subNamedoted = data.d[i].SubjectName;
                                    }
                                    //console.log(data.d[i].TotalTest)
                                    $("#divothertest").append('<a href="#" data-value="' + data.d[i].SubId + '" class="list-group-item " > <span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span> ' + subNamedoted + ' <span class="badge bg-blue">' + data.d[i].TotalTest + ' ' + test + ' </span></a>');
                                }
                                else {
                                    if (othercattotaltests < 1) {
                                        $("#misc_catbox").hide();
                                    }

                                }
                            }
                            else {
                                othercattotalmcqs = othercattotalmcqs + parseInt(data.d[i].TotalMcqs);
                                othercattotaltests = othercattotaltests + parseInt(data.d[i].TotalTest)
                                $("#divmisccattotalmcqs").html("" + othercattotalmcqs + "");
                                $("#divmisccattotaltests").html("" + othercattotaltests + "");
                                if (data.d[i].TotalTest > 0) {

                                    var test = "Test";
                                    if (data.d[i].TotalTest > 1) {
                                        test = "Test's"
                                    }
                                    var subNamedoted = "";
                                    if (data.d[i].SubjectName.length > 36) {
                                        subNamedoted = add3Dots(data.d[i].SubjectName, 33);
                                    }
                                    else {
                                        subNamedoted = data.d[i].SubjectName;
                                    }
                                    //console.log(data.d[i].TotalTest)
                                    $("#divothertest").append('<a href="#" data-value="' + data.d[i].SubId + '" class="list-group-item " > <span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span> ' + subNamedoted + ' <span class="badge bg-blue">' + data.d[i].TotalTest + ' ' + test + ' </span></a>');
                                }
                            }

                        }
                        if (medcattotalmcqs == 0) {
                            $("#med_catbox").hide();
                        }
                        if (enggcattotalmcqs == 0) {
                            $("#engg_catbox").hide();
                        }
                        if (competitivecattotalmcqs == 0) {
                            $("#compet_catbox").hide();
                        }
                        if (admcattotalmcqs == 0) {
                            $("#adm_catbox").hide();
                        }
                        if (jobscattotalmcqs == 0) {
                            $("#job_catbox").hide();
                        }
                        if (skillcattotalmcqs == 0) {
                            $("#skill_catbox").hide();
                        }
                        // if (othercattotalmcqs == 0) {
                        $("#misc_catbox").hide();
                        //}



                    }
                    setTimeout($.unblockUI, 1000);

                },
                error: function (result) {

                    alertify.error("Error occour in Loading Mcqs Please try again letter ! ");
                    setTimeout($.unblockUI, 1000);
                }
            })
        }

        var alltestQuestionsArray = new Array();
        var tempArray = new Array();
        var SpecMarks = 0;
        var isNegativeMarks = 0;
        var IsMultiple = 0;

        // Practice variables 
        var TotalScore = 0;
        var negativeScore = 0;
        var TotalSecIds = 1;
        var TotalSecIdsQ = 0;
        var compareSecIds = 0;
        var mySecCounts = 0;
        var CompareSecCounts = new Array();
        var SecDetailarr = new Array();
        var ClientTestInfo = [];
        //var timer2 = "10:10";
        function getTestInfo(TestId) {
            var SubjectName = "";
            var TestName_test = "";
            var TotalTestQuestions = "";
            clearTimeout(timeoutHandle);
            blockui();
            return $.ajax({
                type: "POST",
                
                contentType: "application/json; charset=utf-8",
                url: "default.aspx/getTestInfo",
                beforeSend: function () {
                    $('#divloading').html('Please Wait while loading your requested contents...');
                    blockui();
                },
                async: false,
                data: "{'TestId':'" + TestId + "'}",
                timeout: 90000, dataType: "json",

                success: function (data) {
                    if (data.d.length > 0) {
                        for (var i = 0; i < data.d.length; i++) {

                            TestName_test = data.d[i].TestName;
                            SubjectName = data.d[i].SubName;
                            IsMultiple = data.d[i].IsMultiple;
                            // SubId = data.d[i].SubId;
                            //  AdminName = data.d[i].AdminName;
                            // Inst = data.d[i].TestInst.unquoted().replace(/\s+/g, " ").replace(/\n/g, " ").notBackSlash();
                            // TestPassingPercentage = data.d[i].TestPassingPercent;
                            TotalTestQuestions = data.d[i].TotalQ;



                        }
                        //  $("#countdowntimer").hide();

                        totalmcqs = 0;
                        totalloadedmcqs = 0;
                        totalmcqs = TotalTestQuestions;
                        pageIndex = 0;
                        pageCount = 0;
                        //alert(totq);
                        $("#totq").html(totalmcqs);
                        $("#totr").text('');
                        $("#totr").html(totalmcqs);
                        //$("#totr_text").html('');
                        $("#lblTestNamed").html("<span class='label label-success'> Subject: " + SubjectName + "</span> <span class='label label-info'> Test Name: " + TestName_test +" </span");
                        if (IsMultiple == 1) {
                            var Inst;
                            var TestName;
                            var TestPassingPercentage;
                            var TestTotalQ;
                            var SecName;
                            var SecDetail;
                            var SecPriority;
                            var SecTotalQ;
                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "../../../../../default.aspx/getTestInst",
                                beforeSend: function () {


                                    $('#divloading').html('Please Wait while loading your requested contents...');
                                    blockui();
                                    //$('#lblQuestionBefore').html("Saving...");



                                },
                                data: "{'TestId':'" + TestId + "'}",
                                timeout: 90000, dataType: "json",
                                success: function (data) {
                                    for (var i = 0; i < data.d.length; i++) {

                                        TestName = data.d[i].TestName;
                                        Inst = data.d[i].TestInst.unquoted().replace(/\s+/g, " ").replace(/\n/g, " ").notBackSlash();
                                        TestPassingPercentage = data.d[i].TestPassingPercent;
                                        TestTotalQ = data.d[i].TestTotalQ;
                                        SecName = data.d[i].SecName;
                                        SecDetail = data.d[i].SecDetail;
                                        SecPriority = data.d[i].SecPriority;
                                        SecTotalQ = data.d[i].SecTotalQ;
                                        SpecMarks = data.d[0].SpecMarks;
                                        isNegativeMarks = data.d[0].isNegativeMarks;
                                        // alert("SpecMarks " + SpecMarks + " and isNegativeMarks " + isNegativeMarks)
                                        //alert(TestTotalQ);
                                        if (TestTotalQ != "") {
                                            // clearInterval(interval());
                                            //alert("time = " + parseInt(TestTotalQ) * 1.5);
                                            var t =parseInt( (parseInt(TestTotalQ) * 41) / 60);
                                            // alert(t);
                                            clearTimeout(timeoutHandle);
                                            countdown(parseInt(t));
                                            $("#countdowntimer").show();
                                            //timer2 = t + ":00";
                                            // setInterval('', t, '');
                                            // timer2 = "00:00";
                                        }
                                        SecDetailarr.push({
                                            SecName: SecName, SecDetail: SecDetail, SecPriority: SecPriority, SecTotalQ: SecTotalQ, TestName: TestName
                                            , TestInst: Inst, TestPassingPercentage: TestPassingPercentage, TestTotalQ: TestTotalQ
                                        });


                                    }
                                    //consoloe.log("SecDetailarr = " + SecDetailarr);
                                    // alert(SecDetailarr[Object.keys(SecDetailarr)[0]]);
                                    var myst = 1;
                                    jQuery('#tblLoadMcqsAllQuestion').before().html('<button type="button" class="btn-small btn-danger" data-toggle="collapse" data-target="#demo">' +
                                   '  Instruction Show/Hide </button> <div id="demo" class="collapse in"><div> <h1>Instructions</h1> </div><div class="row">​' +
                                   '<div class="col-sm-3"><label>Passing Percentage ' + TestPassingPercentage + '%</label></div>'
                                  + '<div class="col-sm-6"><label>Test Name ' + TestName + ' </label></div>'
                                  + '<div class="col-sm-3"><label>Total Questions ' + TestTotalQ + '</label></div></div>'
                                  + '<div class="row"><div class="col-sm-12">' + Inst + '</div></div></div>' + SecHtm(SecDetailarr[0].SecPriority, SecDetailarr[0].SecName, SecDetailarr[0].SecTotalQ, SecDetailarr[0].SecDetail));

                                    //  alert(Inst);
                                    setTimeout($.unblockUI, 500);
                                },
                                error: function (result) {
                                    setTimeout($.unblockUI, 500);
                                    alertify.error("Error");
                                }
                            })
                            //alert("Test Name "+TestName)

                        }
                        else {
                            var mymcqsTot = $("#totq").text();
                            var t = parseInt((parseInt(mymcqsTot) * 60) / 60);

                            clearTimeout(timeoutHandle); countdown(parseInt(t));

                            $("#countdowntimer").show();
                            // setInterval('',"0:0", '');
                        }
                        setTimeout($.unblockUI, 500);

                    }
                    else {
                        setTimeout($.unblockUI, 500);
                        alertify.error("No Record found Against this query ");
                        return false;
                    }


                },
                error: function (result) {
                    setTimeout($.unblockUI, 500);
                    alertify.error("Error");
                    return false;
                }
            })
        }
        function Practice_Settings(mytestid) {
            //  debugger;
            hide_all();
            var TestId = mytestid;
            var TestName_test = "";
            var TotalTestQuestions = 0;
            var isseq = 0;
            lblCorrectAns = 0;
            lblWrongAns = 0;
            lblOverallPercent = 0;
            //    var isMultiple;
            var SubjectName = "";
            // Router.navigate();
            Srno = 1;
            mcq = 1;
            exp = "";
            reff = "";
            isActive = true;
            TotalScore = 0;
            negativeScore = 0;
            TotalSecIds = 1;
            TotalSecIdsQ = 0;
            compareSecIds = 0;
            mySecCounts = 0;

            SecDetailarr.length = 0;
            SecDetail = [];
            ClientTestInfo.length = 0;
            SecDetailarr.length = 0;
            //  var Id = TestId;
            $("#totr").html('');
            //$("#totr_text").html('');
            subname_scroll = "";
            testname_scroll = "";
            $('#tblLoadMcqsAllQuestion').find('div').empty();
            $("#tblLoadMcqsAllQuestion").empty();
            $("#ddlallquiz").html('');
            $("#ddlallquiz").append($("<option></option>").attr("value", 0).text('Status'));
            $("#tbodytblLoadMcqsAllQuestion").empty();
            $("#tblLoadMcqsAllQuestion").show();
            $('.btntestthistest').show();
            //$('#divHeaderbtns').html('<button  class="myresult btn btn-info btn-xs" >Show Result</button> ' +
            //' <button class="myresult btn btn-info btn-xs" >Practice this Test</button>' +
            //'  <button  class="myresult btn btn-info btn-xs" >Take Test</button>');
            $('#LoadMcqsAllQuestion').show();
            blockui();
            getTestInfo(TestId).then(showPractice(TestId))
            setTimeout($.unblockUI, 500);




            isPractice = 1;
            subname_scroll = subname_scroll.replace(/ /g, '-')
            testname_scroll = testname_scroll.trim();
            testname_scroll = encodeURIComponent(testname_scroll);

            subname_scroll = subname_scroll.replace(/ /g, '-')
            subname_scroll = subname_scroll.trim();
            subname_scroll = encodeURIComponent(subname_scroll);
            // forwarding

            $("#mainheader").hide();
            $("#testheader").show();
            CurrentTestid = TestId;
            // goToByScroll();
            // $(window).scrollTop($('#tblLoadMcqsAllQuestion').offset().top);
            //$('#btnShowResultdiv').show(200);

            //displayUserInfo(id);
            ////  Router.navigate('Practice/Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/' + subname_scroll + '/' + testname_scroll + '/TestId=' + CurrentTestid);
            Router.navigate('Practice/Online/Mcqs/Practice/FreeMcqs-' + CurrentTestid);
            // return false;
        }
        function ShowTest_Settings(PramTestId) {
            isActive = true;
            hide_all();
            Scroll_top();
            TotalScore = 0;
            negativeScore = 0;
            TotalSecIds = 1;
            TotalSecIdsQ = 0;
            compareSecIds = 0;
            mySecCounts = 0;
            //    debugger;
            SecDetailarr.length = 0;
            lblCorrectAns = 0;
            lblWrongAns = 0;
            lblOverallPercent = 0;

            var Id = PramTestId;//data[3];
            var TestId = PramTestId;
            var TestName_test = "";
            var TotalTestQuestions = 0;
            var SubId = 0;
            var AdminName = "";
            // var isMultiple;
            var SubjectName = "";
            totalmcqs = 0;
            pageIndex = 0;
            pageCount = 0;
            totalloadedmcqs = 0;
            alltestQuestionsArray = [];
            tempArray = [];


            // totalmcqs = data[6];

            // alert(totalmcqs);
            // return false;

            $("#ddlallquiz").html('');
            $("#ddlallquiz").append($("<option></option>").attr("value", 0).text('Status'));
            subname_scroll = "";
            testname_scroll = "";
            
            Score = 0;
            TotalScore = 0;
            negativeScore = 0;
            CurrentTestid = Id;
            var value_storage = $.jStorage.get(CurrentTestid.toString());
            value_storage = null;

            $('#tblLoadMcqsAllQuestion').find('div').empty();
            $("#tblLoadMcqsAllQuestion").empty();
            $("#ddlallquiz").html('');
            $("#tbodytblLoadMcqsAllQuestion").empty();
            $("#tblLoadMcqsAllQuestion").show();
            $('#btnTestagain').show();
            $('#LoadMcqsAllQuestion').show();
            $(".btnShowResultdiv").show();
            $(".btnPracticethistest").show();
            Router.config({ mode: 'history' });
            Router.navigate();
            Srno = 1;
            mcq = 1;
            exp = "";
            reff = "";
            // isActive = true;
            blockui();
            getTestInfo(TestId).then(showTestdiv(TestId))
            setTimeout($.unblockUI, 500);

            // getTestinfo_test(TestId, TestName_test, SubjectName, totalmcqs).then(showTestdiv(CurrentTestid));

            //showTestdiv(CurrentTestid);
            CurrentTestid = TestId;
            isPractice = 2;
            subname_scroll = subname_scroll.replace(/ /g, '-')
            testname_scroll = testname_scroll.trim();
            testname_scroll = encodeURIComponent(testname_scroll);

            subname_scroll = subname_scroll.replace(/ /g, '-')
            subname_scroll = subname_scroll.trim();
            subname_scroll = encodeURIComponent(subname_scroll);
            $("#mainheader").hide();
            $("#testheader").show();
            //  Router.navigate('Test/Online/Mcqs/Test/FreeMcqs-' + CurrentTestid);
            //return false;
        }
        var isload = 0;
        var urlSubjectList = 0;
        //    debugger;


        //   alert(cat_Fullname);
        if (type != undefined) {
            if (type == "C") {
                // alert("Category selected");
                //return false;
                if (subid != undefined) {
                    isload = 1;
                    // alert("Category Selected");
                    ShowSubjectTests(subid);

                }
            }
            else if (type == "P") {


                if (subid != undefined) {
                    isload = 1;
                    urlSubjectList = 1;
                    // debugger;
                    Practice_Settings(testid_url);
                    // return false;

                }
                else {
                    alert("Something going wrong. Please refresh the page.")
                    return false;
                }


            }
            else if (type == "T") {
                //alert("Test");
                isload = 1;
                urlSubjectList = 1;
                ShowTest_Settings(testid_url);
                // return false;
            }
        }



        if (isload == 0) {
            LoadHomePagesAllsub();
        }
            



        $(".closeall").click(function () {
            hide_all();
            Router.navigate();
            if (isload == 1) {
                LoadHomePagesAllsub();
                $("#catbox").show();
                isload = 0;
            }
            else {

                $("#catbox").show();
            }

        })

        $('#dropdown1').on('change', function () {
            var val = this.value;

            if (val == 'Physics') {
                myTable.columns(1).search(this.value).draw();
            }
            else {
                myTable.columns(1).search(this.value).draw();
            }

        });

        $(document).on("click", '#catbox a', function () {

            // //debugger;
            var subid = $(this).data("value");
            var cat_Fullname = $(this).text();
            //alert(name);
            //return false;
            var mysubidkeystorage = subid + "subid";
            // Check if "key" exists in the storage
            var value_storage = $.jStorage.get(mysubidkeystorage.toString());
            value_storage = null;
            if (!value_storage || value_storage.d.length == 0) {
                // if not - load the data from the server
                ShowSubjectTests(subid, cat_Fullname);
                //alert(subid);
            }
            else {
                var data = value_storage;
                var len = data.d.length;
                var totallen = data.d.length;
                var txt = "";
                var totalmcqs = 0;
                //alert(len);
                if (len > 0) {
                    Scroll_top();
                    for (var i = 0; i < len; i++) {

                        txt += '<tr><td></td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].SubjectName +
                            '</td><td style="font-size: 12px; font-weight: bold; text-transform: capitalize;">' + data.d[i].TestName +
                            '</td><td data-hidden="1">' + data.d[i].TestId +
                             '</td><td data-hidden="1">' + data.d[i].SubId +
                            '</td><td style="font-size: 10px;">' + data.d[i].AdminName +
                            '</td><td><label style="font-size: 12px;">' + data.d[i].TotalMcqs +
                            '</label></td><td> <a href="#" class="btn btn-info Practice">Make Practice</a></td><td> <a href="#" class="btn btn-danger divUserTest">Take Test</a></td><td style="font-size: 12px;"><a href="#" class="btn btn-link AddUserMcqs">Add Question</a></td></tr>';
                        totalmcqs = totalmcqs + data.d[i].TotalMcqs;
                    }

                    if (txt != '') {
                        hide_all();
                        $("#divhometbl").show();
                        $('#allmcqscount').show();
                        $('#maintable').show();
                        if ($.fn.DataTable.isDataTable('#example')) {
                            $('#example').DataTable().destroy();
                            $('#example tbody').empty();
                        }


                        $("#example").append(txt);
                        $("#totalmcqs").text(totalmcqs);
                        myTable = $("#example").DataTable(
                             {
                                 paging: false,
                                 responsive: {
                                     details: true
                                 },
                                 ServerSide: true,

                                 "columnDefs": [
                                      {
                                          "targets": [1],
                                          "visible": false,
                                          "searchable": false
                                      },
                                     {
                                         "targets": [3],
                                         "visible": false,
                                         "searchable": false
                                     },
                                     {
                                         "targets": [4],
                                         "visible": false,
                                         "searchable": false
                                     },
                                     { responsivePriority: 1, targets: 2 },
                                { responsivePriority: 2, targets: 7 },
                                 { responsivePriority: 3, targets: 8 }

                                 //{ responsivePriority: 4, targets: 6 },
                                 //{ responsivePriority: 5, targets: 6 }
                                 ]
                                 //select: {
                                 //    style: 'multi'
                                 //}

                             }
                            );
                        myTable.on('order.dt search.dt', function () {
                            myTable.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                                cell.innerHTML = i + 1;
                            });
                        }).draw()

                    }
                }
            }
            //$('#square').animate({ 'left': i * 360 });
        });
        function beforepract() {

        }


        $(document).on("click", '#dismissmsgInst ', function () {
            $(".ShowTestInstructions").hide();
            //var ads = document.getElementsByClassName('afs_ads');
            //ads.style.display = 'none';
            // window.location.href = "http://localhost:34128/default.aspx";
            //alert("i am click");
        })
        function showInstruction_MultipleTest(Instruction) {
            (function () {


                var myhtml = Instruction + '<div><button id="dismissmsgInst" class="btn btn-lg btn-success">OK I read all instructions</button></div>';
                // var message = "We've detected that you have an ad blocker enabled! Please  it and help support our work!";

                // Define a function for showing the message.
                // Set a timeout of 2 seconds to give adblocker
                // a chance to do its thing
                //var tryMessage = function () {
                //    setTimeout(function () {
                //if (!document.getElementsByClassName) return;
                //var ads = document.getElementsByClassName('afs_ads'),
                //    ad = ads[ads.length - 1];

                //if (!ad
                //    || ad.innerHTML.length == 0
                //    || ad.clientHeight === 0) {

                //$.blockUI({
                //    //    $.blockUI({ 
                //    message: myhtml,
                //    css: { top: '20%', cursor: 'pointer' }
                //    //     }); 
                //})
                //return false;
                $(".ShowTestInstructions").html(myhtml);
                $(".ShowTestInstructions").show();
                //  window.load('load', tryMessage, false);
                //  return;
                // alert(message);
                //window.location.href = '[URL of the donate page. Remove the two slashes at the start of thsi line to enable.]';
                //} else {

                //}

                //    }, 2000);
                //}

                /* Attach a listener for page load ... then show the message */
                //if (window.addEventListener) {

                //} else {
                //    window.attachEvent('onload', tryMessage); //IE
                //}
            })();
        }

        function SecHtm(SecPriority, SecName, SecTotalQ, SecDetail) {

            return '<div class="row"><div class="col-sm-3"><label>Section ' + SecPriority +
                 '</label></div><div class="col-sm-6" style="text-align:center"><label class="SecHeading">' + SecName +
                 '</label></div><div class="col-sm-3">This Section has <label>' + SecTotalQ + ' Questions</label></div></div>' +
                 '<div class="row"><div class="SecDetail col-lg-12">' + SecDetail + '</div></div>';
        }

        $("#example tbody").on("click", 'tr .Practice ', function (event) {

            //  debugger;
            //showInstruction_MultipleTest("Hello this is new Test Instructions :) ");
            //  $("#LoadMcqsAllQuestion").append("<div> <h1>Hello :)</h1></div> ");
            // return false;
            Router.navigate();
            var data = myTable.row(this).data();
            //  clearInterval(interval());

            if (data == undefined) {
                var tr = $(this).closest('tr');
                var row = myTable.row(tr);
                data = myTable.row(row[0][0]).data();
            }
            // alert(data[3]+" and data[4] = " + data[4]);
            if (data[3] != undefined) {

                Practice_Settings(data[3]);
            }
            else {
                alertify.error("There is an error in URL Please go to Home page");
                return false;
            }

            //Practice_Settings(data[3], data[2], data[6],data[10])
            // var Id = myTable.row(row[0][0]).data()[3];

        });
        //$(document).on('change', '[type=checkbox]', AddUserMcqs


        $("#example").on("click", 'tr .divUserTest ', function (event) {

            var data = myTable.row(this).data();
            if (data == undefined) {
                var tr = $(this).closest('tr');
                var row = myTable.row(tr);
                data = myTable.row(row[0][0]).data();
            }
            Router.navigate();
            ShowTest_Settings(data[3]);

            //Router.navigate('Test/OnlineMcqs/' + 'TestFeeMcqs-' + CurrentTestid);
            // Router.navigate('#!Test-' + CurrentTestid + subname_scroll + testname_scroll);
            //return false;
            // $('#btnShowResultdiv').show(200);
            // $('#btnPracticethistest').show(200);
            // alert('hello    == id is = ' + Id + ' and row = ' + row + ' tr = ' + tr);
            // showPractice(Id);
            //displayUserInfo(id);
        });
        $("#example").on("click", '.AddUserMcqs', function (event) {
          // debugger;
            /// alert('I am test :)');
            // var id = myTable.data(this)[0];
            var tr = $(this).closest('tr');
            var row = myTable.row(tr);
            var TestName = myTable.row(row[0][0]).data()[2];
            var SubName = myTable.row(row[0][0]).data()[1];
            var TestId = myTable.row(row[0][0]).data()[3];
            var subid = myTable.row(row[0][0]).data()[4];
            // $("#totr_text").html('Remaining: ');
            // alert('sub name ' + SubName + '  subid ' + subid + '  test name ' + TestName + '   test id ' + TestId);
            Scroll_top();
            hide_all();
            $('#ddlSubject').empty().append($('<option>', { value: subid }).text(SubName));
            $('#ddlTest').empty().append($('<option>', { value: TestId }).text(TestName));
            // $("#ddlSubject").val(subid);
            $("#ddlTest").val(TestId);
            $("#divMcqsQuestion").show();
            $("#divCommonSubTestNumb").show();
            // $('#btnShowResultdiv').show(200);
            // $('#btnPracticethistest').show(200);
            // alert('hello    == id is = ' + Id + ' and row = ' + row + ' tr = ' + tr);
            // showPractice(Id);
            //displayUserInfo(id);
        });
        //$('.Practice').click(function(){
        //    alert("hsdfsfell0");
        //});
        function msieversion() {

            var ua = window.navigator.userAgent;
            var msie = ua.indexOf("MSIE ");

            if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))  // If Internet Explorer, return version number
            {
                return (parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))));
            }
            else  // If another browser, return 0
            {
                return ('otherbrowser');
            }

            return false;
        }

        $("#ddlallquiz").change(function () {
            // //debugger;
            var select_qno = $("#ddlallquiz").val();
            var tridse = 'tr_question_' + select_qno;
            //var divPosition = $(trid).offset();

            goToByScroll(tridse);
            // $(tridse).on('click', goToByScroll($(tridse).val()));
            // alert($('.content-nav').offset());

            //$(trid).scroll();
            ////console.log(trid);
            // document.getElementById("#" + trid).scrollIntoView()
            //$(trid).scrollView();

            // container.scrollTop(scrollTo.offset().top - container.offset().top + container.scrollTop());

        })
        $('.btntestthistest').click(function () {

            ////debugger;
            Scroll_top();
            totalloadedmcqs = 0;
            alltestQuestionsArray = [];
            tempArray = [];
            pageIndex = 0;
            pageCount = 0;
            $("#ddlallquiz").html('');
            $("#ddlallquiz").append($("<option></option>").attr("value", 0).text('Status'));
            $("#totr").text($("#totq").text());
           // $("#totr_text").html('Questions Remaining:');
            hide_all();
            Score = 0;
            TotalScore = 0;
            negativeScore = 0;
            //CurrentTestid = Id;
            var value_storage = $.jStorage.get(CurrentTestid.toString());
            value_storage = null;
            //  var Srno = 1;

            $('#tblLoadMcqsAllQuestion').find('div').empty();
            $("#tblLoadMcqsAllQuestion").empty();
            // $("#ddlallquiz").html('');
            $("#tbodytblLoadMcqsAllQuestion").empty();
            $("#tblLoadMcqsAllQuestion").show();
            $('#btnTestagain').show();
            $('#LoadMcqsAllQuestion').show();
            $(".btnShowResultdiv").show();
            $(".btnPracticethistest").show();

            // configuration
            Router.config({ mode: 'history' });

            // returning the user to the initial state

            Srno = 1;
            mcq = 1;
            exp = "";
            reff = "";
            pageIndex = 0;
            pageCount = 0;
            lblCorrectAns = 0;
            lblWrongAns = 0;
            lblOverallPercent = 0;
            if (CurrentTestid != undefined || CurrentTestid != 0) {
                Router.navigate();

                isActive = true;
                //  IsMultiple = data[10];
                SecDetail = [];
                ClientTestInfo.length = 0;
                SecDetailarr.length = 0;
                if (IsMultiple == 1) {
                    var Inst;
                    var TestName;
                    var TestPassingPercentage;
                    var TestTotalQ;
                    var SecName;
                    var SecDetail;
                    var SecPriority;
                    var SecTotalQ;
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "default.aspx/getTestInst",
                        beforeSend: function () {


                            $('#divloading').html('Please Wait while loading your requested contents...');
                            blockui();
                            //$('#lblQuestionBefore').html("Saving...");



                        },
                        data: "{'TestId':'" + CurrentTestid + "'}",
                        timeout: 90000, dataType: "json",
                        success: function (data) {
                            for (var i = 0; i < data.d.length; i++) {

                                TestName = data.d[i].TestName;
                                Inst = data.d[i].TestInst;
                                TestPassingPercentage = data.d[i].TestPassingPercent;
                                TestTotalQ = data.d[i].TestTotalQ;
                                SecName = data.d[i].SecName;
                                SecDetail = data.d[i].SecDetail;
                                SecPriority = data.d[i].SecPriority;
                                SecTotalQ = data.d[i].SecTotalQ;
                                SpecMarks = data.d[0].SpecMarks;
                                isNegativeMarks = data.d[0].isNegativeMarks;
                                // alert("SpecMarks " + SpecMarks + " and isNegativeMarks " + isNegativeMarks)
                                //alert(TestTotalQ);
                                if (TestTotalQ != "") {
                                    //alert("time = " + parseInt(TestTotalQ) * 1.5);
                                    var t = parseInt((parseInt(TestTotalQ) * 41) / 60);
                                    // alert(t);
                                    // t = parseInt(t * 1000);
                                    clearTimeout(timeoutHandle);
                                    countdown(t);
                                    //  timer2 = t + ":00";
                                    //setInterval(interval, t);
                                    //  interval();
                                    //d setInterval(interval,1000)
                                    //setTimeout("alertify.error(Your Time is Up);", t);
                                    $("#countdowntimer").show();
                                    // timer2 = t + ":00";
                                }
                                SecDetailarr.push({
                                    SecName: SecName, SecDetail: SecDetail, SecPriority: SecPriority, SecTotalQ: SecTotalQ, TestName: TestName
                                    , TestInst: Inst, TestPassingPercentage: TestPassingPercentage, TestTotalQ: TestTotalQ
                                });


                            }
                            //consoloe.log("SecDetailarr = " + SecDetailarr);
                            // alert(SecDetailarr[Object.keys(SecDetailarr)[0]]);
                            var myst = 1;
                            jQuery('#tblLoadMcqsAllQuestion').before().html('<button type="button" class="btn-small btn-danger" data-toggle="collapse" data-target="#demo">' +
                           '  Instruction Show/Hide </button> <div id="demo" class="collapse in"><div> <h1>Instructions</h1> </div><div class="row">​' +
                           '<div class="col-sm-3"><label>Passing Percentage ' + TestPassingPercentage + '%</label></div>'
                          + '<div class="col-sm-6"><label>Test Name ' + TestName + ' </label></div>'
                          + '<div class="col-sm-3"><label>Total Attempted Question Marks' + TestTotalQ + '</label></div></div>'
                          + '<div class="row"><div class="col-sm-12">' + Inst + '</div></div></div>' + SecHtm(SecDetailarr[0].SecPriority, SecDetailarr[0].SecName, SecDetailarr[0].SecTotalQ, SecDetailarr[0].SecDetail));

                            //  alert(Inst);
                            setTimeout($.unblockUI, 500);
                        },
                        error: function (result) {
                            setTimeout($.unblockUI, 500);
                            alertify.error("Error");
                        }
                    })
                    //alert("Test Name "+TestName)

                }
                else {
                    var mymcqsTot = $("#totq").text();
                    var t = parseInt((parseInt(mymcqsTot) * 60) / 60);
                    // alert(t);
                    //  timer2 = "0:0";
                    clearTimeout(timeoutHandle); countdown(t);
                    // timer2 = t + ":00";
                    ///  t = parseInt(t * 1000);
                    //  clearInterval(interval);
                    //setTimeout(interval, 100);

                    // setInterval(interval, t);
                    // setInterval(interval, 1000)

                    $("#countdowntimer").show();
                }
                showTestdiv(CurrentTestid);

                isPractice = 2;
                $("#mainheader").hide();
                $("#testheader").show();
                subname_scroll = subname_scroll.replace(/ /g, '-')
                testname_scroll = testname_scroll.trim();
                testname_scroll = encodeURIComponent(testname_scroll);

                subname_scroll = subname_scroll.replace(/ /g, '-')
                subname_scroll = subname_scroll.trim();
                subname_scroll = encodeURIComponent(subname_scroll);
                Router.navigate('Test/Online/Mcqs/Test/FreeMcqs-' + CurrentTestid);
                // forwarding
                //  Router.navigate('Practice/Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/' + subname_scroll + '/' + testname_scroll + '/TestId=' + CurrentTestid);

                //$("#divinst").show();
                //showTestdiv(Id);

                // Scroll_top();
                //Router.navigate();
                //showTestdiv(CurrentTestid);
                //$("#mainheader").hide();
                //$("#testheader").show();
                // hide_all();
                //  $('#btnShowResultdiv').show(1000);
                // $('#LoadMcqsAllQuestion').show(1000);

            }
            else {
                alertify.error('Please Refresh the Page');
            }
        })

        $('.btnPracticethistest').click(function () {
            //  //debugger;
            if (confirm("Are you sure you want to finish the test?")) {
                if (CurrentTestid != undefined || CurrentTestid != 0) {
                    //Scroll_top();
                    //var tr = $(this).closest('tr');
                    //var row = myTable.row(tr);
                    //var Id = myTable.row(row[0][0]).data()[3];
                    //totalmcqs = 0;
                    $("#countdowntimer").hide();
                    totalloadedmcqs = 0;
                    //totalmcqs = myTable.row(row[0][0]).data()[6];
                    pageIndex = 0;
                    pageCount = 0;
                    Score = 0;

                    //alert(totq);
                    //$("#totq").html(totalmcqs);
                    $("#totr").text('');
                    //$("#totr_text").html('');
                    //$("#lblTestNamed").html("Test Name: " + myTable.row(row[0][0]).data()[1] + "-" + myTable.row(row[0][0]).data()[2]);
                    $("#totr").html('');
                    //$("#totr_text").html('');
                    subname_scroll = "";
                    testname_scroll = "";

                    // Scroll_top();
                    hide_all();
                    // alert('hello    == id is = ' + Id + ' and row = ' + row + ' tr = ' + tr);
                    $('#tblLoadMcqsAllQuestion').find('div').empty();
                    $("#tblLoadMcqsAllQuestion").empty();
                    $("#ddlallquiz").html('');
                    $("#ddlallquiz").append($("<option></option>").attr("value", 0).text('Status'));
                    $("#tbodytblLoadMcqsAllQuestion").empty();
                    $("#tblLoadMcqsAllQuestion").show();
                    $('.btntestthistest').show();
                    $('#LoadMcqsAllQuestion').show();
                    Scroll_top();
                    // configuration
                    Router.config({ mode: 'history' });

                    // returning the user to the initial state
                    Router.navigate();
                    Srno = 1;
                    mcq = 1;
                    exp = "";
                    reff = "";
                    isActive = true;
                    TotalScore = 0;
                    negativeScore = 0;
                    TotalSecIds = 1;
                    TotalSecIdsQ = 0;
                    compareSecIds = 0;
                    mySecCounts = 0;
                    lblCorrectAns = 0;
                    lblWrongAns = 0;
                    lblOverallPercent = 0;
                    SecDetailarr.length = 0;
                    SecDetail = [];
                    ClientTestInfo.length = 0;
                    SecDetailarr.length = 0;
                    if (IsMultiple == 1) {
                        var Inst;
                        var TestName;
                        var TestPassingPercentage;
                        var TestTotalQ;
                        var SecName;
                        var SecDetail;
                        var SecPriority;
                        var SecTotalQ;
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "default.aspx/getTestInst",
                            beforeSend: function () {


                                $('#divloading').html('Please Wait while loading your requested contents...');
                                blockui();
                                //$('#lblQuestionBefore').html("Saving...");



                            },
                            data: "{'TestId':'" + CurrentTestid + "'}",
                            timeout: 90000, dataType: "json",
                            success: function (data) {
                                for (var i = 0; i < data.d.length; i++) {

                                    TestName = data.d[i].TestName;
                                    Inst = data.d[i].TestInst;
                                    TestPassingPercentage = data.d[i].TestPassingPercent;
                                    TestTotalQ = data.d[i].TestTotalQ;
                                    SecName = data.d[i].SecName;
                                    SecDetail = data.d[i].SecDetail;
                                    SecPriority = data.d[i].SecPriority;
                                    SecTotalQ = data.d[i].SecTotalQ;
                                    SpecMarks = data.d[0].SpecMarks;
                                    isNegativeMarks = data.d[0].isNegativeMarks;
                                    //  alert("SpecMarks " + SpecMarks + " and isNegativeMarks " + isNegativeMarks)
                                    //alert(TestTotalQ);
                                    if (TestTotalQ != "") {
                                        //  clearInterval(interval());
                                        //alert("time = " + parseInt(TestTotalQ) * 1.5);
                                        var t = (parseInt(TestTotalQ) * 41) / 60;
                                        // alert(t);
                                        clearTimeout(timeoutHandle); countdown(t);
                                        //  timer2 = t + ":00";
                                        // setInterval('', t, '');
                                        // timer2 = "00:00";
                                    }
                                    SecDetailarr.push({
                                        SecName: SecName, SecDetail: SecDetail, SecPriority: SecPriority, SecTotalQ: SecTotalQ, TestName: TestName
                                        , TestInst: Inst, TestPassingPercentage: TestPassingPercentage, TestTotalQ: TestTotalQ
                                    });


                                }
                                //consoloe.log("SecDetailarr = " + SecDetailarr);
                                // alert(SecDetailarr[Object.keys(SecDetailarr)[0]]);
                                var myst = 1;
                                jQuery('#tblLoadMcqsAllQuestion').before().html('<button type="button" class="btn-small btn-danger" data-toggle="collapse" data-target="#demo">' +
                               '  Instruction Show/Hide </button> <div id="demo" class="collapse in"><div> <h1>Instructions</h1> </div><div class="row">​' +
                               '<div class="col-sm-3"><label>Passing Percentage ' + TestPassingPercentage + '%</label></div>'
                              + '<div class="col-sm-6"><label>Test Name ' + TestName + ' </label></div>'
                              + '<div class="col-sm-3"><label>Total Questions ' + TestTotalQ + '</label></div></div>'
                              + '<div class="row"><div class="col-sm-12">' + Inst + '</div></div></div>' + SecHtm(SecDetailarr[0].SecPriority, SecDetailarr[0].SecName, SecDetailarr[0].SecTotalQ, SecDetailarr[0].SecDetail));

                                //  alert(Inst);
                                setTimeout($.unblockUI, 500);
                            },
                            error: function (result) {
                                setTimeout($.unblockUI, 500);
                                alertify.error("Error");
                            }
                        })
                        //alert("Test Name "+TestName)

                    }
                    else {
                        // setInterval('',"0:0", '');
                    }
                    showPractice(CurrentTestid);
                    $('.progress-bar').css('width', 0 + '%').attr('aria-valuenow', 0, 'aria-valuemax', 0).html('0' + '%');
                    isPractice = 1;
                    subname_scroll = subname_scroll.replace(/ /g, '-')
                    testname_scroll = testname_scroll.trim();
                    testname_scroll = encodeURIComponent(testname_scroll);

                    subname_scroll = subname_scroll.replace(/ /g, '-')
                    subname_scroll = subname_scroll.trim();
                    subname_scroll = encodeURIComponent(subname_scroll);
                    // forwarding
                    Router.navigate('Practice/Online/Mcqs/Practice/FreeMcqs-' + CurrentTestid);
                    //    Router.navigate('Practice/Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/' + subname_scroll + '/' + testname_scroll + '/TestId=' + CurrentTestid);
                    $("#mainheader").hide();
                    $("#testheader").show();
                    //CurrentTestid = Id;
                    //  CurrentTestid = Id;
                    // hide_all();
                    // $('#btnShowResultdiv').show(1000);
                    //  $('#LoadMcqsAllQuestion').show(1000);

                }
                else {
                    alertify.error('Please Refresh the Page');
                }
            }
            // return false;
        })
       
        $("#btnHome").click(function () {
            hide_all();
            isPractice = 0;
            Router.navigate();
            if (urlSubjectList == 1) {
                var subid = getSubId();
                ShowSubjectTests(subid, "");
                urlSubjectList = 0;
            }
            $("#divhometbl").show();
            $('#allmcqscount').show();
            $('#maintable').show();
            //$('#catbox').show();
            //$('#maintable').show();
            $("#mainheader").show();
            //$("#testheader").hide();
        })
        //  var urlSubjectList = 0;
        $("#btndefaulthome").click(function () {
            if (confirm("Are you sure you want to finish the test?")) {

                if (CurrentTestid != undefined || CurrentTestid != 0) {
                    hide_all();
                    isPractice = 0;
                    Router.navigate();
                    if (urlSubjectList == 1) {
                        var subid = getSubId();
                        ShowSubjectTests(subid, "");
                        urlSubjectList = 0;
                    }
                    $("#divhometbl").show();
                    $('#allmcqscount').show();
                    $('#maintable').show();
                    $("#mainheader").show();
                }
                else {
                    alertify.error('Please Refresh the Page');
                    return false;
                }
            }

        });

        $("#canceltest").click(function () {
            if (confirm("Are you sure you want to finish the test?")) {
                if (CurrentTestid != undefined || CurrentTestid != 0) {
                    hide_all();
                    isPractice = 0;
                    if (urlSubjectList == 1) {
                        var subid = getSubId();
                        ShowSubjectTests(subid, "");
                        urlSubjectList = 0;
                    }
                    $("#divhometbl").show();
                    $('#allmcqscount').show();
                    $('#maintable').show();
                    // $('#catbox').show();
                    //$('#maintable').show();
                    //$("#mainheader").show();
                    //$("#testheader").hide();
                    // hide_all();
                    // $('#btnShowResultdiv').show(1000);
                    //  $('#LoadMcqsAllQuestion').show(1000);

                }
                else {
                    alertify.error('Please Refresh the Page');
                }
            }
            return false;
            //$("#logindiv").show();

        });
        $("#btncancel").click(function () {
            if (confirm("Are you sure you want to cancel?")) {
                if (CurrentTestid != undefined || CurrentTestid != 0) {
                    hide_all();
                    isPractice = 0;
                    //$('#allmcqscount').show();
                    $('#catbox').show();
                    //  $("#mainheader").show();
                    //  $("#testheader").hide();
                    // hide_all();
                    // $('#btnShowResultdiv').show(1000);
                    //  $('#LoadMcqsAllQuestion').show(1000);

                }
                else {
                    alertify.error('Please Refresh the Page');
                }
            }
            return false;
            //$("#logindiv").show();

        });
        $("#proceedfur").click(function () {
            if (confirm("Are you sure you want to Start this test?")) {
                if (CurrentTestid != undefined || CurrentTestid != 0) {
                    $("#divinst").hide();
                    $("#example").on("click", '.divUserTest ');
                    alertify.log('Test Started!');
                    // $('#catbox').show();
                    //$('#maintable').show();
                    //$("#mainheader").show();
                    //$("#testheader").hide();
                    // hide_all();
                    // $('#btnShowResultdiv').show(1000);
                    //  $('#LoadMcqsAllQuestion').show(1000);

                }
                else {
                    hide_all();
                    $("#divhometbl").show();
                    $('#allmcqscount').show();
                    $('#maintable').show();

                }
            }
            return false;
            // $("#example").on("click", '.AddUserMcqs');
        });



        function showPractice(TestId) {
            ////debugger;
            // hide_all();
            // var browser = msieversion();
            // alert(browser);
            //#divMcqsQuestion
            CurrentTestid = TestId;
            if (CurrentTestid == undefined) {
                alertify.error("Something going wrong. Please refresh the page.");
                return false;
            }
            //var value_storage = $.jStorage.get(CurrentTestid.toString());
            //value_storage = null;
            //   pageIndex;

            //if (pageIndex == 2 || pageIndex <= pageCount)
            //{
            //    pageIndex = 1;
            //}
            //if (!value_storage || value_storage.d.length == 0) {
            //   alert("TestId " + TestId + " pageIndex = " + pageIndex + " Ismultiple = " + IsMultiple + " ClientTestInfo = " + JSON.stringify(ClientTestInfo));
            $.ajax({
                type: "POST",
                cache: false,
                contentType: "application/json; charset=utf-8",
                url: "../../../../../default.aspx/LoadMcqsQuestions",
                data: "{'TestId':'" + TestId + "','name':'" + 1 + "','pageIndex':'" + pageIndex + "','IsMultiple':'" + IsMultiple + "','ClientTestInfo':'" + JSON.stringify(ClientTestInfo) + "'}",
                dataType: "json",
                timeout: (2 * 10000),
                beforeSend: function () {


                    $('#divloading').html('Please Wait while loading your requested contents...');
                    blockui();
                    //$('#lblQuestionBefore').html("Saving...");



                },
                complete: function () {
                    $('#divloading').html('');
                    isActive = false;
                },
                success: function (data) {

                    var len = data.d.length;

                    //  //console.log("SubName : " + subname + " testname = " + testname)
                    // var txt = new Array();

                    if (len > 0) {
                        pageIndex++;
                        pageCount = 0;
                        totalloadedmcqs = totalloadedmcqs + (len - 1);
                        var txt = "";
                        var op1_rand = "";
                        var op2_rand = "";
                        var op3_rand = "";
                        var op4_rand = "";
                        var op5_rand = "";
                        var op6_rand = "";
                        var op7_rand = "";
                        var op8_rand = "";
                        var exp = "";
                        var exp_by = "";
                        // alert($("#totq").text());



                        subname = data.d[0].SubjectName;
                        testname = data.d[0].TestName;

                        subname_scroll = subname;
                        testname_scroll = testname;
                        setTimeout($.unblockUI, 1000);
                        value_storage = data;
                        $.jStorage.set(CurrentTestid.toString(), value_storage, 300000);


                        //  $("#ddlallquiz").append($("<option></option>").attr("value", 0).text('Question Status'));
                        //for (var i = 0; i < len; i++) {
                        //  myops = [];
                        var random_length;// = Math.floor(Math.random() * len);
                        // for (var i = 0; i < len; i++) {
                        //myops = [];
                        var count = 0;
                        var myops = new Array();
                        len = (len - 1);

                        // alert(len);
                        while (count < len) {

                            myops = [];
                            var i = Math.floor(Math.random() * len);

                            if (data.d[i] != "selected") {

                                $("#ddlallquiz").append($("<option></option>").attr("value", Srno).text(Srno));

                                if (IsMultiple == 1) {
                                    ClientTestInfo.push({ TestId: data.d[i].TestId, McqsId: data.d[i].McqsQuestionId, SecId: data.d[i].SecId, SecMergeTestId: data.d[i].SecMergeTestId });
                                    var secsed = parseInt(data.d[i].SecId);
                                    if (isNaN(secsed)) {
                                        alert("This is not a number secsed");
                                    }
                                    if (isNaN(TotalSecIds)) {
                                        alert("This is not a number TotalSecIds");
                                    }
                                    if (secsed > TotalSecIds) {
                                        //TotalSecIds = data.d[i].SecId;
                                        // alert("SecId "+parseInt(data.d[i].SecId))
                                        for (var k = 0 ; k <= data.d[i].SecId; k++) {
                                            //alert("k = " + k +" and SecDetailarr.length = " + SecDetailarr.length);
                                            if (k == TotalSecIds) {
                                                TotalSecIds++;// parseInt(TotalSecIds) + 1;
                                                //   alert("TotalSecIds " + TotalSecIds);
                                                var mn = parseInt(k);
                                                var Secpri = SecDetailarr[mn].SecPriority; //SecDetailarr[k].SecPriority;
                                                var SeName = SecDetailarr[mn].SecName;
                                                var SecTot = SecDetailarr[mn].SecTotalQ;
                                                var SecDetail = SecDetailarr[mn].SecDetail;
                                                txt += SecHtm(Secpri, SeName, SecTot, SecDetail);

                                                break;
                                            }


                                        }


                                    }
                                    //TotalSecIdsQ++;
                                    //mySecCounts = 0;

                                    //for (var m = 0; m < ClientTestInfo.length; m++) {
                                    //    //console.log("ClientTestInfo[m].SecId " + ClientTestInfo[m].SecId );
                                    //    if (ClientTestInfo[m].SecId > TotalSecIds)
                                    //    {
                                    //        TotalSecIds = ClientTestInfo[m].SecId
                                    //        for (var s = TotalSecIds; s < SecDetailarr.length; s++)
                                    //        {
                                    //            TotalSecIdsQ = SecDetailarr[s].SecTotalQ;
                                    //            //console.log(" SecDetailarr[TotalSecIds].SecTotalQ " + TotalSecIdsQ);
                                    //            break;
                                    //        }
                                    //       // TotalSecIdsQ = SecDetailarr[TotalSecIds].SecTotalQ;
                                    //        mySecCounts++;
                                    //        //console.log("mySecCounts = " + mySecCounts)
                                    //        if (mySecCounts >= TotalSecIdsQ)
                                    //        {

                                    //        }
                                    //    }


                                    //}

                                }
                                txt += '<div id="uniq_mcq_with_options' + data.d[i].McqsQuestionId + '"><div class="row"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" style="background-color: #FFFFFF !important;" id="tr_question_' + Srno + '" > <label>Q.'
                                    + parseInt(Srno++) +
                                    '</label></div><div class="col-xs-10 col-sm-10 col-md-10 col-lg-10"><b><label style="font-size: 14px; margin-left: 3px;margin-top: -1px;">'
                                    + $.trim(data.d[i].QuestionText.unquoted().replace(/\s+/g, " ").replace(/\n/g, " ")) +
                                    '</label></b></div><input type="hidden" id="SpecMarks' + data.d[i].McqsQuestionId + '" value="' + data.d[i].SpecMarks + '" /></div>'; //  <td>' + data.d[i].Points + '</td></tr>';

                                // alert("data.d[i].op1 = "+data.d[i].op1)
                                parseInt(mcq++);
                                exp = "";
                                reff = "";
                                if (data.d[i].op1 == true) {
                                    // alert("txt = " + txt);
                                    var op1_txt = "";
                                    if ($.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) != "") {

                                        if (data.d[i].Option1Correct == true) {

                                            op1_txt = '<div  class="row  uniquemcq"><div class="correctcls col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="checkimg" src="/acme-free/img/check3.png" /></div><div  class="col-xs-10  clsloadmcqsall"><label class="pop" id="lbl_p_op1_' +
                                                data.d[i].McqsQuestionId + '" >' +
                                                $.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) + '</label>' + exp + '</div></div>';
                                            $("#explanat").remove();
                                            exp = "";
                                        }
                                        else {
                                            op1_txt = '<div  class=" row uniquemcq"><div class= "col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-xs-10 clsloadmcqsall" ><label class="pop"  id="lbl_p_op1_' + data.d[i].McqsQuestionId + '" >' + $.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }

                                    //txt += op1_txt;
                                    op1_rand = op1_txt;
                                    myops[0] = op1_txt;


                                }
                                if (data.d[i].op2 == true) {
                                    var op2_txt = "";
                                    if ($.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option2Correct == true) {
                                            op2_txt = '<div class="row " ><div class="correctcls col-xs-2 col-sm-1 col-md-1 col-lg-1"><img  class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-xs-10  clsloadmcqsall"><label class="pop" id="lbl_p_op2_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) + '</label> ' + exp + '</div></div>';
                                            $("#explanat").remove();
                                            exp = "";
                                        }
                                        else {
                                            op2_txt = '<div class="row"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-xs-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op2_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }
                                    op2_rand = op2_txt;
                                    //  txt += op2_txt;
                                    myops[1] = op2_txt;

                                }


                                if (data.d[i].op3 == true) {
                                    var op3_txt = "";
                                    if ($.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option3Correct == true) {
                                            op3_txt = '<div class="row " ><div class="correctcls col-xs-2 col-sm-1 col-md-1 col-lg-1"><img  class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-xs-10  clsloadmcqsall"  ><label class="pop" id="lbl_p_op3_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) + '</label>' + exp + '</div></div>';
                                            $("#explanat").remove();
                                            exp = "";
                                        }
                                        else {
                                            op3_txt = '<div class="row"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-xs-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op3_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }
                                    // txt += op3_txt;
                                    op3_rand = op3_txt;
                                    myops[2] = op3_txt;
                                }


                                if (data.d[i].op4 == true) {
                                    var op4_txt = "";
                                    if ($.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option4Correct == true) {
                                            op4_txt = '<div class="row " ><div class=" correctcls col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-xs-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op4_' + data.d[i].McqsQuestionId + '" >' + $.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) + '</label>' + exp + '</div></div>';
                                            $("#explanat").remove();
                                            exp = "";
                                        }
                                        else {
                                            op4_txt = '<div class="row"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-xs-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op4_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }
                                    op4_rand = op4_txt;
                                    //  txt += op4_txt;
                                    myops[3] = op4_txt;

                                }


                                if (data.d[i].op5 == true) {
                                    var op5_txt = "";
                                    if ($.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option5Correct == true) {
                                            op5_txt = '<div class="row " ><div class="correctcls col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-xs-10  clsloadmcqsall"><label class="pop" id="lbl_p_op5_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                        else {
                                            op5_txt = '<div class="row"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-xs-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op5_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                        exp = "";
                                    }
                                    // txt += op5_txt;
                                    myops[4] = op5_txt;
                                    op5_rand = op5_txt;
                                }


                                if (data.d[i].op6 == true) {
                                    var op6_txt = "";
                                    if ($.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option6Correct == true) {
                                            op6_txt = '<div class="row " ><div class="correctcls col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-xs-10  clsloadmcqsall" ><label class="pop" id="lbl_p_op6_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                        else {
                                            op6_txt = '<div class="row"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-xs-10 clsloadmcqsall"><label class="pop" id="lbl_p_op6_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }
                                    //txt += op6_txt;
                                    op6_rand = op6_txt;
                                    myops[5] = op6_txt;
                                }


                                if (data.d[i].op7 == true) {
                                    var op7_txt = "";
                                    if ($.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option7Correct == true) {
                                            op7_txt = '<div class="row " ><div class="correctcls col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-xs-10  clsloadmcqsall"  ><label class="pop" id="lbl_p_op7_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                        else {
                                            op7_txt = '<div class="row"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-xs-10 clsloadmcqsall"><label class="pop" id="lbl_p_op7_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }
                                    // txt += op7_txt;
                                    op7_rand = op7_txt;
                                    myops[6] = op7_txt;
                                }


                                if (data.d[i].op8 == true) {
                                    var op8_txt = "";
                                    if ($.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option8Correct == true) {
                                            op8_txt = '<div class="row " ><div class="correctcls col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="checkimg" src="/acme-free/img/check3.png" /></div><div class="col-xs-10  clsloadmcqsall"  ><label class="pop" id="lbl_p_op8_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                        else {
                                            op8_txt = '<div class="row"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1"><img class="optionimg" src="/acme-free/img/UXRadioButton.png" /></div><div class="col-xs-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op8_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                        }
                                    }
                                    //  txt += op8_txt;
                                    op8_rand = op8_txt;
                                    myops[7] = op8_txt;


                                }
                                //---------------------- randomization-----------------------------

                                // var myops_i = 0
                                // //variable used to contain controlled random number 
                                // var random_length;
                                //// var spacing = "<br>"
                                // //while all of array elements haven't been cycled thru
                                // while (myops_i < myops.length) {
                                //     //generate random num between 0 and arraylength-1
                                //     random_length = Math.floor(Math.random() * myops.length)
                                //     //if element hasn't been marked as "selected"
                                //     if (myops[random_length] != "selected")
                                //     {
                                //        // document.write(myops[random_length] + " ");
                                //         txt += myops[random_length];
                                //         //mark element as selected
                                //         myops[random_length] = "selected"
                                //         i++
                                //     }
                                // }



                                //-------------------------------
                                exp = "";
                                exp_by = "";
                                if ($.trim(data.d[i].ExplanationText.unquoted().replace(/\s+/g, " ")) != "") {

                                    if (data.d[i].isExplained == 1) {
                                        exp_by = '<hr/><span>Checked and Explained By: </span><br><img  src="../../../../../All_Images/staff_images/' + data.d[i].exp_check_staff_pic + '" width="45" height="45" /> ' + data.d[i].exp_check_staff_name + ' <br/> ' + data.d[i].exp_check_staff_qual + ' <br/> Accuracy: ' + data.d[i].exp_check_staff_acc + '% <hr>';
                                        exp = '<a href="#/" class="btn btn-link" data-html="true" data-placement="bottom" data-toggle="tooltip" title="' + $.trim(data.d[i].ExplanationText.unquoted().replace(/\"/g, "'").replace(/\s+/g, " ").replace(/\n/g, " ")) + exp_by.replace(/\"/g, "'") + '">Explanation</a>';
                                    }
                                    else {
                                        exp_by = "";
                                    }



                                }
                                else {
                                    exp = '';
                                }

                                reff = "";
                                edate = "";
                                // alert(data.d[i].Reference);
                                // alert($.trim(data.d[i].Reference.unquoted().replace(/\s+/g, " ")));
                                if ($.trim(data.d[i].Reference.unquoted().replace(/\s+/g, " ")) != "") {
                                    reff = '<a href="#/" class="btn btn-link" data-html="true" data-placement="bottom" data-toggle="tooltip" title="' + $.trim(data.d[i].Reference.unquoted().replace(/\"/g, "'").replace(/\s+/g, " ").replace(/\n/g, " ")) + '">Reference</a>';
                                }
                                else {
                                    reff = "";
                                }
                                if (data.d[i].edate != "") {
                                    edate = "<span class='label label-info'>Added on " + data.d[i].edate + "</span>";
                                }
                                else {
                                    edate = "";
                                }
                                // shuffle(myops);
                                //  //console.log(shuffle(myops))
                                myops.sort(function () { return 0.5 - Math.random() });
                                //txt += txt.toString();
                                for (var j = 0; j < myops.length; j++) {
                                    txt += myops[j];
                                }
                                //   alert(reff);
                                //   exp = '<a href="#" class="exptxt" data-toggle="tooltip" title="' + (data.d[i].ExplanationText) + '">How</a>';
                                txt += '</div><div class ="row"><div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">' + edate + '</div></div><div class="row"><div class="col-xs-12" > <input type="button" class="btn btn-link btn-sm btnReporttoggle" id="' + data.d[i].McqsQuestionId + '" name="My Name is nauman" value="Report"  /> ' + exp + reff + ' <button class="btn  btn-social btn-facebook  sharemcq" id="999' + data.d[i].McqsQuestionId + '" name="999tr_question_' + Srno + '" style="display:none; background-color:#30487b; color:#fff; ">Post on Facebook</i></button><div id="btnReporttoggle_' + data.d[i].McqsQuestionId + '"></div><img style="width: 20%;" src="/acme-free/img/divider2.gif" /> </div></div>';

                                reff = "";
                                // txt += '<a href="#" class="exptxt" data-toggle="tooltip" title="' + (data.d[i].ExplanationText) + '">How</a>';
                                //  txt += '</div><div class ="row"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1"></div><div class="col-xs-10" ><img style="width: 20%;" src="/acme-free/img/divider2.gif" />  <input type="button" class="btn btn-default btn-sm btnReporttoggle" id="' + data.d[i].McqsQuestionId + '" name="My Name is nauman" value="Report"  /> <a href="#" class="btn btn-info" data-html="true" data-placement="right" data-toggle="tooltip" title="' + (data.d[i].ExplanationText) + '">How</a> <button class="btn  btn-social btn-facebook  sharemcq" id="999' + data.d[i].McqsQuestionId + '" name="999tr_question_' + Srno + '" style="display:none; background-color:#30487b; color:#fff; ">Post on Facebook</i></button><div id="btnReporttoggle_' + data.d[i].McqsQuestionId + '"></div></div></div>';

                                //  $(".exptxt").removeAttr("title");
                                // $(".exptxt").val('');
                                txt.length = 0;
                                data.d[i] = "selected";
                                pageCount = data.d[i].pagecount;
                                count++;


                            }
                            //if (mcq == 50) {
                            //    break;
                            //}
                            // $("#tblLoadMcqsAllQuestion").randomize('tr td');


                        }

                        if (txt != '') {

                            $("#tblLoadMcqsAllQuestion").append(txt);

                        }
                    }

                },
                error: function (Result) {
                    setTimeout($.unblockUI, 500);
                    alertify.error("a network related Error occour. Please Refresh the page! ");
                }
            });
        }



        function showTestdiv(TestId) {

            //    //debugger;
            //  hide_all();

            CurrentTestid = TestId;
            var value_storage = $.jStorage.get(CurrentTestid.toString());
            value_storage = null;

            //if (pageIndex == 0 || pageIndex == null || pageIndex == "") {
            //    pageIndex = 1;
            //}
            /// if (!value_storage || value_storage.d.length == 0) {
            // alert(TestId)
            $.ajax({
                type: "POST",
                cache: false,
                contentType: "application/json; charset=utf-8",

                beforeSend: function () {
                    blockui();
                    $('#divloading').html('Please Wait while loading your requested contents...');
                },

                complete: function () {
                    $('#divloading').html('');
                    isActive = false;
                },
                url: "../default.aspx/LoadMcqsQuestions",
                //  data: "{'TestId':'" + TestId + "','name':'" + 2 + "','pageIndex':'" + pageIndex + "'}",
                data: "{'TestId':'" + TestId + "','name':'" + 2 + "','pageIndex':'" + pageIndex + "','IsMultiple':'" + IsMultiple + "','ClientTestInfo':'" + JSON.stringify(ClientTestInfo) + "'}",

                dataType: "json",
                timeout: (2 * 10000),
                success: function (data) {

                    setTimeout($.unblockUI, 500);
                    var len = data.d.length;
                    var txt = "";
                    //$("#totq").text(totalmcqs);
                    //$("#totr").html(len);
                    //$("#totr_text").html('Remaining: ');


                    //  alltestQuestionsArray = [];
                    // alltestQuestionsArray.push(data.d);
                    // $.extend(alltestQuestionsArray, data.d);
                    //  alltestQuestionsArray = data.d;
                    //alert(alltestQuestionsArray);
                    ////console.log['alltestQuestionsArray = ' + alltestQuestionsArray];
                    //alert(alltestQuestionsArray);
                    var alltemquestions = '';
                    //for (var i in alltestQuestionsArray) {
                    //    for (var j in alltestQuestionsArray[i])
                    //    {

                    //        alltemquestions += alltestQuestionsArray[i][j].userselected;
                    //    }


                    //}
                    // //console.log(alltemquestions);
                    if (len > 0) {
                        pageIndex++;
                        pageCount = 0;
                        value_storage = data;
                        $.jStorage.set(CurrentTestid.toString(), value_storage, 300000);
                        //   $('#tblLoadMcqsAllQuestion').find('div').empty();

                        tempArray = [];
                        tempArray = data.d;
                        //  //console.log("tempArray = " + tempArray.length);
                        $.extend(alltestQuestionsArray, tempArray);
                        alltestQuestionsArray.concat(tempArray);
                        ////console.log("alltestQuestionsArray = "+alltestQuestionsArray.length)
                        // $("#ddlallquiz").html('');
                        //$("#selectId option").remove();

                        len = len - 1;
                        TotalScore = TotalScore + len;
                        totalloadedmcqs = totalloadedmcqs + len;

                        for (var i = 0; i < len; i++) {
                            pageCount = data.d[i].pagecount;
                            $("#ddlallquiz").append($("<option></option>").attr("value", Srno).text(Srno));
                            if (IsMultiple == 1) {
                                ClientTestInfo.push({ TestId: data.d[i].TestId, McqsId: data.d[i].McqsQuestionId, SecId: data.d[i].SecId, SecMergeTestId: data.d[i].SecMergeTestId });
                                var secsed = parseInt(data.d[i].SecId);
                                if (isNaN(secsed)) {
                                    alert("This is not a number secsed");
                                }
                                if (isNaN(TotalSecIds)) {
                                    alert("This is not a number TotalSecIds");
                                }
                                if (secsed > TotalSecIds) {
                                    //TotalSecIds = data.d[i].SecId;
                                    // alert("SecId "+parseInt(data.d[i].SecId))
                                    for (var k = 0 ; k <= data.d[i].SecId; k++) {
                                        //alert("k = " + k +" and SecDetailarr.length = " + SecDetailarr.length);
                                        if (k == TotalSecIds) {
                                            TotalSecIds++;// parseInt(TotalSecIds) + 1;
                                            //   alert("TotalSecIds " + TotalSecIds);
                                            var mn = parseInt(k);
                                            var Secpri = SecDetailarr[mn].SecPriority; //SecDetailarr[k].SecPriority;
                                            var SeName = SecDetailarr[mn].SecName;
                                            var SecTot = SecDetailarr[mn].SecTotalQ;
                                            var SecDetail = SecDetailarr[mn].SecDetail;
                                            txt += SecHtm(Secpri, SeName, SecTot, SecDetail);

                                            break;
                                        }


                                    }


                                }
                                //TotalSecIdsQ++;
                                //mySecCounts = 0;

                                //for (var m = 0; m < ClientTestInfo.length; m++) {
                                //    //console.log("ClientTestInfo[m].SecId " + ClientTestInfo[m].SecId );
                                //    if (ClientTestInfo[m].SecId > TotalSecIds)
                                //    {
                                //        TotalSecIds = ClientTestInfo[m].SecId
                                //        for (var s = TotalSecIds; s < SecDetailarr.length; s++)
                                //        {
                                //            TotalSecIdsQ = SecDetailarr[s].SecTotalQ;
                                //            //console.log(" SecDetailarr[TotalSecIds].SecTotalQ " + TotalSecIdsQ);
                                //            break;
                                //        }
                                //       // TotalSecIdsQ = SecDetailarr[TotalSecIds].SecTotalQ;
                                //        mySecCounts++;
                                //        //console.log("mySecCounts = " + mySecCounts)
                                //        if (mySecCounts >= TotalSecIdsQ)
                                //        {

                                //        }
                                //    }


                                //}

                            }
                            txt += '<div id="uniq_mcq_with_options' + data.d[i].McqsQuestionId + '"><div class="row" id="tr_question_' + Srno + '" ><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="question' + data.d[i].McqsQuestionId + '"><input type="text" style="display:none;" id="' + data.d[i].McqsQuestionId + 'q" name="' + data.d[i].McqsQuestionId + 'q" value=' + Srno + ' ><label>Q.' + parseInt(Srno++) + '</label></div><div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="background-color: #FFFFFF !important;"><b><label style="color:black; font-size:12px;  margin-left: 3px;margin-top: -1px;">' + $.trim(data.d[i].QuestionText.unquoted().replace(/\s+/g, " ")) + '</label></b></div></div>'; //  <td>' + data.d[i].Points + '</td></tr>';

                            if (data.d[i].op1 == true) {
                                //<label class="pop" id="lbl_p_op1_' +data.d[i].McqsQuestionId + '" >
                                if ($.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) != "") {
                                    txt += '<div class="row" id="M1' + data.d[i].McqsQuestionId + '"><div class=" col-xs-2 col-sm-1 col-md-1 col-lg-1" id="1correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="1" id ="1' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op1_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                }

                            }
                            if (data.d[i].op2 == true) {
                                if ($.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) != "") {
                                    txt += '<div class="row" id="M2' + data.d[i].McqsQuestionId + '"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="2correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="2" id ="2' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall" colspan="2"><label class="pop" id="lbl_p_op2_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                }

                            }


                            if (data.d[i].op3 == true) {

                                if ($.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) != "") {
                                    txt += '<div class="row" id="M3' + data.d[i].McqsQuestionId + '"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="3correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="3" id ="3' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall"><label class="pop" id="lbl_p_op3_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                }

                            }


                            if (data.d[i].op4 == true) {
                                if ($.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) != "") {
                                    txt += '<div class="row" id="M4' + data.d[i].McqsQuestionId + '"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="4correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="4" id ="4' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall"><label class="pop" id="lbl_p_op4_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                }

                            }


                            if (data.d[i].op5 == true) {

                                if ($.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) != "") {
                                    txt += '<div class="row"  id="M5' + data.d[i].McqsQuestionId + '"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="5correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="5" id ="5' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall"><label class="pop" id="lbl_p_op5_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                }


                            }


                            if (data.d[i].op6 == true) {

                                if ($.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) != "") {
                                    txt += '<div class="row"  id="M6' + data.d[i].McqsQuestionId + '"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="6correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="6" id ="6' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall"><label class="pop" id="lbl_p_op6_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                }

                            }


                            if (data.d[i].op7 == true) {

                                if ($.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) != "") {
                                    txt += '<div class="row"  id="M7' + data.d[i].McqsQuestionId + '" ><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="7correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="7" id ="7' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall"><label class="pop" id="lbl_p_op7_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
                                }
                            }


                            if (data.d[i].op8 == true) {

                                if ($.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) != "") {
                                    txt += '<div class="row"  id="M8' + data.d[i].McqsQuestionId + '"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="8correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="8" id ="8' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op8_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
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
                            txt += '<div class="row" ><div class="col-sm-1"></div><di class="col-xs-10 col-sm-10 col-md-10 col-lg-10"><img style="width: 20%;" src="/acme-free/img/divider2.gif" /><input type="button" class="btn btn-default btn-sm btnReporttoggle" id="' + data.d[i].McqsQuestionId + '" name="My Name is nauman" value="Report"  /> <div id="btnReporttoggle_' + data.d[i].McqsQuestionId + '"></div></div></div></div></div>';
                            //txt += '</div><div class ="row"><div class="col-sm-1"></div><div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" ><img style="width: 20%;" src="/acme-free/img/divider2.gif" />  <input type="button" class="btn btn-default btn-sm btnReporttoggle" id="' + data.d[i].McqsQuestionId + '" name="My Name is nauman" value="Report"  /> <button class="btn  btn-social btn-facebook  sharemcq" id="999' + data.d[i].McqsQuestionId + '" name="999tr_question_' + Srno + '" style="background-color:#30487b; color:#fff; ">Post on Facebook</i></button><div id="btnReporttoggle_' + data.d[i].McqsQuestionId + '"></div></div></div>';
                        }

                        if (txt != '') {
                            //btnShowResultdiv
                            // $("#tblLoadMcqsAllQuestion").empty();
                            // $("#tblLoadMcqsAllQuestion").remove();
                            $("#tblLoadMcqsAllQuestion").append(txt);
                            // $("#tblLoadMcqsAllQuestion").show();
                            // $('#LoadMcqsAllQuestion').show();
                            //$('#btnPracticethistest').show();
                            //$('#btnShowResultdiv').show();
                            //$('#statusbar').show();
                            //Scroll_top();
                            //$("#mainheader").hide();
                            //$("#testheader").show();
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
            // }
            //else {
            //    var data = value_storage;
            //    setTimeout($.unblockUI, 1000);
            //    var len = data.d.length;
            //    var txt = "";
            //    $("#totq").text(len);
            //    $("#totr").html(len);
            //    $("#totr_text").html('Remaining: ');
            //    TotalScore = data.d.length;
            //    alltestQuestionsArray = data.d;
            //    //console.log['alltestQuestionsArray = ' + alltestQuestionsArray];
            //    //alert(alltestQuestionsArray);
            //    var alltemquestions = '';

            //    if (len > 0) {
            //        // value_storage = data;
            //        // $.jStorage.set(CurrentTestid.toString(), value_storage, 300000);
            //        $('#tblLoadMcqsAllQuestion').find('div').empty();

            //        var Srno = 1;
            //        $("#ddlallquiz").html('');
            //        //$("#selectId option").remove();
            //        $("#ddlallquiz").append($("<option></option>").attr("value", 0).text('Question Status'));
            //        for (var i = 0; i < len; i++) {

            //            $("#ddlallquiz").append($("<option></option>").attr("value", Srno).text(Srno));

            //            txt += '<div id="uniq_mcq_with_options' + data.d[i].McqsQuestionId + '"><div class="row" id="tr_question_' + Srno + '" ><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="question' + data.d[i].McqsQuestionId + '"><input type="text" style="display:none;" id="' + data.d[i].McqsQuestionId + 'q" name="' + data.d[i].McqsQuestionId + 'q" value=' + Srno + ' ><label>Q.' + parseInt(Srno++) + '</label></div><div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="background-color: #FFFFFF !important;"><b><label style="color:black; font-size:12px;  margin-left: 3px;margin-top: -1px;">' + $.trim(data.d[i].QuestionText.unquoted().replace(/\s+/g, " ")) + '</label></b></div></div>'; //  <td>' + data.d[i].Points + '</td></tr>';

            //            if (data.d[i].op1 == true) {
            //                //<label class="pop" id="lbl_p_op1_' +data.d[i].McqsQuestionId + '" >
            //                if ($.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) != "") {
            //                    txt += '<div class="row" id="M1' + data.d[i].McqsQuestionId + '"><div class=" col-xs-2 col-sm-1 col-md-1 col-lg-1" id="1correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="1" id ="1' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op1_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
            //                }

            //            }
            //            if (data.d[i].op2 == true) {
            //                if ($.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) != "") {
            //                    txt += '<div class="row" id="M2' + data.d[i].McqsQuestionId + '"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="2correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="2" id ="2' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall" colspan="2"><label class="pop" id="lbl_p_op2_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
            //                }

            //            }


            //            if (data.d[i].op3 == true) {

            //                if ($.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) != "") {
            //                    txt += '<div class="row" id="M3' + data.d[i].McqsQuestionId + '"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="3correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="3" id ="3' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall"><label class="pop" id="lbl_p_op3_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
            //                }

            //            }


            //            if (data.d[i].op4 == true) {
            //                if ($.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) != "") {
            //                    txt += '<div class="row" id="M4' + data.d[i].McqsQuestionId + '"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="4correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="4" id ="4' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall"><label class="pop" id="lbl_p_op4_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
            //                }

            //            }


            //            if (data.d[i].op5 == true) {

            //                if ($.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) != "") {
            //                    txt += '<div class="row"  id="M5' + data.d[i].McqsQuestionId + '"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="5correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="5" id ="5' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall"><label class="pop" id="lbl_p_op5_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
            //                }


            //            }


            //            if (data.d[i].op6 == true) {

            //                if ($.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) != "") {
            //                    txt += '<div class="row"  id="M6' + data.d[i].McqsQuestionId + '"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="6correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="6" id ="6' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall"><label class="pop" id="lbl_p_op6_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
            //                }

            //            }


            //            if (data.d[i].op7 == true) {

            //                if ($.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) != "") {
            //                    txt += '<div class="row"  id="M7' + data.d[i].McqsQuestionId + '" ><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="7correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="7" id ="7' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall"><label class="pop" id="lbl_p_op7_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
            //                }
            //            }


            //            if (data.d[i].op8 == true) {

            //                if ($.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) != "") {
            //                    txt += '<div class="row"  id="M8' + data.d[i].McqsQuestionId + '"><div class="col-xs-2 col-sm-1 col-md-1 col-lg-1" id="8correctcls' + data.d[i].McqsQuestionId + '"><input type="checkbox" class="largerCheckbox" value="8" id ="8' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></div><div class="col-xs-10 clsloadmcqsall" ><label class="pop" id="lbl_p_op8_' + data.d[i].McqsQuestionId + '">' + $.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) + '</label></div></div>';
            //                }
            //            }
            //            var correctop;
            //            if (data.d[i].Option1Correct == true) {
            //                correctop = 1;
            //            }
            //            else
            //                if (data.d[i].Option2Correct == true) {
            //                    correctop = 2;
            //                }
            //                else
            //                    if (data.d[i].Option3Correct == true) {
            //                        correctop = 3;
            //                    }
            //                    else
            //                        if (data.d[i].Option4Correct == true) {
            //                            correctop = 4;
            //                        }
            //                        else
            //                            if (data.d[i].Option5Correct == true) {
            //                                correctop = 5;
            //                            }
            //                            else
            //                                if (data.d[i].Option6Correct == true) {
            //                                    correctop = 6;
            //                                }
            //                                else
            //                                    if (data.d[i].Option7Correct == true) {
            //                                        correctop = 7;
            //                                    }
            //                                    else
            //                                        if (data.d[i].Option8Correct == true) {
            //                                            correctop = 8;
            //                                        }

            //            txt += '<div class="row" <div class="col-sm-1"><label hidden="hidden" value="' + correctop + '" id="correctop' + data.d[i].McqsQuestionId + '"  name="' + data.d[i].McqsQuestionId + '" for="' + data.d[i].McqsQuestionId + '" >' + correctop + '</label></div></div>';
            //            txt += '<div class="row" ><div class="col-sm-1"></div><di class="col-xs-10 col-sm-10 col-md-10 col-lg-10"><img style="width: 20%;" src="/acme-free/img/divider2.gif" /><input type="button" class="btn btn-default btn-sm btnReporttoggle" id="' + data.d[i].McqsQuestionId + '" name="My Name is nauman" value="Report"  /> <div id="btnReporttoggle_' + data.d[i].McqsQuestionId + '"></div></div></div></div></div>';
            //            //txt += '</div><div class ="row"><div class="col-sm-1"></div><div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" ><img style="width: 20%;" src="/acme-free/img/divider2.gif" />  <input type="button" class="btn btn-default btn-sm btnReporttoggle" id="' + data.d[i].McqsQuestionId + '" name="My Name is nauman" value="Report"  /> <button class="btn  btn-social btn-facebook  sharemcq" id="999' + data.d[i].McqsQuestionId + '" name="999tr_question_' + Srno + '" style="background-color:#30487b; color:#fff; ">Post on Facebook</i></button><div id="btnReporttoggle_' + data.d[i].McqsQuestionId + '"></div></div></div>';
            //        }

            //        if (txt != '') {
            //            $("#tblLoadMcqsAllQuestion").empty();
            //            // $("#tblLoadMcqsAllQuestion").remove();
            //            $("#tblLoadMcqsAllQuestion").append(txt);
            //            $("#tblLoadMcqsAllQuestion").show();
            //            $('#LoadMcqsAllQuestion').show();
            //            $('#btnPracticethistest').show();
            //            $('#btnShowResultdiv').show();
            //            $('#statusbar').show();
            //            Scroll_top();
            //            $("#mainheader").hide();
            //            $("#testheader").show();
            //            //$('html, body').animate({
            //            //    scrollTop: $('#LoadMcqsAllQuestion').offset().top
            //            //}, 2000);

            //        }
            //    }
            //}


        }
        var showhideReport = 0;
        $(document).on('click', '.btnReporttoggle', function (e) {

            //lbl_p_op1_
            ////debugger;
            var chkboxname = this.id;

            if (document.getElementById('rdbreport1_' + chkboxname)) {
                //alert('yep');
                $('#btnReporttoggle_' + chkboxname).append(string).toggle();
            } else {


                var string = " <div id='ReportMcq" + chkboxname + "' class='ReportMcq' > " +
                    "<div class='row' id='Report_all_options' > " +
            "<div class='col-md-12'> " +
                "<input type='radio'  name='" + chkboxname + "' value='1' id='rdbreport1_" + chkboxname + "' class='radio ui-radio radio-inline' /><label for='rdbreport1_" + chkboxname + "'>The Answer is Incorrect.</label><br /> " +
                "<input type='radio'  name='" + chkboxname + "' value='2' id='rdbreport2_" + chkboxname + "'/><label for='rdbreport2_" + chkboxname + "'>The Question is Incomplete.</label><br /> " +
                "<input type='radio'  name='" + chkboxname + "' value='3' id='rdbreport3_" + chkboxname + "'/><label for='rdbreport3_" + chkboxname + "'>The Option is not clear.</label><br />" +
                "<input type='radio'  name='" + chkboxname + "' value='4' id='rdbreport4_" + chkboxname + "'/><label for='rdbreport4_" + chkboxname + "'>I only doubt in it.</label><br />" +
        "</div>" +
        "</div>" +
        "<div class='row div_incorrect_answer'  id='div_incorrect_answer_rdbreport1_" + chkboxname + "' style='display:none;'>" +
        "      <div class='col-md-12'>" +
        "    <label>The Correct Option Should be</label><br />" +
        "    <select id='ddl_user_correct_" + chkboxname + "' class='ddl_user_correct'>" +
        "        <option value='1'>Blue Whale 1</option>" +
        "        <option value='2'>Blue Whale 2</option>" +
        "        <option value='3'>Blue Whale 3</option>" +
        "        <option value='4'>Blue Whale 4</option>" +
        "    </select><br />" +
        "<label>Want to inform you later ? Email address: </label><input type='text' id='user_corr_email' placeholder='Email' /><br />" +
        "    <button class='btn btn-info btn-lg btn_FinalReport' id='btn_FinalReport1' name='" + chkboxname + "'  >Send Report</button>" +
         "         </div>" +
        "</div>" +
        "                   <div class='row div_incorrect_Question' id='div_incorrect_Question_rdbreport2_" + chkboxname + "' style='display:none;'>" +
        "      <div class='col-md-12'>" +
        "    <label>The Correct Question Should be</label><br />" +
        "    <input type='text' id='txt_user_corr_q_" + chkboxname + "' placeholder='Type Correct Question ' /> <br />" +
        "<label>Want to inform you later ? Email address: </label><input type='text' id='user_corr_email' placeholder='Email' /><br />" +
        "    <button class='btn btn-info btn-lg btn_FinalReport' id='btn_FinalReport2' name='" + chkboxname + "'>Send Report</button>" +
        "          </div>" +
        "</div>" +
        "                  <div class='row div_notclear_option' id='div_notclear_option_rdbreport3_" + chkboxname + "' style='display:none;'>" +
        "      <div class='col-md-12'>" +
        "    <label>The Correct Option Should be</label><br />" +
        "    <select id='ddl_user_not_clear_option_" + chkboxname + "' class='ddl_user_correct'>" +
         "       <option value='1'>Blue Whale 1</option>" +
         "       <option value='2'>Blue Whale 2</option>" +
         "       <option value='3'>Blue Whale 3</option>" +
        "        <option value='4'>Blue Whale 4</option>" +
        "    </select><br />" +
        "          <input type='text' id='txt_user_not_clear_option_" + chkboxname + "' /> <br />" +
        "    <button class='btn btn-info btn-lg btn_FinalReport' id='btn_FinalReport3' name='" + chkboxname + "' >Send Report</button>" +
        "          </div>" +
        "</div>" +
        "<div class='row div_doubt_option' id='div_doubt_option_rdbreport4_" + chkboxname + "' style='display:none;'>" +
        "    <div class='col-md-12'>" +
        "        <label>Want to inform you later ? your mail address here</label><input type='text' id='user_corr_email' placeholder='Email' /><br />" +
        "        <input type='button' class='btn btn-info btn-lg btn_FinalReport' id='btn_FinalReport4' value='Send Report' name='" + chkboxname + "' />" +
        "    </div>" +
        "</div>" +
    "</div>";
                //var value = $(this).$value;
                //var favorite = [];
                //  alert('name ' + chkboxname + ' and value ');

                //if (showhideReport == 0) {
                $('#btnReporttoggle_' + chkboxname).html(string);

            }

        });
        //sharemcq
        $(document).on('click', '.sharemcq', function () {


            //alert(this.id);
            // $('')
            var McqsId = this.id;

            var questiontr = this.name;
            questiontr = questiontr.substr(3);
            var btnId = this.id;
            McqsId = McqsId.substr(3);
            ////console.log(McqsId);
            //alert('uniq_mcq_with_options' + McqsId)
            //DrawPic('uniq_mcq_with_options' + McqsId);
            var divId = 'uniq_mcq_with_options' + McqsId;
            //alert(divId);
            //var Pic = document.getElementById("myCanvas").toDataURL("image/png");


            //  sendFile(Pic);
            //Pic = Pic.replace(/^data:image\/(png|jpg);base64,/, "")
            var testName_e = $("#lblTestNamed").text();
            var TotalQuestions = $("#totq").text();
            UploadPic(divId, testName_e, TotalQuestions, btnId);
            // alert(testName);

            return false;


            // Sending the image data to Server
            $.ajax({
                type: 'POST',
                cache: false,
                url: 'default.aspx/UploadPic',
                data: '{ "imageData" : "' + Pic + '" ,"TestName" : "' + testName_e + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (msg) {
                    var pic_name = msg.d;

                }

            });

        });

        function insert_usersReport(oldurl, ReporterName, User_Email, McqsId, selected_correct_option_text, selected_radio) {
           
            $.ajax({
                type: "POST",
                cache: false,
                contentType: "application/json; charset=utf-8",
                url: "default.aspx/InsertReport",
                data: "{'ReporterName':'" + ReporterName + "','ReporterEmail':'" + User_Email + "','Report_McqsId':'" + McqsId +
                        "','Report_OptionText':'" + selected_correct_option_text + "','Report_Type':'" + selected_radio +
                        "'}",
                timeout: (2 * 100000), dataType: "json",
                success: function (data) {
                    Router.navigate(oldurl);
                    //alert(data.d)
                    if (data.d == "true") {
                        alertify.success('Reported Saved successfully');
                        $("#" + McqsId).css('color', 'red');
                        $("#" + McqsId).css('color', 'red');
                        $("#" + McqsId).val("Thank You to giving us Your Time. We will see it ASAP.!");
                        $("#" + McqsId).attr('disabled', 'true');
                        $('#btnReporttoggle_' + McqsId).hide();

                    }
                    else {
                        alertify.error('Not Rported Saved successfully. Please try again.');
                        Router.navigate(oldurl);
                    }

                },
                error: function (jqXHR, exception) {
                    var msg = '';
                    if (jqXHR.status === 0) {
                        msg = 'Not connect.\n Please Verify you Network.';
                    } else if (jqXHR.status == 404) {
                        msg = 'Requested page not found. [404]';
                    } else if (jqXHR.status == 500) {
                        msg = 'Internal Server . Please Retry again with different values.Error [500].';
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
                },
            })
        }
        $(document).on('click', '#btn_FinalReport1', function () {

            //alert(this.name);
            // $('')
            oldurl = window.location.pathname;
            Router.navigate();


            var McqsId = this.name;
            var selected_radio = $('input[type="radio"]:checked').val();
            var selected_correct_option_text = ($('#ddl_user_correct_' + this.name + ' :selected').text());
            var selected_correct_option_value = ($('#ddl_user_correct_' + this.name + ' :selected').val());
            var User_Email = ($("#user_corr_email").val());
            var ReporterName = "";
            insert_usersReport(oldurl, ReporterName, User_Email, McqsId, selected_correct_option_text, selected_radio);
            //// alert(User_Email);

            //$(this).hide();

            //alert('called ' + selected);
        });
        $(document).on('click', '#btn_FinalReport2', function () {

            oldurl = window.location.pathname;
            Router.navigate();


            var McqsId = this.name;
            var selected_radio = $('input[type="radio"]:checked').val();
            var selected_correct_option_text = ($('#ddl_user_correct_' + this.name + ' :selected').text());
            var selected_correct_option_value = ($('#ddl_user_correct_' + this.name + ' :selected').val());
            var User_Email = ($("#user_corr_email").val());
            var ReporterName = "";
            insert_usersReport(oldurl, ReporterName, User_Email, McqsId, selected_correct_option_text, selected_radio);
            //  alert(this.name);
            // $('')
            //oldurl = window.location.pathname;
            //Router.navigate();
            //var McqsId = this.name;
            //var selected_radio = $('input[type="radio"]:checked').val();
            //var selected_correct_option_text = ($('#ddl_user_correct_' + this.name + ' :selected').text());
            //var selected_correct_option_value = ($('#ddl_user_correct_' + this.name + ' :selected').val());
            //var ReporterName = "";
            //insert_usersReport(oldurl, ReporterName, User_Email, McqsId, selected_correct_option_text, selected_radio);
            //$("#" + McqsId).css('color', 'red');
            //$("#" + McqsId).css('color', 'red');
            //$("#" + McqsId).val("Reported Successfully!");
            //$("#" + McqsId).attr('disabled', 'true');
            //$('#btnReporttoggle_' + McqsId).hide();
            //$(this).hide();

            //alert('called ' + selected);
        });
        $(document).on('click', '#btn_FinalReport3', function () {

            oldurl = window.location.pathname;
            Router.navigate();


            var McqsId = this.name;
            var selected_radio = $('input[type="radio"]:checked').val();
            var selected_correct_option_text = ($('#ddl_user_correct_' + this.name + ' :selected').text());
            var selected_correct_option_value = ($('#ddl_user_correct_' + this.name + ' :selected').val());
            var User_Email = ($("#user_corr_email").val());
            var ReporterName = "";
            insert_usersReport(oldurl, ReporterName, User_Email, McqsId, selected_correct_option_text, selected_radio);
            //alert(this.name);
            // $('')
            //var McqsId = this.name;
            //var selected_radio = $('input[type="radio"]:checked').val();
            //var selected_correct_option_text = ($('#ddl_user_correct_' + this.name + ' :selected').text());
            //var selected_correct_option_value = ($('#ddl_user_correct_' + this.name + ' :selected').val());

            //$("#" + McqsId).css('color', 'red');
            //$("#" + McqsId).css('color', 'red');
            //$("#" + McqsId).val("Reported Successfully!");
            //$("#" + McqsId).attr('disabled', 'true');
            //$('#btnReporttoggle_' + McqsId).hide();
            //$(this).hide();

            //alert('called ' + selected);
        });
        $(document).on('click', '#btn_FinalReport4', function () {

            oldurl = window.location.pathname;
            Router.navigate();


            var McqsId = this.name;
            var selected_radio = $('input[type="radio"]:checked').val();
            var selected_correct_option_text = ($('#ddl_user_correct_' + this.name + ' :selected').text());
            var selected_correct_option_value = ($('#ddl_user_correct_' + this.name + ' :selected').val());
            var User_Email = ($("#user_corr_email").val());
            var ReporterName = "";
            insert_usersReport(oldurl, ReporterName, User_Email, McqsId, selected_correct_option_text, selected_radio);
            //alert(this.name);
            // $('')
            //var McqsId = this.name;
            //var selected_radio = $('input[type="radio"]:checked').val();
            //var selected_correct_option_text = ($('#ddl_user_correct_' + this.name + ' :selected').text());
            //var selected_correct_option_value = ($('#ddl_user_correct_' + this.name + ' :selected').val());

            //$("#" + McqsId).css('color', 'red');
            //$("#" + McqsId).css('color', 'red');
            //$("#" + McqsId).val("Reported Successfully!");
            //$("#" + McqsId).attr('disabled', 'true');
            //$('#btnReporttoggle_' + McqsId).hide();
            //$(this).hide();

            //alert('called ' + selected);
        });
        $(document).on('change', '[type=radio]', function (e) {
            e.preventDefault();
            //  alert(this.id);
            var chkboxname = this.id;
            var name = this.name;
            ////debugger;
            var op1 = $("#lbl_p_op1_" + name).text();
            var op2 = $("#lbl_p_op2_" + name).text();
            var op3 = $("#lbl_p_op3_" + name).text();
            var op4 = $("#lbl_p_op4_" + name).text();
            var op5 = $("#lbl_p_op5_" + name).text();
            var op6 = $("#lbl_p_op6_" + name).text();
            var op7 = $("#lbl_p_op7_" + name).text();
            var op8 = $("#lbl_p_op8_" + name).text();
            // alert($("#lbl_p_op1_" + name).name());


            $('.ddl_user_correct').empty().append($("<option></option>")
                       .attr("value", 0)
                       .text('Select Option'));
            if (op1.length > 2) {
                $('.ddl_user_correct').append($("<option></option>")
                       .attr("value", 1)
                       .text(op1));
            }

            if (op2.length > 2) {
                $('.ddl_user_correct').append($("<option></option>")
                      .attr("value", 2)
                      .text(op2));
            }

            if (op3.length > 2) {
                $('.ddl_user_correct').append($("<option></option>")
   .attr("value", 3)
   .text(op3));
            }

            if (op4.length > 2) {
                $('.ddl_user_correct').append($("<option></option>")
   .attr("value", 4)
   .text(op4));
            }

            if (op5.length > 2) {
                $('.ddl_user_correct').append($("<option></option>")
   .attr("value", 5)
   .text(op5));
            }

            if (op6.length > 2) {
                $('.ddl_user_correct').append($("<option></option>")
   .attr("value", 6)
   .text(op6));
            }

            if (op7.length > 2) {
                $('.ddl_user_correct').append($("<option></option>")
   .attr("value", 7)
   .text(op7));
            }

            if (op8.length > 2) {
                $('.ddl_user_correct').append($("<option></option>")
  .attr("value", 8)
  .text(op8));
            }
            //_"+chkboxname+"'
            if (this.value == '1') {
                //  alert(this.id);         .div_doubt_option{}
                //.div_incorrect_answer{}
                //.div_notclear_option {}
                //.div_incorrect_Question{}
                //  //debugger;
                //$('.div_notclear_option').show();
                //$('#mySelect')
                //id = "lbl_p_op1_' + data.d[i].McqsQuestionId + '"


                $('#div_incorrect_answer_' + chkboxname).show();
                $('.div_incorrect_Question').hide();
                $('.div_notclear_option').hide();
                $('.div_doubt_option').hide();
                // alert('Allot Thai Gayo Bhai_'+chkboxname);
            }
            else if (this.value == '2') {
                //  alert(this.id);
                ////debugger;
                // $('#div_incorrect_Question_'+chkboxname).show();
                //$('.div_notclear_option').hide();
                $('.div_incorrect_answer').hide();
                //$('#div_incorrect_Question_' + chkboxname).show();
                $('#div_incorrect_Question_' + chkboxname).show();
                $('.div_notclear_option').hide();
                $('.div_doubt_option').hide();
                // alert('Transfer Thai Gayo_'+chkboxname);
            }
            else if (this.value == '3') {
                //  alert(this.id);
                //  //debugger;
                $('#div_notclear_option_' + chkboxname).show();
                $('.div_incorrect_answer').hide();
                //$('#div_incorrect_Question_' + chkboxname).show();
                $('.div_incorrect_Question').hide();

                $('.div_doubt_option').hide();
                // alert('Transfer Thai Gayo_'+chkboxname);
            }
            else if (this.value == '4') {
                //  alert(this.id);
                //  //debugger;
                //$('#div_doubt_option_'+chkboxname).show();
                $('.div_incorrect_answer').hide();
                //$('#div_incorrect_Question_' + chkboxname).show();
                $('.div_incorrect_Question').hide();
                $('.div_notclear_option').hide();
                $('#div_doubt_option_' + chkboxname).show();
                //  alert('Transfer Thai Gayo');
            }
        });

        //$('#btnShowResultdiv').click(function () {


        //})
        var Score = 0;

        $('#btnTestagain').click(function () {

            if (CurrentTestid != undefined || CurrentTestid != 0) {
                // Scroll_top();
                Router.navigate();
                // totalmcqs = 0;
                totalloadedmcqs = 0;
                alltestQuestionsArray = [];
                tempArray = [];
                pageIndex = 0;
                pageCount = 0;
                $("#ddlallquiz").html('');
                $("#ddlallquiz").append($("<option></option>").attr("value", 0).text('Status'));
                $("#totr").text($("#totq").text());
                //  totalmcqs = myTable.row(row[0][0]).data()[6];

                // alert(totalmcqs);
                // return false;
                // $("#totr").html('');
                // $("#totq").html('');
                //$("#totq").html(totalmcqs);
                //$("#totr").html(totalmcqs);
                //$("#totr_text").html('');
                //$("#lblTestNamed").html("Test Name: " + myTable.row(row[0][0]).data()[1] + "-" + myTable.row(row[0][0]).data()[2]);
                //// $("#totr").html('');
                //$("#totr_text").html('');
                //subname_scroll = "";
                //testname_scroll = "";
                hide_all();
                Score = 0;
                TotalScore = 0;
                negativeScore = 0;
                //CurrentTestid = Id;
                var value_storage = $.jStorage.get(CurrentTestid.toString());
                value_storage = null;
                //  var Srno = 1;
               // $("#totr_text").html('Questions Remaining:');
                $('#tblLoadMcqsAllQuestion').find('div').empty();
                $("#tblLoadMcqsAllQuestion").empty();
                // $("#ddlallquiz").html('');
                $("#tbodytblLoadMcqsAllQuestion").empty();
                $("#tblLoadMcqsAllQuestion").show();
                $('#btnTestagain').show();
                $('#LoadMcqsAllQuestion').show();
                $(".btnShowResultdiv").show();
                $(".btnPracticethistest").show();
                Scroll_top();
                // configuration
                Router.config({ mode: 'history' });

                // returning the user to the initial state

                Srno = 1;
                mcq = 1;
                exp = "";
                reff = "";
                lblCorrectAns = 0;
                lblWrongAns = 0;
                lblOverallPercent = 0;
                // pageIndex = 0;
                isActive = true;
                // IsMultiple = data[10];
                SecDetail = [];
                ClientTestInfo.length = 0;
                SecDetailarr.length = 0;
                if (IsMultiple == 1) {
                    var Inst;
                    var TestName;
                    var TestPassingPercentage;
                    var TestTotalQ;
                    var SecName;
                    var SecDetail;
                    var SecPriority;
                    var SecTotalQ;
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "default.aspx/getTestInst",
                        data: "{'TestId':'" + CurrentTestid + "'}",
                        beforeSend: function () {


                            $('#divloading').html('Please Wait while loading your requested contents...');
                            blockui();
                            //$('#lblQuestionBefore').html("Saving...");



                        },
                        timeout: 90000, dataType: "json",
                        success: function (data) {
                            for (var i = 0; i < data.d.length; i++) {

                                TestName = data.d[i].TestName;
                                Inst = data.d[i].TestInst;
                                TestPassingPercentage = data.d[i].TestPassingPercent;
                                TestTotalQ = data.d[i].TestTotalQ;
                                SecName = data.d[i].SecName;
                                SecDetail = data.d[i].SecDetail;
                                SecPriority = data.d[i].SecPriority;
                                SecTotalQ = data.d[i].SecTotalQ;
                                SpecMarks = data.d[0].SpecMarks;
                                isNegativeMarks = data.d[0].isNegativeMarks;

                                //alert(TestTotalQ);
                                if (TestTotalQ != "") {
                                    //alert("time = " + parseInt(TestTotalQ) * 1.5);
                                    var t = parseInt((parseInt(TestTotalQ) * 41) / 60);
                                    // alert(t);
                                    // t = parseInt(t * 1000);
                                    clearTimeout(timeoutHandle); countdown(t);
                                    //timer2 = t + ":00";
                                    //setInterval(interval, t);
                                    //  interval();
                                    //d setInterval(interval,1000)
                                    //setTimeout("alertify.error(Your Time is Up);", t);
                                    $("#countdowntimer").show();
                                    // timer2 = t + ":00";
                                }
                                SecDetailarr.push({
                                    SecName: SecName, SecDetail: SecDetail, SecPriority: SecPriority, SecTotalQ: SecTotalQ, TestName: TestName
                                    , TestInst: Inst, TestPassingPercentage: TestPassingPercentage, TestTotalQ: TestTotalQ
                                });


                            }
                            //consoloe.log("SecDetailarr = " + SecDetailarr);
                            // alert(SecDetailarr[Object.keys(SecDetailarr)[0]]);
                            var myst = 1;
                            jQuery('#tblLoadMcqsAllQuestion').before().html('<button type="button" class="btn-small btn-danger" data-toggle="collapse" data-target="#demo">' +
                           '  Instruction Show/Hide </button> <div id="demo" class="collapse in"><div> <h1>Instructions</h1> </div><div class="row">​' +
                           '<div class="col-sm-3"><label>Passing Percentage ' + TestPassingPercentage + '%</label></div>'
                          + '<div class="col-sm-6"><label>Test Name ' + TestName + ' </label></div>'
                          + '<div class="col-sm-3"><label>Total Questions ' + TestTotalQ + '</label></div></div>'
                          + '<div class="row"><div class="col-sm-12">' + Inst + '</div></div></div>' + SecHtm(SecDetailarr[0].SecPriority, SecDetailarr[0].SecName, SecDetailarr[0].SecTotalQ, SecDetailarr[0].SecDetail));

                            //  alert(Inst);
                            setTimeout($.unblockUI, 500);
                        },
                        error: function (result) {
                            alertify.error("Error");
                            setTimeout($.unblockUI, 500);
                        }
                    })
                    //alert("Test Name "+TestName)

                }
                else {
                    var mymcqsTot = $("#totq").text();
                    var t = parseInt((parseInt(mymcqsTot) * 60) / 60);
                    // alert(t);
                    //  timer2 = "0:0";
                    clearTimeout(timeoutHandle); countdown(t);
                    //timer2 = t + ":00";
                    ///  t = parseInt(t * 1000);
                    //  clearInterval(interval);
                    //setTimeout(interval, 100);

                    // setInterval(interval, t);
                    // setInterval(interval, 1000)

                    $("#countdowntimer").show();
                }
                showTestdiv(CurrentTestid);
                isPractice = 2;
                $("#mainheader").hide();
                $("#testheader").show();
                subname_scroll = subname_scroll.replace(/ /g, '-')
                testname_scroll = testname_scroll.trim();
                testname_scroll = encodeURIComponent(testname_scroll);

                subname_scroll = subname_scroll.replace(/ /g, '-')
                subname_scroll = subname_scroll.trim();
                subname_scroll = encodeURIComponent(subname_scroll);
                // forwarding
                Router.navigate('Test/Online/Mcqs/Test/FreeMcqs-' + CurrentTestid);
                // Router.navigate('Practice/Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/' + subname_scroll + '/' + testname_scroll + '/TestId=' + CurrentTestid);

                // hide_all();
                // $('#btnShowResultdiv').show(1000);
                //  $('#LoadMcqsAllQuestion').show(1000);

            }
            else {
                alert('Please Refresh the Page');
            }
        })
        $('#btnpractiseagain').click(function () {
            if (CurrentTestid != undefined || CurrentTestid != 0) {
                //Scroll_top();
                //totalmcqs = 0;
                totalloadedmcqs = 0;
                $("#countdowntimer").hide();
                //totalmcqs = myTable.row(row[0][0]).data()[6];
                pageIndex = 0;
                pageCount = 0;
                //alert(totq);
                //$("#totq").html(totalmcqs);
                $("#totr").text('');
                //$("#totr_text").html('');
                //$("#lblTestNamed").html("Test Name: " + myTable.row(row[0][0]).data()[1] + "-" + myTable.row(row[0][0]).data()[2]);
                $("#totr").html('');
                //$("#totr_text").html('');
                subname_scroll = "";
                testname_scroll = "";

                // Scroll_top();
                hide_all();
                // alert('hello    == id is = ' + Id + ' and row = ' + row + ' tr = ' + tr);
                $('#tblLoadMcqsAllQuestion').find('div').empty();
                $("#tblLoadMcqsAllQuestion").empty();
                $("#ddlallquiz").html('');
                $("#ddlallquiz").append($("<option></option>").attr("value", 0).text('Status'));
                $("#tbodytblLoadMcqsAllQuestion").empty();
                $("#tblLoadMcqsAllQuestion").show();
                $('.btntestthistest').show();
                $('#LoadMcqsAllQuestion').show();
                Scroll_top();
                // configuration
                Router.config({ mode: 'history' });

                // returning the user to the initial state
                Router.navigate();
                Srno = 1;
                mcq = 1;
                exp = "";
                reff = "";
                isActive = true;
                TotalScore = 0;
                negativeScore = 0;
                TotalSecIds = 1;
                TotalSecIdsQ = 0;
                compareSecIds = 0;
                mySecCounts = 0;
                lblCorrectAns = 0;
                lblWrongAns = 0;
                lblOverallPercent = 0;
                SecDetailarr.length = 0;
                SecDetail = [];
                ClientTestInfo.length = 0;
                SecDetailarr.length = 0;
                if (IsMultiple == 1) {
                    var Inst;
                    var TestName;
                    var TestPassingPercentage;
                    var TestTotalQ;
                    var SecName;
                    var SecDetail;
                    var SecPriority;
                    var SecTotalQ;
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "default.aspx/getTestInst",
                        data: "{'TestId':'" + CurrentTestid + "'}",
                        timeout: 90000, dataType: "json",
                        beforeSend: function () {


                            $('#divloading').html('Please Wait while loading your requested contents...');
                            blockui();
                            //$('#lblQuestionBefore').html("Saving...");



                        },
                        success: function (data) {
                            for (var i = 0; i < data.d.length; i++) {

                                TestName = data.d[i].TestName;
                                Inst = data.d[i].TestInst;
                                TestPassingPercentage = data.d[i].TestPassingPercent;
                                TestTotalQ = data.d[i].TestTotalQ;
                                SecName = data.d[i].SecName;
                                SecDetail = data.d[i].SecDetail;
                                SecPriority = data.d[i].SecPriority;
                                SecTotalQ = data.d[i].SecTotalQ;
                                SpecMarks = data.d[0].SpecMarks;
                                isNegativeMarks = data.d[0].isNegativeMarks;
                                //    alert("SpecMarks " + SpecMarks + " and isNegativeMarks " + isNegativeMarks)
                                //alert(TestTotalQ);
                                if (TestTotalQ != "") {
                                    //  clearInterval(interval());
                                    //alert("time = " + parseInt(TestTotalQ) * 1.5);
                                    var t = (parseInt(TestTotalQ) * 41) / 60;
                                    // alert(t);
                                    clearTimeout(timeoutHandle); countdown(t);
                                    //  timer2 = t + ":00";
                                    // setInterval('', t, '');
                                    // timer2 = "00:00";
                                }
                                SecDetailarr.push({
                                    SecName: SecName, SecDetail: SecDetail, SecPriority: SecPriority, SecTotalQ: SecTotalQ, TestName: TestName
                                    , TestInst: Inst, TestPassingPercentage: TestPassingPercentage, TestTotalQ: TestTotalQ
                                });


                            }
                            //consoloe.log("SecDetailarr = " + SecDetailarr);
                            // alert(SecDetailarr[Object.keys(SecDetailarr)[0]]);
                            var myst = 1;
                            jQuery('#tblLoadMcqsAllQuestion').before().html('<button type="button" class="btn-small btn-danger" data-toggle="collapse" data-target="#demo">' +
                           '  Instruction Show/Hide </button> <div id="demo" class="collapse in"><div> <h1>Instructions</h1> </div><div class="row">​' +
                           '<div class="col-sm-3"><label>Passing Percentage ' + TestPassingPercentage + '%</label></div>'
                          + '<div class="col-sm-6"><label>Test Name ' + TestName + ' </label></div>'
                          + '<div class="col-sm-3"><label>Total Questions ' + TestTotalQ + '</label></div></div>'
                          + '<div class="row"><div class="col-sm-12">' + Inst + '</div></div></div>' + SecHtm(SecDetailarr[0].SecPriority, SecDetailarr[0].SecName, SecDetailarr[0].SecTotalQ, SecDetailarr[0].SecDetail));

                            //  alert(Inst);
                            setTimeout($.unblockUI, 500);
                        },
                        error: function (result) {
                            alertify.error("Error");
                            setTimeout($.unblockUI, 500);
                        }
                    })
                    //alert("Test Name "+TestName)

                }
                else {
                    // setInterval('',"0:0", '');
                }
                showPractice(CurrentTestid);
                isPractice = 1;
                subname_scroll = subname_scroll.replace(/ /g, '-')
                testname_scroll = testname_scroll.trim();
                testname_scroll = encodeURIComponent(testname_scroll);

                subname_scroll = subname_scroll.replace(/ /g, '-')
                subname_scroll = subname_scroll.trim();
                subname_scroll = encodeURIComponent(subname_scroll);
                // forwarding
                Router.navigate('Practice/Online/Mcqs/Practice/FreeMcqs-' + CurrentTestid);
                //   Router.navigate('Practice/Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/' + subname_scroll + '/' + testname_scroll + '/TestId=' + CurrentTestid);
                $("#mainheader").hide();
                $("#testheader").show();
                // hide_all();
                // $('#LoadMcqsAllQuestion').show(1000);
            }
            else {
                alert('Please Refresh the Page');
            }
        })

        $('#btnDownloadResultCard').click(function () {
            if (CurrentTestid != undefined || CurrentTestid != 0) {
                ////debugger;
                //console.log('my array = ' + alltestQuestionsArray);
                Router.navigate();
                var data = new Array();
                for (i = 0; i < alltestQuestionsArray.length; i++) {
                    data[i] = alltestQuestionsArray[i];
                }
                // alert(data[0]);
                //  alert(JSON.stringify(alltestQuestionsArray));
                // data[0] = alltestQuestionsArray[0];
                isActive = true;
                $.ajax({
                    type: "POST",
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    url: "default.aspx/downloadResultCard",
                    data: "{'data':" + JSON.stringify(alltestQuestionsArray) + "}",
                    timeout: (2 * 100000), dataType: "json",
                    success: function (data) {
                        isActive = false;
                        window.location = "SecurePages/ResultCard.aspx";
                        Router.navigate(oldurl);
                        //alert(data.d)
                        if (data.d == "true") {
                            alertify.success('Reported Saved successfully');
                            $("#" + McqsId).css('color', 'red');
                            $("#" + McqsId).css('color', 'red');
                            $("#" + McqsId).val("Thank You to giving us Your Time. We will see it ASAP.!");
                            $("#" + McqsId).attr('disabled', 'true');
                            $('#btnReporttoggle_' + McqsId).hide();

                        }
                        else {
                            alertify.error('Not Rported Saved successfully. Please try again.');
                            Router.navigate(oldurl);
                        }

                        //hide_all();
                        //$('#divCommonSubTestNumb').show(1000);
                        //$('#divMcqsQuestion').show(1000);
                        //$('#btnSave').show();
                        //$('#divCommonSubTestNumb').show(1000);
                        //Scroll_top();


                    },
                    error: function (jqXHR, exception) {
                        var msg = '';
                        if (jqXHR.status === 0) {
                            msg = 'Not connect.\n Please Verify you Network.';
                        } else if (jqXHR.status == 404) {
                            msg = 'Requested page not found. [404]';
                        } else if (jqXHR.status == 500) {
                            msg = 'Internal Server . Please Retry again with different values.Error [500].';
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
                    },
                })


                //Scroll_top();
                // showPractice(CurrentTestid);
                // $("#mainheader").hide();
                //  $("#testheader").show();
                // hide_all();
                // $('#LoadMcqsAllQuestion').show(1000);
            }
            else {
                alert('Please Refresh the Page');
            }
        })
        var TotalUserAttemptedQuestions_Array = new Array();
       
        $(document).on('change', '[type=checkbox]', function (e) {

            debugger;
            var $chkboxname = this.name;
            var $value = $(this).val();
            var favorite = [];
         //   columnChart();

            // //console.log('checkboxname' + $chkboxname + ' value ' + $value);
            $.each($("input[type=checkbox]:checked"), function () {
                if (this.name == $chkboxname) {
                    favorite.push($(this).val());
                }

            });
            // //debugger;
            var trid = ($value + "correctcls" + this.name); //"M"+$value+this.id//$(this).parent().closest('div').attr('id'); //("correctcls" + this.id); //$(this).closest('div').attr('id');

            var iname = $chkboxname + "q";
            // var labelid = document.getElementById(iname);// $("input[for='" + $("#" + iname).attr('id') + "']");//$("#" + $chkboxname+'q').val();;
            var $texts = $("#" + iname).val();

            // $("#ddlallquiz").val($texts).addClass("ddlattempted");
            //$('#ddlallquiz option').each(function () {
            //   // var theText = $(this).html();
            //    $(this).addClass($texts);
            //});
            //  $("#ddlallquiz").find("option[4]").addClass("ddlattempted");
            $('option[value="' + $texts + '"]').addClass('ddlattempted');
            // $("#ddlallquiz").val('3').addClass('ddlattempted');
            // $("#ddlallquiz option[value=$texts]").addClass("ddlattempted");
            //$('#ddlallquiz :option["' + $texts +'"]').addClass("ddlattempted");

            //   $("#" + $chkboxname + "q").find("label").attr("id", "value");
            //var labelss = $("#50203q").val();
            //  //debugger;
            var response = ("#correctop" + $chkboxname);
            var correctOption = $(response).text();
            if (favorite == $(response).text()) {
                lblCorrectAns = parseInt(lblCorrectAns) + 1;
                $(".lblCorrectAns").text(lblCorrectAns);
                var ob = 0;
                for (i = 0; i < alltestQuestionsArray.length; i++) {

                    // alert(alltestQuestionsArray[i]);
                    if (this.name == alltestQuestionsArray[i].McqsQuestionId) {
                        ob = i;
                        break;
                    }
                    //if(ob != -1)
                    //{
                    //    break;
                    //}

                }
                alltestQuestionsArray[ob].userselectedoption = $value;
                alltestQuestionsArray[ob].Isusercorrect = 1; //IsuserAttempt
                alltestQuestionsArray[ob].IsuserAttempt = 1; //IsuserAttempt
                // var ob = jQuery.inArray(this.name,alltestQuestionsArray[0]);

                // var string = [0,ob, 'userselected', $(response).text(), 'isusercorrect', 1];
                // alltestQuestionsArray[ob].push(string);
                // alltestQuestionsArray[0][ob]['isusercorrect'] = 1;
                //for (i = 0; i < alltestQuestionsArray[0].length; i++)
                //{
                //    //console.log('alltestQuestionsArray[0]  = ' + alltestQuestionsArray[0][i]);
                //}
                $("#" + trid).addClass('correctcls');
               // $("#" + trid).append().html("<svg class='checkmark' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 52 52'>  <circle class='checkmark__circle' cx='26' cy='26' r='25' fill='none'/>  <path class='checkmark__check' fill='none' d='M14.1 27.2l7.1 7.2 16.7-16.8'/></svg>");

                for (i = 1; i < 9; i++) {
                    $("#" + i + (this.name)).attr("disabled", "disabled");
                }
                if (SpecMarks > 0) {
                    Score = Score + SpecMarks;
                }
                else {
                    Score++;
                }



            }
            else {
                var ob = 0;
                lblWrongAns = parseInt(lblWrongAns) + 1;
                $(".lblWrongAns").text(lblWrongAns);
                // alert('length'+alltestQuestionsArray.length);
                for (i = 0; i < alltestQuestionsArray.length; i++) {
                    //   alert(alltestQuestionsArray[i]);
                    //if (this.name == alltestQuestionsArray[i].McqsQuestionId) {
                    //    ob = i;
                    //    break;
                    //}

                }
                if (isNegativeMarks > 0) {
                    negativeScore++;
                }
                alltestQuestionsArray[ob].userselectedoption = $value;
                alltestQuestionsArray[ob].Isusercorrect = 0;
                alltestQuestionsArray[ob].IsuserAttempt = 1;
                // var ob = jQuery.inArray(this.name, alltestQuestionsArray[0]);
                //var string = [0,ob, 'userselected', $(response).text(), 'isusercorrect', 0];
                //alltestQuestionsArray[ob].push(string);
                //for (i = 0; i < alltestQuestionsArray[0].length; i++) {
                //    //console.log('alltestQuestionsArray[0]  = ' + alltestQuestionsArray[0][i]);
                //}
                $("#" + trid).addClass('inCorrectSelected');
               // $("#" + trid).append().html("<svg class='crossmark' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 52 52'><circle class='crossmark__circle' cx='26' cy='26' r='25' fill='none' />  <path class='checkmark crossmark__check' fill='none' d='M16 16 36 36 M36 16 16 36' /></svg>");
                $("#" + correctOption + "correctcls" + this.name).addClass('inCorrectcls');
               // $("#" + correctOption + "correctcls" + this.name).append().html("<svg class='checkmark' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 52 52'>  <circle class='checkmark__circle' cx='26' cy='26' r='25' fill='none'/>  <path class='checkmark__check' fill='none' d='M14.1 27.2l7.1 7.2 16.7-16.8'/></svg>");
                //($response).addClass('inCorrectcls');
                for (i = 1; i < 9; i++)
                {
                    $("#" + i + (this.name)).attr("disabled", "disabled");
                }
            }
            var remainingq = parseInt($("#totr").text());
            // alert(remainingq);
            $("#totr").html(remainingq - 1);
            var mytotq = $("#totq").text();

            var mypercent = parseInt(mytotq) - parseInt(remainingq - 1);
            lblOverallPercent = parseFloat((parseInt(lblCorrectAns) / (parseInt(lblCorrectAns) + parseInt(lblWrongAns)))*100).toFixed(2);
            $(".lblOverallPercent").text(lblOverallPercent);
            var progressbartotal = parseInt((mypercent / parseInt(mytotq)) * 100);
            // alert(mypercent + ' '+parseInt(progressbartotal) + ' ' + remainingq + '  ' + mytotq);
            $('.progress-bar').css('width', progressbartotal + '%').attr('aria-valuenow', progressbartotal, 'aria-valuemax', parseInt(mytotq)).html(progressbartotal + '%');
        });
        

        var bar_TotalQuestionMcqs_test = new ProgressBar.Circle(TotalQuestionsMcqsTest, {
            color: '#aaa',
            // This has to be the same size as the maximum width to
            // prevent clipping
            strokeWidth: 4,
            trailWidth: 1,
            easing: 'easeInOut',
            duration: 1400,
            text: {
                autoStyleContainer: false
            },
            from: { color: '#aaa', width: 1 },
            to: { color: '#1B99F1', width: 4 },
            // Set default step function for all animate calls
            step: function (state, circle) {
                circle.path.setAttribute('stroke', state.color);
                circle.path.setAttribute('stroke-width', state.width);

                var value = Math.round(circle.value() * 100);
                if (value === 0) {
                    circle.setText('');
                } else {
                    //  circle.setText("<label style='text-align:center; color: #8BE2F9'>" + parseInt(value * 2.2) + "</label><br><b>Question's</b>");
                }

            }
        });
        bar_TotalQuestionMcqs_test.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
        bar_TotalQuestionMcqs_test.text.style.fontSize = '2em';
        // bar_TotalQuestionMcqs_test.animate(1.0);


        var bar_TotalQuestionMcqsperc_test = new ProgressBar.Circle(cont_prog, {
            color: '#aaa',
            // This has to be the same size as the maximum width to
            // prevent clipping
            strokeWidth: 4,
            trailWidth: 1,
            easing: 'easeInOut',
            duration: 1400,
            text: {
                autoStyleContainer: false
            },
            from: { color: '#aaa', width: 1 },
            to: { color: '#efa50b', width: 4 },
            // Set default step function for all animate calls
            step: function (state, circle) {
                circle.path.setAttribute('stroke', state.color);
                circle.path.setAttribute('stroke-width', state.width);

                var value = Math.round(circle.value() * 100);
                if (value === 0) {
                    circle.setText('');
                } else {
                    //  circle.setText("<label style='text-align:center; color: rgb(234, 22, 22)'>" + parseInt(value * 2.2) + "</label><br><b>Question's</b>");
                }

            }
        });
        bar_TotalQuestionMcqsperc_test.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
        bar_TotalQuestionMcqsperc_test.text.style.fontSize = '2em';
        // bar_TotalQuestionMcqsperc_test.animate(1.0);


        var con_percentiles = new ProgressBar.Circle(con_percentile, {
            color: '#aaa',
            // This has to be the same size as the maximum width to
            // prevent clipping
            strokeWidth: 4,
            trailWidth: 1,
            easing: 'easeInOut',
            duration: 1400,
            text: {
                autoStyleContainer: false
            },
            from: { color: '#aaa', width: 1 },
            to: { color: '#7ab03f', width: 4 },
            // Set default step function for all animate calls
            step: function (state, circle) {
                circle.path.setAttribute('stroke', state.color);
                circle.path.setAttribute('stroke-width', state.width);

                var value = Math.round(circle.value() * 100);
                if (value === 0) {
                    circle.setText('');
                } else {
                    // circle.setText("<label style='text-align:center; color: rgb(234, 22, 22)'>" + parseInt(value * 2.2) + "</label><br><b>Question's</b>");
                }

            }
        });
        con_percentiles.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
        con_percentiles.text.style.fontSize = '2em';
        //con_percentiles.animate(1.0);

        var heartbar = new ProgressBar.Path('#heart-path', {
            easing: 'easeInOut',
            duration: 1400,
            from: { color: '#aaa', width: 1 },
            to: { color: '#0D83A2', width: 4 },
            text: {
                // Initial value for text.
                // Default: null
                value: '50%',

                // Class name for text element.
                // Default: 'progressbar-text'
                className: 'progressbar__label',

                // Inline CSS styles for the text element.
                // If you want to modify all CSS your self, set null to disable
                // all default styles.
                // If the style option contains values, container is automatically
                // set to position: relative. You can disable behavior this with
                // autoStyleContainer: false
                // If you specify anything in this object, none of the default styles
                // apply
                // Default: object speficied below
                style: {
                    // Text color.
                    // Default: same as stroke color (options.color)
                    color: '#04B444',
                    position: 'absolute',
                    left: '50%',
                    top: '50%',
                    padding: 0,
                    margin: 0,
                    // You can specify styles which will be browser prefixed
                    transform: {
                        prefix: true,
                        value: 'translate(-50%, -50%)'
                    }
                },
                // Only effective if the text.style is not null
                // By default position: relative is applied to container if text
                // is set. Setting this to false disables that feature.
                autoStyleContainer: true,

                // Only effective if the shape is SemiCircle.
                // If true, baseline for text is aligned with bottom of
                // the SVG canvas. If false, bottom line of SVG canvas
                // is in the center of text.
                // Default: true
                alignToBottom: true
            },

        });


        //    heartbar.setText(60);
        // Number from 0.0 to 1.0

        $('.myresult_old').click(function () {

            var percentage = 0;
            var status = '';
            var grade = '';
            var comments = "";
            if (Score == 0 || TotalScore == 0) {
                percentage = 0;
                status = "Please Practice before attempting to this test.  ";

            }
            else if (Score > TotalScore) {
                percentage = 0;
                status = "Please Test again.  ";
            }
            else {
                percentage = (Score / TotalScore) * 100
                if (percentage > 90) {
                    status = "Congratulations You PASSED this Test Successfully. ";
                    grade = 'A+';
                    comments = "Outstanding of Marks--Exceptional";


                }
                else
                    if (percentage > 80) {
                        status = "Congratulations You PASSED this Test Successfully. ";
                        grade = 'A';
                        comments = "Excellent.";


                    }
                    else
                        if (percentage > 70) {
                            status = "Congratulations You PASSED this Test Successfully. ";
                            grade = 'B';
                            comments = "Very Good.";


                        }
                        else
                            if (percentage > 60) {
                                status = "Congratulations You PASSED this Test Successfully. ";
                                grade = 'C';
                                comments = "Good";


                            }
                            else
                                if (percentage > 50) {
                                    status = "Congratulations You PASSED this Test Successfully. ";
                                    grade = 'D';
                                    comments = "Fair";


                                }
                                else
                                    if (percentage > 40) {
                                        status = "Congratulations You PASSED this Test Successfully. ";
                                        grade = 'E';
                                        comments = "Satisfactory";

                                    }

                                    else
                                        if (percentage < 40) {
                                            status = "Better Luck Next Time ";
                                            grade = 'F';
                                            comments = "Poor";


                                        }
            }
            var candName = "Your overall progress is";//$('#candidatName').text();
            //if (candName.length < 2)
            //{
            //    candName = "Candidate";
            //}+
            if (percentage > 40) {
                $('#lblresultmsg').css({ 'color': 'green' });
            }
            else {
                $('#lblresultmsg').css({ 'color': 'red' });
            }
            $('#lbloboutoffull').text(Score + '/' + TotalScore)
            $('#lblpercent').text(percentage.toFixed(0) + '%');
            $('#lblresultmsg').text(status);
            $('#lblgrade').text(grade);
            $('#lblcomment').text(comments);
            $('#lblcand').text(candName);
            // negativeScore;
            UserTestName = $("#UserTestName").val();
            ResultData(UserTestName, TotalScore, Score, percentage.toFixed(0), negativeScore, CurrentTestid);






        })
        function ResultData(UserTName, TotalScore, ObScore, percentage, negativeScore, TestId) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../default.aspx/SaveGetResult",
                data: "{'Name':'" + UserTName + "','TotScore':'" + TotalScore + "','obtainSc':'" + Score + "','Percentage':'" + percentage + "','NegativeScore':'" + negativeScore + "','TestId':'" + TestId + "'}",
                timeout: 90000, dataType: "json",
                success: function (data) {
                    var obj = data.d;
                    heartbar.set(0);
                    bar_TotalQuestionMcqs_test.set(0);
                    bar_TotalQuestionMcqsperc_test.set(0);
                    con_percentiles.set(0);
                    hide_all();
                    //   $('#bgimg').show();
                    $("#mainheader").hide();
                    $("#lblMultiTestTotalQ").text("");
                    $("#lblMultiTestObtain").text("");
                    $("#lblMultiTestPercent").text("");
                    $("#lblMultiTestPercentile").text("");
                    if (obj.length > 0) {

                        $("#MergeTestResult_New").show();

                        $("#lblMultiTestTotalQ").text(TotalScore);
                        $("#lblMultiTestObtain").text(Score);
                        $("#lblMultiTestPercent").text(percentage + "%");
                        //alert("Percentile "+data.d[0].Percentile);
                        $("#lblMultiTestPercentile").text(data.d[0].Percentile);
                        bar_TotalQuestionMcqs_test.animate(1.0);

                        bar_TotalQuestionMcqsperc_test.animate(parseFloat(percentage / 100));
                        heartbar.animate(parseFloat(percentage / 100));
                        //console.log("parseFloat(parseInt(data.d[0].Percentile) / 100) " + parseFloat(data.d[0].Percentile / 100));
                        con_percentiles.animate(parseFloat(parseInt(data.d[0].Percentile) / 100));
                    }
                },
                error: function (result) {
                    alertify.error("Error");
                }
            })
        }
        $('.myresult').click(function () {

            var percentage = 0;
            var status = '';
            var grade = '';
            var comments = "";
            var UserTestName = $("#UserTestName").val();
            if (UserTestName.trim() == "" || UserTestName == undefined) {

                alertify.error("Please Enter your name first! ");
                $("#UserTestName").focus();
            }
            else {



                if (confirm("Are you sure you want to finish the test?")) {


                    //  $("#testheader").show();
                    //$('html, body').animate({
                    //    scrollTop: $('#bgimg').offset().top
                    //}, 20);

                    if (SpecMarks > 0) {
                        TotalScore = parseInt(TotalScore) * parseInt(SpecMarks);
                    }
                    //alert("isNegativeMarks " + isNegativeMarks + " negativeScore = " + negativeScore);
                    if (isNegativeMarks > 0) {
                        Score = parseInt(Score) - negativeScore;
                    }

                    if (Score == 0 || TotalScore == 0) {
                        percentage = 0;
                        status = "Please Practice before attempting to this test.  ";
                        //$("#congrats").show();
                    }
                    else if (Score > TotalScore) {
                        percentage = 0;
                        status = "Please take test again.  ";
                    }
                    else {
                        percentage = parseInt((Score / TotalScore) * 100)
                        if (percentage > 90) {
                            status = "Congratulations You PASSED this Test Successfully. ";
                            grade = 'A+';
                            comments = "Outstanding of Marks";

                        }
                        else
                            if (percentage > 80) {
                                status = "Congratulations You PASSED this Test Successfully. ";
                                grade = 'A';
                                comments = "Excellent.";

                            }
                            else
                                if (percentage > 70) {
                                    status = "Congratulations You PASSED this Test Successfully. ";
                                    grade = 'B';
                                    comments = "Very Good.";


                                }
                                else
                                    if (percentage > 60) {
                                        status = "Congratulations You PASSED this Test Successfully. ";
                                        grade = 'C';
                                        comments = "Good";



                                    }
                                    else
                                        if (percentage > 50) {
                                            status = "Congratulations You PASSED this Test Successfully. ";
                                            grade = 'D';
                                            comments = "Fair";
                                            $("#congrats").show();

                                        }
                                        else
                                            if (percentage > 40) {
                                                status = "Congratulations You PASSED this Test Successfully. ";
                                                grade = 'E';
                                                comments = "Satisfactory";

                                            }

                                            else
                                                if (percentage < 40) {
                                                    status = "Better Luck Next Time ";
                                                    grade = 'F';
                                                    comments = "Poor";


                                                }
                        Router.navigate();
                        UserTestName = $("#UserTestName").val();
                        ResultData(UserTestName, TotalScore, Score, percentage, negativeScore, CurrentTestid);

                        if (percentage > 50) {
                            $("#congrats").show();

                        }
                        else {
                            $("#congrats").hide();

                        }
                    }
                    return false;
                }

            }

            var candName = "Your overall progress is";//$('#candidatName').text();
            //if (candName.length < 2)
            //{
            //    candName = "Candidate";
            //}+
            if (percentage > 40) {
                $('#lblresultmsg').css({ 'color': 'green' });
            }
            else {
                $('#lblresultmsg').css({ 'color': 'red' });
            }
            $('#lbloboutoffull').text(Score + '/' + TotalScore)
            $('#lblpercent').text(percentage + '%');
            $('#lblresultmsg').text(status);
            $('#lblgrade').text(grade);
            $('#lblcomment').text(comments);
            $('#lblcand').text(candName);
        })


        var toggletest = 0;
        $('.divUserPractice').click(function () {
            hide_all();
            if (toggletest == 0) {
                $('#UsersTestArea').show(1000);
                Scroll_top();
                toggletest = 1;
            }
            else {
                $('#UsersTestArea').hide();
                $('#UsersTestArea').show(1000);
                Scroll_top();
                toggletest = 1;
            }





        })

        $('#tooltip1').tooltip();
        $('#tooltip2').tooltip();
        $('#tooltip3').tooltip();
        $('#tooltip4').tooltip();
        $('#tooltip5').tooltip();
        $('body').tooltip({
            selector: '[data-toggle=tooltip]'
        });
    });
    function Scroll_top() {
        $("html, body").animate({ scrollTop: -50 }, 'slow');

    }
    function sendFile(file) {

        var formData = new FormData();
        formData.append('file', $('#f_UploadImage')[0].files[0]);
        $.ajax({
            type: 'post',
            cache: false,
            url: 'fileUploader.ashx',
            data: formData,
            success: function (status) {
                if (status != 'error') {
                    var my_path = "MediaUploader/" + status;
                    $("#myUploadedImg").attr("src", my_path);
                }
            },
            processData: false,
            contentType: false,
            error: function () {
                alert("Whoops something went wrong!");
            }
        });
    }
});