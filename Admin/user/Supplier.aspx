<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false"
    CodeFile="Supplier.aspx.vb" Inherits="Admin_user_Supplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="templatemo_content_right" style="padding-left: 30px;">
        <div class="col-md-12">
            <div class="panel panel-success">
                <div class="panel panel-heading">
                    Supplier Profile
                </div>
                <div class="panel panel-body" align="center">
                    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="s_id"
                        DataSourceID="SqlDataSource1">
                        <EditItemTemplate>
                        <table>
                        <tr>
                        <td>Supplier ID:
                        </td>
                        <td> <asp:Label ID="s_idLabel1" runat="server" Text='<%# Eval("s_id") %>' />
                        </td>
                        </tr>
                        <tr>
                        <td> Supplier Name:
                        </td>
                        <td><asp:TextBox ID="s_nameTextBox" runat="server" Text='<%# Bind("s_name") %>' />
                            
                        </td>
                        </tr>
                        <tr>
                        <td> Address:
                        </td>
                        <td><asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                            
                        </td>
                        </tr>
                        <tr>
                        <td> Area ID:
                        </td>
                        <td> <asp:TextBox ID="area_idTextBox" runat="server" Text='<%# Bind("area_id") %>' />
                           
                        </td>
                        </tr>
                        <tr>
                        <td> Contact:
                        </td>
                        <td><asp:TextBox ID="contactTextBox" runat="server" Text='<%# Bind("contact") %>' />
                                                       
                        </td>
                        </tr>
                        <tr>
                        <td> Email_id:
                        </td>
                        <td><asp:TextBox ID="Email_idTextBox" runat="server" Text='<%# Bind("Email_id") %>' />
                            
                        </td>
                        </tr>
                        <tr>
                        <td>company_id:
                        </td>
                        <td><asp:TextBox ID="company_idTextBox" runat="server" Text='<%# Bind("company_id") %>' />
                            
                        </td>
                        </tr>
                        </table>                          
                           
                           
                           
                            
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        Supplier Name:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="s_nameTextBox" runat="server" Text='<%# Bind("s_name") %>' />
                                    </td>
                                    <td>
                                </tr>
                                <tr>
                                    <td>
                                        address:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        area_id
                                    </td>
                                    <td>
                                        <asp:TextBox ID="area_idTextBox" runat="server" Text='<%# Bind("area_id") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        contact:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="contactTextBox" runat="server" Text='<%# Bind("contact") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Email_id:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Email_idTextBox" runat="server" Text='<%# Bind("Email_id") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        company_id:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="company_idTextBox" runat="server" Text='<%# Bind("company_id") %>' />
                                    </td>
                                    <td>
                                </tr>
                            </table>
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Insert" OnClick="InsertButton_Click" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        Supplier ID:
                                    </td>
                                    <td>
                                        <asp:Label ID="s_idLabel" runat="server" Text='<%# Eval("s_id") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Supplier Name:
                                    </td>
                                    <td>
                                        <asp:Label ID="s_nameLabel" runat="server" Text='<%# Bind("s_name") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Address:
                                    </td>
                                    <td>
                                        <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Area_id:
                                    </td>
                                    <td>
                                        <asp:Label ID="area_idLabel" runat="server" Text='<%# Bind("area_id") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Contact:
                                    </td>
                                    <td>
                                        <asp:Label ID="contactLabel" runat="server" Text='<%# Bind("contact") %>' />
                                    </td>
                                    <tr>
                                        <td>
                                            Email_id:
                                        </td>
                                        <td>
                                            <asp:Label ID="Email_idLabel" runat="server" Text='<%# Bind("Email_id") %>' />
                                        </td>
                                    </tr>
                                </tr>
                                <tr>
                                    <td>
                                        company_id:
                                    </td>
                                    <td>
                                        <asp:Label ID="company_idLabel" runat="server" Text='<%# Bind("company_id") %>' />
                                    </td>
                                </tr>
                            </table>
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                Text="Edit" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="Delete" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                Text="New" />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
                        SelectCommand="SELECT * FROM [Supplier]" DeleteCommand="DELETE FROM [Supplier] WHERE [s_id] = @s_id"
                        InsertCommand="INSERT INTO [Supplier] ([s_id], [s_name], [address], [area_id], [contact], [Email_id], [company_id]) VALUES (@s_id, @s_name, @address, @area_id, @contact, @Email_id, @company_id)"
                        UpdateCommand="UPDATE [Supplier] SET [s_name] = @s_name, [address] = @address, [area_id] = @area_id, [contact] = @contact, [Email_id] = @Email_id, [company_id] = @company_id WHERE [s_id] = @s_id">
                        <DeleteParameters>
                            <asp:Parameter Name="s_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="s_id" Type="Int32" />
                            <asp:Parameter Name="s_name" Type="String" />
                            <asp:Parameter Name="address" Type="String" />
                            <asp:Parameter Name="area_id" Type="Int32" />
                            <asp:Parameter Name="contact" Type="Decimal" />
                            <asp:Parameter Name="Email_id" Type="String" />
                            <asp:Parameter Name="company_id" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="s_name" Type="String" />
                            <asp:Parameter Name="address" Type="String" />
                            <asp:Parameter Name="area_id" Type="Int32" />
                            <asp:Parameter Name="contact" Type="Decimal" />
                            <asp:Parameter Name="Email_id" Type="String" />
                            <asp:Parameter Name="company_id" Type="Int32" />
                            <asp:Parameter Name="s_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="panel panel-footer">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
