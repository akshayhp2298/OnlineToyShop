<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false" CodeFile="PurchaseReport.aspx.vb" Inherits="Admin_Report_PurchaseReport" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <div align="center">
    <h1>Purchase Report</h1>
</div>
    Select Month :
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource2" DataTextField="Expr1" DataValueField="Expr2">
       
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        
        SelectCommand="SELECT DISTINCT DATENAME(month, DATEADD(month, MONTH(purchase_date), - 1)) AS Expr1, MONTH(purchase_date) AS Expr2 FROM Purchase">
    </asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    Select Year :&nbsp;
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="Expr1" DataValueField="Expr1">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        SelectCommand="SELECT DISTINCT YEAR(purchase_date) AS Expr1 FROM Purchase">
    </asp:SqlDataSource>
    <p>
&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Show All Record" />
    <br />&nbsp;&nbsp;
   
    </p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="purchase_id" 
        DataSourceID="SqlDataSource3" EmptyDataText="No Data" Width="90%">
        <Columns>
            <asp:BoundField DataField="purchase_id" HeaderText="Purchase Id" ReadOnly="True" 
                SortExpression="purchase_id" />
            <asp:BoundField DataField="s_name" HeaderText="Supplier" 
                SortExpression="s_name" />
            <asp:ImageField DataImageUrlField="image_path" HeaderText="Image">
                <ControlStyle Height="30px" Width="30px" />
            </asp:ImageField>
            <asp:BoundField DataField="p_name" HeaderText="Product" 
                SortExpression="p_name" />
            <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
            <asp:BoundField DataField="amount" HeaderText="amount" 
                SortExpression="amount" />
            <asp:BoundField DataField="tax" HeaderText="tax" SortExpression="tax" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        
        SelectCommand="SELECT Purchase.purchase_id, Supplier.s_name, Product_img.image_path, Product.p_name, Purchase_details.qty, Purchase.amount, Purchase.tax FROM Product_img INNER JOIN Product ON Product_img.p_id = Product.p_id INNER JOIN Purchase_details ON Product.p_id = Purchase_details.p_id INNER JOIN Purchase ON Purchase_details.purchase_id = Purchase.purchase_id INNER JOIN Supplier ON Purchase.s_id = Supplier.s_id WHERE (MONTH(Purchase.purchase_date) = @mon) AND (YEAR(Purchase.purchase_date) = @year)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="mon" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList2" Name="year" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        
        
        SelectCommand="SELECT Purchase.purchase_id, Supplier.s_name, Product_img.image_path, Product.p_name, Purchase_details.qty, Purchase.amount, Purchase.tax FROM Product_img INNER JOIN Product ON Product_img.p_id = Product.p_id INNER JOIN Purchase_details ON Product.p_id = Purchase_details.p_id INNER JOIN Purchase ON Purchase_details.purchase_id = Purchase.purchase_id INNER JOIN Supplier ON Purchase.s_id = Supplier.s_id">
    </asp:SqlDataSource>
    <br />
    


</asp:Content>

