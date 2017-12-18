<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="jquery1.Index" %>

<%@ OutputCache CacheProfile="Cache30Seconds" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=9">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Developed By Freemcqs.com">
    <meta name="author" content="Free mcqs">
    <meta name="keywords" content="Important Questions, Mcqs, Solved Mcqs, mcqs test, Past papers, online mcqs">
    <script type="text/javascript">
        //  debugger;
        var Router = {
            routes: [],
            mode: null,
            root: '/',
            config: function (options) {
                this.mode = options && options.mode && options.mode == 'history'
                            && !!(history.pushState) ? 'history' : 'hash';
                this.root = options && options.root ? '/' + this.clearSlashes(options.root) + '/' : '/';
                return this;
            },
            getFragment: function () {
                var fragment = '';
                if (this.mode === 'history') {
                    fragment = this.clearSlashes(decodeURI(location.pathname + location.search));
                    fragment = fragment.replace(/\?(.*)$/, '');
                    fragment = this.root != '/' ? fragment.replace(this.root, '') : fragment;
                } else {
                    var match = window.location.href.match(/#(.*)$/);
                    fragment = match ? match[1] : '';
                }
                return this.clearSlashes(fragment);
            },
            clearSlashes: function (path) {
                return path.toString().replace(/\/$/, '').replace(/^\//, '');
            },
            add: function (re, handler) {
                if (typeof re == 'function') {
                    handler = re;
                    re = '';
                }
                this.routes.push({ re: re, handler: handler });
                return this;
            },
            remove: function (param) {
                for (var i = 0, r; i < this.routes.length, r = this.routes[i]; i++) {
                    if (r.handler === param || r.re.toString() === param.toString()) {
                        this.routes.splice(i, 1);
                        return this;
                    }
                }
                return this;
            },
            flush: function () {
                this.routes = [];
                this.mode = null;
                this.root = '/';
                return this;
            },
            check: function (f) {
                var fragment = f || this.getFragment();
                for (var i = 0; i < this.routes.length; i++) {
                    var match = fragment.match(this.routes[i].re);
                    if (match) {
                        match.shift();
                        this.routes[i].handler.apply({}, match);
                        return this;
                    }
                }
                return this;
            },
            listen: function () {
                var self = this;
                var current = self.getFragment();
                var fn = function () {
                    if (current !== self.getFragment()) {
                        current = self.getFragment();
                        self.check(current);
                    }
                }
                clearInterval(this.interval);
                this.interval = setInterval(fn, 50);
                return this;
            },
            navigate: function (path) {
                path = path ? path : '';
                if (this.mode === 'history') {
                    history.pushState(null, null, this.root + this.clearSlashes(path));
                } else {
                    window.location.href = window.location.href.replace(/#(.*)$/, '') + '#' + path;
                }
                return this;
            }
        }
        //  debugger;

        var hashval = window.location.pathname;
        //  console.log('hashval = ' + hashval);
        var type = hashval.charAt(1);
        //   Router.navigate('Category/Online/Mcqs/Category/FreeMcqs' + subid);
        //alert(type);
        // return false;  /Practice/Online/Mcqs/Practice/FreeMcqs-1359
        var testid_url = hashval.split('-')[1];
        var subid = hashval.split('-')[1];
        //console.log("subid = " + subid);
        //  alert(subid)
        //var cat_Fullname = hashval.split('-')[2];
        //console.log("cat_Fullname = " + cat_Fullname);
        //  window.location.pathname = "";
        Router.config({ mode: 'history' });
        Router.navigate();
        //   Router.navigate();
        //   window.location.pathname = "";
        function ChangeUrl(title, url) {
            if (typeof (history.pushState) != "undefined") {
                var obj = { Title: title, Url: url };
                history.pushState(obj, obj.Title, obj.Url);
            } else {
                alert("Browser does not support HTML5.");
            }
        }
        //Router.navigate("default.aspx");
        function retfalse() {
            alert("return false called")
            return false;
        }
        //  retfalse();
    </script>
    <link rel="icon" href="../../../../../acme-free/img/freemcqlogo.PNG" />


    <title>FreeMcqs For all | Online MCQS Test, Practise and result Important Questions, Mcqs, Solved Mcqs, mcqs test, Past papers, online mcqs
    </title>

    <!-- Bootstrap core CSS -->

    <%--<link href="DataTables_1/DataTables-1.10.15/css/dataTables.bootstrap.min.css" rel="stylesheet" />--%>
    <%--<link href="/acme-free/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="../../../../../DataTables_1/Bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../../../acme-free/css/alertify.core.css" rel="stylesheet" />
    <link href="../../../../../acme-free/css/alertify.default.css" rel="stylesheet" />
    <link href="../../../../../acme-free/css/theme.css" rel="stylesheet">
    <link href="../../../../../acme-free/css/bootstrap-reset.css" rel="stylesheet">
    <%-- <link href="../../../../../Timer/css/jquery.countdown.css" rel="stylesheet" />--%>
    <!--external css-->
    <link href="../../../../../acme-free/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />


    <link href="../../../../../jquery.mobile.custom/jquery.mobile.custom.structure.min.css" rel="stylesheet" />
    <link href="../../../../../jquery.mobile.custom/jquery.mobile.custom.theme.min.css" rel="stylesheet" />



    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="../../../../../acme-free/css/component.css">
    <link href="../../../../../acme-free/css/style.css" rel="stylesheet">
    <link href="../../../../../acme-free/css/style-responsive.css" rel="stylesheet" />
    <%--<link href="/DataTables_1/datatables.min.css" rel="stylesheet" />--%>
    <%--<link href="/DataTables_1/Bootstrap-3.3.7/css/bootstrap-theme.min.css" rel="stylesheet" />--%>
    <%--<link href="/DataTables_1/Bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="../../../../../DataTables_1/datatables.min.css" rel="stylesheet" />
    <%--<link href="/DataTables_1/Responsive-2.1.1/css/responsive.bootstrap.min.css" rel="stylesheet" />--%>
    <%--<link href="/DataTables_1/Select-1.1.2/css/select.dataTables.min.css" rel="stylesheet" />--%>
    <%--<link href="/DataTables_1/Responsive-2.0.2/css/responsive.dataTables.min.css" rel="stylesheet" />--%>
    <link href="../../../../../acme-free/css/tooltipster.css" rel="stylesheet" />
    <%--<link href:"//cdn.datatables.net/select/1.1.2/js/dataTables.select.min.js" />--%>
    <%--<script src="DataTables_1/DataTables-1.10.15/js/dataTables.bootstrap.min.js"></script>--%>
    <style>
        div.growlUI {
            background: url(check48.png) no-repeat 10px 10px;
        }

            div.growlUI h1, div.growlUI h2 {
                color: white;
                padding: 5px 5px 5px 75px;
                text-align: left;
            }

        .cancelTest {
        }

        .ddlattempted {
            background: green;
            color: white;
        }

        .ddlnotattempted {
            background: #EA082A;
            color: white;
        }

        .btnReporttoggle {
        }

        .ShowTestInstructions {
        }

        @media only screen and (max-width: 480px) {
            #testheader {
                min-height: 200px;
            }
        }

        @media only screen and (min-width: 480px) and (max-width: 768px) {
            #testheader {
                min-height: 100px;
            }
        }

        @media only screen and (min-width: 768px) and (max-width: 959px) {
            #testheader {
                min-height: 72px;
            }
        }

        @media only screen and (min-width: 959px) {
            #testheader {
                min-height: 72px;
            }
        }

        .userIconSelect {
            border: 1px solid black;
        }

        .div_doubt_option {
        }

        .div_incorrect_answer {
        }

        .div_notclear_option {
        }

        .div_incorrect_Question {
        }

        .ddl_user_correct {
        }

        .btn_FinalReport {
        }

        .ReportMcq {
        }

        .sharemcq {
        }

        .uniquemcq {
        }

        #divMyTags {
            text-align: center;
        }

        .closeall {
            opacity: 1.0;
            /*font-size: 35px;*/
            float: right;
            cursor: pointer;
        }

        body {
            overflow-x: hidden;
        }

        input[type="checkbox"] {
            outline: solid #2d08a0 !important;
        }
    </style>



    <%-- <script src="/acme-free/js/html2canvas.js"></script>
    <script src="/acme-free/js/Canvas2Image.js"></script>
    <script src="/acme-free/js/JsCode.js"></script>--%>
