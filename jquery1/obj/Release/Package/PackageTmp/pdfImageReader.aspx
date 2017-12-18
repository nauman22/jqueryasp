<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="pdfImageReader.aspx.cs" Inherits="jquery1.pdfImageReader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="ckeditor/skins/moono/editor.css" rel="stylesheet" />
    <script src="acme-free/js/jquery-1.12.3.min.js"></script>
    <link href="bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="row" id="divInformationPanel" runat="server">
                <div class="col-sm-4">
                    <div class="row">
                        <div class="col-sm-6">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </div>
                        <div class="col-sm-6">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">

                            <asp:TextBox ID="txtanswerkeys" runat="server" TextMode="MultiLine" Height="90px"></asp:TextBox>
                        </div>
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:DropDownList ID="ddlsubject" runat="server" CssClass="dropdown " Style="font-size: 11px; width: 185px;" DataSourceID="SqlDataSource1" DataTextField="SubjectName" DataValueField="SubjectId">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vuhomework %>" SelectCommand="SELECT DISTINCT [SubjectId], [SubjectName], [AdminId] FROM [tblSubjectInformation] WHERE (([AdminId] = @AdminId) AND ([SubjectDeletedbit] = @SubjectDeletedbit))">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="132" Name="AdminId" Type="Int32" />
                                            <asp:Parameter DefaultValue="FALSE" Name="SubjectDeletedbit" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:DropDownList ID="ddltest" CssClass="dropdown" Style="font-size: 11px; width: 185px;" runat="server" DataSourceID="SqlDataSource2" DataTextField="TestName" DataValueField="TestId" Height="19px" Width="60px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:vuhomework %>" SelectCommand="SELECT [TestId], [TestName], [AdminId] FROM [tblTest] WHERE (([TestDeletebit] = @TestDeletebit) AND ([AdminId] = @AdminId))">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="FALSE" Name="TestDeletebit" Type="Boolean" />
                                            <asp:Parameter DefaultValue="132" Name="AdminId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <select id="ddlPoints" class="" runat="server" style="font-size: 11px; width: 185px;">
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
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:Label ID="lblText" runat="server" Text="hello i am messge :) ; " Style="font-size: 11px;"></asp:Label>
                                </div>
                            </div>

                        </div>
                    </div>


                </div>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-sm-3">
                            <asp:Label runat="server" Text="Question Start Symbol "></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <asp:TextBox runat="server" ID="question_symbol"></asp:TextBox>
                        </div>
                        <div class="col-sm-3">
                            <asp:Label runat="server" Text="Option1 Start Symbol "></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <asp:TextBox runat="server" ID="txtop1_symbol"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <asp:Label runat="server" Text="Option2 Start Symbol "></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <asp:TextBox runat="server" ID="txtop2_symbol"></asp:TextBox>
                        </div>
                        <div class="col-sm-3">
                            <asp:Label runat="server" Text="Option3 Start Symbol "></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <asp:TextBox runat="server" ID="txtop3_symbol"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <asp:Label runat="server" Text="Option4 Start Symbol "></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <asp:TextBox runat="server" ID="txtop4_symbol"></asp:TextBox>
                        </div>
                        <div class="col-sm-3">
                            <asp:Label runat="server" Text="True False ?"></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <asp:RadioButtonList ID="rdbTrueFalse" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Selected="True" Value="0">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <asp:Label runat="server" Text="Correct Answer Symbol"></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <asp:TextBox runat="server" ID="txtCorrectAnswerSymbol"></asp:TextBox>
                        </div>
                        <div class="col-sm-3">
                            <asp:Label runat="server" Text="Cutting Style with Enter ?"></asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <asp:RadioButtonList ID="rdbEnter" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-5">
                            <asp:Label runat="server">Select Answer Auto from Answer box ?</asp:Label>
                        </div>
                        <div class="col-sm-3">
                            <asp:RadioButtonList ID="rdbSelectAnswerTextbox" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                       
                        <div class="col-sm-4">
                            <asp:Label runat="server" ID="lblqno"></asp:Label>
                        </div>
                    </div>

                </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <asp:TextBox runat="server" ID="txtrow" TextMode="MultiLine" Height="182px" Width="594px"></asp:TextBox>
                    </div>
                    <div class="col-sm-6">
                          <asp:TextBox ID="txtquestion" runat="server" Height="94px" TextMode="MultiLine" Width="740px" CssClass="txtq"></asp:TextBox>
                <asp:TextBox ID="txtqarray" runat="server" Text="0" Width="27px" style="display:none;"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                         <asp:CheckBox runat="server" ID="chk1" name="chkCorrect" CssClass="chk"/>
                        <asp:TextBox runat="server" ID="op1" Width="780px" CssClass="op1" TextMode="MultiLine">1986</asp:TextBox>
                <asp:TextBox ID="txtop1array" runat="server" Text="1" Width="27px" style="display:none;" ></asp:TextBox>
                    </div>
                    <div class="col-sm-6">
                        <asp:CheckBox runat="server" ID="chk2" name="chkCorrect" CssClass="chk" />
                         <asp:TextBox runat="server" ID="op2" Width="780px" CssClass="op2" TextMode="MultiLine">1986</asp:TextBox>
                <asp:TextBox ID="txtop2array" runat="server" Text="2" Width="27px" style="display:none;"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <asp:CheckBox runat="server" ID="chk3" name="chkCorrect" CssClass="chk"/>
                         <asp:TextBox runat="server" ID="op3" Width="780px" CssClass="op3" TextMode="MultiLine" >1986</asp:TextBox>
                <asp:TextBox ID="txtop3array" runat="server" Text="3" Width="27px" style="display:none;"></asp:TextBox>
                    </div>
                    <div class="col-sm-6">
                         <asp:CheckBox runat="server" ID="chk4" name="chkCorrect" CssClass="chk"/>
                         <asp:TextBox runat="server" ID="op4" Width="780px" CssClass="op4" TextMode="MultiLine">1986</asp:TextBox>
                <asp:TextBox ID="txtop4array" runat="server" Text="4" Width="27px" style="display:none;"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 checkbox-inline">
                        <asp:CheckBox runat="server" ID="chk5" name="chkCorrect" CssClass="chk" style="display:none;"/>
                        <asp:TextBox runat="server" ID="op5" Width="780px" style="display:none;">1986</asp:TextBox>
                        <asp:TextBox ID="txtop5array" runat="server" Text="5" Width="27px" style="display:none;"> </asp:TextBox>
                        <asp:TextBox ID="txtexp" runat="server"  Width="200px" Height="41" TextMode="MultiLine" PlaceHolder="Explanation" ></asp:TextBox>
        <asp:TextBox ID="txtref" runat="server"  Width="200px" Height="41" TextMode="MultiLine" PlaceHolder="Reference" > </asp:TextBox>
                    </div>
                    <div class="col-sm-6">
                         <asp:Button ID="btnSavenNext" Text="SAVE" runat="server" OnClick="btnSavenNext_Click" Height="47px" Width="120px" CssClass="btn btn-success"/>
        <asp:Button ID="btnNext" runat="server" Text="NEXT" OnClick="btnNext_Click"  Height="47px" Width="120px" CssClass="btn btn-info"   />
        <asp:Button ID="btnHideInformationPanel" runat="server" Height="47px"  Text="HIDE INFO PANEL"  OnClick="btnHideInformationPanel_Click" CssClass="btn btn-info" />
        <asp:Button ID="Button2" runat="server" Height="47px" OnClick="Button2_Click" Text="+" Width="46px" style="display:none;" />
        <asp:Label ID="lblTotalQuestionsFound" runat="server" Text=""></asp:Label> 
        <asp:Label ID="lblTotalQuestionFeeded" runat="server" Text="" Font-Bold="True" ForeColor="#006600"></asp:Label> 
        <asp:Label ID="lblTotalQuestionsRemaining" runat="server" Text=""></asp:Label> 
        <asp:Label ID="questionresutl" Font-Bold="true" runat="server" Text=""></asp:Label>
        <asp:Label ID="questionresult2" Font-Bold="true" runat="server" Text=""></asp:Label>
        <asp:Label ID="questionresut3" Font-Bold="true" runat="server" Text=""></asp:Label>
        <asp:Label ID="questionresut4" Font-Bold="true" runat="server" Text=""></asp:Label>
        <asp:Label ID="questionresut5" Font-Bold="true" runat="server" Text=""></asp:Label>
                         <asp:HiddenField runat="server" ID="hiddenrowtext" />
                         <asp:HiddenField ID="hidequestionno" Value="0" runat="server" />
        <asp:HiddenField ID="hideop1" Value="1" runat="server" />
        <asp:HiddenField ID="hideop2" Value="2" runat="server" />
        <asp:HiddenField ID="Hideop3" Value="3" runat="server" />
        <asp:HiddenField ID="Hideop4" Value="4" runat="server" />
        <asp:HiddenField ID="Hideop5" Value="5" runat="server" />
        <asp:HiddenField ID="HideCounter" Value="0" runat="server" />
                    </div>
                </div>
            </div>
      
            </div>
      </form>
    <footer>
        <script src="Scripts/jquery-1.11.3.min.js"></script>
        <script src="ckeditor/ckeditor.js"></script>
        <script src="ckeditor/styles.js"></script>
        <script src="ckeditor/config.js"></script>
        <script src="ckeditor/adapters/jquery.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                //  alert("hello");
                $('.txtq').ckeditor();
                $('.op1').ckeditor();
                $('.op2').ckeditor();
                $('.op3').ckeditor();
                $('.op4').ckeditor();

            })
        </script>
    </footer>
</body>

</html>
