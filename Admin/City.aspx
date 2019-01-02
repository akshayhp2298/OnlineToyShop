﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false"
    CodeFile="City.aspx.vb" Inherits="Admin_Product_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
        SelectCommand="SELECT * FROM [City]" 
        DeleteCommand="DELETE FROM [City] WHERE [city_id] = @city_id" 
        InsertCommand="INSERT INTO [City] ([city_id], [name]) VALUES (@city_id, @name)" 
        UpdateCommand="UPDATE [City] SET [name] = @name WHERE [city_id] = @city_id">
        <DeleteParameters>
            <asp:Parameter Name="city_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="city_id" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="city_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="city_id" DataSourceID="SqlDataSource1" ForeColor="#333333"
        GridLines="None" AllowPaging="True" AutoGenerateDeleteButton="True" 
        AutoGenerateEditButton="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="city_id" HeaderText="ID" ReadOnly="True"
                SortExpression="city_id" />
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
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
                Add City...</div>
                <div class="panel panel-body" align="center">
            <table>
            <tr>
            <td>
                City :-
            </td>
            <td><asp:TextBox ID="TextBox1" placeholder="Enter Category name..."  runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            </tr>
              </table>  
              </div>
              <div class="panel panel-footer" align="center">
                <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Add" /></div>

</asp:Content>