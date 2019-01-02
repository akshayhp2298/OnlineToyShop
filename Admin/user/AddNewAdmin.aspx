<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false" CodeFile="AddNewAdmin.aspx.vb" Inherits="Admin_user_AddNewAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">





    <table align="center">
        <tr>
            <td>
                                First Name:-
                            </td>
            <td>
                <div class="form-group">
                    <asp:TextBox ID="fnameTextBox" placeholder="First name..." Width="80%" runat="server"
                                        ValidationGroup="ValidationSummary1"></asp:TextBox>
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
                    <asp:TextBox ID="lnameTextBox" placeholder="Last name..." Width="80%" runat="server"></asp:TextBox>
                </div>
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
                    <asp:TextBox ID="Adddress_line1" placeholder="Addressline1..." Width="80%" runat="server"></asp:TextBox>
                </div>
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
                    <asp:TextBox ID="Address_line2" placeholder="Adressline2..." Width="80%" runat="server"></asp:TextBox>
                </div>
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
                    <asp:TextBox ID="ContactTextBox" runat="server" placeholder="Contact Number..." TextMode="Phone"></asp:TextBox>
                </div>
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
                    <asp:TextBox ID="EmailTextBox" runat="server" placeholder="Email-ID...    " TextMode="Email"></asp:TextBox>
                </div>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="EmailTextBox"
                                    runat="server" ErrorMessage="* Email-ID is Required..." Font-Bold="True" ForeColor="Red"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                                User Name :-
                            </td>
            <td>
                <div class="form-group">
                    <asp:TextBox ID="UserNameTextBox" runat="server" placeholder="User Name..."></asp:TextBox>
                </div>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="UserNameTextBox"
                                        runat="server" ErrorMessage="* UserName is Required..." Font-Bold="True" ForeColor="Red"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
                            </td>
                        </tr>
        <tr>
            <td>
                                Password :-
                            </td>
            <td>
                <div class="form-group">
                    <asp:TextBox ID="PasswordTextBox" runat="server" placeholder="Password..." TextMode="Password"></asp:TextBox>
                </div>
            </td>
            <td>
                <div style="float:left;display:inline; width:120px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="PasswordTextBox"
                                    runat="server" ErrorMessage="* Password is Required..." Font-Bold="True" ForeColor="Red"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    Display="Dynamic" 
                                    ErrorMessage="*Must Contain [a - z  A - Z] [0-9] [special Chararcter]"
                                     
                                    ForeColor="Red"  Font-Bold=true
                                    ValidationExpression="^[a-zA-Z0-9'@&amp;#.\s]{7,10}$" ControlToValidate="PasswordTextBox"></asp:RegularExpressionValidator>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                                Confirm Password :-
                            </td>
            <td>
                <div class="form-group">
                    <asp:TextBox ID="CPasswordTextBox" runat="server" placeholder="Confirm Password..."
                                        TextMode="Password"></asp:TextBox>
                </div>
            </td>
            <td>
                <asp:CompareValidator ID="C" runat="server" ErrorMessage="Password & Confirm Password must be same..."
                                    ControlToCompare="PasswordTextBox" Font-Bold="True" ForeColor="Red" ControlToValidate="CPasswordTextBox"
                                    CultureInvariantValues="True" Display="Dynamic"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="CPasswordTextBox"
                                    runat="server" ErrorMessage="* Confirm Password is Required..." Font-Bold="True"
                                    ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                                Security Question :-
                            </td>
            <td>
                <div class="form-group">
                    <asp:DropDownList ID="secque" runat="server">
                        <asp:ListItem>What is Your Favourite Color?</asp:ListItem>
                        <asp:ListItem>What Is Your School Name?</asp:ListItem>
                        <asp:ListItem>What is Your Favoutite Food?</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="secque"
                                    runat="server" Font-Bold="True" ForeColor="Red" ErrorMessage="* Security question is Required..."
                                    Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                                Security Answer :-
                            </td>
            <td>
                <div class="form-group">
                    <asp:TextBox ID="secans" runat="server"></asp:TextBox>
                </div>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="secans"
                                    runat="server" ErrorMessage="* security answer is Required..." Font-Bold="True"
                                    ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>

     <div align="center">
                        <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Submit" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button class="btn btn-danger" ID="Button2" runat="server" Text="Cancel" 
                            PostBackUrl="~/Admin/user/Admin.aspx" />
                    </div>


</asp:Content>

