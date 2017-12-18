<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myindex.aspx.cs" Inherits="jquery1.acme_free.myindex" EnableSessionState="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Developed By Freemcqs.com">
    <meta name="author" content="Free mcqs">
    <meta name="keywords" content="Important Questions, Mcqs, Solved Mcqs, mcqs test, Past papers, online mcqs">
    <link rel="icon" href="img/faviconFinal.ico" />
    <link href="css/alertify.core.css" rel="stylesheet" />
    <link href="css/alertify.default.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.11.2.min.js"></script>
    <script src="../ckeditor_5.6/ckeditor.js"></script>
    <%--<script src="../ckeditor/ckeditor.js"></script>--%>
    <link href="../lou-multi-select-e052211/css/multi-select.dev.css" rel="stylesheet" />
    <link href="../lou-multi-select-e052211/css/multi-select.dist.css" rel="stylesheet" />
    <title>FreeMcqs | Home
    </title>
    <style>
        .fuCatImg{

        }
        .imgCatimg{}
        .dt-index {
            column-width: auto !important;
        }

        .table_FirstTdWidth {
            width: 15%;
        }

        .viewMcqsReportedDetail {
        }

        .viewMcqsReportedClear {
        }

        .viewAddMcqsDetail {
        }

        .viewUserAllmcqs {
        }

        .clsloadmcqsall {
            font-size: 14px;
            color: black;
        }

        .clscorrectop {
            background-color: #94EC94 !important;
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

        .ddlMergeTestSeclist {
        }
    </style>

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

        .insertmcqs {
        }

        .divUserPractice {
        }

        .divUserTest {
        }

        .editmcqs {
        }

        .deletemcqs {
        }

        .insertShortQ {
        }

        .editShortQ {
        }

        .DeleteShortQ {
        }

        .insertLongQ {
        }

        .EditLongQ {
        }

        .DeleteLongQ {
        }

        .mcqsShow {
        }

        .ShortQShow {
        }

        .LongQShow {
        }

        .SubShow {
        }

        .TestShow {
        }

        .UserShow {
        }

        .ReportUser {
        }

        .UserSummary {
        }

        .Non_Reg_Users_Add_Mcqs {
        }

        .Non_Reg_Users_Rpt_Mcqs {
        }

        .insertSub {
        }

        .insertCat {
        }

        .insertTest {
        }

        .insertUser {
        }

        .editSub {
        }

        .editTest {
        }

        .editUser {
        }

        .DelSub {
        }

        .DelTest {
        }

        .MergeTest {
        }

        .DelUser {
        }

        .mousetrap {
        }

        .checkimg {
            margin-left: 14px;
            width: 32px;
        }

        .optionimg {
            width: 28px;
            margin-left: 14px;
        }

        .questionimg {
            width: 36px;
            margin-left: 8px;
        }

        .listimg {
            width: 20px;
            margin-left: 14px;
        }

        .pop {
            width: 1009px;
            margin-top: 14px;
            font-weight: normal;
        }

        .insertedMergeTestSec {
        }

        .insertStaff {
        }

        .StaffShow {
        }

        .editStaff {
        }

        .DellStaff {
        }

        .insertcatlink {
        }

        .showcat {
        }

        .editcat {
        }

        .delcat {
        }

        .userDashboard {
        }

        .hero-widget {
            text-align: center;
            padding-top: 20px;
            padding-bottom: 20px;
        }

            .hero-widget .icon {
                display: block;
                font-size: 96px;
                line-height: 96px;
                margin-bottom: 10px;
                text-align: center;
            }

            .hero-widget var {
                display: block;
                height: 64px;
                font-size: 64px;
                line-height: 64px;
                font-style: normal;
            }

            .hero-widget label {
                font-size: 17px;
            }

            .hero-widget .options {
                margin-top: 10px;
            }
    </style>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet">-->

    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/flexslider.css" />
    <link href="assets/bxslider/jquery.bxslider.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="assets/owlcarousel/owl.carousel.css">
    <link rel="stylesheet" href="assets/owlcarousel/owl.theme.css">

    <link href="css/superfish.css" rel="stylesheet" media="screen">
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'> -->


    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="css/component.css">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="css/parallax-slider/parallax-slider.css" />
    <script src="js/pace.min.js"></script>
    <link href="css/dataurl_minimal.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js">
    </script>
    <script src="js/respond.min.js">
    </script>
    <![endif]-->
    <% 
        string sadminid = HttpUtility.UrlDecode(Request.QueryString["adminid"]);
        string uRole = HttpUtility.UrlDecode(Request.QueryString["UserR"]);
        int role = Convert.ToInt32(Decrypt(uRole));
        int AdminId = Convert.ToInt32(Decrypt(sadminid));
    %>
</head>

<body>
    <!--header start-->
    <header class="head-section">
        <div class="navbar navbar-default navbar-static-top container">
            <div class="navbar-header">
                <button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="myindex.aspx">Free<span>Mcqs</span></a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="userDashboard">Dashboard <i class="fa fa-home"></i></a>
                        <%--<ul class="dropdown-menu">
                            <li>
                                <a href="index.html">Home Parallax</a>
                            </li>
                            <li>
                                <a href="index1.html">Home Seq-slider1</a>
                            </li>
                            <li>
                                <a href="index2.html">Home Seq-slider2</a>
                            </li>
                        </ul>--%>
                    </li>
                    <% if (role == 9 || role == 8)
                       {  %>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover="dropdown"
                            data-toggle="dropdown" href="#">Category <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">

                            <li>
                                <a href="#divAddCatlink" class="insertcatlink">Add</a>
                            </li>
                            <li>
                                <a href="#showCatlink" class="showcat">Show</a>
                            </li>
                            <li>
                                <a href="#EditCatlink" class="editcat">Edit</a>
                            </li>
                            <li>
                                <a href="#deletCatlink" class="delcat">Delete</a>
                            </li>

                        </ul>
                    </li>
                    <% } %>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover="dropdown"
                            data-toggle="dropdown" href="#">Mcqs <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#divMcqsQuestion" class="insertmcqs">Add</a>
                            </li>
                            <li>
                                <a href="#showMcqs_Questions" class="mcqsShow">Show</a>
                            </li>
                            <li>
                                <a href="#linkEditMcqs" class="editmcqs">Edit</a>
                            </li>
                            <%-- <% if(role == 9 || role == 8){
                                    %>--%>
                            <li>
                                <a href="#" class="deletemcqs">Delete</a>
                            </li>
                            <%-- <%} %>--%>
                            <!--<li class="dropdown-submenu">
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
                          </li>-->
                        </ul>
                    </li>
                    <% if (role == 9 || role == 8)
                       {
                    %>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover="dropdown"
                            data-toggle="dropdown" href="#">Short Questions <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#ShortQuestion" class="insertShortQ">Add</a>
                            </li>
                            <li>
                                <a href="#divShowShortQuestion" class="ShortQShow">Show</a>
                            </li>
                            <li>
                                <a href="#divShowShortQuestion" class="editShortQ">Edit</a>
                            </li>
                            <li>
                                <a href="#" class="DeleteShortQ">Delete</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover="dropdown"
                            data-toggle="dropdown" href="#">Long Questions <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#LongQuestion" class="insertLongQ">Add</a>
                            </li>
                            <li>
                                <a href="#divShowLongQuestion" class="LongQShow">Show</a>
                            </li>
                            <li>
                                <a href="#linkEditLongQuestion" class="EditLongQ">Edit</a>
                            </li>
                            <li>
                                <a href="#" class="DeleteLongQ">Delete</a>
                            </li>

                        </ul>
                    </li>
                    <% } %>
                    <%--<li class="dropdown">
                        <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover="dropdown" data-toggle="dropdown" href="#">Categories<i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" class="insertCat">Add</a>
                            </li>
                            <li>
                                <a href="#" class="SubShow">Show</a>
                            </li>
                            <li>
                                <a href="#" class="editSub">Edit</a>
                            </li>
                            <li>
                                <a href="#" class="DelSub">Delete</a>
                            </li>

                        </ul>
                    </li>--%>
                    <% if (role == 9 || role == 8)
                       {
                    %>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover="dropdown" data-toggle="dropdown" href="#">Subjects <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" class="insertSub">Add</a>
                            </li>
                            <li>
                                <a href="#" class="SubShow">Show</a>
                            </li>
                            <li>
                                <a href="#" class="editSub">Edit</a>
                            </li>
                            <li>
                                <a href="#" class="DelSub">Delete</a>
                            </li>

                        </ul>
                    </li>
                    <% } %>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover="dropdown" data-toggle="dropdown" href="#">Tests <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" class="insertTest">Add</a>
                            </li>
                            <li>
                                <a href="#" class="TestShow">Show</a>
                            </li>
                            <li>
                                <a href="#" class="editTest">Edit</a>
                            </li>
                            <% if (role == 9 || role == 8)
                               {
                            %>
                            <li>
                                <a href="#" class="DelTest">Delete</a>
                            </li>

                            <% }
                               if (role == 9)
                               {
                            %>
                            <li>
                                <a href="#" class="MergeTest">Merge Test</a>
                            </li>
                            <% } %>
                        </ul>
                    </li>
                    <% if (role == 9 || role == 8)
                       {
                    %>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover="dropdown" data-toggle="dropdown" href="#">Users <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" class="insertUser">Add</a>
                            </li>
                            <li>
                                <a href="#" class="UserShow">Show</a>
                            </li>
                            <li>
                                <a href="#" class="editUser">Edit</a>
                            </li>
                            <li>
                                <a href="#" class="DelUser">Delete</a>
                            </li>
                            <%   //$('input[name=Dadminid]').val();        .ReportUser{}
                           //  .UserSummary{}


                           if (role == 9)
                           { %>

                            <li>
                                <a href="#" class="UserSummary">User All Summary</a>
                            </li>
                            <li>
                                <a href="#" class="Non_Reg_Users_Add_Mcqs">Added Mcqs</a>
                            </li>
                            <li>
                                <a href="#" class="ReportUser">Reported Mcqs</a>
                            </li>


                            <% }
                                
                            %>
                        </ul>
                    </li>
                    <% } %>
                    <%   //$('input[name=Dadminid]').val();        .ReportUser{}
                        //  .UserSummary{}


                        if (role == 9 || role == 8)
                        { %>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover="dropdown" data-toggle="dropdown" href="#">Staff <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" class="insertStaff">Add</a>
                            </li>
                            <li>
                                <a href="#" class="StaffShow">Show</a>
                            </li>
                            <li>
                                <a href="#" class="editStaff">Edit</a>
                            </li>
                            <li>
                                <a href="#" class="DellStaff">Delete</a>
                            </li>




                        </ul>
                    </li>
                    <% }
                                
                    %>
                    <!--<li class="dropdown">
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
                  </li>-->
                    <li>
                        <a href="#contact.html" class="contactus">Contact</a>
                    </li>
                    <li>
                        <a href="../General_Pages/SignUpAdmin.aspx">Sign out</a>
                    </li>

                    <li>
                        <%--<input class="form-control search" placeholder=" Search" type="text">--%>
                        <a href="../default.aspx" target="_blank">Home page</a>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <!--header end-->

    <div class="container">
        <div class="row mar-b-50">

            <div id="divCommonSubTestNumb">
                <div class="form-group">
                    <div class="container flex-container">
                        <div class="row">
                            <div class="col-md-3">
                                <%-- <label id="lblSubjectName" class="control-label" for="ddlSubject"><span>Subject</span></label>--%>
                                <select id="ddlSubject" name="ddlSubject" class="select-item" runat="server"></select>
                            </div>

                            <div class="col-md-3">
                                <%-- <label id="lblTestName" class="control-label" for="ddlTest" runat="server"><span>Test</span></label>--%>
                                <select id="ddlTest" name="ddlTest" class=" "></select>
                            </div>

                            <div class="col-md-3">
                                <%--<label class="control-label" for="ddlPoints"><span>Points</span></label>--%>
                                <select id="ddlPoints" class="">
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
                            <div class="col-md-3">

                                <label style="width: 100%;">
                                    <input type="checkbox" id="chkreloadpage" value="1" />
                                    Reload on click on Save button.
                                </label>
                            </div>
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
                .myhref {
                    padding-top: 16px;
                    color: papayawhip;
                }

                a.myhref:hover {
                    background-color: black;
                }

                a.myhref:active {
                    background-color: white;
                }

                a.myhref::before {
                    background-color: darkgreen;
                }
            </style>

            <div id="divMcqsQuestion" style="display: block">

                <div class="row">
                    <div class="col-md-6">
                        <input type="button" id="btnQuestionSimpleBox" class="btn btn-xs btn-link" value="Simple Textbox" />

                        <input type="button" id="btnQuestionckeditor" class="btn btn-xs btn-link" value="Textbox With Options" />

                        <div class="focusguard hidden" id="focusguard-1" tabindex="1"></div>

                        <input tabindex="2" type="button" id="btnShowHidetxtQuestion" class="btn btn-xs btn-link" value="Show/Hide Question" />
                    </div>
                    <div class="col-md-2">
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
                        <textarea tabindex="3" name="txtQuestion" id="txtQuestion" style="width: 100%" class="mousetrap"></textarea>
                    </div>

                </div>

                <hr />
                <div class="row">

                    <div class="col-md-6">
                        <input type="button" id="btnOption1SimpleBox" class="btn btn-xs btn-link" value="Simple Textbox" />
                        <input type="button" id="btnOption1ckeditor" class="btn btn-xs btn-link" value="Textbox With Options" />
                        <input type="button" id="btnShowHidetxtOption1" class="btn btn-xs btn-link" value="Show/Hide Option 1" />
                    </div>
                    <div class="col-md-6">
                        <input type="button" id="btnOption2SimpleBox" class="btn btn-xs btn-link" value="Simple Textbox" />
                        <input type="button" id="btnOption2ckeditor" class="btn btn-xs btn-link" value="Textbox With Options" />
                        <input type="button" id="btnShowHidetxtOption2" class="btn btn-xs btn-link" value="Show/Hide Option 2" />
                    </div>


                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div id="divtxtOption1">
                            <div class="form-group">
                                <label style="width: 100%; display: inline-flex;">
                                    <div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                                        <input tabindex="4" type="checkbox" id="chkOption1" value="1" class="minimal" style="position: relative; opacity: 25;" />
                                        <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                    </div>
                                    This Option 1 is Correct!
                                </label>

                                <textarea tabindex="5" name="content" id="txtOption1" style="width: 100%" class="mousetrap"></textarea>
                            </div>
                        </div>

                    </div>
                    <div id="divtxtOption2" class="col-md-6">
                        <div class="form-group">
                            <label style="width: 100%; display: inline-flex;">
                                <div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                                    <input tabindex="6" type="checkbox" id="chkOption2" value="1" class="minimal" style="position: relative; opacity: 25;" />
                                    <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                </div>
                                This Option 2 is Correct!
                            </label>

                            <textarea tabindex="7" name="content" id="txtOption2" style="width: 100%" class="mousetrap"></textarea>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-6">
                        <input type="button" id="btnOption3SimpleBox" class="btn btn-xs btn-link" value="Simple Textbox" />
                        <input type="button" id="btnOption3ckeditor" class="btn btn-xs btn-link" value="Textbox With Options" />
                        <input type="button" id="btnShowHidetxtOption3" class="btn btn-xs btn-link" value="Show/Hide Option 3" />
                    </div>
                    <div class="col-md-6">
                        <input type="button" id="btnOption4SimpleBox" class="btn btn-xs btn-link" value="Simple Textbox" />
                        <input type="button" id="btnOption4ckeditor" class="btn btn-xs btn-link" value="Textbox With Options" />
                        <input type="button" id="btnShowHidetxtOption4" class="btn btn-xs btn-link" value="Show/Hide Option 4" />
                    </div>


                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div id="divtxtOption3">
                            <div class="form-group">
                                <label style="width: 100%; display: inline-flex;">
                                    <div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                                        <input tabindex="8" type="checkbox" id="chkOption3" value="1" class="minimal" style="position: relative; opacity: 25;" />
                                        <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                    </div>
                                    This Option 3 is Correct!
                                </label>
                                <textarea tabindex="9" name="content" id="txtOption3" style="width: 100%" class="mousetrap"></textarea>
                            </div>
                        </div>
                    </div>
                    <div id="divtxtOption4" class="col-md-6">
                        <div class="form-group">
                            <label style="width: 100%; display: inline-flex;">
                                <div class="icheckbox_minimal-blue" aria-checked="false" aria-disabled="false" style="position: relative;">
                                    <input tabindex="10" type="checkbox" id="chkOption4" value="1" class="minimal" style="position: relative; opacity: 25;" />
                                    <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                                </div>
                                This Option 4 is Correct!
                            </label>
                            <textarea tabindex="11" name="content" id="txtOption4" style="width: 100%" class="mousetrap"></textarea>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-6">
                        <input tabindex="13" type="button" id="btnSave" name="btnSave" class="btn btn-success btn-lg" value="Save" />

                        <input type="button" id="btnUpdate_mcqs" name="btnUpdate_mcqs" class="btn btn-success btn-lg" value="Update" />
                        <input type="button" id="btnMoreOptions" class="btn btn-success" value="More Options" />
                        <input type="button" id="btnReference" class="btn btn-success" value="Reference" />
                        <input type="button" id="btnExplanation" class="btn btn-success" value="Explanation" />

                    </div>
                </div>
                <div id="MoreOptions">
                    <hr />
                    <div class="row">
                        <div class="col-md-6">
                            <input type="button" id="btnOption5SimpleBox" class="btn btn-xs btn-link" value="Simple Textbox" />
                            <input type="button" id="btnOption5ckeditor" class="btn btn-xs btn-link" value="Textbox With Options" />
                            <input type="button" id="btnShowHidetxtOption5" class="btn btn-xs btn-link" value="Show/Hide Option 5" />
                        </div>
                        <div class="col-md-6 ">
                            <input type="button" id="btnOption6SimpleBox" class="btn btn-xs btn-link" value="Simple Textbox" />
                            <input type="button" id="btnOption6ckeditor" class="btn btn-xs btn-link" value="Textbox With Options" />
                            <input type="button" id="btnShowHidetxtOption6" class="btn btn-xs btn-link" value="Show/Hide Option 6" />
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
                                    <textarea name="content" id="txtOption5" style="width: 100%" class="mousetrap"></textarea>
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
                            <input type="button" id="btnOption7SimpleBox" class="btn btn-xs btn-link" value="Simple Textbox" />
                            <input type="button" id="btnOption7ckeditor" class="btn btn-xs btn-link" value="Textbox With Options" />
                            <input type="button" id="btnShowHidetxtOption7" class="btn btn-xs btn-link" value="Show/Hide Option 7" />
                        </div>
                        <div class="col-md-6 ">
                            <input type="button" id="btnOption8SimpleBox" class="btn btn-xs btn-link" value="Simple Textbox" />
                            <input type="button" id="btnOption8ckeditor" class="btn btn-xs btn-link" value="Textbox With Options" />
                            <input type="button" id="btnShowHidetxtOption8" class="btn btn-xs btn-link" value="Show/Hide Option 8" />
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
                                    <select id="ddlStaff_exp"></select>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-md-12">
                                    <textarea name="content" tabindex="12" id="txtExplanation" style="width: 100%"></textarea>
                                </div>
                                <div class="focusguard" id="focusguard-2" tabindex="14"></div>
                            </div>
                        </div>
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
            <div id="divShowShortQuestionAll">
                <table id="tblshowshortquestion">
                    <thead>
                        <tr>
                        </tr>
                    </thead>
                    <tbody id="tblshowshortquestion_tbody">
                        <tr>
                        </tr>
                    </tbody>
                </table>
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
                            <a class="btn btn-app btn-success" id="btnSaveShortQuestion" name="btnSaveShortQuestion">
                                <i class="fa fa-save"></i>Save and Next
                            </a>
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
                        <%--    <a class="btn btn-app btn-success" id="btnSaveShortQuestion" name="btnSaveShortQuestion">
                                <i class="fa fa-save"></i>Save and Next
                            </a>--%>
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
                    <input type="button" id="btnAddMoreTestSettings" value="More Settings" class="btn btn-lg" />
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

                        
                           <div class="row">
                        <div class="col-md-5">
                            <input type="file" id="fuTestImage" />
                        </div>
                        <div class="col-md-5">
                            <img id="imgTestimg" width="70" height="80" />
                        </div>
                    </div>
                    </div>
                    <input type="button" id="btnSaveNewTest" value="Add New Test" class="btn btn-lg" />
                </div>
                <div id="divEditTest">
                    <select id="ddlSubjectlistForEditTest"></select>
                    <select id="ddlTestlistForEditTest"></select>
                    <input type="text" id="txtEditTestName" placeholder="Test Name" />
                    <input type="button" id="btnEditMoreTestSettings" value="More Settings" class="btn btn-lg" />
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
                          <div class="row">
                        <div class="col-md-5">
                            <input type="file" id="fuEditTestImage" />
                        </div>
                        <div class="col-md-5">
                            <img id="imgEditTestimg" width="70" height="80" />
                        </div>
                    </div>
                       
                    </div>
                    <input type="button" id="btnSaveEditTestSettings" value="Update Test Changes" class="btn btn-lg" />
                </div>
                <div id="divDeleteTest">
                    <select id="ddlSubjectlistForDeleteTest"></select>
                    <select id="ddlTestlistForDeleteTest"></select>
                    <input type="button" id="btnDeleteTest" value="Delete Test" class="btn btn-lg" />
                </div>
                <div id="divMergeTest">
                    <input type="text" id="MergeTestName" placeholder="Test Name" class="input-lg" />
                    <input type="text" id="MergeTestTotalQ" placeholder="Total Questions" class="input-lg" />
                    <input type="text" id="MergeTestInstructions" class="" />
                    <input type="button" id="MergeTestAddSection" value="Add Section" class="btn-primary" />
                    <input type="button" id="MergeTestDelSection" value="Remove Section" class="btn-danger" />
                    <div id="diveMergeAddSection">
                    </div>
                    <select id="ddlMergeTestDifficultyLevel">
                        <option value="0">Select Test Level</option>
                        <option value="50">Easy</option>
                        <option value="60">Normal</option>
                        <option value="70">Hard</option>
                        <option value="85">Challenging</option>
                        <option value="95">Fiendish</option>
                    </select>
                    <select id="ddlSubjectlistForMergeTest" class="select-item"></select>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="IsNegativeMark" />
                            Test with Negative Marking (1 Mark deducted for each wrong Answer)
                        </label>
                    </div>

                    <label for="SpecMarks" class="form-control label-info">Special Marks for each Question</label>
                    <input type="number" id="SpecMarks" class="input-sm" aria-describedby="SpecMarks">

                    <input type="button" id="btnMergeTest" value="Merge Test" class="btn btn-lg" />
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-sm-12  wow fadeInLeft">
                                <table id="example" class="display" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>Subject Name</th>
                                            <th>Test Name</th>
                                            <th>TestId</th>
                                            <th>SubId</th>
                                            <th>Made By</th>
                                            <th>Total Mcqs</th>
                                            <th>Add Tests</th>
                                            <th>Add in Section</th>
                                            <th>Get Questions</th>



                                        </tr>
                                    </thead>

                                </table>
                            </div>
                        </div>




                    </div>
                    <%--<select id="ddlSubjectlistToMergeTest"></select>
                        <select id="ddlTestlistToMergeTest"></select>
                        <select id="ddlNewSubjectlistForMergeTest"></select>--%>
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
                    <input type="button" id="btnShowTestMcqs" value="Show Test Mcqs" class="btn btn-lg" />
                    <table id="tblShowTest"></table>
                </div>

            </div>
            <div id="divSubjectSetteings">
                <!-- <select id="ddlSubjectNameList"></select> -->
                <div>

                    <div id="divEditSubjectName">
                        <label>Category</label>
                        <select id="ddlEditCatlist"></select>
                        <label id="lblEditSubjectName">Subject Name</label>
                        <select id="ddlEditSubjectNames"></select>
                        <input type="text" id="txtEditSubjectNames" placeholder="Subject Name" />
                          <input type="text" id="txtEditNewSubjectObjective" placeholder="Subject Objective" />
                        <input type="text" id="txtEditNewSubjectTestChapters" placeholder="Subject Test Chapters" />
                        <input type="text" id="txtEditNewSubjectExplanation" placeholder="Subject Explanation" />
                        <input type="text" id="txtEditNewSubjectReferenceBooks" placeholder="Subject Ref. Books" />
                        <input type="text" id="txtEditNewSubjectCode" placeholder="Subject Code" />
                           <div class="row">
                        <div class="col-md-5">
                            <input type="file" id="fuEditSubImg" />
                        </div>
                        <div class="col-md-5">
                            <img id="imgEditSubimg" width="70" height="80" />
                        </div>
                    </div>
                        <input type="button" id="btnSaveEditSubjectName" value="Update/Save" />
                    </div>
                    <div id="divDeleteSubjectName">
                        <select id="ddlDeleteSubjectNames"></select>

                        <input type="button" id="btnDeleteSubjectWithAllrelatedMaterial" value="Delete Subject With All its Tests and Mcqs" />


                    </div>
                    <div id="divDeleteReplaceSubjectWithExistingSubject" style="display: none">
                        <select id="ddlDeleteReplaceSubjectWithExistingSubject"></select>
                        <input type="button" id="btnReplaceSubjectWithExistingSubject" value="Delete Current Subject and Merge it with other Existing Subject" />
                    </div>
                    <div id="divDeleteOnlySubjectSettings" style="display: none">
                        <select id="ddlDeleteOnlySubjectSettings"></select>
                        <input type="button" id="btnDeleteOnlySubjectSettings" value="Delete only Subject Settings" />
                    </div>
                    <div id="divAddcat">
                        <input type="text" id="txtAddNewcat" placeholder="Subject Name" />
                        <input type="button" id="btnAddcatNameOnly" value="Add New Subject" class="btn btn-lg" />
                        <input type="button" value="Advanced Settings" id="btncatAdvancedSettings" class="btn btn-lg" />
                    </div>
                    <div id="divAddMoreSubjects">
                        <label>Category</label>
                        <select id="ddlCatlist"></select>
                        <input type="text" id="txtAddNewSubjectName" placeholder="Subject Name" />
                       
                         
                        <input type="button" id="btnAddSubjectNameOnly" value="Add New Subject" class="btn btn-lg" />
                        <input type="button" value="Advanced Settings" id="btnSubjectAdvancedSettings" class="btn btn-lg" />
                    </div>
                    <div id="divSubjectAdvancedSettings">
                        <!--  <select id="ddlSubjectAdvancedSettings"></select> -->
                        <input type="text" id="txtSubjectObjective" placeholder="Subject Objective" />
                        <input type="text" id="txtSubjectTestChapters" placeholder="Sub. Chapters" />
                        <input type="text" id="txtSubjectExplanation" placeholder="Sub. Explanation" />
                        <input type="text" id="txtSubjectReferenceBooks" placeholder="Sub. References" />
                        <input type="text" id="txtSubjectCode" placeholder="Subj. Code" />
                          <div class="row">
                        <div class="col-md-5">
                            <input type="file" id="fuSubImg" />
                        </div>
                        <div class="col-md-5">
                            <img id="imgSubimg" width="70" height="80" class="imgCatimg"/>
                        </div>
                    </div>
                       
                        <input type="button" id="btnSaveSubjectAdvanceSettings" value="Save" class="btn btn-lg" />
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
            <div id="divEditUsers">
                <div id="divEditUserDropDown">
                    <select id="ddlEditUsers"></select>
                </div>
                <div id="divEditUserDetails">
                    <div class="row">
                        <div class="col-sm-12">
                            <label id="lbledituserid" style="display: none;"></label>
                        </div>
                    </div>

                </div>
                <%--    <div class="row">
                        <div class="col-sm-12">
 <input type="button" id="btnEditUserDetail" class="btn-primary" value="Update User Details" />
                        </div>
                    </div>--%>
            </div>
            <div id="divAddUser">

                <div class="form-inline">

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
                                            <input type="checkbox" id="chkUserEmailResult" />Email Result To the User.
                                        </label>
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
                                            <input type="checkbox" id="chkRandomizeQuestionsInTest" />Randmomiz Questions in Test
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 columns">
                                        <label class="checkbox-inline" for="chkEmailTestResultToAdmin">
                                            <input type="checkbox" id="chkEmailTestResultToAdmin" />Email User Test Result to Admin When a User Completing Test.
                                        </label>
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
                                                <option value="10">Data Entry Operator</option>
                                            </select>
                                        </label>
                                    </div>
                                </div>
                                <br />
                                <input type="hidden" id="hiduserselectedsub" />
                                <input type="hidden" id="hiduserselectedtest" />
                                <input type="button" class="btn  btn-link" id="btnLoadUserSub" value="Select Specific Subject for this User" />
                                <div class="row" id="divAssignedSub">
                                    <div class="col-md-12">
                                        <select id="ddlsubassigned" multiple="multiple">
                                        </select>
                                    </div>

                                </div>
                                <br />
                                <input type="button" class="btn  btn-link" id="btnLoadUserTest" value="Select Specific Test for this User" />
                                <div class="row" id="divAssignedTest">
                                    <div class="col-md-12">
                                        <select id="ddltestassigned" multiple="multiple">
                                        </select>
                                    </div>

                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-12 columns">
                                        <label class="checkbox-inline" for="chkUserSeeOtherUsersResult">
                                            <input type="checkbox" id="chkUserSeeOtherUsersResult" />User can see other User's Result of a specifice Test/Subject.
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 columns">
                                        <label class="checkbox-inline" for="chkCertificateCustomDesign">
                                            <input type="checkbox" id="chkCertificateCustomDesign" />User can customize Certificate Design/Fields.
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 columns">
                                        <label class="checkbox-inline" for="chkResultCardCustomDesign">
                                            <input type="checkbox" id="chkResultCardCustomDesign" />User can customize Result Card Design/Fields.
                                        </label>
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

                            <input type="button" id="btnAddUser" class="btn btn-lg" value="Add User" />
                        </div>
                    </div>
                </div>
            </div>
            <%--  Users Dashboard--%>
            <br />

            <div class="container" id="userDashboard" style="background-image: url(img/seq-slider/bg-clouds.png); background-color: cornflowerblue;">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="alert alert-info" role="alert">
                            <strong>MCQ's Report.</strong> This Dashboard will tell you briefly about your Progress.
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="hero-widget well well-sm">
                            <div class="icon">
                                <i class="glyphicon glyphicon-save"></i>
                            </div>
                            <div class="text">
                                <var id="lbldashboardtoday">0</var>
                                <label class="text-muted">Today</label>
                            </div>
                            <%-- <div class="options">
                    <a href="javascript:;" class="btn btn-primary btn-lg"><i class="glyphicon glyphicon-plus"></i> Add a guest</a>
                </div>--%>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="hero-widget well well-sm">
                            <div class="icon">
                                <i class="glyphicon glyphicon-star"></i>
                            </div>
                            <div class="text">
                                <var id="lbldashboardyesterday">0</var>
                                <label class="text-muted">Yesterday</label>
                            </div>
                            <%--<div class="options">
                    <a href="javascript:;" class="btn btn-default btn-lg"><i class="glyphicon glyphicon-search"></i> View traffic</a>
                </div>--%>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="hero-widget well well-sm">
                            <div class="icon">
                                <i class="glyphicon glyphicon-tags"></i>
                            </div>
                            <div class="text">
                                <var id="lbldashboardmonth">0</var>
                                <label class="text-muted">Month</label>
                            </div>
                            <%--  <div class="options">
                    <a href="javascript:;" class="btn btn-default btn-lg"><i class="glyphicon glyphicon-search"></i> View orders</a>
                </div>--%>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="hero-widget well well-sm">
                            <div class="icon">
                                <i class="glyphicon glyphicon-cog"></i>
                            </div>
                            <div class="text">
                                <var id="lbldashboard_total"></var>
                                <label class="text-muted">Total</label>
                            </div>
                            <%-- <div class="options">
                    <a href="javascript:;" class="btn btn-default btn-lg"><i class="glyphicon glyphicon-wrench"></i> Edit profile</a>
                </div>--%>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Add Staff --%>
            <div id="divAddStaff">
                <div class="form-inline">

                    <div class="row">
                        <div class="col-md-5">
                            <input type="text" id="txtStaffName" class="form-control" placeholder="Staff Name" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <input type="text" id="txtStaffQual" class="form-control" placeholder="Staff Qualification i.e MSC" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <input type="text" id="txtStaffMob" class="form-control" placeholder="Staff Mobile No" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <input type="text" id="txtStaffjoiningDate" class="form-control" placeholder="Staff Joining Date" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <input type="file" id="fuStaffImg" />
                        </div>
                        <div class="col-md-5">
                            <img id="imgStaffimg" width="70" height="80" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <button type="button" id="btnAddStaff" class="btn btn-lg">Add Staff</button>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Add Category --%>
            <div id="divAddCatNew">
                <div class="form-inline">

                    <div class="row">
                        <div class="col-md-5">
                            <input type="text" id="txtCatName" class="form-control" placeholder="Category Name" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <input type="text" id="txtCatTagline" class="form-control" placeholder="Category Tagline" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <input type="text" id="txtCatPurpose" class="form-control" placeholder="Category Purpose" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <input type="text" id="txtCatDesc" class="form-control" placeholder="Category Description" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5">
                            <input type="file" id="fuCatImg" class="fuCatImg"/>
                        </div>
                        <div class="col-md-5">
                            <img id="imgCatimg" width="70" height="80" class="imgCatimg"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <button type="button" id="btnAddCatt" class="btn btn-lg">Add Category</button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="LoadMcqsAllQuestion" class="mcqsShow">
                <div class="container">
                    <div class="row">
                        <table id="tblLoadMcqsAllQuestion" border="0">
                            <thead>
                                <tr>

                                    <th>
                                        <img class="listimg" src="../acme-free/img/Lists.png" /></th>
                                    <th>Question and Options</th>

                                </tr>
                            </thead>
                            <tbody id="tbodytblLoadMcqsAllQuestion">
                        </table>
                    </div>
                </div>
            </div>
            <div id="divcontactus">
                <div class="container">


                    <div class="row">
                        <div class="col-lg-5 col-sm-5 address">
                            <section class="contact-infos">
                                <h4 class="title custom-font text-black">ADDRESS
                                </h4>
                                <address>
                                    Pakistan
                                    G.T. Road Rahwali Mohallah Amrat Pura Near To met Nauman Karachi Wala,
                                    <br>
                                    Gujranwala,Punjab , Pakistan
                                </address>
                            </section>
                            <section class="contact-infos">
                                <h4 class="title custom-font text-black">BUSINESS HOURS
                                </h4>
                                <p>
                                    Monday - Friday 4pm to 8pm
                                    <br>
                                    Saturday - 7am to 6pm
                                    <br>
                                    Sunday- Closed
                                    <br>
                                </p>
                            </section>
                            <section class="contact-infos">
                                <h4>TELEPHONE
                                </h4>
                                <p>
                                    <i class="icon-phone"></i>
                                    092-3456218851
                                </p>
                            </section>
                        </div>
                        <div class="col-lg-7 col-sm-7 address">
                            <h4>Drop us a line so that we can hear from you
                            </h4>
                            <div class="contact-form">
                                <form role="form">
                                    <div class="form-group">
                                        <label for="name">
                                            Name
                                        </label>
                                        <input type="text" placeholder="" id="contactname" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="email">
                                            Email
                                        </label>
                                        <input type="text" placeholder="" id="contactemail" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">
                                            Phone
                                        </label>
                                        <input type="text" id="contactphone" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">
                                            Message
                                        </label>
                                        <textarea placeholder="" id="contactmessage" rows="5" class="form-control"></textarea>
                                    </div>
                                    <button class="btn btn-info" type="button" id="btncontact">
                                        Submit
                                    </button>
                                </form>
                                <div class="col-lg-7">
                                    <label id="contactusStatus" style="width: 100%;"></label>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>



            <div id="divEditStaff">
                <div id="divEditStaffDropDown">
                    <select id="ddlEditStaff"></select>
                </div>
                <div id="divEditStaffDetails">
                    <div class="row">
                        <div class="col-sm-12">
                            <label id="lbleditStaffid" style="display: none;"></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-1">
                            <label>Staff Name:</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtEditStaffName" />
                        </div>
                        <div class="col-sm-1">
                            <label>Staff Qualification:</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtEditStaffQual" />
                        </div>
                        <div class="col-sm-1">
                            <label>Staff Mobile No:</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtEditStaffMob" />
                        </div>


                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <input type="button" id="btnEditStaffDetail" class="btn-primary" value="Update Staff Details" />
                        </div>
                    </div>
                </div>
            </div>
            <div id="divEditCat">
                <div id="divEditCatDropDown">
                    <select id="ddlEditCat"></select>
                </div>
                <div id="divEditCatDetails">
                    <div class="row">
                        <div class="col-sm-12">
                            <label id="lbleditCatid" style="display: none;"></label>
                        </div>
                    </div>
                    <div class="row">
                        
                        <div class="col-sm-3">
                            <input type="text" id="txtEditCatName" placeholder="Category Name:" />
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtEditCatTagline" placeholder="Category Tagline:" />
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtEditCatPurpose" placeholder="Category Purpose:" />
                        </div>
                      
                        <div class="col-sm-3">
                            <input type="text" id="txtEditCatDes" placeholder="Category Description" />
                        </div>


                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            Category Image
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                <input type="file" id="fuCatEditImg" class="fuCatImg" />
                            </div>
                            <div class="col-md-5">
                                <img id="imgCatEditimg" width="70" height="80" class="imgCatimg"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <input type="button" id="btnEditCat" class="btn-primary" value="Update Category Details" />
                        </div>
                    </div>
                </div>
            </div>
            <div id="divDeleteUsers">
                <select id="ddlDeleteUsers"></select>
                <div id="divDeleteUserDetails">
                    <div class="row">
                        <div class="col-sm-12">
                            <label id="lblDeleteuserid" style="display: none;"></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-1">
                            <label>User Name:</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtDeleteUserName" readonly="readonly" style="background-color: red; color: white;" />
                        </div>
                        <div class="col-sm-1">
                            <label>User Email:</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtDeleteUserEmail" readonly="readonly" style="background-color: red; color: white;" />
                        </div>
                        <div class="col-sm-1">
                            <label>User Password:</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtDeleteUserpwd" readonly="readonly" style="background-color: red; color: white;" />
                        </div>


                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <input type="button" id="btnDeleteUser" class="btn-danger" value="Delete User" />
                        </div>
                    </div>
                </div>

            </div>
            <div id="divDeleteStaff">
                <select id="ddlDeleteStaff"></select>
                <div id="divDeleteStaffDetails">
                    <div class="row">
                        <div class="col-sm-12">
                            <label id="lblDeleteStaffid" style="display: none;"></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-1">
                            <label>Staff Name:</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtDeleteStaffName" readonly="readonly" style="background-color: red; color: white;" />
                        </div>
                        <div class="col-sm-1">
                            <label>Staff Qualification:</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtDeleteStaffQual" readonly="readonly" style="background-color: red; color: white;" />
                        </div>
                        <div class="col-sm-1">
                            <label>Staff Mobile No:</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtDeleteMob" readonly="readonly" style="background-color: red; color: white;" />
                        </div>


                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <input type="button" id="btnDeleteStaff" class="btn-danger" value="Delete User" />
                        </div>
                    </div>
                </div>

            </div>
            <div id="divDeleteCat">
                <select id="ddlDeleteCat"></select>
                <div id="divDeleteCatDetails">
                    <div class="row">
                        <div class="col-sm-12">
                            <label id="lblDeleteCatid" style="display: none;"></label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-1">
                            <label>Category Name:</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtDeleteCatName" readonly="readonly" style="background-color: red; color: white;" />
                        </div>
                        <div class="col-sm-1">
                            <label>Category Description:</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtDeleteCatDes" readonly="readonly" style="background-color: red; color: white;" />
                        </div>
                        <div class="col-sm-1">
                            <label>Category Purpose</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" id="txtDeleteCatPurpose" readonly="readonly" style="background-color: red; color: white;" />
                        </div>


                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <input type="button" id="btnDeleteCat" class="btn-danger" value="Delete Category" />
                        </div>
                    </div>
                </div>

            </div>
            <div id="divMcqsAddNonRegUser">
                <table id="tblShowMcqsAddNonRegUser" class="display">
                    <thead>
                        <tr>
                            <th width="1%">S# No.</th>
                            <th>McqsId</th>
                            <th>CatId</th>
                            <th>TestId</th>
                            <th>SubId</th>
                            <th>CatName</th>
                            <th>SubjectName</th>
                            <th>TestName</th>
                            <th>Inserted Date</th>
                            <th>View</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

            </div>
            <div id="divAddedUserTable">
                <table id="tblShowUsers" class="table table-hover">
                    <thead>
                        <tr>
                            <th>S# No.</th>
                            <th>AdminId</th>
                            <th>UserRoleId</th>
                            <th>Pic</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Sub Users </th>
                            <th>Role </th>
                            <th>Mcqs Feeded</th>
                            <th>Detail</th>
                            <th>Report Mcqs Id</th>

                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

            </div>
            <div id="divAddedStaffTable">
                <table id="tblStaff" class="table table-hover">
                    <thead>
                        <tr>
                            <th>S# No.</th>
                            <th>Name</th>
                            <th>Qualification</th>
                            <th>Mobile No.</th>
                            <th>Total Mcq's</th>
                            <th>Total Explanation's</th>
                            <th>Status</th>
                            <th>Joining Date </th>



                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

            </div>
            <div id="divAddedCatTable">
                <table id="tblCat" class="table table-hover">
                    <thead>
                        <tr>
                            <th>S# No.</th>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Total Subjects</th>
                            <th>Total Tests</th>
                            <th>Total Mcqs</th>
                            <th >Status</th>


                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                          <th></th>
                            <th></th>
                            <th>Overall Total</th>
                            <th>Total Subjects</th>
                            <th>Total Tests</th>
                            <th>Total Mcqs</th>
                            <th></th>
                           
                        </tr>
                    </tfoot>
                    <tbody>
                    </tbody>
                </table>

            </div>
            <div id="divReportUser">
                <table id="tblReportUser" class="display">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Subject Name</th>
                            <th>Test Name</th>
                            <th>Mcqs Question</th>
                            <th>Option Text
                            </th>
                            <th>Report Type
                            </th>
                            <th>Reported Date
                            </th>
                            <th>Detail</th>
                            <th>Reported By 
                            </th>

                            <th>Reporter Email Address
                            </th>
                            <th>UserId</th>
                            <th>McqsId</th>
                            <th>SubId</th>
                            <th>TestId</th>
                            <th>Action taken</th>



                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>


            </div>
            <div id="loading">
                <p>
                    <img src="img/loading.gif" />
                    Please Wait
                </p>
            </div>
            <%--   <div id="divUser">
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
                </div>--%>
            <script>
                // var SaveStatus = 0;

                //CKEDITOR.replace('txtShortQuestion');
                //CKEDITOR.replace('txtShortAnswer');
                //CKEDITOR.replace('txtLongQuestion');
                //CKEDITOR.replace('txtLongAnswer');
                //CKEDITOR.replace('txtReference');
                //CKEDITOR.replace('txtExplanation');
                //CKEDITOR.replace('txtUserTermsAndConditions');
            </script>
            <!--<div class="feature-box">
          <div class="col-md-4 col-sm-4 text-center wow fadeInUp">
            <div class="feature-box-heading">
              <em>
              <img src="img/1.png" alt="" width="100" height="100">

              </em>
              <h4>
                <b>Multipurpose Template</b>
              </h4>
            </div>
            <p class="text-center">
              Lorem ipsum dolor sit amet, dolore eiusmod quis tempor incididunt ut et dolore Ut veniam unde nostrudlaboris.
            </p>
          </div>
          <div class="col-md-4 col-sm-4 text-center wow fadeInUp">
            <div class="feature-box-heading">
              <em>
                <img src="img/2.png" alt="" width="100" height="100">
              </em>
              <h4>
                <b>Well Documented</b>
              </h4>
            </div>
            <p class="text-center">
              Lorem ipsum dolor sit amet, dolore eiusmod quis tempor incididunt ut et dolore Ut veniam unde nostrudlaboris.
            </p>
          </div>
          <div class="col-md-4 col-sm-4 text-center wow fadeInUp">
            <div class="feature-box-heading">
              <em>
                <img src="img/3.png" alt="" width="100" height="100">
              </em>
              <h4>
                <b>Responsive Design</b>
              </h4>
            </div>
            <p class="text-center">
              Lorem ipsum dolor sit amet, dolore eiusmod quis tempor incididunt ut et dolore Ut veniam unde nostrudlaboris.
            </p>
          </div>
        </div>-->
            <!--feature end-->
        </div>
    </div>
    </div>


    <!--property start-->
    <%--  <div class="property gray-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-sm-6 text-center wow fadeInLeft">
                    <img src="img/tab1.png" alt="">
                </div>
                <div class="col-lg-6 col-sm-6 wow fadeInRight">
                    <h1>Your Progress
                    </h1>
                    <hr>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Serial No.
                                </th>
                                <th>Title
                                </th>
                                <th>Total
                                </th>
                                <th>Status
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1
                                </td>
                                <td>Mcqs
                                </td>
                                <td>
                                    <label id="totalmcqs"></label>
                                </td>
                                <td><i class="fa fa-check fa-lg pr-10"></i>
                                </td>
                            </tr>
                            <tr>
                                <td>2
                                </td>
                                <td>Short Questions
                                </td>
                                <td>
                                    <label id="totalshq"></label>
                                </td>
                                <td><i class="fa fa-check fa-lg pr-10"></i>
                                </td>
                            </tr>
                            <tr>
                                <td>3
                                </td>
                                <td>Long Questions
                                </td>
                                <td>
                                    <label id="totallong"></label>
                                </td>
                                <td><i class="fa fa-check fa-lg pr-10"></i>
                                </td>
                            </tr>
                            <tr>
                                <td>4
                                </td>
                                <td>Subjects
                                </td>
                                <td>
                                    <label id="totalSub"></label>
                                </td>
                                <td><i class="fa fa-check fa-lg pr-10"></i>
                                </td>
                            </tr>
                            <tr>
                                <td>5
                                </td>
                                <td>Tests
                                </td>
                                <td>
                                    <label id="totaltest"></label>
                                </td>
                                <td><i class="fa fa-check fa-lg pr-10"></i>
                                </td>
                            </tr>
                            <tr>
                                <td>6
                                </td>
                                <td>User's
                                </td>
                                <td>
                                    <label id="totalusers"></label>
                                </td>
                                <td><i class="fa fa-check fa-lg pr-10"></i>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <%--    <p>
              <i class="fa fa-check fa-lg pr-10">
              </i>
              Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ablic jiener. natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ablic jiener. natus error sit voluptatem accusantiu.
            </p>
            <p>
              <i class="fa fa-check fa-lg pr-10">
              </i>
              Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ablic jiener. natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ablic jiener. natus error sit voluptatem accusantiu.
            </p>
            <p>
              <i class="fa fa-check fa-lg pr-10">
              </i>
              Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ablic jiener.
            </p>
            <hr>
            <a href="javascript:;" class="btn btn-purchase">
              Purchase now
            </a>--%>
    <%--</div>
            </div>
        </div>
    </div>--%>
    <!--property end-->

    <%-- <div class="container">--%>
    <%-- <div class="row col-lg-12 col-sm-12">
            <div class="divUserTest divUserPractice" id="UsersTestArea">
                <div id="Information" style="background-color: beige; width: 100%;">
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
    <%--</tr>
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
                                </td>--%>
    <%--  <td><label>Current Date Time</label></td>
                        <td><label>Monday 19-Oct-2015 at 7:56 PM</label></td>--%>
    <%-- </tr>
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

                </div>--%>
    <%--   <div>
                    <table>
                        <tr>
                            <td colspan="2">
                                <label>I am a Question ?</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" />
                            </td>
                            <td>
                                <label>Choice one</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" />
                            </td>
                            <td>
                                <label>Choice one</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" />
                            </td>
                            <td>
                                <label>Choice one</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" />
                            </td>
                            <td>
                                <label>Choice one</label>
                            </td>
                        </tr>
                    </table>
                </div>

                <div id="Questions" style="background-color: aliceblue">
                    <%-- <label class="question">Question</label>--%>
    <%-- <label id="questionText" class="lblQuest">What is the meaning of LMS ?</label>--%>
    <%--  </div>
                <div id="Description" style="background-color: aliceblue">
                    <label>Please Choose Correct Options</label>

                </div>--%>
    <%--<div id="Answers" style="background-color: aquamarine">--%>
    <%--  <label>Answers</label>
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


                </div>--%>
    <%--</div>
        </div>
    </div>--%>
    <%-- <div class="container">

        <div class="row mar-b-60">
            <div class="col-lg-6">
                <!--tab start-->
                <section class="tab wow fadeInLeft">
                    <header class="panel-heading tab-bg-dark-navy-blue">
                        <ul class="nav nav-tabs nav-justified ">
                            <li class="active">
                                <a data-toggle="tab" href="#news">News
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#events">Events
                                </a>
                            </li>
                            <li class="">
                                <a data-toggle="tab" href="#notice-board">Notice board
                                </a>
                            </li>
                        </ul>
                    </header>
                    <div class="panel-body">
                        <div class="tab-content tasi-tab">
                            <div id="news" class="tab-pane fade in active">
                                <article class="media">
                                    <a class="pull-left thumb p-thumb">
                                        <img src="img/product1.jpg" alt="">
                                    </a>
                                    <div class="media-body b-btm">
                                        <a href="#" class=" p-head">News Tittle goes here
                                        </a>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                        </p>
                                    </div>
                                </article>
                                <article class="media">
                                    <a class="pull-left thumb p-thumb">
                                        <img src="img/product2.jpg" alt="">
                                    </a>
                                    <div class="media-body b-btm">
                                        <a href="#" class=" p-head">News Tittle goes here 2
                                        </a>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. simsut dorlor
                                        </p>
                                    </div>
                                </article>
                                <article class="media">
                                    <a class="pull-left thumb p-thumb">
                                        <img src="img/product1.jpg" alt="">
                                    </a>
                                    <div class="media-body b-btm">
                                        <a href="#" class=" p-head">News Tittle goes here 3
                                        </a>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. sumon ahmed
                                        </p>
                                    </div>
                                </article>
                            </div>
                            <div id="events" class="tab-pane fade">
                                <article class="media">
                                    <a class="pull-left thumb p-thumb">
                                        <!--image goes here-->
                                    </a>
                                    <div class="media-body b-btm">
                                        <a href="#" class="cmt-head">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                        </a>
                                        <p>

                                            <i class="fa fa-time"></i>
                                            1 hours ago
                                        </p>
                                    </div>
                                </article>
                                <article class="media">
                                    <a class="pull-left thumb p-thumb">
                                        <!--image goes here-->
                                    </a>
                                    <div class="media-body b-btm">
                                        <a href="#" class="cmt-head">Nulla vel metus scelerisque ante sollicitudin commodo
                                        </a>
                                        <p>

                                            <i class="fa fa-time"></i>
                                            23 mins ago
                                        </p>
                                    </div>
                                </article>
                                <article class="media">
                                    <a class="pull-left thumb p-thumb">
                                        <!--image goes here-->
                                    </a>
                                    <div class="media-body b-btm">
                                        <a href="#" class="cmt-head">Donec lacinia congue felis in faucibus.
                                        </a>
                                        <p>

                                            <i class="fa fa-time"></i>
                                            15 mins ago
                                        </p>
                                    </div>
                                </article>
                            </div>
                            <div id="notice-board" class="tab-pane fade">
                                <p>
                                    Notice board goes here Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ablic jiener.
                                </p>
                                <p>
                                    Notice board goes here Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ablic jiener.
                                </p>
                            </div>
                        </div>
                    </div>
                </section>
                <!--tab end-->
            </div>
            <div class="col-lg-6">
                <!--testimonial start-->
                <div class="about-testimonial boxed-style about-flexslider ">
                    <section class="slider wow fadeInRight">
                        <div class="flexslider">
                            <ul class="slides about-flex-slides">
                                <li>
                                    <div class="about-testimonial-image ">
                                        
                                    </div>
                                    <a class="about-testimonial-author" href="#">Russel Reagan
                                    </a>
                                    <span class="about-testimonial-company">CCD Realestate
                                    </span>
                                    <div class="about-testimonial-content">
                                        <p class="about-testimonial-quote">
                                            Donec ut purus sed tortor malesuada venenatis eget eget lorem. Nullam tempor lectus a ligula lobortis pretium. Donec ut purus sed tortor malesuada venenatis eget eget lorem.
                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="about-testimonial-image ">
                                       
                                    </div>
                                    <a class="about-testimonial-author" href="#">Steven gerrard
                                    </a>
                                    <span class="about-testimonial-company">Molt BVG
                                    </span>
                                    <div class="about-testimonial-content">
                                        <p class="about-testimonial-quote">
                                            Pellentesque et pulvinar enim. Quisque at tempor ligula. Maecenas augue ante, euismod vitae egestas sit amet, accumsan eu nulla. Nullam tempor lectus a ligula lobortis pretium. Donec ut purus sed tortor malesuada venenatis eget eget lorem.
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </section>
                </div>
                <!--testimonial end-->
            </div>
        </div>
    </div>


    <!--recent work start-->
    <div class="bg-lg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 recent">
                    <h3 class="recent-work">Recent Work
                    </h3>
                    <p>Some of our work we have done earlier</p>
                    <div id="owl-demo" class="owl-carousel owl-theme wow fadeIn">

                        <div class="item view view-tenth">
                            <img src="img/works/img8.jpg" alt="work Image">
                            <div class="mask">
                                <a href="blog-detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
                                    <i class="fa fa-link"></i>
                                </a>
                            </div>
                        </div>
                        <div class="item view view-tenth">
                            <img src="img/works/img9.jpg" alt="work Image">
                            <div class="mask">
                                <a href="blog-detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
                                    <i class="fa fa-link"></i>
                                </a>
                            </div>
                        </div>
                        <div class="item view view-tenth">
                            <img src="img/works/img10.jpg" alt="work Image">
                            <div class="mask">
                                <a href="blog-detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
                                    <i class="fa fa-link"></i>
                                </a>
                            </div>
                        </div>
                        <div class="item view view-tenth">
                            <img src="img/works/img11.jpg" alt="work Image">
                            <div class="mask">
                                <a href="blog-detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
                                    <i class="fa fa-link"></i>
                                </a>
                            </div>
                        </div>
                        <div class="item view view-tenth">
                            <img src="img/works/img12.jpg" alt="work Image">
                            <div class="mask">
                                <a href="blog-detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
                                    <i class="fa fa-link"></i>
                                </a>
                            </div>
                        </div>
                        <div class="item view view-tenth">
                            <img src="img/works/img13.jpg" alt="work Image">
                            <div class="mask">
                                <a href="blog-detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
                                    <i class="fa fa-link"></i>
                                </a>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
        <!--recent work end-->
    </div>



    <div id="home-services">

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>In case you need any help
                    </h2>
                </div>

                <div class="col-md-4">
                    <div class="h-service">
                        <div class="icon-wrap ico-bg round-fifty wow fadeInDown">
                            <i class="fa fa-question"></i>
                        </div>
                        <div class="h-service-content wow fadeInUp">
                            <h3>PRESALE QUESTION
                            </h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                  tempor incididunt ut labore et dolore magna aliqua. Ut enim  laborum.
                  <br>
                                <a href="#">Learn more
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="h-service">
                        <div class="icon-wrap ico-bg round-fifty wow fadeInDown">
                            <i class="fa fa-h-square"></i>
                        </div>
                        <div class="h-service-content wow fadeInUp">
                            <h3>NEED SUPPORT?
                            </h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                  tempor incididunt ut labore et dolore magna aliqua. Ut enim  laborum.
                  <br>
                                <a href="#">Learn more
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="h-service">
                        <div class="icon-wrap ico-bg round-fifty wow fadeInDown">
                            <i class="fa fa-users"></i>
                        </div>
                        <div class="h-service-content wow fadeInUp">
                            <h3>CHECK FORUM
                            </h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                  tempor incididunt ut labore et dolore magna aliqua. Ut enim  laborum.
                  <br>
                                <a href="#">Learn more
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /row -->

        </div>
        <!-- /container -->

    </div>
    <!-- service end -->
    <div class="hr">
        <span class="hr-inner"></span>
    </div>

    <div class="container">
        <div class="row mar-b-50 our-clients">
            <div class="col-md-3">
                <h2>Our Clients
                </h2>
                <p>
                    Lorem dipsum folor margade sitede lametep eiusmod psumquis dolore.Margade sitede lametep eiusmod.
            lametep eiusmod psumquis dolore.
                </p>
            </div>
            <div class="col-md-9">
                <div class="outside">
                    <p>
                        <span id="slider-prev"></span>
                        |
              <span id="slider-next"></span>
                    </p>
                </div>

                <ul class="bxslider1 clients-list">
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />

                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />

                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />

                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />

                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />

                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />

                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />

                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>

                </ul>


            </div>
        </div>
        <!-- END CLIENTS -->
    </div>--%>




    <!--container end-->

    <!--footer start-->



    <footer class="footer">

        <input type="hidden" name="Dadminid" value="<%=hidden1%>" />
        <input type="hidden" name="Dadminuserrole" value="<%=userrole%>" />

        <link href="../bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
        <link href="../Styles/CustomStyles.css" rel="stylesheet" />
        <script src="../Scripts/datetimepicker-master/jquery.datetimepicker.js"></script>
        <link href="../Scripts/datetimepicker-master/jquery.datetimepicker.css" rel="stylesheet" />
        <script src="../Scripts/MouseTrap.js"></script>
        <link href="../DataTables_1/datatables.min.css" rel="stylesheet" />
        <script src="../DataTables_1/datatables.min.js"></script>
        <script src="js/Allfun.js"></script>


        <script type="text/javascript" src="js/parallax-slider/modernizr.custom.28468.js">
        </script>
        <%--   <div class="container">
            <div class="row">
                <div class="col-lg-3 col-sm-3 address wow fadeInUp" data-wow-duration="2s" data-wow-delay=".1s">
                    <h1>contact info
                    </h1>
                    <address>
                        <p><i class="fa fa-home pr-10"></i>Address: No.XXXXXX street</p>
                        <p><i class="fa fa-globe pr-10"></i>Mars city, Country </p>
                        <p><i class="fa fa-mobile pr-10"></i>Mobile : (123) 456-7890 </p>
                        <p><i class="fa fa-phone pr-10"></i>Phone : (123) 456-7890 </p>
                        <p><i class="fa fa-envelope pr-10"></i>Email :   <a href="javascript:;">support@example.com</a></p>
                    </address>
                </div>
                <div class="col-lg-3 col-sm-3 wow fadeInUp" data-wow-duration="2s" data-wow-delay=".3s">
                    <h1>latest tweet</h1>
                    <div class="tweet-box">
                        <i class="fa fa-twitter"></i>
                        <em>Please follow
                  <a href="javascript:;">@example</a>
                            for all future updates of us!
                  <a href="javascript:;">twitter.com/acme</a>
                        </em>
                    </div>
                    <div class="tweet-box">
                        <i class="fa fa-twitter"></i>
                        <em>Please follow
                  <a href="javascript:;">@example</a>
                            for all future updates of us!
                  <a href="javascript:;">twitter.com/acme</a>
                        </em>
                    </div>
                    <div class="tweet-box">
                        <i class="fa fa-twitter"></i>
                        <em>Please follow
                  <a href="javascript:;">@example</a>
                            for all future updates of us!
                  <a href="javascript:;">twitter.com/acme</a>
                        </em>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-3">
                    <div class="page-footer wow fadeInUp" data-wow-duration="2s" data-wow-delay=".5s">
                        <h1>Our Company
                        </h1>
                        <ul class="page-footer-list">
                            <li>
                                <i class="fa fa-angle-right"></i>
                                <a href="about.html">About Us</a>
                            </li>
                            <li>
                                <i class="fa fa-angle-right"></i>
                                <a href="faq.html">Support</a>
                            </li>
                            <li>
                                <i class="fa fa-angle-right"></i>
                                <a href="service.html">Service</a>
                            </li>
                            <li>
                                <i class="fa fa-angle-right"></i>
                                <a href="privacy-policy.html">Privacy Policy</a>
                            </li>
                            <li>
                                <i class="fa fa-angle-right"></i>
                                <a href="career.html">We are Hiring</a>
                            </li>
                            <li>
                                <i class="fa fa-angle-right"></i>
                                <a href="terms.html">Term & condition</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-3">
                    <div class="text-footer wow fadeInUp" data-wow-duration="2s" data-wow-delay=".7s">
                        <h1>Text Widget
                        </h1>
                        <p>
                            This is a text widget.Lorem ipsum dolor sit amet.
                This is a text widget.Lorem ipsum dolor sit amet.
                        </p>
                    </div>
                </div>
            </div>
        </div>--%>
    </footer>
    <!-- footer end -->
    <!--small footer start -->
    <%--   <footer class="footer-small">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-sm-6 pull-right">
                    <ul class="social-link-footer list-unstyled">
                        <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".1s"><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".2s"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".3s"><a href="#"><i class="fa fa-dribbble"></i></a></li>
                        <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".4s"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".5s"><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".6s"><a href="#"><i class="fa fa-skype"></i></a></li>
                        <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".7s"><a href="#"><i class="fa fa-github"></i></a></li>
                        <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".8s"><a href="#"><i class="fa fa-youtube"></i></a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <div class="copyright">
                        <p>&copy; Copyright - Acme Theme by cosmic.</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>--%>
    <!--small footer end-->

    <!-- js placed at the end of the document so the pages load faster
<script src="js/jquery.js">
</script>
-->
    <%-- <script src="js/jquery-1.8.3.min.js"></script>--%>
    <script src="js/jquery-1.12.0.min.js"></script>

    <script src="js/bootstrap.min.js">
    </script>
    <script type="text/javascript" src="js/hover-dropdown.js">
    </script>
    <script defer src="js/jquery.flexslider.js">
    </script>
    <script type="text/javascript" src="assets/bxslider/jquery.bxslider.js">
    </script>

    <script type="text/javascript" src="js/jquery.parallax-1.1.3.js">
    </script>
    <script src="js/wow.min.js">
    </script>
    <script src="assets/owlcarousel/owl.carousel.js">
    </script>

    <script src="js/jquery.easing.min.js">
    </script>
    <script src="js/link-hover.js">
    </script>
    <script src="js/superfish.js">
    </script>
    <link href="../Scripts/datetimepicker-master/jquery.datetimepicker.css" rel="stylesheet" />
    <script src="../Scripts/datetimepicker-master/jquery.datetimepicker.js"></script>
    <script src="../bootstrap-3.3.5-dist/js/bootstrapNew.js"></script>
    <link href="../bootstrap-3.3.5-dist/css/bootstrapNew.css" rel="stylesheet" />
    <script type="text/javascript" src="js/parallax-slider/jquery.cslider.js">

    </script>
    <script src="js/alertify.min.js"></script>
    <script type="text/javascript">
        //$(function () {

        //    $('#da-slider').cslider({
        //        autoplay: true,
        //        bgincrement: 100
        //    });

        //});
    </script>
    <script src="../lou-multi-select-e052211/js/jquery.multi-select.js"></script>


    <!--common script for all pages-->
    <script src="js/common-scripts.js">
    </script>

    <script type="text/javascript">
        // Sys.Net.WebRequestManager.set_defaultTimeout(600000);

        //jQuery(document).ready(function () {
        //    // $('#example').DataTable();

        //    $('.bxslider1').bxSlider({
        //        minSlides: 5,
        //        maxSlides: 6,
        //        slideWidth: 360,
        //        slideMargin: 2,
        //        moveSlides: 1,
        //        responsive: true,
        //        nextSelector: '#slider-next',
        //        prevSelector: '#slider-prev',
        //        nextText: 'Onward →',
        //        prevText: '← Go back'
        //    });

        //});


    </script>


    <script>
        //$('a.info').tooltip();

        //$(window).load(function () {
        //    $('.flexslider').flexslider({
        //        animation: "slide",
        //        start: function (slider) {
        //            $('body').removeClass('loading');
        //        }
        //    });
        //});

        //$(document).ready(function () {

        //    $("#owl-demo").owlCarousel({

        //        items: 4

        //    });

        //});

        //jQuery(document).ready(function () {
        //    jQuery('ul.superfish').superfish();
        //});

        //new WOW().init();


    </script>
</body>
</html>
</html>
