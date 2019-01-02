<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false"
    CodeFile="Admin.aspx.vb" Inherits="Admin_user_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="templatemo_content_right" style="padding-left: 30px;">
        <asp:Panel ID="Panel2" runat="server">
            <div class="col-md-12">
                <div class="panel panel-success">
                    <div class="panel panel-heading">
                        Profile
                    </div>
                    <div class="panel panel-body">
                        <table align="center" style="font-size: large; text-transform: capitalize; table-layout: auto;">
                            <tr>
                                <td>
                                    First Name:
                                </td>
                                <td>
                                    <asp:Label ID="fnameLabel" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Last Name:
                                </td>
                                <td>
                                    <asp:Label ID="lnameLabel" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address:
                                </td>
                                <td>
                                    <asp:Label ID="address1Label" runat="server" />
                                    <br />
                                    <asp:Label ID="address2Label" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Contact:
                                </td>
                                <td>
                                    <asp:Label ID="contactLabel" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email_id:
                                </td>
                                <td>
                                    <asp:Label ID="Email_idLabel" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp
                                </td>
                            </tr>
                        </table>
                    </div>
                    <dir class="panel panel-footer">
                        <asp:LinkButton ID="EditButton" runat="server" Text="Edit" /></dir>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Visible="false">
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
                                <td>
                                    <div class="form-group">
                                        <asp:TextBox ID="fnameTextBox" placeholder="First name..." Width="80%" runat="server"></asp:TextBox>
                                    </div>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* First Name is Required..."
                                        ControlToValidate="fnameTextBox" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Last Name :-
                                </td>
                                <td>
                                    <div class="form-group">
                                        <asp:TextBox ID="lnameTextBox" placeholder="Last name..." Width="80%" runat="server"></asp:TextBox></div>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Last Name is Required..."
                                        ControlToValidate="lnameTextBox" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address Line1 :-
                                </td>
                                <td>
                                    <div class="form-group">
                                        <asp:TextBox ID="Adddress_line1" placeholder="Addressline1..." Width="80%" runat="server"></asp:TextBox></div>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Adddress_line1"
                                        runat="server" ErrorMessage="* AdressLine1 is Required..." Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address Line2 :-
                                </td>
                                <td>
                                    <div class="form-group">
                                        <asp:TextBox ID="Address_line2" placeholder="Adressline2..." Width="80%" runat="server"></asp:TextBox></div>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Address_line2"
                                        runat="server" ErrorMessage="* AdressLine2 is Required..." Font-Bold="True" ForeColor="Red"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    City :-
                                </td>
                                <td>
                                    <div class="form-group">
                                        <asp:DropDownList ID="CityDropDownList" runat="server" AutoPostBack="True" DataSourceID="CitySqlDataSource"
                                            DataTextField="name" DataValueField="city_id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="CitySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
                                            SelectCommand="SELECT * FROM [City]"></asp:SqlDataSource>
                                    </div>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="CityDropDownList"
                                        runat="server" ErrorMessage="* city is Required..." Font-Bold="True" ForeColor="Red"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Area :-
                                </td>
                                <td>
                                    <div class="form-group">
                                        <asp:DropDownList ID="AreaDropDownList" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                                            DataTextField="name" DataValueField="area_id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
                                            SelectCommand="SELECT * FROM [Area] WHERE ([city_id] = @city_id)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="CityDropDownList" DefaultValue="1" Name="city_id"
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="AreaDropDownList"
                                        runat="server" ErrorMessage="* Area is Required..." Font-Bold="True" ForeColor="Red"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Contact No. :-
                                </td>
                                <td>
                                    <div class="form-group">
                                        <asp:TextBox ID="ContactTextBox" runat="server" placeholder="Contact Number..." TextMode="Phone"></asp:TextBox></div>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="ContactTextBox"
                                        runat="server" ErrorMessage="* contact Number is Required..." Font-Bold="True"
                                        ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    EmailID :-
                                </td>
                                <td>
                                    <div class="form-group">
                                        <asp:TextBox ID="EmailTextBox" runat="server" placeholder="Email-ID...    " TextMode="Email"></asp:TextBox></div>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="EmailTextBox"
                                        runat="server" ErrorMessage="* Email-ID is Required..." Font-Bold="True" ForeColor="Red"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <dir class="panel panel-footer">
                        <table align="center" width="500px">
                            <tr>
                                <td align="left">
                                    <asp:Button ID="UpdateButton" runat="server" class="btn btn-success" Text="Update" />
                                </td>
                                <td align="right">
                                    <div align="right">
                                        <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="Cancle" /></div>
                                </td>
                            </tr>
                        </table>
                    </dir>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
