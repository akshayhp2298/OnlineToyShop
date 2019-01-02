<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false" CodeFile="SalesReport.aspx.vb" Inherits="Admin_Report_SalesReport" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  

  <div align="center">
    <h1>Sales Report</h1>
</div>


    Select Month :
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource2" DataTextField="Expr1" DataValueField="Expr2">
        
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        SelectCommand="SELECT DISTINCT DATENAME(month, DATEADD(month, MONTH(sales_date), - 1)) AS Expr1, MONTH(sales_date) AS Expr2 FROM Sales">
    </asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    Select Year :&nbsp;
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="Expr1" DataValueField="Expr1">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        SelectCommand="SELECT DISTINCT YEAR(sales_date) AS Expr1 FROM Sales">
    </asp:SqlDataSource>
     <asp:Button ID="Button1" runat="server" Text="Show All Record" />
&nbsp;
    <br />
    View by Customer :
&nbsp;&nbsp;<asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
        DataSourceID="cusname" DataTextField="name" DataValueField="c_id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="cusname" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        SelectCommand="SELECT { fn CONCAT({ fn CONCAT(fname, ' ') }, lname) } AS name, c_id FROM Customer">
    </asp:SqlDataSource>
    View By Product :
    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
        DataSourceID="productname" DataTextField="p_name" DataValueField="p_id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="productname" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        SelectCommand="SELECT [p_id], [p_name] FROM [Product]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="sales_id" 
        DataSourceID="SqlDataSource3" EmptyDataText="No Data" Width="90%">
        <Columns>
            <asp:BoundField DataField="sales_id" HeaderText="sales_id" ReadOnly="True" 
                SortExpression="sales_id" />
            <asp:BoundField DataField="fname" HeaderText="First Name" 
                SortExpression="fname" />
            <asp:BoundField DataField="lname" HeaderText="Last Name" 
                SortExpression="lname" />
            <asp:ImageField DataImageUrlField="image_path" HeaderText="Image">
                <ControlStyle Height="30px" Width="30px" />
            </asp:ImageField>
            <asp:BoundField DataField="p_name" HeaderText="Product" 
                SortExpression="p_name" />
            <asp:BoundField DataField="qty" HeaderText="Qty" SortExpression="qty" />
            <asp:BoundField DataField="amount" HeaderText="Amount" ReadOnly="True" 
                SortExpression="amount" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        SelectCommand="SELECT Sales.sales_id, Customer.fname, Customer.lname, Product_img.image_path, Product.p_name, Sales_detail.qty, Sales_detail.amount * Sales_detail.qty AS amount FROM Sales INNER JOIN Customer ON Sales.c_id = Customer.c_id INNER JOIN Sales_detail ON Sales.sales_id = Sales_detail.sales_id INNER JOIN Product_img INNER JOIN Product ON Product_img.p_id = Product.p_id ON Sales_detail.p_id = Product.p_id WHERE (MONTH(Sales.sales_date) = @mon) AND (YEAR(Sales.sales_date) = @year)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="mon" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DropDownList2" Name="year" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        
        SelectCommand="SELECT Sales.sales_id, Customer.fname, Customer.lname, Product_img.image_path, Product.p_name, Sales_detail.qty, Sales_detail.amount * Sales_detail.qty AS amount FROM Sales INNER JOIN Customer ON Sales.c_id = Customer.c_id INNER JOIN Sales_detail ON Sales.sales_id = Sales_detail.sales_id INNER JOIN Product_img INNER JOIN Product ON Product_img.p_id = Product.p_id ON Sales_detail.p_id = Product.p_id ">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        
        
        SelectCommand="SELECT Sales.sales_id, Customer.fname, Customer.lname, Product_img.image_path, Product.p_name, Sales_detail.qty, Sales_detail.amount * Sales_detail.qty AS amount FROM Sales INNER JOIN Customer ON Sales.c_id = Customer.c_id INNER JOIN Sales_detail ON Sales.sales_id = Sales_detail.sales_id INNER JOIN Product_img INNER JOIN Product ON Product_img.p_id = Product.p_id ON Sales_detail.p_id = Product.p_id WHERE (Customer.c_id = @c_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList3" Name="c_id" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
        
        
        SelectCommand="SELECT Sales.sales_id, Customer.fname, Customer.lname, Product_img.image_path, Product.p_name, Sales_detail.qty, Sales_detail.amount * Sales_detail.qty AS amount FROM Sales INNER JOIN Customer ON Sales.c_id = Customer.c_id INNER JOIN Sales_detail ON Sales.sales_id = Sales_detail.sales_id INNER JOIN Product_img INNER JOIN Product ON Product_img.p_id = Product.p_id ON Sales_detail.p_id = Product.p_id WHERE (Product.p_id = @p_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList4" Name="p_id" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
  




</asp:Content>

