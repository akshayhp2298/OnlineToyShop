<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="WishList.aspx.vb" Inherits="WishList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">




    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
        AutoGenerateColumns="False" DataKeyNames="c_id,p_id">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="p_name" HeaderText="Product" 
                SortExpression="p_name" />
            <asp:ImageField DataImageUrlField="image_path" HeaderText="Image">
                <ControlStyle Height="100px" Width="100px" />
            </asp:ImageField>
            <asp:BoundField DataField="c_id" HeaderText="c_id" ReadOnly="True" 
                SortExpression="c_id" Visible ="false" />
            <asp:BoundField DataField="p_id" HeaderText="p_id" ReadOnly="True" 
                SortExpression="p_id" />
        </Columns>
    </asp:GridView>




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        DeleteCommand="DELETE FROM WishList WHERE (c_id = @c_id) AND (p_id = @p_id)" 
        
        SelectCommand="SELECT Product.p_name, Product_img.image_path, WishList.c_id, WishList.p_id FROM WishList INNER JOIN Product ON WishList.p_id = Product.p_id INNER JOIN Product_img ON Product.p_id = Product_img.p_id WHERE (WishList.c_id = @c_id)">
        <DeleteParameters>
            <asp:Parameter Name="c_id" />
            <asp:Parameter Name="p_id" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter Name="c_id" SessionField="uid" />
        </SelectParameters>
    </asp:SqlDataSource>
    


</asp:Content>

