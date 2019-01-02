<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false"
    CodeFile="Category.aspx.vb" Inherits="Admin_Product_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
        DeleteCommand="DELETE FROM [Category] WHERE [category_id] = @category_id" InsertCommand="INSERT INTO [Category] ([category_id], [category_name]) VALUES (@category_id, @category_name)"
        SelectCommand="SELECT [category_id], [category_name] FROM [Category]" UpdateCommand="UPDATE [Category] SET [category_name] = @category_name WHERE [category_id] = @category_id">
        <DeleteParameters>
            <asp:Parameter Name="category_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="category_id" Type="Int32" />
            <asp:Parameter Name="category_name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="category_name" Type="String" />
            <asp:Parameter Name="category_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="category_id" DataSourceID="SqlDataSource1" ForeColor="#333333"
        GridLines="None" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="category_id" HeaderText="category_id" ReadOnly="True"
                SortExpression="category_id" />
            <asp:BoundField DataField="category_name" HeaderText="category_name" SortExpression="category_name" />
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
    <br />
    <br />
    <div class="col-md-12">
        <div class="panel panel-success">
            <div class="panel panel-heading">
                Add Category...</div>
                <div class="panel panel-body">
            <table>
            <tr>
            <td>
                Categoty :-
            </td>
            <td><asp:TextBox ID="TextBox1" placeholder="Enter Category name..."  runat="server"></asp:TextBox>
            </td>
            <td>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Category Name is Required..." ControlToValidate="TextBox1" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        
            </td>
            </tr>
              </table>  
              </div>
              <div class="panel panel-footer" align="center">
                <asp:Button ID="Button1" runat="server" Text="Button" /></div>

</asp:Content>
