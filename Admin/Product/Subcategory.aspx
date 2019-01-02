<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false"
    CodeFile="Subcategory.aspx.vb" Inherits="Admin_Product_Subcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        
       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="subcategory_id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display."
            ForeColor="#333333" GridLines="None" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="subcategory_id" HeaderText="ID" ReadOnly="True"
                    SortExpression="subcategory_id" />
                <asp:BoundField DataField="subcategory_name" HeaderText="Subcategory" 
                    SortExpression="subcategory_name" />
                <asp:BoundField DataField="category_id" HeaderText="Category_id" 
                    SortExpression="category_id" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
            DeleteCommand="DELETE FROM [Subcategory] WHERE [subcategory_id] = @subcategory_id"
            InsertCommand="INSERT INTO [Subcategory] ([subcategory_id], [subcategory_name], [category_id]) VALUES (@subcategory_id, @subcategory_name, @category_id)"
            SelectCommand="SELECT [subcategory_id], [subcategory_name], [category_id] FROM [Subcategory]"
            UpdateCommand="UPDATE [Subcategory] SET [subcategory_name] = @subcategory_name, [category_id] = @category_id WHERE [subcategory_id] = @subcategory_id">
            <DeleteParameters>
                <asp:Parameter Name="subcategory_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="subcategory_id" Type="Int32" />
                <asp:Parameter Name="subcategory_name" Type="String" />
                <asp:Parameter Name="category_id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="subcategory_name" Type="String" />
                <asp:Parameter Name="category_id" Type="Int32" />
                <asp:Parameter Name="subcategory_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <div class="col-md-12">
            <div class="panel panel-success">
                <div class="panel panel-heading">
                    Add Subcagory
                </div>
                <div class="panel panel-body">
                    <table align="center">
                        <tr>
                            <td>
                                Subcatgory Name :-
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" placeholder="Enter Subcategory..." runat="server"></asp:TextBox>
                            </td>
                            <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Subcategory Name is Required..." ControlToValidate="TextBox1" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                            </td>
                        </tr>
                        <tr>
                        <td>&nbsp</td>
                        </tr>
                        <tr>
                            <td>
                                Select Category :-
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="SqlDataSource2" DataTextField="category_name" 
                                    DataValueField="category_id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
                                    SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="panel panel-footer" align="center">
                    <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Add" />
                </div>
            </div>
        </div>
        <br />
        </form>
    
</asp:Content>
