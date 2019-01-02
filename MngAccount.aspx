<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MngAccount.aspx.vb" Inherits="MngAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="tem">
    </div>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <div id="templatemo_content_right" style="padding-left: 30px;">
      
        <div class="col-md-12">
            <div class="panel panel-success">
                <div class="panel panel-heading">
                    Profile
                </div>
                <div class="panel panel-body">
                    <table align="center" 
                        style="font-size: large; text-transform: capitalize; table-layout: auto;">
                   
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
                        &nbsp</td></tr>
                        
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
                        &nbsp</td></tr>
                        
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
                        &nbsp</td></tr>
                        <tr>
                            <td>
                                Gender:
                            </td>
                            <td>
                                <asp:Label ID="genderLabel" runat="server" />
                            </td>
                        </tr>
                        <tr>
                        <td>
                        &nbsp</td></tr>
                        <tr>
                            <td>
                                BirthDate:
                            </td>
                            <td>
                                <asp:Label ID="dobLabel" runat="server" />
                            </td>
                        </tr>
                        <tr>
                        <td>
                        &nbsp</td></tr>
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
                        &nbsp</td></tr>
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
                        &nbsp</td></tr>
                        <tr>
                            <td>
                                &nbsp
                            </td>
                            <td>
                                
                            </td>
                        </tr><tr>
                        <td>
                        &nbsp</td></tr>
                        
                    </table>






                </div>
                <dir class="panel panel-footer">
                <asp:LinkButton ID="EditButton" runat="server" 
                                    Text="Edit" PostBackUrl="~/EditProfile.aspx" />
                <asp:LinkButton ID="LinkButton1" runat="server" 
                                    Text="Enter Child Detail" PostBackUrl="~/ChildDetail.aspx" />
                <asp:LinkButton ID="LinkButton2" runat="server" 
                                    Text="View Child Detail" PostBackUrl="~/ViewChildDetailaspx.aspx" />
                                    
                                    
                                    </dir>
            </div>
        </div>
        </div>
        
 




  
</asp:Content>
