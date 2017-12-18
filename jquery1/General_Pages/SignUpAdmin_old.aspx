<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpAdmin_old.aspx.cs" Inherits="jquery1.SignUpAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Free Mcqs</title>
    <link rel="icon" href="../acme-free/img/faviconFinal.ico"/>
    <script src="../Scripts/jquery-1.11.2.min.js"></script>
    <link href="../bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/CustomStyles.css" rel="stylesheet" />
 <script type="text/javascript">

     var emptyUserNameMessage = 'Hey, Enter your Email here.';
     var progressUserNameMessage = 'Checking...';
     var availableUserNameMessage = 'WOW beautiful Email address.';
     var usedUserNameMessage = 'This Email already in our System';
     var lblNameResponse = 'So thats they called you hmmm.';
     var lblEnterName = 'Hi enter your good name please :)';
     var PaswordRequired = ' Give your password here OK.';
     var PaswordGiven =' OH MY WORD!  ';

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
                 $('#lblPassword').html('Hey ' + $('#txtAdminName').val().toUpperCase()+ '. ' + PaswordRequired);
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
                 if(!pattern.test(txtAdmintext)){
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
                     success: function (data) {
                         var obj = data.d;
                         console.log(obj);
                         var arr = obj.split(",");
                         console.log("part 1 is = "+arr[0] + " and part 2 is " + arr[1])
                         if (arr[0] == 9) {
                             $('#lblSignInmsg').html("<h1>You are Sign-In Successfully</h1>");

                             window.location = "../acme-free/myindex.aspx?adminid=" + arr[1];
                         }
                         if (arr[0] == 8) {
                            $('#lblSignInmsg').html("<h1>You are Sign-In Successfully</h1>");

                             window.location = "../acme-free/myindex.aspx?adminid=" + arr[1];
                         }
                         if (arr[0] == 3) {
                             $('#lblSignInmsg').html("<h1>You are Sign-In Successfully</h1>");

                             window.location = "../SecurePages/User.aspx";
                         }

                         else if (arr[0] == 0) {
                             $('#lblSignInmsg').html("<h3>Please Check Your Email and Password Again! 0</h3>");
                         }

                         else if (arr[0] == -1) {
                             $('#lblSignInmsg').html("<h3>Please Check Your Email and Password Again! -1</h3>");
                         }
                     },
                     error: function (result) {
                         $('#lblSignInmsg').html("<h3>Please Check Your Email and Password Again! 0</h3>");
                         return false;
                     }
                 });
             }
             else {
                 alert('Please enter all the fields')
                 return false;
             }
         })
     });

 </script>
  
</head>
<body class="bodyBackground" >

    <form id="form1" runat="server">
        
        <div class="container center">
            <h1>Sign-Up</h1>
            <div class="form-horizontal col-md-8 col-md-offset-2 panel-group">
                <div class="form-group panelbg" id="divSignUp">
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-12 col-md-offset-2">
                           <input type="text" class="input-lg" autofocus="autofocus" placeholder="Name" id="txtAdminName" />
                            <label id="lblName" ></label>
                        </div>
                        </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12 text-left col-md-offset-2">
                            <input type="email" class="input-lg " placeholder="Email Address" id="txtAdminEmail" />
                            <label id="userNameAvailabilityLabel" ></label>
                             <span id="ProgressDiv" class="hide">Loading..</span>
                        </div>
                    </div>
                    <br />
                    <div class="row">

                        <div class="col-md-12 text-left col-md-offset-2">
                            <input type="password" class="input-lg" placeholder="Password" id="txtAdminpassword" />
                            <label id="lblPassword" ></label>
                        </div>
                    </div>
                    <br />
                  <%--  <div class="row">
                        <div class="g-recaptcha col-sm-4 col-sm-offset-2" data-sitekey="6LfdDgoTAAAAAHlQ4SX8uQUJsTqbVlJRXHYoltnS"></div>
                    </div>--%>
                    <br />
                    <div class="row">
                        <div class="col-md-4 text-left col-md-offset-2">
                            <input type="button" value="Sign-Up" class="btn-info btn-lg" id="btnSignUp" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4">
                            <label id="lblmsg"/><br />
                        </div>
                    </div>
                </div>
                 <div class="form-group panelbg" id="divSignIn">
                   <div class="row">
                        <div class="col-md-12 col-md-offset-2">
                           <input type="email" class="input-lg" autofocus="autofocus" placeholder="Email" id="txtSignInEmail" value="" />
                            <label id="lblSignInEmail" ></label>
                        </div>
                        </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12 text-left col-md-offset-2">
                            <input type="password" class="input-lg " placeholder="Password" value="" id="txtSignInPassword" />
                            <label id="lblSignInPassword" ></label>
                             <span id="ProgressDivSignIn" class="hide">Loading...</span>
                        </div>
                    </div>
                       <div class="row">
                        <div class="col-md-4 text-left col-md-offset-2">
                            <input type="button" value="SignIn" class="btn-info btn-lg" id="btnSignIn" />
                        </div>
                         
                    </div>
                      <div class="row">
                        <div class="col-md-4 col-md-offset-4">
                            <label id="lblSignInmsg"/><br />
                        </div>
                    </div>
                     </div>
            </div>
        </div>
    </form>
  
</body>
</html>
