<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="ChangePassword.aspx.vb" Inherits="Account_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="templatemo_content_right" style="padding-left: 30px;">
        <div class="col-md-12">
            <div class="panel panel-success">
                <div class="panel panel-heading">
                    Change Password.
                </div>
                <div class="panel panel-body">
                <div class="row1">
        
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                
                

                <asp:Panel ID="Panel1" runat="server">
                Enter Your Old Password
                 <div class="form-group input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <asp:TextBox ID="TextBox1" class="form-control" placeholder="Your Old Password" 
                            runat="server" TextMode="Password"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ControlToValidate="PswdTB" runat="server" ErrorMessage="* Confirm Password is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic" Enabled=false></asp:RequiredFieldValidator>
                       
                    </div>
                Enter New Password
                <div class="form-group input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <asp:TextBox ID="PswdTB" class="form-control" placeholder="Your New Password" 
                            runat="server" TextMode="Password"></asp:TextBox></div>
                            <div> <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ControlToValidate="PswdTB" runat="server" ErrorMessage="* Confirm Password is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>
                       
                       </div>
                    
                    Confirm Password
                    <div class="form-group input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <asp:TextBox ID="CPswdTB" class="form-control" placeholder="Confirm Password" 
                            runat="server" TextMode="Password"></asp:TextBox>
                           
                    </div>
                    <div>
                     <asp:CompareValidator ID="C" runat="server" ErrorMessage="Password & Confirm Password must be same..." ControlToCompare="PswdTB" Font-Bold="True" ForeColor="Red" ControlToValidate="CPswdTB" CultureInvariantValues="True" Display="Dynamic" ></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13"  ControlToValidate="CPswdTB" runat="server" ErrorMessage="* Confirm Password is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                       </div>
                    <asp:Button ID="Button3" class="btn btn-primary "
                        runat="server" Text="Finish" />

                </asp:Panel>
            </div>
        </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
