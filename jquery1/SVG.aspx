<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SVG.aspx.cs" Inherits="jquery1.SVG" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="acme-free/js/jquery-1.12.3.min.js"></script>
   <%-- <script src="Snap.svg-0.5.1/dist/snap.svg-min.js"></script>
    <script src="Snap.svg-0.5.1/Gruntfile.js"></script>
    <link href="Styles/CustomStyles.css" rel="stylesheet" />--%>
    
<%--    <script src="AnimatedCheck/angular.min.js"></script>
    <script src="AnimatedCheck/angular-animate.min.js"></script>
    <link href="../AnimatedCheck/animated-check.css" rel="stylesheet" />
     <script src="../AnimatedCheck/animated-check.js"></script>--%>
    <script src="../../../../../acme-free/js/progressbar.min.js"></script>
   <%-- <script src="../../../../../acme-free/js/progressbar.min.js"></script>--%>
   <%-- <link href="../../../../../acme-free/css/CheckCrossAnimate.css" rel="stylesheet" />--%>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%--<h1>
            Cross Mark
        </h1>
    <svg class='crossmark' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 52 52'><circle class='crossmark__circle' cx='26' cy='26' r='25' fill='none' />  <path class='checkmark crossmark__check' fill='none' d='M16 16 36 36 M36 16 16 36' /></svg>
   --%>
        <h1>check mark</h1>
         <svg xmlns="http://www.w3.org/2000/svg" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                                <path fill-opacity="0" stroke-width="1" stroke="#bbb" d="M81.495,13.923c-11.368-5.261-26.234-0.311-31.489,11.032C44.74,13.612,29.879,8.657,18.511,13.923  C6.402,19.539,0.613,33.883,10.175,50.804c6.792,12.04,18.826,21.111,39.831,37.379c20.993-16.268,33.033-25.344,39.819-37.379  C99.387,33.883,93.598,19.539,81.495,13.923z" />
                                                <path id="heart-path" fill-opacity="0" stroke-width="3" stroke="#ED6A5A" d="M81.495,13.923c-11.368-5.261-26.234-0.311-31.489,11.032C44.74,13.612,29.879,8.657,18.511,13.923  C6.402,19.539,0.613,33.883,10.175,50.804c6.792,12.04,18.826,21.111,39.831,37.379c20.993-16.268,33.033-25.344,39.819-37.379  C99.387,33.883,93.598,19.539,81.495,13.923z" />
                                            </svg>
                 </div>
        <script>
            var bar_TotalQuestionMcqs_test = new ProgressBar.Circle(30, {
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
           // bar_TotalQuestionMcqs_test.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
          //  bar_TotalQuestionMcqs_test.text.style.fontSize = '2em';
          //  bar_TotalQuestionMcqs_test.set(10);
            //bar_TotalQuestionMcqs_test.animate(1.0);
        </script>
    </form>
</body>
</html>
