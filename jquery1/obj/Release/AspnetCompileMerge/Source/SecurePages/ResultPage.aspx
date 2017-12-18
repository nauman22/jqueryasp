<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResultPage.aspx.cs" Inherits="jquery1.SecurePages.ResultPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    
<body>
    <style>
        .dear{
            font-size:61px;
            font-family:serif;
            margin-left: 12%;
        }
        .username{
            font-size:61px;
            font-family:serif;
            
        }
        .yourstatus{
                margin-top: 2%;
                position:absolute;
            margin-left: 23%;
            font-size: 32px;
        }
        .userpercent{
            font-size: 70px;
             
             
                    position: absolute;
    margin-left: 38%;
        }
        .statuslbl{
                font-size: 88px;
    color: green;
    font-weight: bolder;
    font-family: sans-serif;
    position: absolute;
    margin-top: 4%;
    margin-left: 23%;

        }
        .status{
                font-size: 45px;
             margin-left: 12%;
            position: absolute;
             margin-top: 6%;
        }
        .mybtn{
                font-size: 100px;
    position: absolute;
    margin-top: 12%;
    color: currentColor;
    background-color: forestgreen;
        }
    </style>
    <form id="form1" runat="server">
    <div id="result " hidden="hidden">
        <div>
            <label class="dear">Dear </label><label id="UserName" class="username"> Nauman </label> <br />
            <label id="score" class="yourstatus"> Your Socre is </label><label id="userPercent" class="userpercent">50 % </label> <br />
            <label id="decided" class="status">Status </label><label id="lblStatus" class="statuslbl">Passed</label>


        </div>
        <input type="button" class="mybtn" value="Start Test Again" />
    </div>
        <div id="instructions">

            <input type="button" value="Start Test" />
        </div>
    </form>
</body>
</html>
