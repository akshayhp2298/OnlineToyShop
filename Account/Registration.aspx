<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Registration.aspx.vb" Inherits="Account_Registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Register Yourself with us...</title>
    <link href="../css/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style4
        {
            font-size: medium;
            width: 970px;
        }
    </style>
</head>
<body>
 <form id="Form1" runat=server>  
    <div id="templatemo_container_login">
        <div>
        
            <table>
                <tr>
                    <td class="style4">
                        <asp:Image ID="mehtatoyshopimg" runat="server" ImageUrl="~/images/mehtatoyshop.png"
                            Width="178px" />
                        <b style="font-family: Broadway; font-size: 40px; color: #663300">Mehta Toy Shop</b>
                    </td>
                    <td width="600px">
                        <div id="templatemo_menu_header">
                            <ul>
                                 <li><asp:LinkButton ID="accountlink" runat="server" PostBackUrl="~/MngAccount.aspx"><i class="fa fa-user"></i> Account</asp:LinkButton></li>
                                <li><asp:LinkButton ID="wishlistlink" runat="server"  PostBackUrl="~/WishList.aspx"><i class="fa fa-star"></i> Wishlist</asp:LinkButton></li>
                                <li><asp:LinkButton ID="orderlink" runat="server" PostBackUrl="~/MngOrder.aspx"><i class="fa fa-briefcase"></i>&nbspView Order</asp:LinkButton></li>
                                <li><asp:LinkButton ID="cartlink" runat="server"  PostBackUrl="~/Cart.aspx"><i class="fa fa-shopping-cart"></i> Cart</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="loginlink" runat="server"><i class="fa fa-lock"></i> Login</asp:LinkButton></li>
                            </ul>
                        </div>
                    </td>
                </tr>
            </table>
            
            
        </div>
        <hr style="height: 1px; color: #663300" />
        <div id="templatemo_menu">
            <ul>
                <li><a href="../Default.aspx" class="current">Home</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </div>
        
        <!-- end of menu -->
        <br />
        <br />
        <!-- end of header -->
        <div id="templatemo_content_login" align="center">
            </div>
            
            <div class="row">
            <div class="col-md-10">
            <div class="panel panel-info">

            <div class="panel-heading">
                           <h1 align="center">
                Registeration</h1>
                        </div>
           <br>
            <!-- One "tab" for each step in the form: -->
                <table align="center">
                    <tr>
                        <td>
                            First Name:-
                        </td>
                        <td><div class="form-group">
                            <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server">
                            </asp:ToolkitScriptManager>
                            <asp:TextBox ID="fnameTextBox" placeholder="First name..." Width="80%" runat="server" ValidationGroup="ValidationSummary1"></asp:TextBox>
                            </div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* First Name is Required..." ControlToValidate="fnameTextBox" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                            Last Name :-
                        </td>
                        <td><div class="form-group">
                            <asp:TextBox ID="lnameTextBox" placeholder="Last name..." Width="80%" runat="server"></asp:TextBox></div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Last Name is Required..." ControlToValidate="lnameTextBox" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Address Line1 :-
                        </td>
                        <td><div class="form-group">
                            <asp:TextBox ID="Adddress_line1" placeholder="Addressline1..." Width="80%" runat="server"></asp:TextBox></div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  ControlToValidate="Adddress_line1" runat="server" ErrorMessage="* AdressLine1 is Required..." Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Address Line2 :-
                        </td>
                        <td><div class="form-group">
                            <asp:TextBox ID="Address_line2" placeholder="Adressline2..." Width="80%" runat="server"></asp:TextBox></div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Address_line2" runat="server" ErrorMessage="* AdressLine2 is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            City :-
                        </td>
                        <td><div class="form-group">
                            <asp:DropDownList ID="CityDropDownList" runat="server" AutoPostBack="True" 
                                DataSourceID="CitySqlDataSource" DataTextField="name" DataValueField="city_id">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="CitySqlDataSource" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
                                SelectCommand="SELECT * FROM [City]"></asp:SqlDataSource></div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  ControlToValidate="CityDropDownList" runat="server" ErrorMessage="* city is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Area :-
                        </td>
                        <td><div class="form-group">
                            <asp:DropDownList ID="AreaDropDownList" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="area_id">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
                                SelectCommand="SELECT * FROM [Area] WHERE ([city_id] = @city_id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="CityDropDownList" DefaultValue="1" 
                                        Name="city_id" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource></div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6"  ControlToValidate="AreaDropDownList" runat="server" ErrorMessage="* Area is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
               
                    <tr>
                        <td>
                            Contact No. :-
                        </td>
                        <td><div class="form-group">
                            <asp:TextBox ID="ContactTextBox" runat="server" placeholder="Contact Number..." 
                                TextMode="Phone"></asp:TextBox></div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7"  ControlToValidate="ContactTextBox" runat="server" ErrorMessage="* contact Number is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            EmailID :-
                        </td>
                        <td><div class="form-group">
                            <asp:TextBox ID="EmailTextBox" runat="server" placeholder="Email-ID...    " 
                                TextMode="Email"></asp:TextBox></div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8"  ControlToValidate="EmailTextBox" runat="server" ErrorMessage="* Email-ID is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
               
                    <tr>
                        <td>
                            Birth Date :-
                        </td>
                        <td>
                            <div class="form-group">
                            <asp:TextBox ID="birthdate" runat="server" placeholder="Your Birthdate..."></asp:TextBox><asp:CalendarExtender
                                ID="CalendarExtender1" runat="server" TargetControlID="birthdate">
                            </asp:CalendarExtender></div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9"  ControlToValidate="birthdate" runat="server" ErrorMessage="* Birthdate is Required..." Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender :-
                        </td>
                        <td width=200px><div class="form-group">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server"
                                Height="49px" Width="108px">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:RadioButtonList></div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10"  ControlToValidate="RadioButtonList1" runat="server" ErrorMessage="* Birthdate is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                       
                         </td>
                    </tr>
               
                    <tr>
                        <td>
                            User Name :-
                        </td>
                        <td><div class="form-group">
                            <asp:TextBox ID="UserNameTextBox" runat="server"></asp:TextBox></div>
