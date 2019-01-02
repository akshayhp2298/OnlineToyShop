<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false" CodeFile="Customer.aspx.vb" Inherits="Admin_user_Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




<link href="/OnlineToyShop/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <div id="templatemo_content_right" style="padding-left: 30px;">
      
        <div class="col-md-12">
            <div class="panel panel-success">
                <div class="panel panel-heading">
                    Customer
                    Profile
                </div>
                <div class="panel panel-body">
                    






              <table align="center">  

        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" 
            DataKeyNames="c_id" DataSourceID="SqlDataSource1" align="center" CellSpacing="0">
            
              
            <ItemTemplate>
                
              
                        <tr>
                        <td>
                         Customer Id:
                
                        </td>
                        <td><asp:Label ID="c_idLabel" runat="server" Text='<%# Eval("c_id") %>' /></td>
                        </tr><tr>
                        <td>&nbsp</td></tr>
                        <tr>
                            <td>
                                First Name:
                            </td>
                            <td>
                                <asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' />
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
                               <asp:Label ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>' />
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
                                <asp:Label ID="address1Label" runat="server" Text='<%# Bind("address1") %>' />
                <br />
                
                <asp:Label ID="address2Label" runat="server" Text='<%# Bind("address2") %>' />
                            </td>
                        </tr>
                        <tr>
                        <td>
                        &nbsp</td></tr>
                        <tr>
                        <td>Area :</td>
                        <td><asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' /></td>
                        </tr><tr>
                        <td>
                        &nbsp</td></tr>
                        <tr>
                        <td>City :</td>
                        <td><asp:Label ID="citylbl" runat="server" Text='<%# Bind("Expr1") %>' /></td>
                        </tr>
                        <tr>
                        <td>&nbsp</td></tr>
                        <tr>
                            <td>
                                Gender:
                            </td>
                            <td>
                <asp:Label ID="genderLabel" runat="server" Text='<%# Bind("gender") %>' />
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
                                <asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob") %>' />
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
                               <asp:Label ID="contactLabel" runat="server" Text='<%# Bind("contact") %>' />
               
               
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
                                 <asp:Label ID="Email_idLabel" runat="server" Text='<%# Bind("Email_id") %>' />
                            </td>
                        </tr>
                        <tr>
                        <td>
                        &nbsp</td></tr>
                        <tr>
                        <td>
                         User Name:
                
                        </td>
                        <td><asp:Label ID="user_nameLabel" runat="server" Text='<%# Bind("user_name") %>' />
              
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
                        <td>  Company Id:
                </td>
                <td>
                <asp:Label ID="company_idLabel" runat="server" 
                    Text='<%# Bind("company_id") %>' /></td>
                        </tr>
                        
                        <tr>
                        <td>
                        &nbsp</td></tr>
                        
                   
            </ItemTemplate>
             
        </asp:FormView>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
            SelectCommand="SELECT Customer.c_id, Customer.fname, Customer.lname, Customer.address1, Customer.address2, Area.name, City.name AS Expr1, Customer.gender, Customer.dob, Customer.contact, Customer.Email_id, Customer.user_name, Customer.company_id FROM City INNER JOIN Area ON City.city_id = Area.city_id INNER JOIN Customer ON Area.area_id = Customer.area_id"></asp:SqlDataSource>
            </div>
                <dir class="panel panel-footer">
               </dir>
            </div>
        </div>

        </div>
        
</asp:Content>

