<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="excel.aspx.cs" Inherits="jquery1.excel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:FileUpload ID="FlUploadcsv" runat="server" />
                    <asp:Button ID="btnIpload" runat="server" Text="Import" OnClick="btnIpload_Click" />
        
        <asp:Button ID="onSite" runat="server" Text="Publish to the Site" OnClick="onSite_Click"  /><asp:Label runat="server" ID="lbl_wait_data"></asp:Label><asp:Label runat="server" ID="lblremainingrecords" Style="display:none;"></asp:Label>
        <a href="default.aspx">Home Page</a>
       <br />
         <asp:Label runat="server" ID="lblerror"></asp:Label>
        <br />
        <asp:Label runat="server" ID="Labelerrornotcompleted"></asp:Label>
        <br />
<asp:Label runat="server" ID="totalrows"></asp:Label>        <asp:Label runat="server" ID="lblcounts"></asp:Label>
<br />
<asp:GridView ID="gvEmployee" runat="server" width="80%" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">   
   <Columns>
    <asp:TemplateField HeaderText = "Sr.No." ItemStyle-Width="60">
        <ItemTemplate>
            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
        </ItemTemplate>

<ItemStyle Width="60px"></ItemStyle>
    </asp:TemplateField>
   
</Columns>
    <FooterStyle BackColor="White" ForeColor="#000066" />
    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
    <RowStyle ForeColor="#000066" />
    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#007DBB" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#00547E" />
</asp:GridView>

    </div>
    </form>
</body>
</html>
