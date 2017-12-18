<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cs101.aspx.cs" Inherits="jquery1.Executeable_App.cs101" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
    <meta charset="utf-8" />
    <title>Test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Developed By Freemcqs.com" />
    <meta name="author" content="Free mcqs" />
    <meta name="keywords" content="Important Questions, Mcqs, Solved Mcqs, mcqs test, Past papers, online mcqs" />
    <link rel="icon" href="acme-free/img/faviconFinal.ico" />
    <link href="../acme-free/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../acme-free/css/alertify.core.css" rel="stylesheet" />
    <link href="../acme-free/css/alertify.default.css" rel="stylesheet" />
    <link href="../jquery.mobile.custom/jquery.mobile.custom.structure.min.css" rel="stylesheet" />
    <link href="../jquery.mobile.custom/jquery.mobile.custom.theme.min.css" rel="stylesheet" />
    <link href="../acme-free/css/style.css" rel="stylesheet" />
    <link href="../acme-free/css/style-responsive.css" rel="stylesheet" />
    <%-- <link href="../acme-free/css/reset.css" rel="stylesheet" />
    <link href="../acme-free/css/structure.css" rel="stylesheet" />--%>
    <style>
        p:first-letter {
            text-transform: capitalize;
        }

        .Practice {
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

        .lineargrad {
            /* fallback */
            background-color: #A9A9A9;
            background: url(images/linear_bg_2.png);
            background-repeat: repeat-x;
            /* Safari 4-5, Chrome 1-9 */
            background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#FFFFFF), to(rgb(77, 119, 132)));
            /* Safari 5.1, Chrome 10+ */
            background: -webkit-linear-gradient(top, ##A9A9A9, ##1a82f7);
            /* Firefox 3.6+ */
            background: -moz-linear-gradient(top, ##A9A9A9, #1a82f7);
            /* IE 10 */
            background: -ms-linear-gradient(top, #A9A9A9, #1a82f7);
            /* Opera 11.10+ */
            background: -o-linear-gradient(top, #A9A9A9, #1a82f7);
        }

        .ddlattempted {
            background: green;
            color: white;
        }

        .ddlnotattempted {
            background: #EA082A;
            color: white;
        }

    </style>
</head>
<body>

    

    <%--<iframe src="http://localhost:34128/Executeable_App/cs101.aspx" scrolling="no" style="height: 590px; border: 1px solid black; width: 80%; margin-top: 95px; margin-left: 134px; ">
</iframe>--%>


     <!--header start-->
    <header class="head-section" id="testheader">
        <div class="navbar navbar-fixed-top navbar-static-top container" style="background-color:azure;    min-height: 72px;">
            <div class="navbar-header">
                <button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse"
                    type="button">
                    <span class="icon-bar"></span><span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="default.aspx">Free<span>Mcqs</span></a>
                 <label id="lblTestName">Test Name:MCAT - Biology Past Papers.</label>
               <label style="margin-left: 20px;">Total Questions:</label>
                <label id="totq" ></label>
                <label id="totr" style="margin-left: 24px;"> Remaining:54</label> 
                <label style="margin-left:24px;">Question Status:</label>
                <select id="ddlallquiz" class=" dropdown dropdown-submenu">
                    <option value="0">Select</option>
                    <option class="ddlattempted" value="1">1</option>
                    <option class="ddlnotattempted" value="2">2</option>
                   </select>
        
                <button id="btndefaulthome" class="btn btn-danger" >Cancel Test</button>
            </div>
           
                     
                      
                  
           

              <%--  <ul class="nav navbar-nav" style="float: left;    margin-left: 53px;">
                     <li class="dropdown">
                          <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="index.html">Universities <i style="font-weight: bold;    font-size: 10px;    color: white;    background-color: rgb(72, 207, 173);">250+ Mcq's</i>
                      </a>

                      <ul class="dropdown-menu">
                          <li class="dropdown-submenu">
                              <a href="#" tabindex="-1">Virtual University</a>

                             
                                  
                                      <ul class="dropdown-menu">
                                          <li class="dropdown-submenu">
                                              <a href="#">BSC</a>
                                              <ul class="dropdown-menu">
                                                  <li class="dropdown-submenu">
                                                      <a href="#">Semester 1</a>
                                                      <ul class="dropdown-menu">
                                                          <li class="dropdown-submenu">
                                                              <a href="#">CS101-Introduction to Computer Science</a>
                                                              <ul class="dropdown-menu">
                                                                  <li >
                                                                      Lecture No.1
                                                                          <a href="#" class="btn btn-info Practice">Make Practice</a><a href="#" class="btn btn-danger divUserTest">Take Test</a>
                                                                      
                                                                  </li>
                                                                  <li >
                                                                      <a href="#">Lecture No.2</a>
                                                                  </li>
                                                                  <li >
                                                                      <a href="#">Lecture No.3</a>
                                                                  </li>
                                                                  <li >
                                                                      <a href="#">Lecture No.4</a>
                                                                  </li>
                                                              </ul>
                                                          </li>
                                                          </ul>
                                                  </li>
                                              </ul>
                                          </li>
                                    <li class="dropdown-submenu">
                                              <a href="#">MCS</a>
                                          <ul class="dropdown-menu">
                                                  <li class="dropdown-submenu">
                                                      <a href="#">Semester 1</a>
                                                      <ul class="dropdown-menu">
                                                          <li class="dropdown-submenu">
                                                              <a href="#">CS101-Introduction to Computer Science</a>
                                                              <ul class="dropdown-menu">
                                                                  <li >
                                                                      <a href="#">Lecture No.1</a>
                                                                  </li>
                                                                  <li >
                                                                      <a href="#">Lecture No.2</a>
                                                                  </li>
                                                                  <li >
                                                                      <a href="#">Lecture No.3</a>
                                                                  </li>
                                                                  <li >
                                                                      <a href="#">Lecture No.4</a>
                                                                  </li>
                                                              </ul>
                                                          </li>
                                                          </ul>
                                                  </li>
                                              </ul>
                                          </li>
                                      
                              </ul>
                          </li>
                          
                                          <li>
                                              <a href="#">COMSAT</a>
                                          </li>
                                      </ul>
                                  </li>
                    <li class="dropdown">
                          <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="index.html">MCAT <i style="font-weight: bold;    font-size: 10px;    color: white;    background-color: rgb(72, 207, 173);">250+ Mcq's</i>
                      </a>
                    </li>
                    </ul>--%>
               
               
                

<%--                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="#">Feature <i class="fa fa-angle-down"></i>
                      </a>

                      <ul class="dropdown-menu">
                          <li>
                              <a href="typography.html">Typography</a>
                          </li>

                          <li>
                              <a href="button.html">Buttons</a>
                          </li>

                          <li>
                              <a href="form.html">Form</a>
                          </li>

                          <li>
                              <a href="table.html">Table</a>
                          </li>

                          <li class="dropdown-submenu">
                              <a href="#" tabindex="-1">More options</a>

                              <ul class="dropdown-menu">
                                  <li>
                                      <a href="#" tabindex="-1">Second level</a>
                                  </li>

                                  <li class="dropdown-submenu">
                                      <a href="#">Even More..</a>

                                      <ul class="dropdown-menu">
                                          <li>
                                              <a href="#">3rd level</a>
                                          </li>

                                          <li>
                                              <a href="#">3rd level</a>
                                          </li>
                                      </ul>
                                  </li>

                                  <li>
                                      <a href="#">Second level</a>
                                  </li>

                                  <li>
                                      <a href="#">Second level</a>
                                  </li>
                              </ul>
                          </li>
                      </ul>
                  </li>

                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="#">Pages <i class="fa fa-angle-down"></i>
                      </a>

                      <ul class="dropdown-menu">
                          <li>
                              <a href="about.html">About</a>
                          </li>

                          <li>
                              <a href="404.html">404 page</a>
                          </li>

                          <li>
                              <a href="career.html">career</a>
                          </li>

                          <li>
                              <a href="login.html">Login</a>
                          </li>

                          <li>
                              <a href="registration.html">Registration</a>
                          </li>

                          <li>
                              <a href="faq.html">FAQ</a>
                          </li>

                          <li class="dropdown-submenu">
                              <a href="#" tabindex="-1">Pricing table</a>

                              <ul class="dropdown-menu">
                                  <li class="dropdown-submenu"></li>

                                  <li>
                                      <a href="price-table-one.html">Pricing table one</a>
                                  </li>

                                  <li>
                                      <a href="price-table-two.html">Pricing table two</a>
                                  </li>
                              </ul>
                          </li>

                          <li>
                              <a href="service.html">Service</a>
                          </li>

                          <li>
                              <a href="terms.html">Terms & Condition</a>
                          </li>

                          <li>
                              <a href="privacy.html">Privacy policy</a>
                          </li>
                      </ul>
                  </li>

                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="#">Portfolio <i class="fa fa-angle-down"></i>
                      </a>

                      <ul class="dropdown-menu">
                          <li>
                              <a href="portfolio-3-col.html">Portfolio 3 column</a>
                          </li>

                          <li>
                              <a href="portfolio-4-col.html">Portfolio 4 column</a>
                          </li>

                          <li>
                              <a href="portfolio-single-image.html">Portfolio Single Image</a>
                          </li>

                          <li>
                              <a href="portfolio-single-video.html">Portfolio Single Video</a>
                          </li>
                      </ul>
                  </li>

                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="#">Blog <i class="fa fa-angle-down"></i>
                      </a>

                      <ul class="dropdown-menu">
                          <li>
                              <a href="blog.html">Blog</a>
                          </li>

                          <li>
                              <a href="blog-two-col.html">Blog two column</a>
                          </li>

                          <li>
                              <a href="blog-detail.html">Blog Single Image</a>
                          </li>

                          <li>
                              <a href="blog-detail-video.html">Blog single video</a>
                          </li>
                      </ul>
                  </li>--%>
               <%-- <ul class="nav navbar-fixed-top">
                    <li>
                        <a href="General_Pages/SignUpAdmin.aspx" class=" btn-block">Create free Account to Make Your Test here</a>

                    </li>
                    <li>
                        <a href="General_Pages/SignUpAdmin.aspx">Admin Login Only</a>

                    </li>

                    <%-- <li><input class="form-control search" placeholder=" Search" type="text"></li>
                </ul>--%>
            
        </div>
    </header>
    <!--header end-->
    <div class="container">
      <%--  <div class="row" id="statusbar" >
        
              

        </div>--%>

        <div id="LoadMcqsAllQuestion" class="mcqsShow ">
            <div class="row table-responsive">

                <table id="tblLoadMcqsAllQuestion" border="1" class=" ui-responsive" style="margin-left: 2%; width: 96%; margin-top: 9%; display: none;">
                    <thead>
                        <tr>

                            <th>
                                <img class="listimg" src="../acme-free/img/list2.png" />

                            </th>
                            <th>Question and Options

                            </th>

                        </tr>
                    </thead>

                </table>

                <button id="btnShowResultdiv" class="myresult btn btn-info btn-lg" style="margin-left: 2%; display: none;">Show Result</button>
                <button id="btnPracticethistest" class="myresult btn btn-info btn-lg" style="display: none;">Practice this Test</button>
                <button id="btntestthistest" class="myresult btn btn-info btn-lg" style="margin-left: 2%; display: none;">Take Test</button>

            </div>
        </div>
    </div>
    <div id="logindiv" class="box login">
         <table border="1"  class="table table-responsive" style="    margin: 18%;margin-left: 4%;     width: 35%;     border: 1px solid #ddd; " >
            <tr class="lineargrad">
                <td ><label>Login here</label></td><td></td>
            </tr>
            <tr><td ></td><td></td></tr>
            <tr><td ><label style="margin-bottom:0px; ">Student ID</label></td><td><input id="txtCode" type="text" /></td></tr>
            <tr><td ><label style="    margin-bottom: 0px;">Exam Password</label></td><td><input id="txtPwd" type="password" /></td></tr>
            <tr><td> </td><td><input type="button" id="btnlog" style="   width: 127px;" value="Login" class="btn-lg btn-login" /></td></tr>
            <tr style="height: 25px;"><td><label id="lblerr" style="color: red;"></label></td><td></td></tr>
        </table>

        <%--<fieldset class="boxBody">
            <label>Username</label>
            <input type="text" tabindex="1" placeholder="User Name" id="txtCode" required="" />
            <label>Password</label>
            <input type="password" tabindex="2" id="txtPwd" required="" />
        </fieldset>
        <footer>
            <%--<label><input type="checkbox" tabindex="3">Keep me logged in</label>--%>
          <%--  <input type="button" id="btnlog" value="Login" tabindex="4" style="width: 56%; margin-top: -22px; height: 41px;" />
        </footer>--%>--%>


    </div>
    <div class="container">
        <div class="row">
            <div id="bgimg" style="width: 50%; margin: 0 auto; display: none; margin-top: 8%;" class="table table-responsive">
                <table border="1" class="table table-responsive" style="background-image: linear-gradient(rgba(255,255,255,0.9),rgba(255,255,255,0.9)), url(../acme-free/img/pas.jpg);">
                    <thead>
                        <tr style="text-align: center;">

                            <th>
                                <label style="margin: auto; font-size: 16px;">Result Card</label>
                            </th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <p>
                                    <label id="lblcand">Your Overall Result is</label>
                                    <label style="color: green; text-align: center; font-size: 16px;" id="lblpercent">%</label>

                                </p>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <label style="font-weight: normal;">Score:   </label>
                                <label id="lbloboutoffull"></label>
                            </td>




                        </tr>
                        <tr>

                            <td>
                                <label id="lblresultmsg" style="color: green;">Congratulations You PASSED this Test Successfully. </label>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <label style="font-weight: normal;">Grade:   </label>
                                <label id="lblgrade"></label>
                                <br />
                                <label style="font-weight: normal;">Remarks:   </label>
                                <label id="lblcomment"></label>
                            </td>
                        </tr>
                        <tr style="text-align: center;">
                            <td>
                                <button class="btn btn-info btn-lg" id="btnTestagain">Test Again</button>
                                <button class="btn btn-success btn-lg" id="btnpractiseagain">Practice this test</button></td>

                        </tr>
                    </tbody>


                    <%-- <tr><td colspan="4"><h4>Your Rank in this Test is 2nd</h4></td></tr>--%>
                </table>
                <img id="congrats" name="congrats" src="../Executeable_App/congrats.gif" style="margin-left: 27%; display: none;" />

            </div>
        </div>
    </div>
    <div class="container" id="divinst" style="display: none; margin-top: 9%;">
        <h1>Please read the following instructions carefully before attempting Quiz</h1>
        <p>
            • This quiz consists of 5 Multiple Choice Questions (MCQ’s) carrying 1 mark each.<br />
            • Read questions carefully and select the most appropriate answer for each MCQ.<br />
            • Avoid selecting two choices for one MCQ. The double options will be marked zero.<br />
            • All instructions will be considered while marking. So, be careful while attempting the quiz.
        </p>
        <br />
        <input type="button" id="canceltest" value="Cancel" />
        <input type="button" id="proceedfur" value="Take Quiz" />
    </div>

    <%--   <script src="../acme-free/js/jquery-1.8.3.min.js"></script>--%>
    <script src="../acme-free/js/jquery-1.12.0.min.js"></script>
    <script src="../acme-free/js/bootstrap.min.js"></script>
    <script src="../acme-free/js/alertify.min.js"></script>
    <script src="../acme-free/js/jquery.blockUI.js"></script>

    <script type="text/javascript">
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }
        String.prototype.unquoted = function () { return this.replace(/(^")|("$)/g, '') }
        function hide_all() {
            $('#bgimg').hide();
            $('#btnShowResultdiv').hide();
            $('#LoadMcqsAllQuestion').hide();
            $('#btntestthistest').hide();
            $('#btnPracticethistest').hide();
            $("#logindiv").hide();
            $("#divinst").hide();
            $("#statusbar").hide();
        }
       // hide_all();
        $(document).ready(function () {
            $("#logindiv").show();
             showTestdiv(1261);
            $("#txtPwd").keyup(function (event) {
                if (event.keyCode == 13) {
                    // alert('hello');
                    $("#btnlog").click();
                }
            });


            $("#btnlog").click(function () {
                var code = $("#txtCode").val().toUpperCase();
                var pwd = $("#txtPwd").val();
                var ispract = 0;
                if (code == "CS101") {
                    if (pwd == "12345") {

                        if (ispract == 1) {
                            showPractice(1261);
                        }
                        else {
                            hide_all();
                            $("#divinst").show();
                            //showTestdiv(1261);
                        }
                    }

                    else {
                        $("#lblerr").text("Not a valid Password");
                    }
                }
                else {
                    $("#lblerr").text("Not a Valid ID");

                }

            })
            $("#canceltest").click(function () {
                hide_all();
                $("#logindiv").show();

            });
            $("#proceedfur").click(function () {
                hide_all();
                showTestdiv(1261);
                // $("#logindiv").show();

            });
            // showPractice(1261);
            $.fn.randomize = function (a) { (a ? this.find(a) : this).parent().each(function () { $(this).children(a).sort(function () { return Math.random() - 0.5 }).detach().appendTo(this) }); return this };
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
            $('#btntestthistest').click(function () {

                if (CurrentTestid != undefined || CurrentTestid != 0) {

                    showTestdiv(CurrentTestid);

                }
                else {
                    alertify.error('Please Refresh the Page');
                }
            })
            $('#btnPracticethistest').click(function () {
                //  //debugger;
                if (confirm("Are you sure you want to finish the test?")) {
                    if (CurrentTestid != undefined || CurrentTestid != 0) {
                        Scroll_top();
                        showPractice(CurrentTestid);
                        // hide_all();
                        // $('#btnShowResultdiv').show(1000);
                        //  $('#LoadMcqsAllQuestion').show(1000);

                    }
                    else {
                        alertify.error('Please Refresh the Page');
                    }
                }
                return false;
            })
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

           
            var TotalScore = 0;
            function showPractice(TestId) {
                // //debugger;
                hide_all();
                // var browser = msieversion();
                // alert(browser);
                //#divMcqsQuestion
                CurrentTestid = TestId;
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "../default.aspx/LoadMcqsQuestions",
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
                        // var txt = new Array();
                        setTimeout($.unblockUI, 1000);
                        if (len > 0) {
                            $('#tbodytblLoadMcqsAllQuestion').find('tr').remove();
                            // $("#tbodytblLoadMcqsAllQuestion").remove();
                            var Srno = 1;
                            var mcq = 1;
                            var exp = "";
                            for (var i = 0; i < len; i++) {

                                txt += '<tr id="trquestion_' + Srno + '" ><td> <label>Q.No.' + parseInt(Srno++) + '</label></td><td style="background-color: #FFFFFF !important;"><b><label style="font-size: 12px; margin-left: 3px;margin-top: 9px;">' + $.trim(data.d[i].QuestionText.unquoted().replace(/\s+/g, " ").replace(/\n/g, " ")) + '</label></b></td></tr>'; //  <td>' + data.d[i].Points + '</td></tr>';
                                // alert("data.d[i].op1 = "+data.d[i].op1)
                                parseInt(mcq++);
                                exp = "";

                                if (($.trim(data.d[i].ExplanationText.unquoted().replace(/\s+/g, " ")).length > 10)) {
                                    //  alert(data.d[i].ExplanationText);
                                    exp = '<button id="explanat">How</button>';
                                    $('#explanat').click(function () {
                                        // $.growlUI('Explanation', data.d[i].ExplanationText);
                                        alert('hello');
                                    });
                                    //trquestion_
                                }
                                //  //debugger;
                                if (data.d[i].op1 == true) {
                                    // alert("txt = " + txt);
                                    if ($.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) != "") {

                                        if (data.d[i].Option1Correct == true) {


                                            txt += '<tr class="correctcls"><td><img class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall"><label class="pop" >' + $.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) + '</label>' + exp + '</td></tr>';
                                            $("#explanat").remove();
                                            exp = "";
                                        }
                                        else {
                                            txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" ><label class="pop">' + $.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                        }
                                    }


                                }
                                if (data.d[i].op2 == true) {

                                    if ($.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option2Correct == true) {
                                            txt += '<tr class="correctcls" ><td><img  class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall"><label class="pop" >' + $.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) + '</label> ' + exp + '</td></tr>';
                                            $("#explanat").remove();
                                            exp = "";
                                        }
                                        else {
                                            txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" ><label class="pop">' + $.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                        }
                                    }
                                }


                                if (data.d[i].op3 == true) {

                                    if ($.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option3Correct == true) {
                                            txt += '<tr class="correctcls"><td><img  class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall"  ><label class="pop" >' + $.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) + '</label>' + exp + '</td></tr>';
                                            $("#explanat").remove();
                                            exp = "";
                                        }
                                        else {
                                            txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" ><label class="pop">' + $.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                        }
                                    }
                                }


                                if (data.d[i].op4 == true) {

                                    if ($.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option4Correct == true) {
                                            txt += '<tr class="correctcls"><td><img class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall" ><label class="pop" >' + $.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) + '</label>' + exp + '</td></tr>';
                                            $("#explanat").remove();
                                            exp = "";
                                        }
                                        else {
                                            txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" ><label class="pop">' + $.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                        }
                                    }

                                }


                                if (data.d[i].op5 == true) {

                                    if ($.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option5Correct == true) {
                                            txt += '<tr class="correctcls"><td><img class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall"><label class="pop">' + $.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                        }
                                        else {
                                            txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" ><label class="pop">' + $.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                        }
                                        exp = "";
                                    }
                                }


                                if (data.d[i].op6 == true) {
                                    if ($.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option6Correct == true) {
                                            txt += '<tr class="correctcls"><td><img class="checkimg" src="../acme-free/img/check3.png" /></td><td class=" clscorrectop clsloadmcqsall" ><label class="pop">' + $.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                        }
                                        else {
                                            txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall"><label class="pop">' + $.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                        }
                                    }
                                }


                                if (data.d[i].op7 == true) {
                                    if ($.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option7Correct == true) {
                                            txt += '<tr class="correctcls"><td><img class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall"  ><label class="pop">' + $.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                        }
                                        else {
                                            txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall"><label class="pop">' + $.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                        }
                                    }
                                }


                                if (data.d[i].op8 == true) {
                                    if ($.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        if (data.d[i].Option8Correct == true) {
                                            txt += '<tr class="correctcls"><td><img class="checkimg" src="../acme-free/img/check3.png" /></td><td class="clscorrectop clsloadmcqsall"  ><label class="pop">' + $.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                        }
                                        else {
                                            txt += '<tr><td><img class="optionimg" src="../acme-free/img/UXRadioButton.png" /></td><td class="clsloadmcqsall" ><label class="pop">' + $.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) + '</label></td><td></td></tr>';
                                        }
                                    }


                                }
                                //  shuffle(txt);
                                // txt.sort(function () { return 0.5 - Math.random() });
                                //txt += txt.toString();
                                //   exp = '<a href="#" class="exptxt" data-toggle="tooltip" title="' + (data.d[i].ExplanationText) + '">How</a>';
                                txt += '<tr><td></td><td ><img style="width: 20%;" src="../acme-free/img/divider2.gif" /> </td></tr>';
                                $(".exptxt").removeAttr("title");
                                $(".exptxt").val('');
                                txt.length = 0;
                                //if (mcq == 50) {
                                //    break;
                                //}
                                // $("#tblLoadMcqsAllQuestion").randomize('tr td');


                            }

                            if (txt != '') {
                                $("#tbodytblLoadMcqsAllQuestion").remove();
                                $("#tblLoadMcqsAllQuestion").append('<tbody id="tbodytblLoadMcqsAllQuestion">' + txt + '</tbody>');
                                $("#tblLoadMcqsAllQuestion").show();
                                $('#btntestthistest').show();
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
            function showTestdiv(TestId) {

                hide_all();
                Score = 0;
                TotalScore = 0;
                CurrentTestid = TestId;
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
                    url: "../default.aspx/LoadMcqsQuestions",
                    data: "{'TestId':'" + TestId + "','name':'" + 2 + "'}",
                    dataType: "json",
                    timeout: (2 * 1000000),
                    success: function (data) {
                        setTimeout($.unblockUI, 1000);
                        var len = data.d.length;
                        var txt = "";
                        $("#totq").text(len);
                        TotalScore = data.d.length;
                        if (len > 0) {
                            $('#tbodytblLoadMcqsAllQuestion').find('tr').remove();
                            var Srno = 1;
                            $("#ddlallquiz").html('');
                            //$("#selectId option").remove();
                            $("#ddlallquiz").append($("<option></option>").attr("value", 0).text('Question Status'));
                            for (var i = 0; i < len; i++) {

                                $("#ddlallquiz").append($("<option></option>").attr("value", Srno).text(Srno));

                                txt += '<tr id="tr_question_' + Srno + '" ><td id="question' + data.d[i].McqsQuestionId + '"><input type="text" style="display:none;" id="' + data.d[i].McqsQuestionId + 'q" name="' + data.d[i].McqsQuestionId + 'q" value=' + Srno + ' ><label>Q.No.' + parseInt(Srno++) + '</label></td><td style="background-color: #FFFFFF !important;"><b><label style="color:black; font-size:12px;  margin-left: 3px;margin-top: 9px;">' + $.trim(data.d[i].QuestionText.unquoted().replace(/\s+/g, " ")) + '</label></b></td></tr>'; //  <td>' + data.d[i].Points + '</td></tr>';

                                if (data.d[i].op1 == true) {

                                    if ($.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<tr id="1' + data.d[i].McqsQuestionId + '"><td><input type="checkbox" class="largerCheckbox" value="1" id ="' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></td><td class="clsloadmcqsall" colspan="2"><label class="pop">' + $.trim(data.d[i].Option1Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                    }

                                }
                                if (data.d[i].op2 == true) {
                                    if ($.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<tr id="2' + data.d[i].McqsQuestionId + '"><td><input type="checkbox" class="largerCheckbox" value="2" id ="' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></td><td class="clsloadmcqsall" colspan="2"><label class="pop">' + $.trim(data.d[i].Option2Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                    }

                                }


                                if (data.d[i].op3 == true) {

                                    if ($.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<tr id="3' + data.d[i].McqsQuestionId + '"><td><input type="checkbox" class="largerCheckbox" value="3" id ="' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></td><td class="clsloadmcqsall"><label class="pop">' + $.trim(data.d[i].Option3Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                    }

                                }


                                if (data.d[i].op4 == true) {
                                    if ($.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<tr id="4' + data.d[i].McqsQuestionId + '"><td><input type="checkbox" class="largerCheckbox" value="4" id ="' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></td><td class="clsloadmcqsall"><label class="pop">' + $.trim(data.d[i].Option4Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                    }

                                }


                                if (data.d[i].op5 == true) {

                                    if ($.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<tr id="5' + data.d[i].McqsQuestionId + '"><td><input type="checkbox" class="largerCheckbox" value="5" id ="' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></td><td class="clsloadmcqsall"><label class="pop">' + $.trim(data.d[i].Option5Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                    }


                                }


                                if (data.d[i].op6 == true) {

                                    if ($.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<tr id="6' + data.d[i].McqsQuestionId + '"><td><input type="checkbox" class="largerCheckbox" value="6" id ="' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></td><td class="clsloadmcqsall"><label class="pop">' + $.trim(data.d[i].Option6Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                    }

                                }


                                if (data.d[i].op7 == true) {

                                    if ($.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<tr id="7' + data.d[i].McqsQuestionId + '" ><td><input type="checkbox" class="largerCheckbox" value="7" id ="' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></td><td class="clsloadmcqsall"><label class="pop">' + $.trim(data.d[i].Option7Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
                                    }
                                }


                                if (data.d[i].op8 == true) {

                                    if ($.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) != "") {
                                        txt += '<tr id="8' + data.d[i].McqsQuestionId + '"><td><input type="checkbox" class="largerCheckbox" value="8" id ="' + data.d[i].McqsQuestionId + '" name="' + data.d[i].McqsQuestionId + '" /></td><td class="clsloadmcqsall" ><label class="pop">' + $.trim(data.d[i].Option8Text.unquoted().replace(/\s+/g, " ")) + '</label></td></tr>';
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

                                txt += '<tr><td colspan="2" ><label hidden="hidden" value="' + correctop + '" id="' + data.d[i].McqsQuestionId + '"  name="' + data.d[i].McqsQuestionId + '" for="' + data.d[i].McqsQuestionId + '" >' + correctop + '</label></td></tr>';
                                txt += '<tr><td colspan="2" ><img style="width: 20%;" src="../acme-free/img/divider2.gif" /></td></tr>';
                            }

                            if (txt != '') {
                                $("#tbodytblLoadMcqsAllQuestion").remove();
                                $("#tblLoadMcqsAllQuestion").append('<tbody id="tbodytblLoadMcqsAllQuestion">' + txt + '</tbody>');
                                $("#tblLoadMcqsAllQuestion").show();
                                $('#LoadMcqsAllQuestion').show();
                                $('#btnPracticethistest').show();
                                $('#btnShowResultdiv').show();
                                $('#statusbar').show();
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
            $('#btnShowResultdiv').click(function () {
                if (confirm("Are you sure you want to finish the test?")) {

                    hide_all();
                    $('#bgimg').show();
                    $('html, body').animate({
                        scrollTop: $('#bgimg').offset().top
                    }, 20);
                }
                return false;


            })
            var Score = 0;
            $('#btnTestagain').click(function () {

                if (CurrentTestid != undefined || CurrentTestid != 0) {
                    // Scroll_top();
                    showTestdiv(CurrentTestid);
                }
                else {
                    alert('Please Refresh the Page');
                }
            })
            $('#btnpractiseagain').click(function () {
                if (CurrentTestid != undefined || CurrentTestid != 0) {
                    showPractice(CurrentTestid);

                }
                else {
                    alert('Please Refresh the Page');
                }
            })
            $(document).on('change', '[type=checkbox]', function (e) {
                var $chkboxname = this.name;
                var $value = $(this).$value;
                var favorite = [];
                // console.log('checkboxname' + $chkboxname + ' value ' + $value);
                $.each($("input[type=checkbox]:checked"), function () {
                    if (this.name == $chkboxname) {
                        favorite.push($(this).val());
                    }

                });
                //  //debugger;
                var trid = $(this).closest('tr').attr('id');
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
                var $response = $("label[for='" + $(this).attr('id') + "']");

                if (favorite == $response.text()) {

                    $("#" + trid).addClass('correctcls');
                    for (i = 0; i < 9; i++) {
                        $("#" + i + this.name).find("input").attr("disabled", "disabled");
                    }
                    Score++;


                }
                else {
                    $("#" + trid).addClass('inCorrectSelected');
                    $("#" + $response.text() + this.name).addClass('inCorrectcls');
                    for (i = 0; i < 9; i++) {
                        $("#" + i + this.name).find("input").attr("disabled", "disabled");
                    }
                }
            });
            $('.myresult').click(function () {

                var percentage = 0;
                var status = '';
                var grade = '';
                var comments = "";
                if (Score == 0 || TotalScore == 0) {
                    percentage = 0;
                    status = "Please Practice before attempting to this test.  ";
                    //$("#congrats").show();
                }
                else {
                    percentage = (Score / TotalScore) * 100
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
                    if (percentage > 50) {
                        $("#congrats").show();

                    }
                    else {
                        $("#congrats").hide();

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

    </script>


</body>
</html>
