<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpAdmin.aspx.cs" Inherits="jquery1.General_Pages.logintest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
    <link rel="icon" href="../acme-free/img/faviconFinal.ico"/>
   
    <link href="../acme-free/css/bootstrap-reset.css" rel="stylesheet" />
    <link href="../acme-free/css/bootstrap.min.css" rel="stylesheet" />

    <link href="../acme-free/css/style-responsive.css" rel="stylesheet" />
    <link href="../acme-free/css/animate.css" rel="stylesheet" />
    <link href="../acme-free/css/style.css" rel="stylesheet" />
    <link href="../acme-free/css/theme.css" rel="stylesheet" />
    <link href="../Styles/CustomStyles.css" rel="stylesheet" />

    <link href="../acme-free/css/alertify.core.css" rel="stylesheet" />
    <title>Free Mcqs</title>
</head>
<body>
    <!--header start-->
    <!--header start-->
    <header class="head-section" id="mainheader">
        <div class="navbar navbar-default navbar-static-top container">
            <div class="navbar-header">
                <button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse"
                    type="button">
                    <span class="icon-bar"></span><span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="../default.aspx">Free<span>Mcqs</span></a>
            </div>


            <div class="add">
            </div>

            <%--<div class="navbar-collapse collapse">--%>

            <%-- <ul class="nav navbar-nav" style="float: left; margin-left: 53px;">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover="dropdown"
                            data-toggle="dropdown" style="text-decoration:solid; text-transform:uppercase;" href="index.html">
                            Universities  <span class="badge bg-light-blue ">  250 <i style="font-size:7px;">Mcqs</i></span>
                           
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
                                                            <li>Lecture No.1
                                                                          <a href="#" class="btn btn-info Practice">Make Practice</a><a href="#" class="btn btn-danger divUserTest">Take Test</a>

                                                            </li>
                                                            <li>
                                                                <a href="#">Lecture No.2</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">Lecture No.3</a>
                                                            </li>
                                                            <li>
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
                                                            <li>
                                                                <a href="#">Lecture No.1</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">Lecture No.2</a>
                                                            </li>
                                                            <li>
                                                                <a href="#">Lecture No.3</a>
                                                            </li>
                                                            <li>
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
                        <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover="dropdown"
                            data-toggle="dropdown" href="index.html">MCAT  <span class="badge bg-green">14 Mcqs</span>--%>
            <%--<i class="fa fa-angle-down" style="font-weight: bold; font-size: 10px; color: white; background-color: rgb(72, 207, 173);">250+ Mcq's</i>--%>
            <%--  </a>

                    </li>
                    <li class="dropdown">
                        
                        <a class="dropdown-toggle " data-close-others="false" data-delay="0" data-hover="dropdown" data-toggle="dropdown" href="index.html">
                             
                            
                            
                            <span class="badge bg-light-blue ">Home  14 Mcqs <i class="fa fa-list"></i></span>
                           
                            
                        </a>--%>
            <%-- <ul class="dropdown-menu">
                            <li>

                                <a href="index.html">Home Parallax
                              <span class="label label-default label-pill pull-xs-right">14 Mcqs</span></a>
                            </li>
                            <li>
                                <a href="index1.html">Home Seq-slider1</a>
                            </li>
                            <li>
                                <a href="index2.html">Home Seq-slider2</a>
                            </li>
                        </ul>
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

            <a class="btn-login text-right" style="float: right; display:none;" href="General_Pages/SignUpAdmin.aspx">Sign Up</a>



            <%-- </div>--%>
            <button id="share_button" style="display: none;"></button>
        </div>

    </header>
    <!--header end-->
   
    <!--header end-->

    <!--breadcrumbs start-->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-sm-4">
                    <h1>Login</h1>
                </div>
                <div class="col-lg-8 col-sm-8">
                    <ol class="breadcrumb pull-right">
                        <li><a href="../default.aspx">Home</a></li>
                       <%-- <li><a href="#">Features</a></li>--%>
                        <li class="active">Login</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!--breadcrumbs end-->

    <!--container start-->
    <div class="login-bg">
        <div class="container">
            <div class="form-wrapper">
            <form class="form-signin wow fadeInUp animated" action="index.html" data-wow-animation-name="fadeInUp" style="visibility: visible; animation-name: fadeInUp;">
            <h2 class="form-signin-heading">sign in now</h2>
            <div class="login-wrap">
                <input type="email" class="form-control" placeholder="User ID" autofocus="autofocus" placeholder="Email" id="txtSignInEmail">
               
                            <label id="lblSignInEmail" ></label>
                  <input type="password" class="form-control" placeholder="Password" value="" id="txtSignInPassword" />
                            <label id="lblSignInPassword" ></label>
                             <span id="ProgressDivSignIn" class="hide">Loading...</span>
            
                <%--<label class="checkbox">
                    <input type="checkbox" value="remember-me"> Remember me
                    <span class="pull-right">
                        <a data-toggle="modal" href="#myModal"> Forgot Password?</a>

                    </span>
                </label>--%>
                <p id="lblSignInmsg"></p>
                <p><img id="loadbar" class="" style="display:none;" width="208px" src="../All_Images/loadbar.gif" /></p>
                 <input type="button" value="Sign in" class="btn btn-lg btn-login btn-block" id="btnSignIn" />
                <%--<p>or you can sign in via social network</p>
                <div class="login-social-link">
                    <a href="index.html" class="facebook">
                        <i class="fa fa-facebook"></i>
                        Facebook
                    </a>
                    <a href="index.html" class="twitter">
                        <i class="fa fa-twitter"></i>
                        Twitter
                    </a>
                </div>
                <div class="registration">
                    Don't have an account yet?
                    <a class="" href="registration.html">
                        Create an account
                    </a>
                </div>--%>
                
            </div>
                 <%--<label id="lblSignInmsg" class="form-control "></label><br />--%>
              <!-- Modal -->
              <div aria-hidden="true" aria-labelledby="myModal" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                              <h4 class="modal-title">Forgot Password ?</h4>
                          </div>
                          <div class="modal-body">
                              <p>Enter your e-mail address below to reset your password.</p>
                              <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                          </div>
                          <div class="modal-footer">
                              <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                              <button class="btn btn-success" type="button">Submit</button>
                          </div>
                      </div>
                  </div>
              </div>
              <!-- modal -->

          </form>
          </div>
        </div>
    </div>
    <!--container end-->


  <!-- js placed at the end of the document so the pages load faster -->
      <script src="../Scripts/jquery-1.11.2.min.js"></script>
    <script src="../acme-free/js/jquery.js"></script>
    <script src="../acme-free/js/jquery.easing.min.js"></script>
    <script src="../acme-free/js/bootstrap.min.js"></script><i id="back-to-top" style="display: inline;"></i>
    <script src="../acme-free/js/alertify.min.js"></script>

   
    <script type="text/javascript">

        var emptyUserNameMessage = 'Hey, Enter your Email here.';
        var progressUserNameMessage = 'Checking...';
        var availableUserNameMessage = 'WOW beautiful Email address.';
        var usedUserNameMessage = 'This Email already in our System';
        var lblNameResponse = 'So thats they called you hmmm.';
        var lblEnterName = 'Hi enter your good name please :)';
        var PaswordRequired = ' Give your password here OK.';
        var PaswordGiven = ' OH MY WORD!  ';
        var loginattempts = 0;
        $(document).ready(function () {
            $('#loadbar').hide();
        })
        $(function () {
            $('#txtAdminName').focusout(function () {
                var txtAdminName = $('#txtAdminName').val();
                if ($.trim(txtAdminName) == '') {
                    $('#lblName').html(lblEnterName);
                    $('#lblName').removeClass();
                    $('#lblName').addClass('required labelForError');
                }
                else {
                    $('#lblName').html(lblNameResponse);
                    $('#lblName').removeClass();
                    $('#lblName').addClass('available labelForError');
                }
            })
            $('#txtAdminpassword').focusout(function () {
                var txtAdminpassword = $('#txtAdminpassword').val();
                if ($.trim(txtAdminpassword) == '') {
                    $('#lblPassword').html('Hey ' + $('#txtAdminName').val().toUpperCase() + '. ' + PaswordRequired);
                    $('#lblPassword').removeClass();
                    $('#lblPassword').addClass('required labelForError ');
                }
                else {
                    $('#lblPassword').html(PaswordGiven + $('#txtAdminName').val().toUpperCase() + '... You are GENIUS.');
                    $('#lblPassword').removeClass();
                    $('#lblPassword').addClass('available labelForError');
                }
            })
            $('#txtAdminEmail').focusout(function () {
                var txtAdmintext = $('#txtAdminEmail').val();
                if ($.trim(txtAdmintext) == '') {
                    $('#userNameAvailabilityLabel').html(emptyUserNameMessage);
                    $('#userNameAvailabilityLabel').removeClass();
                    $('#userNameAvailabilityLabel').addClass('required labelForError');
                }

                else {
                    var pattern = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i
                    if (!pattern.test(txtAdmintext)) {
                        $('#userNameAvailabilityLabel').html('it seems not in correct Format');
                        $('#userNameAvailabilityLabel').removeClass();
                        $('#userNameAvailabilityLabel').addClass('required labelForError');
                        return false;
                    }


                    $('#userNameAvailabilityLabel').html('');
                    $('#ProgressDiv').show();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "SignUpAdmin.aspx/CheckUserNameAvailability",
                        data: "{'adminEmailCheck':'" + $.trim(txtAdmintext) + "'}",
                        dataType: "json",
                        timeout: 90000,
                        success: function (response) {


                            if (response != null && response.d != null) {
                                var data = response.d;
                                switch (data) {
                                    case 0:

                                        $('#userNameAvailabilityLabel').html(availableUserNameMessage);
                                        $('#userNameAvailabilityLabel').removeClass();
                                        $('#userNameAvailabilityLabel').addClass('available');
                                        break;
                                    case 1:

                                        $('#userNameAvailabilityLabel').html(usedUserNameMessage);
                                        $('#userNameAvailabilityLabel').removeClass();
                                        $('#userNameAvailabilityLabel').addClass('used');

                                        break;
                                }
                            }
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert("Error" + xhr.statusText);
                        }
                    })
                }


            })


            $('#btnSignUp').click(function () {
                var name = $('#txtAdminName').val();
                var email = $('#txtAdminEmail').val();
                var password = $('#txtAdminpassword').val();
                if (name != '' && email != '' && password) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "SignUpAdmin.aspx/InsertData",
                        data: "{'adminName':'" + name + "','adminEmail':'" + email + "','adminPassword':'" + password + "'}",
                        dataType: "json",
                        timeout: 90000,
                        success: function (data) {
                            var obj = data.d;
                            if (obj == 'true') {
                                $('#txtAdminName').val('');
                                $('#txtAdminEmail').val('');
                                $('#txtAdminpassword').val('');
                                $('#lblmsg').html("Details Submitted Successfully");
                                window.location = "../acme-free/myindex.aspx";
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
                else {
                    alert('Please enter all the fields')
                    return false;
                }
            })

            $('#btnSignIn').click(function () {

                var email = $('#txtSignInEmail').val();
                var password = $('#txtSignInPassword').val();
                if (email != '' && password) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "SignUpAdmin.aspx/SignIn",
                        data: "{'SigninEmailCheck':'" + email + "','SignInPassword':'" + password + "'}",
                        dataType: "json",
                        timeout: 90000,
                        complete: function () {
                            //if (parseInt(loginattempts) > 6)
                            //{
                            //    $('#btnSignIn').hide();
                            //}
                            //else {
                            //    $('#btnSignIn').show();
                            //}
                           
                            $('#loadbar').hide();
                        },
                        beforeSend: function () {
                            $('#lblSignInmsg').css("color", "darkblue");
                            $('#lblSignInmsg').html("Please Wait...");
                            $('#btnSignIn').hide();
                            $('#loadbar').show();
                        },
                        success: function (data) {
                            loginattempts = loginattempts + 1;
                            //console.log('loginattempts = '+loginattempts)
                            var obj = data.d;
                            //console.log(obj);
                            var arr = obj.split(",");
                            //console.log("part 1 is = " + arr[0] + " and part 2 is " + arr[1])
                            if (arr[0] != 0)
                            {
                                $('#btnSignIn').hide();
                                $('#lblSignInmsg').html("You are Sign-In Successfully");

                                window.location = "../acme-free/myindex.aspx?&UserR=" + arr[0] + "&adminid=" + arr[1];
                            }
                           else if (arr[0] == 0) {
                                $('#lblSignInmsg').css("color", "red");
                                $('#lblSignInmsg').html("Please Check Your Email and Password Again!");
                                $('#btnSignIn').show();
                                if (parseInt(loginattempts) > 6) {
                                    $('#btnSignIn').hide();
                                }
                                $('#loadbar').hide();
                            }

                            else if (arr[0] == -1) {
                                $('#lblSignInmsg').css("color", "red");
                                $('#lblSignInmsg').html("Please Check Your Email and Password Again!");
                                $('#btnSignIn').show();
                                if (parseInt(loginattempts) > 6) {
                                    $('#btnSignIn').hide();
                                }
                                $('#loadbar').hide();
                            }
                        },
                        error: function (result) {
                            $('#lblSignInmsg').css("color", "red");
                            $('#lblSignInmsg').html("Please Check Your Email and Password Again! ");
                            $('#btnSignIn').show();
                            if (parseInt(loginattempts) > 6) {
                                $('#btnSignIn').hide();
                            }
                            $('#loadbar').hide();
                            return false;
                        }
                    });
                }
                else {
                    alertify.error('Please enter all the fields')
                    return false;
                }
            })
        });

 </script>
  

</body>
</html>
