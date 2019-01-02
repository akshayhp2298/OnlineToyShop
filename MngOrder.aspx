<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="MngOrder.aspx.vb" Inherits="MngOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div id="templatemo_content_right" style="padding-left: 30px;" >


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" 
        GridLines="None" Width="100%" DataKeyNames="sales_id">

        <AlternatingRowStyle BackColor="White" />
        <Columns>
           
            <asp:ImageField DataImageUrlField="image_path" HeaderText="Image">
                <ControlStyle Height="100px" Width="100px" />
<ControlStyle Height="100px" Width="100px"></ControlStyle>
            </asp:ImageField>
            <asp:BoundField DataField="p_name" HeaderText="Product" 
                SortExpression="p_name" />
            <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty" />
            <asp:BoundField DataField="amount" HeaderText="Amount" 
                SortExpression="amount" />
            <asp:BoundField DataField="sales_date" HeaderText="Order Date" 
                SortExpression="sales_date" DataFormatString="{0:dd-MM-yyyy}" />
                <asp:BoundField DataField="delivery_status" HeaderText="Status" 
                SortExpression="delivery_status" />
                 <asp:BoundField DataField="sales_id"  
                SortExpression="sales_id" DataFormatString="{0:d}" Visible=false/>
            
           
  
            <asp:HyperLinkField text="View Invoice"
                SortExpression="sales_id" DataNavigateUrlFields="sales_id" 
                DataNavigateUrlFormatString="~/OrderInvoice.aspx?s_id={0}" />

            
          
            
            <asp:HyperLinkField DataNavigateUrlFields="sales_id,p_id" 
                DataNavigateUrlFormatString="~/OrderReturn.aspx?s_id={0}&amp;p_id={1}" 
                Text="Return"></asp:HyperLinkField>

            
          
            
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

<SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        
        
        SelectCommand="SELECT Product_img.image_path, Product.p_name, Sales_detail.qty, Sales_detail.amount, Sales.sales_date, Sales.delivery_status, Sales.sales_id, Sales_detail.p_id FROM Sales INNER JOIN Sales_detail ON Sales.sales_id = Sales_detail.sales_id INNER JOIN Product ON Sales_detail.p_id = Product.p_id INNER JOIN Product_img ON Product.p_id = Product_img.p_id WHERE (Sales.c_id = @c_id)">
        <SelectParameters>
            <asp:SessionParameter Name="c_id" SessionField="uid" />
        </SelectParameters>
    </asp:SqlDataSource>


    </div>


</asp:Content>

