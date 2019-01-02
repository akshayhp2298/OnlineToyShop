<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ForgetPassword.aspx.vb" Inherits="Account_ForgetPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Forget Password...</title>
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link href="../Admin/assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            font-size: medium;
            width: 1012px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="templatemo_container_login">
        <div>
            <table>
                <tr>
                    <td class="style1">
                        <asp:Image ID="mehtatoyshopimg" runat="server" ImageUrl="~/images/mehtatoyshop.png"
                            Width="178px" />
                        <b style="font-family: Broadway; font-size: 40px; color: #663300">Mehta Toy Shop</b>
                    </td>
                    <td width="600px">
                        <div id="templatemo_menu_header">
                            <ul>
                                <li>
                                    <asp:LinkButton ID="accountlink" runat="server"><i class="fa fa-user"></i> Account</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="wishlistlink" runat="server"><i class="fa fa-star"></i> Wishlist</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="checkooutlink" runat="server"><i class="fa fa-crosshairs"></i> Checkout</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="cartlink" runat="server"><i class="fa fa-shopping-cart"></i> Cart</asp:LinkButton></li>
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
        <div class="row text-center " style="padding-top: 10px;">
            <div class="col-md-12" style="left: -20px">
                <img src="../images/user.png" height="50" width="50" />
                <br />
                <h3>
                    Forget Password</h3>
            </div>
        </div>
        
        <div class="row1">
        
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                <asp:Panel ID="Panel1" runat="server">
                <div class="panel-body">
                   <form role="form">
                    <hr />  
                    <h5>
                        Enter Your User Name</h5>
                    <br />
                    <div class="form-group input-group">
                        <span class="input-group-addon"><i class="fa fa-tag"></i></span>
                        <asp:TextBox ID="UserName" class="form-control" placeholder="Your Username " runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  ControlToValidate="UserName" runat="server" ErrorMessage="* Confirm Password is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                       
                    </div>
                    
                  
                    <asp:Button ID="Button1" class="btn btn-primary "
                        runat="server" Text="Next" />
                    <hr />
                   </form>
                </div>
               
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Visible=false>

                    <h5>
                        Security Question</h5>
                    <br />
                    <div class="form-group input-group">
                        <span class="input-group-addon"><i class="fa fa-question"></i></span>
                        <asp:TextBox ID="secque" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    
                    <h5>
                        Enter Your Answer</h5>
                    <br />
                    <div class="form-group input-group">
                        <span class="input-group-addon">Ans.</span>
                        <asp:TextBox ID="secans" class="form-control" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ControlToValidate="secans" runat="server" ErrorMessage="* Confirm Password is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic" Enabled=false></asp:RequiredFieldValidator>
                       
                    </div>
                    <asp:Button ID="Button2" class="btn btn-primary "
                        runat="server" Text="Next" />


                </asp:Panel>

                <asp:Panel ID="Panel3" runat="server" Visible=false>


                <div class="form-group input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <asp:TextBox ID="PswdTB" class="form-control" placeholder="Your Password" 
                            runat="server" TextMode="Password"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ControlToValidate="PswdTB" runat="server" ErrorMessage="* Confirm Password is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic" Enabled=false></asp:RequiredFieldValidator>
                       
                    </div>
                    <div class="form-group input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <asp:TextBox ID="CPswdTB" class="form-control" placeholder="Your Password" 
                            runat="server" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="C" runat="server" ErrorMessage="Password & Confirm Password must be same..." ControlToCompare="PswdTB" Font-Bold="True" ForeColor="Red" ControlToValidate="CPswdTB" CultureInvariantValues="True" Display="Dynamic" Enabled=false></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13"  ControlToValidate="CPswdTB" runat="server" ErrorMessage="* Confirm Password is Required..." Font-Bold="True" ForeColor="Red" Display="Dynamic" Enabled=false></asp:RequiredFieldValidator>
                       
                    </div>
                    <asp:Button ID="Button3" class="btn btn-primary "
                        runat="server" Text="Finish" />

                </asp:Panel>
            </div>
        </div>
        <!-- end of content right -->
        <div class="cleaner_with_height">
            &nbsp;</div>
        <!-- end of content -->
    </div>
    
    </form>
</body>
</html>
