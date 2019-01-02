<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="ProductDetail.aspx.vb" Inherits="ProductDetail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        
        .Star
        {
            background-image: url(images/Star.gif);
            height: 17px;
            width: 17px;
        }
        .WaitingStar
        {
            background-image: url(images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }
        .FilledStar
        {
            background-image: url(images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <div id="templatemo_content_right" style="padding-left: 30px;">
        <asp:Panel ID="Panel1" class="panel panel-default" runat="server">
            <table class="style2">
                <tr>
                    <td colspan="2">
                        <div class="panel panel-heading">
                            <h1>
                                <div align="left">
                                    <asp:Literal ID="ProductName" runat="server"></asp:Literal></div>
                                <div align="right">
                                    <asp:ImageButton ID="WishlistImageButton" Height="50" Width="50" runat="server" ImageUrl="~/images/wishlist.png" />
                                </div>
                               
                            </h1>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td rowspan="5" align="right" width="330px">
                        <div class="image_panel">
                            <asp:Image ID="ProductImage" Height="300px" Width="300px" runat="server" />
                        </div>
                    </td>
                    <td>
                        <div class="panel panel-body_pro">
                            Brand Name :-
                            <asp:Literal ID="BrandName" runat="server"></asp:Literal></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="panel panel-body_pro">
                            Category :-
                            <asp:Literal ID="CategoryName" runat="server"></asp:Literal></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="panel panel-body_pro">
                            Sub-category :-
                            <asp:Literal ID="SubcategoryName" runat="server"></asp:Literal></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="panel panel-body_pro">
                            Price :-
                            <asp:Literal ID="Price" runat="server"></asp:Literal>&nbsp-
                            <asp:Literal ID="discount" runat="server"></asp:Literal>%
                            </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="panel panel-body_pro">
                            Description :-
                            <asp:Literal ID="Desc" runat="server"></asp:Literal></div>
                    </td>
                </tr>
                <tr align="center">
                    <td align="center">
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="qtyTextBox"
                            ErrorMessage="Qty can not be less then 1" ForeColor="Red" MaximumValue="50" MinimumValue="1"
                            Type="Integer"></asp:RangeValidator>
                        Quantity:-<asp:TextBox ID="qtyTextBox" runat="server" Height="25px" Width="43px"
                            CausesValidation="False" TextMode="Number">1</asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="qtyTextBox"
                            ErrorMessage="Qty is Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                       
                    </td>
                    <td>&nbsp</td>
                    </tr>
                    <tr align="center">
                    <td >
                   
                         <asp:ImageButton ID="AddToCartImageButton" Height="80" Width="200" runat="server"
                            ImageUrl="~/images/Addtocart.png" />
                    </td>
                    <td >
                        <asp:ImageButton ID="Button4" runat="server" Height="80" Width="200" Text="Buy Now" ImageUrl="~/images/buy-now.png" />
                    </td>
                </tr>
                <tr><td> &nbsp</td></tr>
            </table>
        </asp:Panel>
        <hr />
        Give Rating To this Product...
        <asp:Button ID="Button3" runat="server" Text="Button" />
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <cc1:Rating ID="Rating1" runat="server" 
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
        FilledStarCssClass="FilledStar">
        <asp:Button ID="Button2" runat="server" Text="Button" />
    </cc1:Rating>
    
        <hr />
        <asp:Panel ID="Panel2" runat="server">
          
            <div class="col-md-12">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        Reviews...
                    </div>
                    <div class="panel-body">
                        <ul class="media-list">
                            <asp:DataList ID="DataList3" runat="server" DataSourceID="feedbackSqlDataSource"
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                CellPadding="4" ForeColor="Black" Width="100%">
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <ItemTemplate>
                                    <br />
                                    <li class="media">
                                        <div class="panel panel-footer">
                                            By...<br />
                                            
                                            <asp:Label ID="c_idLabel" runat="server" Text='<%# Bind("fname") %>' />
                                            <asp:Label ID="Label1" runat="server" Text=' <%# Bind("lname") %>' />
                                        </div>
                                        <div class="panel panel-body" align="center">
                                            <asp:Label ID="feedback_descLabel" runat="server" Text='<%# Bind("feedback_desc") %>' />
                                        </div>
                                        <div>
                                            Date:
                                            <asp:Label ID="feedback_dateLabel" runat="server" Text='<%# Bind("feedback_date") %>' />
                                        </div>
                                    </li>
                                </ItemTemplate>
                                <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            </asp:DataList>
                            <br />
                            <asp:SqlDataSource ID="feedbackSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
                                SelectCommand="SELECT * FROM [Feedback],[Customer] WHERE ([p_id] = @p_id) and ([Customer].c_id=[Feedback].c_id)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="p_id" QueryStringField="id" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ul>
                    </div>
                </div>
            </div>
            <div style="font-size: 20px">
               &nbsp;&nbsp;&nbsp;&nbsp; Give your Feedback to this...
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="feedbackTextBox" runat="server"></asp:TextBox>
                &nbsp;<asp:Button ID="Button1" class="btn btn-toolbar" runat="server" Text="Submit" />
            </div>
        </asp:Panel>
        <div class="cleaner_with_height">
        </div>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
