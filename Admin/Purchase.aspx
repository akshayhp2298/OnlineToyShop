<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false"
    CodeFile="Purchase.aspx.vb" Inherits="Admin_Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 383px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-12">
        <div class="panel panel-success">
            <div class="panel panel-heading">
                Add Subcagory
            </div>
            <div class="panel panel-body">




                <table class="nav-justified">
                    <tr>
                        <td>
                            Supplier Name:</td>
                        <td class="style1">
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource1" DataTextField="s_name" DataValueField="s_id">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
                                SelectCommand="SELECT [s_id], [s_name] FROM [Supplier]"></asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Purchase Date:</td>
                        <td class="style1">
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage=" Date" ControlToValidate="TextBox2" Font-Bold="True" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Amount:</td>
                        <td class="style1">
                            <asp:TextBox ID="TextBox3" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ErrorMessage="* Amount is Required..." ControlToValidate="TextBox3" 
                                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tax:</td>
                        <td class="style1">
                            <asp:TextBox ID="TextBox4" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="* Tax is Required..." ControlToValidate="TextBox4" 
                                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Product Name:</td>
                        <td class="style1">
                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                DataSourceID="SqlDataSource2" DataTextField="p_name" DataValueField="p_id">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
                                SelectCommand="SELECT [p_name], [p_id] FROM [Product]"></asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Quantity:</td>
                        <td class="style1">
                            <asp:TextBox ID="TextBox5" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="* Quantity is Required..." ControlToValidate="TextBox5" 
                                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>




            </div>
            <div class="panel panel-footer">
                <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Add" />
            </div>
        </div>
    </div>
</asp:Content>
