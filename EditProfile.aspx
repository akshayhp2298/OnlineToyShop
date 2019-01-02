<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="EditProfile.aspx.vb" Inherits="EditProfile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <div id="templatemo_content_right" style="padding-left: 30px;">
<div class="col-md-12">
            <div class="panel panel-success">
                <div class="panel panel-heading">
                   Edit Profile
                </div>
                <div class="panel panel-body">
                    <table align="center">
                    <tr>
                        <td>
                            First Name:-
                        </td>
                        <td><div class="form-group">
                           
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
                            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                            </asp:ToolkitScriptManager>
                            <div class="form-group">
                            <asp:TextBox ID="birthdate" runat="server" placeholder="Your Birthdate..."  ></asp:TextBox>
                            
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="birthdate">
                                </asp:CalendarExtender> 
                            
                            </div>
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
                                <asp:ListItem id="male">Male</asp:ListItem>
                                <asp:ListItem id="female">Female</asp:ListItem>
                            </asp:RadioButtonList></div>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10"  ControlToValidate="RadioButtonList1" runat="server" ErrorMessage="* Gender is Required..." Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                         </td>
                    </tr>
               
                    
                </table>






                </div>
                <dir class="panel panel-footer">
                <asp:Button ID="UpdateButton" runat="server"  class="btn btn-success"
                                    Text="Update" />
                    <li>
                    </li>
                </dir>
            </div>
        </div>
        </div>
</asp:Content>

