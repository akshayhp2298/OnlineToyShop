<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false" CodeFile="PurchaseReturnReport.aspx.vb" Inherits="Admin_Report_PurchaseReturnReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div align="center">
    <h1>Purchase Return Report</h1>
</div>
    Select Month :<asp:DropDownList ID="DropDownList1" runat="server" 
        AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Expr1" 
        DataValueField="Expr2">
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    Select Year :
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource3" DataTextField="Expr1" DataValueField="Expr1">
    </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="Show All" />
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        
        SelectCommand="SELECT DISTINCT DATENAME(month, DATEADD(month, MONTH(purchase_return_date), - 1)) AS Expr1, MONTH(purchase_return_date) AS Expr2 FROM Purchase_return">
    </asp:SqlDataSource>
    View By Supplier :
    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource4" DataTextField="s_name" DataValueField="s_id">
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp; View By Product :
    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource5" DataTextField="p_name" DataValueField="p_id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        SelectCommand="SELECT [p_id], [p_name] FROM [Product]"></asp:SqlDataSource>
&nbsp;<asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        SelectCommand="SELECT [s_id], [s_name] FROM [Supplier]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        
        SelectCommand="SELECT DISTINCT YEAR(purchase_return_date) AS Expr1 FROM Purchase_return">
    </asp:SqlDataSource>
    <br />
&nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataKeyNames="purchase_return_id" DataSourceID="SqlDataSource1" 
        EmptyDataText="No Data" Width="90%">
        <Columns>
            <asp:BoundField DataField="purchase_return_id" HeaderText="Id" ReadOnly="True" 
                SortExpression="purchase_return_id" />
            <asp:ImageField DataImageUrlField="image_path" HeaderText="Image">
                <ControlStyle Height="30px" Width="30px" />
            </asp:ImageField>
            <asp:BoundField DataField="p_name" HeaderText="Product" 
                SortExpression="p_name" />
            <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty" />
            <asp:BoundField DataField="s_name" HeaderText="Supplier" 
                SortExpression="s_name" />
            <asp:BoundField DataField="purchase_return_date" DataFormatString="{0:d}" 
                HeaderText="Return date" SortExpression="purchase_return_date" />
            <asp:BoundField DataField="purchase_date" DataFormatString="{0:d}" 
                HeaderText="Purchase date" SortExpression="purchase_date" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        SelectCommand="SELECT Purchase_return.purchase_return_id, Product_img.image_path, Product.p_name, Purchase_return_detail.qty, Supplier.s_name, Purchase_return.purchase_return_date, Purchase.purchase_date FROM Purchase INNER JOIN Purchase_return ON Purchase.purchase_id = Purchase_return.purchase_id INNER JOIN Purchase_return_detail ON Purchase_return.purchase_return_id = Purchase_return_detail.purchase_return_id INNER JOIN Supplier ON Purchase.s_id = Supplier.s_id INNER JOIN Product ON Purchase_return_detail.p_id = Product.p_id INNER JOIN Product_img ON Product.p_id = Product_img.p_id">
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        SelectCommand="SELECT Purchase_return.purchase_return_id, Product_img.image_path, Product.p_name, Purchase_return_detail.qty, Supplier.s_name, Purchase_return.purchase_return_date, Purchase.purchase_date FROM Purchase INNER JOIN Purchase_return ON Purchase.purchase_id = Purchase_return.purchase_id INNER JOIN Purchase_return_detail ON Purchase_return.purchase_return_id = Purchase_return_detail.purchase_return_id INNER JOIN Supplier ON Purchase.s_id = Supplier.s_id INNER JOIN Product ON Purchase_return_detail.p_id = Product.p_id INNER JOIN Product_img ON Product.p_id = Product_img.p_id WHERE (MONTH(Purchase_return.purchase_return_date) = @mon) AND (YEAR(Purchase_return.purchase_return_date) = @year)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="mon" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList2" Name="year" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        SelectCommand="SELECT Purchase_return.purchase_return_id, Product_img.image_path, Product.p_name, Purchase_return_detail.qty, Supplier.s_name, Purchase_return.purchase_return_date, Purchase.purchase_date FROM Purchase INNER JOIN Purchase_return ON Purchase.purchase_id = Purchase_return.purchase_id INNER JOIN Purchase_return_detail ON Purchase_return.purchase_return_id = Purchase_return_detail.purchase_return_id INNER JOIN Supplier ON Purchase.s_id = Supplier.s_id INNER JOIN Product ON Purchase_return_detail.p_id = Product.p_id INNER JOIN Product_img ON Product.p_id = Product_img.p_id WHERE (Supplier.s_name = @s_name)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList3" Name="s_name" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        SelectCommand="SELECT Purchase_return.purchase_return_id, Product_img.image_path, Product.p_name, Purchase_return_detail.qty, Supplier.s_name, Purchase_return.purchase_return_date, Purchase.purchase_date FROM Purchase INNER JOIN Purchase_return ON Purchase.purchase_id = Purchase_return.purchase_id INNER JOIN Purchase_return_detail ON Purchase_return.purchase_return_id = Purchase_return_detail.purchase_return_id INNER JOIN Supplier ON Purchase.s_id = Supplier.s_id INNER JOIN Product ON Purchase_return_detail.p_id = Product.p_id INNER JOIN Product_img ON Product.p_id = Product_img.p_id WHERE (Product.p_id = @p_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList4" Name="p_id" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />


</asp:Content>