<td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11"  ControlToValidate="UserNameTextBox" runat="server" ErrorMessage="* UserName is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password :-
                        </td>
                        <td><div class="form-group">
                            <asp:TextBox ID="PasswordTextBox" runat="server" placeholder="Password..." TextMode="Password"></asp:TextBox></div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12"  ControlToValidate="PasswordTextBox" runat="server" ErrorMessage="* Password is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Confirm Password :-
                        </td>
                        <td><div class="form-group">
                            <asp:TextBox ID="CPasswordTextBox" runat="server" placeholder="Confirm Password..." TextMode="Password"></asp:TextBox></div>
                        </td>
                        <td>
                            <asp:CompareValidator ID="C" runat="server" ErrorMessage="Password & Confirm Password must be same..." ControlToCompare="PasswordTextBox" Font-Bold="True" ForeColor="Red" ControlToValidate="CPasswordTextBox" CultureInvariantValues="True" Display="Dynamic"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13"  ControlToValidate="CPasswordTextBox" runat="server" ErrorMessage="* Confirm Password is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Security Question :-
                        </td>
                        <td><div class="form-group">
                            <asp:DropDownList ID="secque" runat="server">
                                <asp:ListItem>What is Your Favourite Color?</asp:ListItem>
                                <asp:ListItem>What Is Your School Name?</asp:ListItem>
                                <asp:ListItem>What is Your Favoutite Food?</asp:ListItem>
                            </asp:DropDownList></div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14"  ControlToValidate="secque" runat="server" Font-Bold="True" ForeColor="Red" ErrorMessage="* Security question is Required..." Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Security Answer :-
                        </td>
                        <td>
                            <div class="form-group">
                            <asp:TextBox ID="secans" runat="server"></asp:TextBox></div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15"  ControlToValidate="secans" runat="server" ErrorMessage="* security answer is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>

                <div align=center>
                <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Submit" />
                 
                </div>
                <br />
           </div>
           </div>
           </div>
            <!-- Circles which indicates the steps of the form: -->
        
            </form>
        </div>
    </div>
    <br />
    <br />
    <br />
    

    </form>
</body>
</html>
