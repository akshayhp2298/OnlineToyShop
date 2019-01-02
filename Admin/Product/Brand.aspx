<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false"
    CodeFile="Brand.aspx.vb" Inherits="Admin_Product_Category" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
        DeleteCommand="DELETE FROM [Brand] WHERE [brand_id] = @brand_id" InsertCommand="INSERT INTO [Brand] ([brand_id], [b_name]) VALUES (@brand_id, @b_name)"
        SelectCommand="SELECT * FROM [Brand]" 
        UpdateCommand="UPDATE [Brand] SET [b_name] = @b_name WHERE [brand_id] = @brand_id">
        <DeleteParameters>
            <asp:Parameter Name="brand_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="brand_id" Type="Int32" />
            <asp:Parameter Name="b_name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="b_name" Type="String" />
            <asp:Parameter Name="brand_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="brand_id" DataSourceID="SqlDataSource1" ForeColor="#333333"
        GridLines="None" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="brand_id" HeaderText="brand_id" ReadOnly="True"
                SortExpression="brand_id" />
            <asp:BoundField DataField="b_name" HeaderText="b_name" 
                SortExpression="b_name" />
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
                Add Brand...</div>
                <div class="panel panel-body">
            <table align="center">
            <tr>
            <td>
                Brand :-
            </td>
            <td><asp:TextBox ID="TextBox1" placeholder="Enter Brand name..." runat="server"></asp:TextBox>
            </td>
            <td>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Brand Name is Required..." ControlToValidate="TextBox1" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        
            </td>
            </tr>
              </table>  
              </div>
              <div class="panel panel-footer" align="center">
                <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Add" /></div>
   


   



</asp:Content>
