<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Account_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LogIn</title>
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
        <div class="row text-center " style="padding-top: 10px;">
            <div class="col-md-12" style="left: -20px">
                <img src="../images/user.png" height="50" width="50" />
                <br />
                <h3>
                    Login...</h3>
            </div>
        </div>
        
        <div class="row1">
        
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
               
                <div class="panel-body">
                   <form role="form">
                    <hr />
                    <h5>
                        Enter Details to Login</h5>
                    <br />
                    <div class="form-group input-group">
                        <span class="input-group-addon"><i class="fa fa-tag"></i></span>
                        <asp:TextBox ID="UserNameTB" class="form-control" placeholder="Your Username " runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <asp:TextBox ID="PswdTB" class="form-control" placeholder="Your Password" 
                            runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        
                            <asp:CheckBox ID="CheckBox1" runat="server" />&nbsp  Remember Me
                            
                        
                        <span class="pull-right"><a href="ForgetPassword.aspx">Forget password ? </a></span>
                    </div>
                    <asp:Button ID="Button1" class="btn btn-primary "
                        runat="server" Text="LogIn" />
                    <hr />
                    Not register ?<a href="Registration.aspx">Click Here...</a> or go to <a href="../Default.aspx">Home</a>
                    </form>
                </div>
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