</head>

<body style="display: block !important;">

    <div class="container">



        <!--header start-->
        <header class="head-section" id="mainheader">
            <div class="navbar navbar-default navbar-static-top container">

                <div class="row">
                   
                        <div class="navbar-header col-md-3">
                            <%--<button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse"
                        type="button">
                        <span class="icon-bar"></span><span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>--%>
                            <a class="navbar-brand" href="default.aspx">
                                <img src="../../../../../acme-free/img/freemcqlogo.PNG" width="50px" /></a>
                            <a class="navbar-brand" href="default.aspx">Free<span>Mcqs</span>.com</a>

                        </div>

                    </div>
                    <div class="col-md-8">
                        <div class="navbar-collapse collapse in" style="height: auto;">
                            <ul class="nav navbar-nav">
                                <li>
                                    <a class="btn btn-login" href="General_Pages/SignUpAdmin.aspx">Sign Up</a>

                                </li>
                            </ul>


                        </div>
                    </div>
                    <div class="col-md-1">
                    </div>




                </div>

                <%--    <div class="add">
                </div>--%>






                <%-- </div>--%>
                <%--<button id="share_button" style="display: none;"></button>--%>

                <%-- <a href="#" class="" data-toggle="tooltip" data-html="true" data-placement="right" title="<img src='acme-free/img/skill.jpg'/>" />How</a>
                <a href="#" data-toggle="tooltip" title="Hooray!">Hover over me</a>
                <a href="#" data-toggle="tooltip" data-placement="top" title="Hooray!">Hover</a>--%>
            </div>

        </header>
        <!--header end-->
        <header class="head-section" id="testheader" style="display: none;">

            <div class="navbar navbar-default navbar-fixed-top navbar-static-top  container" id="fixedheader" style="background-color: #ffffff; min-height: 72px;">
                <div data-target=".navbar-collapse" class="navbar-header">

                    <a data-target=".navbar-collapse" class="" href="../../../../../default.aspx">
                        <span data-target=".navbar-collapse" class="icon-bar">
                            <img src="../../../../../acme-free/img/freemcqlogo.PNG" width="30" /></span>
                       
                  
                   Free<span>Mcqs</span></a>
                </div>
                <div data-target=".navbar-collapse" class="navbar-collapse collapse">
                    <div class="row">
                        <div class="col-sm-4">
                            
                                 <label data-target=".navbar-collapse" id="lblTestNamed"></label>
                        </div>
                        <div class="col-sm-6">
                   
                          <span data-target=".navbar-collapse" class="label label-info">Question Status 
                              <select data-target=".navbar-collapse" id="ddlallquiz" class=" label-inverse">
                                <option value="0">Select</option>
                                <option class="ddlattempted" value="1">1</option>
                                <option class="ddlnotattempted" value="2">2</option>
                            </select> </span>
                            <span data-target=".navbar-collapse" class="label label-info">Total Questions</span><span data-target=".navbar-collapse"  class="label label-inverse"> <label data-target=".navbar-collapse" id="totq"></label></span>

                    
                     
                                                    <span data-target=".navbar-collapse" class="label label-info">Remaining Questoins</span><span class="label label-inverse"> <label data-target=".navbar-collapse" id="totr"></label></span>
                      
                                <span data-target=".navbar-collapse"  id="countdowntimer" class="label label-info" >Time Left</span>   <span data-target=".navbar-collapse"  id="mycounter" class="countdown label label-inverse" ></span> 
                          
                        </div>
                      
                        

                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="progress">
                                <div class="progress-bar progress-bar-striped active" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <button data-toggle="collapse" id="btndefaulthome" class="btn btn-xs btn-danger">Cancel</button>
                            <button class="btntestthistest btn btn-info btn-xs" style="margin-left: 2%;">Start this Test</button>
                             <button class="btnPracticethistest btn btn-success btn-xs" style="display: none;">Practice this Test</button>
                            
                        </div>
                       
                        <div class="col-sm-4 btn-group-xs " id="divHeaderbtns">
                             <span class="label label-success ">Correct Ans. <label class="lblCorrectAns" ></label></span>
                             <span class="label label-danger ">Wrong Ans. <label class="lblWrongAns"></label></span>
                            <span  class="label label-inverse ">Percentage <label class="lblOverallPercent"></label>%</span>
                        </div>

                    </div>

                    <%--                    <div class="navbar-collapse collapse in" style="height: auto;">

                        
                       
                       


                        
                        <div>
                            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                            <!-- freemcqsAdd1 -->
                            <ins class="adsbygoogle"
                                style="display: block"
                                data-ad-client="ca-pub-8184474600195496"
                                data-ad-slot="9268775167"
                                data-ad-format="auto"></ins>
                            <script>
                                (adsbygoogle = window.adsbygoogle || []).push({});
                            </script>
                        </div>
                    </div>--%>
                </div>
            </div>
        </header>

        <div class="row">


            <div class="col-sm-9" id="divhometbl" style="display: none;">
                <div class="row">
                    <div class="col-xs-1"></div>
                    <div class="col-xs-5">
                        <a class="closeall btn btn-info" style="float: left !important">HOME</a>
                    </div>
                    <div class="col-xs-6">
                        <a>
                            <img width="25px" height="25px" class="closeall" src="../../../../../acme-free/img/cross.png" /></a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="alert alert-info" style="text-align: center;"><span id="SPANSubName"></span>
                            <label id="totalmcqs"></label>
                            Mcqs</h2>
                    </div>
                </div>
                <div class="container" id="allmcqscount" style="display: none;">

                    <%--  <div class="row mar-b-50">
                        <div class="col-md-12">
                            <div align="center">
                                 <canvas id="myCanvas" width="900" height="400"></canvas>
                                <img src="" id="newimg_fb">
                            </div>
                            <div class="text-center feature-head wow fadeInDown">
                                <div class="DTS_Loading" id="divloading"></div>
                             
                               <label>About </label> <label id="totalmcqs"  ></label><label class="">   Mcqs</label>
                                <hr />--%>
                    <%-- <a href="Online-MCAT-ECAT-NEET-UKAT-MEDICAL-Engineering-Free-Mcq-Mcqs-Test-Practise-download/TestId=1262">Practise</a>--%>
                    <%--    <div id="testimg">
                                </div>
                                <div id="img-out"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <h1 id="div1loading"></h1>--%>
                </div>
                <div class="container" id="maintable">

                    <div class="row">
                        <div class="col-lg-9 col-md-9 col-sm-9">
                            <table id="example" class="table table-responsive table-stroke">
                                <thead>
                                    <tr>
                                        <th>Sr. No.</th>
                                        <th>Subject Name</th>
                                        <th>Test Name</th>
                                        <th>TestId</th>
                                        <th>SubId</th>
                                        <th>Made By</th>
                                        <th>Total Mcqs</th>
                                        <th>Make Practice</th>
                                        <th>Take Test</th>
                                        <th>Add Mcqs</th>
                                        <th>IsMultiple</th>

                                    </tr>
                                </thead>
                                <tbody></tbody>

                            </table>

                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3">
                            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                            <!-- sideline -->
                            <ins class="adsbygoogle"
                                style="display: inline-block; width: 300px; height: 600px"
                                data-ad-client="ca-pub-8184474600195496"
                                data-ad-slot="8478248066"></ins>
                            <script>
                                (adsbygoogle = window.adsbygoogle || []).push({});
                            </script>
                        </div>




                    </div>
                </div>
            </div>

            <div style="background-color: lightblue; height: auto;" class="col-sm-3">
            </div>
        </div>


        <div class="feature-box" id="catbox">
            <div class="container">
                <div class="row">


                    <div id="vu_catbox" class="col-md-6 col-sm-6 text-center wow fadeInUp animated" data-wow-animation-name="fadeInUp" style="border: inherit; visibility: visible; animation-name: fadeInUp;">
                        <div class="feature-box-heading">
                            <em>
                                <img src="../../../../../All_Images/logo.png" alt="" width="130" height="78">
                               
                            </em>
                            <h4>
                                <b>Virtual University</b>
                            </h4>
                            <label><span class="glyphicon glyphicon-flag " aria-hidden="true"></span>This Category has overall <span id="divvucattotaltests" class="badge bg-blue" aria-hidden="true">Please Wait...</span> <span style="color: red;">Tests</span> and <span id="divvucattotalmcqs" class="badge bg-green" aria-hidden="true"></span><span style="color: darkblue;">MCQS</span>.</label>
                        </div>
                        <div>
                            <div id="divvucat" class="list-group" style="font-size: 12px; text-align: left;">
                            </div>


                        </div>

                    </div>
                    <div id="med_catbox" class="col-md-6 col-sm-6 text-center wow fadeInUp animated" data-wow-animation-name="fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
                        <div class="feature-box-heading">
                            <em>
                                <img src="../../../../../All_Images/0.jpg" alt="" width="130" height="78">
                            </em>
                            <h4>
                                <b>Medical</b>
                            </h4>
                            <label><span class="glyphicon glyphicon-flag " aria-hidden="true"></span>This Category has overall <span id="divmedcattotaltests" class="badge bg-blue" aria-hidden="true">Please Wait...</span> <span style="color: red;">Tests</span> and <span id="divmedcattotalmcqs" class="badge bg-green" aria-hidden="true"></span><span style="color: darkblue;">MCQS</span>.</label>
                        </div>
                        <div id="divmedcat" class="list-group" style="font-size: 12px; text-align: left;">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div id="engg_catbox" class="col-md-6 col-sm-6 text-center wow fadeInUp animated" data-wow-animation-name="fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
                        <div class="feature-box-heading">
                            <em>
                                <img src="../../../../../All_Images/engine.jpg" alt="" width="130" height="78">
                            </em>
                            <h4>
                                <b>Engineering</b>
                            </h4>
                            <label><span class="glyphicon glyphicon-flag " aria-hidden="true"></span>This Category has overall <span id="divenggcattotaltests" class="badge bg-blue" aria-hidden="true">Please Wait...</span> <span style="color: red;">Tests</span> and <span id="divenggcattotalmcqs" class="badge bg-green" aria-hidden="true"></span><span style="color: darkblue;">MCQS</span>.</label>
                        </div>
                        <div id="divengcat" class="list-group" style="font-size: 12px; text-align: left;">
                        </div>
                    </div>
                </div>
                <div class="row">


                    <div id="compet_catbox" class="col-md-6 col-sm-6 text-center wow fadeInUp animated" data-wow-animation-name="fadeInUp" style="border: inherit; visibility: visible; animation-name: fadeInUp;">
                        <div class="feature-box-heading">
                            <em>

                                <img src="../../../../../All_Images/comp.jpg" alt="" width="130" height="78">
                            </em>
                            <h4>
                                <b>Competitive Test</b>
                            </h4>
                            <label><span class="glyphicon glyphicon-flag " aria-hidden="true"></span>This Category has overall <span id="divcompcattotaltests" class="badge bg-blue" aria-hidden="true">Please Wait...</span> <span style="color: red;">Tests</span> and <span id="divcompcattotalmcqs" class="badge bg-green" aria-hidden="true"></span><span style="color: darkblue;">MCQS</span>.</label>
                        </div>
                        <div>
                            <div id="divcomptcat" class="list-group" style="font-size: 12px; text-align: left;">
                            </div>


                        </div>

                    </div>
                </div>
                <div class="row">
                    <div id="adm_catbox" class="col-md-6 col-sm-6 text-center wow fadeInUp animated" data-wow-animation-name="fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
                        <div class="feature-box-heading">
                            <em>

                                <img src="../../../../../All_Images/Adm2.jpg" alt="" width="130" height="78">
                            </em>
                            <h4>
                                <b>Admission Test</b>
                            </h4>
                            <label><span class="glyphicon glyphicon-flag " aria-hidden="true"></span>This Category has overall <span id="divadmcattotaltests" class="badge bg-blue" aria-hidden="true">Please Wait...</span> <span style="color: red;">Tests</span> and <span id="divadmcattotalmcqs" class="badge bg-green" aria-hidden="true"></span><span style="color: darkblue;">MCQS</span>.</label>
                        </div>
                        <div id="divAdmtest" class="list-group" style="font-size: 12px; text-align: left;">
                        </div>
                    </div>
                    <div id="job_catbox" class="col-md-6 col-sm-6 text-center wow fadeInUp animated" data-wow-animation-name="fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
                        <div class="feature-box-heading">
                            <em>

                                <img src="../../../../../All_Images/Jobs.jpg" alt="" width="130" height="78">
                            </em>
                            <h4>
                                <b>Job Tests</b>
                            </h4>
                            <label><span class="glyphicon glyphicon-flag " aria-hidden="true"></span>This Category has overall <span id="divjobcattotaltests" class="badge bg-blue" aria-hidden="true">Please Wait...</span> <span style="color: red;">Tests</span> and <span id="divjobcattotalmcqs" class="badge bg-green" aria-hidden="true"></span><span style="color: darkblue;">MCQS</span>.</label>
                        </div>
                        <div id="divjobtest" class="list-group" style="font-size: 12px; text-align: left;">
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div id="skill_catbox" class="col-md-6 col-sm-6 text-center wow fadeInUp animated" data-wow-animation-name="fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
                        <div class="feature-box-heading">
                            <em>

                                <img src="../../../../../All_Images/skill.jpeg" alt="" width="130" height="78">
                            </em>
                            <h4>
                                <b>Skill Tests</b>
                            </h4>
                            <label><span class="glyphicon glyphicon-flag " aria-hidden="true"></span>This Category has overall <span id="divskillcattotaltests" class="badge bg-blue" aria-hidden="true">Please Wait...</span> <span style="color: red;">Tests</span> and <span id="divmedskilltotalmcqs" class="badge bg-green" aria-hidden="true"></span><span style="color: darkblue;">MCQS</span>.</label>
                        </div>
                        <div id="divskilltest" class="list-group" style="font-size: 12px; text-align: left;">
                        </div>
                    </div>
                    <div id="misc_catbox" class="col-md-6 col-sm-6 text-center wow fadeInUp animated" data-wow-animation-name="fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
                        <div class="feature-box-heading">
                            <em>

                                <img src="../../../../../All_Images/miscellaneous-002.jpg" alt="" width="130" height="78">
                            </em>
                            <h4>
                                <b>Misc Tests</b>
                            </h4>
                            <label><span class="glyphicon glyphicon-flag " aria-hidden="true"></span>This Category has overall <span id="divmisccattotaltests" class="badge bg-blue" aria-hidden="true">Please Wait...</span> <span style="color: red;">Tests</span> and <span id="divmisccattotalmcqs" class="badge bg-green" aria-hidden="true"></span><span style="color: darkblue;">MCQS</span>.</label>
                        </div>
                        <div id="divothertest" class="list-group" style="font-size: 12px; text-align: left;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--feature end-->



        <div class="container">
            <div id="LoadMcqsAllQuestion" class="mcqsShow ">
                <div class="row" style="overflow-x: hidden;">

                    <div id="tblLoadMcqsAllQuestion" class="col-sm-9" style="overflow-x: hidden; margin-left: 0%;  margin-top: 14%; display: none;">
                    </div>
                    <div class="col-sm-3">
                           <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                            <!-- sideline -->
                            <ins class="adsbygoogle"
                                style="display: inline-block; width: 300px; height: 600px"
                                data-ad-client="ca-pub-8184474600195496"
                                data-ad-slot="8478248066"></ins>
                            <script>
                                (adsbygoogle = window.adsbygoogle || []).push({});
                            </script>
                    </div>
                    </div>
                </div>
            </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <input type="text" placeholder="Your Name" id="UserTestName" class="input-lg " />
                        </div>
                        <button class="btnShowResultdiv myresult btn btn-info btn-lg" style="margin-left: 2%; display: none;">Show Result</button>
                        <button class="btnPracticethistest btn btn-info btn-lg" style="display: none;">Practice this Test</button>
                        <button class="btntestthistest btn btn-info btn-lg" style="margin-left: 2%; display: none;">Start this Test</button>
                        </div>

            <div class="container">
                <div class="row">
                </div>

                <div class="container" id="divinst" style="display: none; margin-top: 9%;">
                    <h3>Please read the following instructions carefully before attempting Quiz</h3>
                    <p>
                        • This quiz consists of only Multiple Choice Questions (MCQ’s) carrying 1 mark each.<br />
                        • Read questions carefully and select the most appropriate answer for each MCQ.<br />
                        • Avoid selecting two choices for one MCQ. The double options will be marked zero.<br />
                        • All instructions will be considered while marking. So, be careful while attempting the quiz.
                    </p>
                    <br />
                    <input type="button" id="canceltest" class="btn btn-danger btn-lg" value="Cancel" />
                    <input type="button" id="proceedfur" class="btn btn-info btn-lg" value="Take Quiz" />
                </div>
            </div>

            <div class="container">
                <div class="row mar-b-50">
                    <div id="divCommonSubTestNumb" style="display: none;">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <label id="lblSubjectName" class="control-label" for="ddlSubject"><span>Subject</span></label>
                                    <select id="ddlSubject" name="ddlSubject" class=""></select>
                                </div>

                                <div class="col-md-3">
                                    <label id="lblTestName" class="control-label" for="ddlTest"><span>Test</span></label>
                                    <select id="ddlTest" name="ddlTest" class=" "></select>
                                </div>

                                <div class="col-md-3">
                                    <label class="control-label" for="ddlPoints"><span>Points</span></label>
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
                                    <label style="width: 100%;">
                                        <input type="checkbox" id="chkreloadpage" value="1" />
                                        Reload on click on Save button.
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="divMcqsQuestion" style="display: none">

                        <div class="row">
                            <div class="col-md-12">
                                <input type="button" id="btnQuestionSimpleBox" class="btn btn-xs btn-info" value="Simple Textbox" />

                                <input type="button" id="btnQuestionckeditor" class="btn btn-xs btn-info" value="Textbox With Options" />
                                <div class="focusguard" id="focusguard-1" tabindex="1"></div>
                                <input tabindex="2" type="button" id="btnShowHidetxtQuestion" class="btn btn-xs btn-info" value="Show/Hide Question" />
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

                                <input type="button" id="btncancel" class="btn btn-warning" value="Cancel" />
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
                                            <textarea name="content" tabindex="12" id="txtExplanation" style="width: 100%"></textarea>
                                        </div>
                                        <div class="focusguard" id="focusguard-2" tabindex="14"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <div class="container">


                <style>
                    #TotalQuestionsMcqsTest {
                        margin: 20px;
                        width: 200px;
                        height: 200px;
                        position: relative;
                    }

                    #cont_prog {
                        margin: 20px;
                        width: 200px;
                        height: 200px;
                        position: relative;
                    }

                    #con_percentile {
                        margin: 20px;
                        width: 200px;
                        height: 200px;
                        position: relative;
                    }

                    #container {
                        margin: 20px;
                        width: 200px;
                        height: 200px;
                    }

                    .box_result {
                        box-shadow: 10px 10px 5px #888888;
                        border: 1px solid white;
                        text-align: center;
                        color: white;
                    }

                    .onlybox_shadow {
                        box-shadow: 10px 10px 5px #888888;
                        /*border: 1px solid white;*/
                    }
                    .btntestthistest{

                    }
                    .btnPracticethistest{}
                    .btnShowResultdiv{}
                    .lblCorrectAns{}
                    .lblWrongAns{}
                    .lblOverallPercent{}
                </style>
                <div id="MergeTestResult_New">
                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    <!-- freemcqsAdd1 -->
                    <ins class="adsbygoogle"
                        style="display: block"
                        data-ad-client="ca-pub-8184474600195496"
                        data-ad-slot="9268775167"
                        data-ad-format="auto"></ins>
                    <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    </script>
                    <div class="panel panel-primary">
                        <div class="panel-body">
                            <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                <div class="btn-group" role="group">

                                    <div class="label-primary  box_result">
                                        <label>Total attempted Question Marks</label>
                                    </div>
                                    <div class="blog-item" style="text-align: center;">
                                        <div id="TotalQuestionsMcqsTest"></div>
                                        <div style="text-align: left;">
                                            <label class="btn btn-primary onlybox_shadow" style="font-size: xx-large;" id="lblMultiTestTotalQ">220</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-group" role="group">
                                    <div class="label-danger box_result">
                                        <label>Obtained Marks</label>
                                    </div>
                                    <div class="blog-item" style="text-align: center;">
                                        <div id="container">
                                            <svg xmlns="http://www.w3.org/2000/svg" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                                <path fill-opacity="0" stroke-width="1" stroke="#bbb" d="M81.495,13.923c-11.368-5.261-26.234-0.311-31.489,11.032C44.74,13.612,29.879,8.657,18.511,13.923  C6.402,19.539,0.613,33.883,10.175,50.804c6.792,12.04,18.826,21.111,39.831,37.379c20.993-16.268,33.033-25.344,39.819-37.379  C99.387,33.883,93.598,19.539,81.495,13.923z" />
                                                <path id="heart-path" fill-opacity="0" stroke-width="3" stroke="#ED6A5A" d="M81.495,13.923c-11.368-5.261-26.234-0.311-31.489,11.032C44.74,13.612,29.879,8.657,18.511,13.923  C6.402,19.539,0.613,33.883,10.175,50.804c6.792,12.04,18.826,21.111,39.831,37.379c20.993-16.268,33.033-25.344,39.819-37.379  C99.387,33.883,93.598,19.539,81.495,13.923z" />
                                            </svg>
                                        </div>
                                        <div style="text-align: left;">
                                            <label class="btn btn-danger onlybox_shadow" style="font-size: xx-large;" id="lblMultiTestObtain">148</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-group" role="group">
                                    <div class="label-warning box_result">
                                        <label>Percentage</label>
                                    </div>
                                    <div class="blog-item" style="text-align: center;">
                                        <div id="cont_prog">
                                        </div>
                                        <div style="text-align: left;">
                                            <label class="btn btn-warning onlybox_shadow" style="font-size: xx-large;" id="lblMultiTestPercent">56%</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-group" role="group">
                                    <div class="label-success box_result">
                                        <label>Percentile</label>
                                    </div>
                                    <div class="blog-item" style="text-align: center;">
                                        <div id="con_percentile">
                                        </div>
                                        <div style="text-align: left;">
                                            <label class="btn btn-success onlybox_shadow" style="font-size: xx-large;" id="lblMultiTestPercentile">89</label>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>

                    </div>
                    <div class="row" style="text-align: center;">
                        <div class="col-lg-12">

                            <button class="btn btn-danger btn-lg  " id="btnHome">Home Page</button>
                            <button class="btn btn-info btn-lg" id="btnTestagain">Test Again</button>
                            <button class="btn btn-success btn-lg" id="btnpractiseagain">Practice this test</button>
                            <button class="btn btn-primary btn-lg" id="btnDownloadResultCard">Download Result Card</button>
                        </div>
                    </div>
                </div>




            </div>

            <div class="afs_ads">&nbsp;</div>
            <dialog class="ShowTestInstructions">
                <h1></h1>
            </dialog>

            <script>

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
                (function () {


                    var myhtml = '<div><h2 class="page-header alert alert-danger">It Looks Like You Have AdBlocker Enabled</h2>' +
                       '<p class="bs-callout bs-callout-danger">Freemcqs.com relies solely on ads to keep producing and offering free content to you. We appreciate if you add our site on whitelist of Adblock to help support our site and see your desire content.</p>' +
                       '<button id="dismissmsg" class="btn btn-lg btn-success">Refresh Page</button></div>';
                    // var message = "We've detected that you have an ad blocker enabled! Please  it and help support our work!";

                    // Define a function for showing the message.
                    // Set a timeout of 2 seconds to give adblocker
                    // a chance to do its thing
                    var tryMessage = function () {
                        setTimeout(function () {
                            if (!document.getElementsByClassName) return;
                            var ads = document.getElementsByClassName('afs_ads'),
                                ad = ads[ads.length - 1];

                            if (!ad
                                || ad.innerHTML.length == 0
                                || ad.clientHeight === 0) {

                                //$.blockUI({
                                //            //    $.blockUI({ 
                                //            message: myhtml,
                                //            css: { top: '20%', cursor:'pointer' }
                                //            //     }); 
                                //        })
                                $(document).on("click", '#dismissmsg ', function () {
                                    window.location.href = "http://localhost:34128/default.aspx";
                                    //alert("i am click");
                                })
                                return;
                                // alert(message);
                                //window.location.href = '[URL of the donate page. Remove the two slashes at the start of thsi line to enable.]';
                            } else {
                                ad.style.display = 'none';
                            }

                        }, 2000);
                    }

                    /* Attach a listener for page load ... then show the message */
                    if (window.addEventListener) {
                        window.addEventListener('load', tryMessage, false);
                    } else {
                        window.attachEvent('onload', tryMessage); //IE
                    }
                })();
            </script>
            <script src="../../../../../acme-free/js/json2.js"></script>

            <script src="../../../../../DataTables_1/jQuery-2.2.4/jquery-2.2.4.min.js"></script>
            <script src="../../../../../DataTables_1/Bootstrap-3.3.7/js/bootstrap.min.js"></script>

            <script src="../../../../../DataTables_1/datatables.min.js"></script>
            <script src="../../../../../acme-free/js/jstorage.js"></script>
            <script src="../../../../../acme-free/js/alertify.min.js"></script>
            <script src="../../../../../acme-free/js/hover-dropdown.js"></script>

            <script src="../../../../../acme-free/js/jquery.blockUI.js"></script>

            <script src="../../../../../ckeditor/ckeditor.js"></script>
            <script src="../../../../../acme-free/js/MyNewTimer.js"></script>
            <script type="text/javascript">
                //$(document).ready(function () {

                //    //$('.product-highlight').hide();

                //    //$('a[href$=shoes').click(function () {
                //    //   // $('#shoes').show();
                //    //});

                //    // add this line...


                //    //$(window.location.hash).show();

                //    $(".icon-prev a").on('click', function (e) {
                //        var contentId = $(this).data('index');
                //        // alert(contentId);
                //    });
                //});
            </script>
            <script>

                $("#btnSavepngimg").click(function () {


                    html2canvas($("#mytb"), {
                        onrendered: function (canvas) {
                            theCanvas = canvas;
                            document.body.appendChild(canvas);

                            // Convert and download as image 
                            Canvas2Image.saveAsPNG(canvas);
                            $("#img-out").append(canvas);
                            // Clean up 
                            document.body.removeChild(canvas);
                        }
                    });
                });
                window.fbAsyncInit = function () {
                    FB.init({
                        appId: '1652596581731791',
                        status: true, // check login status
                        cookie: true, // enable cookies to allow the server to access the session
                        xfbml: true,// parse XFBML,
                        oauth: true


                    });
                };
                //(function () {
                //    var e = document.createElement('script');
                //    e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
                //    e.async = true;
                //    //$("sharemcq").appendChild(e);
                //    document.getElementById('share_button').appendChild(e);
                //}());



            </script>

            <script src="../../../../../acme-free/js/HomeFunc.js"></script>
            <link href="../../../../../acme-free/css/CheckCrossAnimate.css" rel="stylesheet" />
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

                .SecHeading {
                    font-size: xx-large;
                    text-transform: uppercase;
                    color: darkblue;
                }

                .SecDetail {
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
                    width: 40px;
                    height: 40px;
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
           
            <script>
                (function (i, s, o, g, r, a, m) {
                    i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                        (i[r].q = i[r].q || []).push(arguments)
                    }, i[r].l = 1 * new Date(); a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
                })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

                ga('create', 'UA-80235577-1', 'auto');
                ga('send', 'pageview');

            </script>

            <script type="text/javascript">

                function getResultUsers(totalmarks, obtaiMarks, secArray, perQMark, negativeMarks, totalAttempts) {
                    // get %age
                    var overallPercentage = parseFloat(parseInt(obtaiMarks) / parseInt(totalmarks));
                    // get Percentile

                }
            </script>
            <script src="../../../../../acme-free/js/progressbar.min.js"></script>

       
</body>
</html>

