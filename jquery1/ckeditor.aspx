<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ckeditor.aspx.cs" Inherits="jquery1.ckeditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Bootstrap core CSS -->
    <link href="/acme-free/css/bootstrap.min.css" rel="stylesheet">
    <link href="acme-free/css/alertify.core.css" rel="stylesheet" />
    <link href="acme-free/css/alertify.default.css" rel="stylesheet" />
    <link href="/acme-free/css/theme.css" rel="stylesheet">
    <link href="/acme-free/css/bootstrap-reset.css" rel="stylesheet">
   
    <!--external css-->
    <link href="/acme-free/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    

    <link href="jquery.mobile.custom/jquery.mobile.custom.structure.min.css" rel="stylesheet" />
    <link href="jquery.mobile.custom/jquery.mobile.custom.theme.min.css" rel="stylesheet" />



    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="/acme-free/css/component.css">
    <link href="/acme-free/css/style.css" rel="stylesheet">
    <link href="/acme-free/css/style-responsive.css" rel="stylesheet" />
    <link href="/DataTables_1/datatables.min.css" rel="stylesheet" />
    <link href="/DataTables_1/Select-1.1.2/css/select.dataTables.min.css" rel="stylesheet" />
    <link href="/DataTables_1/Responsive-2.0.2/css/responsive.dataTables.min.css" rel="stylesheet" />
    <link href="/acme-free/css/tooltipster.css" rel="stylesheet" />
     <script src="acme-free/js/json2.js"></script>
    <script src="/Scripts/jquery-1.11.2.min.js"></script>
   
    <script src="/acme-free/js/bootstrap.min.js"></script>
        
        <script src="acme-free/js/jstorage.js"></script>
    <script src="/acme-free/js/alertify.min.js"></script>
    <script type="text/javascript" src="/acme-free/js/hover-dropdown.js"></script>
  
    <script src="/acme-free/js/jquery.blockUI.js"></script>

    <script src="/DataTables_1/datatables.min.js"></script>

    <script src="/DataTables_1/Select-1.1.2/js/dataTables.select.min.js"></script>

    <script src="/DataTables_1/Responsive-2.0.2/js/dataTables.responsive.js"></script>
    <script src="/ckeditor_5.6/plugins/mathjax/dialogs/mathjax.js"></script>
    
    <script src="/ckeditor_5.6/ckeditor.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
    <textarea name="txtQuestion" id="txtQuestion" style="width: 90%" ></textarea>
         <script type="text/javascript">        // jquery document ready function   
             $(function () {                    // 1. change the textarea into an editor   

              //   $('#txtQuestion')();
                 CKEDITOR.replace('txtQuestion', {
                     filebrowserBrowseUrl: '/FileBrowser',
                     filebrowserWindowWidth: 800,
                     filebrowserWindowHeight: 600
                     
                 });

             });             </script>
       <br />
        <br />
        <br />
     
        
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </form>
</body>
</html>
