<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="OrderReturn.aspx.vb" Inherits="OrderReturn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="templatemo_content_right">



    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" 
        GridLines="None" Width="100%" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:ImageField DataImageUrlField="image_path" HeaderText="Image">
                <ControlStyle Height="70px" Width="70px" />
            </asp:ImageField>
            <asp:BoundField DataField="p_name" HeaderText="p_name" 
                SortExpression="p_name" />
            <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
            <asp:BoundField DataField="amount" HeaderText="amount" 
                SortExpression="amount" />
            <asp:BoundField DataField="sales_date" HeaderText="sales_date" 
                SortExpression="sales_date" DataFormatString="{0:dd-MM-yyyy}" />
            <asp:BoundField DataField="delivery_status" HeaderText="delivery_status" 
                SortExpression="delivery_status" />
            <asp:BoundField DataField="sales_id" HeaderText="sales_id" 
                SortExpression="sales_id"  Visible=false/>
            <asp:BoundField DataField="p_id" HeaderText="p_id" SortExpression="p_id"  Visible=false/>
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
        <SortedAscendingCellStyle BackColor="#FDF5AC">
        </SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#4D0000">
        </SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#FCF6C0">
        </SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#820000">
        </SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        
        
        
        
        
        SelectCommand="SELECT Product_img.image_path, Product.p_name, Sales_detail.qty, Sales_detail.amount, Sales.sales_date, Sales.delivery_status, Sales.sales_id, Sales_detail.p_id FROM Sales INNER JOIN Sales_detail ON Sales.sales_id = Sales_detail.sales_id INNER JOIN Product ON Sales_detail.p_id = Product.p_id INNER JOIN Product_img ON Product.p_id = Product_img.p_id WHERE (Sales_detail.p_id = @p_id) AND (Sales_detail.sales_id = @s_id)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="p_id" QueryStringField="p_id" />
            <asp:QueryStringParameter Name="s_id" QueryStringField="s_id" />
        </SelectParameters>
    </asp:SqlDataSource>



    <br />
    Are You Sure Return This Product ?<br />
    <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text="Yes" />
    <asp:Button ID="Button2" runat="server" CssClass="brn btn-success" 
        Text="Cancel" />



    </div>

</asp:Content>

