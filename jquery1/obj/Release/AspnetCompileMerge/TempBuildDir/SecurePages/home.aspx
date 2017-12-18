<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="jquery1.SecurePages.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <select id="ddlSubject">
        <option value="1">NTS</option>
    </select><select id="ddlTest">
        <option value="1">NTS Test 1</option>
             </select>
        <input type="button" id="Practice" value="Practice" />
        <input type="button" id="Test" value="Test" />
    </div>
    </form>
</body>
</html>
