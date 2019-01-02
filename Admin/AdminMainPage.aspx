<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false"
    CodeFile="AdminMainPage.aspx.vb" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-12">
        <div class="panel panel-success">
            <div class="panel panel-heading">
                New Order
            </div>
            <div class="panel panel-body">



                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="sales_id" DataSourceID="SqlDataSource1" 
                    ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="c_id" HeaderText="Cus ID" SortExpression="c_id" />
                        <asp:BoundField DataField="sales_id" HeaderText="Sales ID" ReadOnly="True" 
                            SortExpression="sales_id" />
                        <asp:ImageField DataImageUrlField="image_path" HeaderText="Image">
                            <ControlStyle Height="70px" Width="70px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="p_name" HeaderText="Product" 
                            SortExpression="p_name" />
                        <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
                        <asp:BoundField DataField="amount" HeaderText="amount" 
                            SortExpression="amount" />
                        <asp:BoundField DataField="sales_date" DataFormatString="{0:dd-MM-yyyy}" 
                            HeaderText="sales_date" SortExpression="sales_date" />
                        <asp:BoundField DataField="del_date" DataFormatString="{0:dd-MM-yyyy}" 
                            HeaderText="del_date" SortExpression="del_date" />
                        <asp:BoundField DataField="delivery_status" HeaderText="delivery_status" 
                            SortExpression="delivery_status" />
                        <asp:BoundField DataField="del_address" HeaderText="del_address" 
                            SortExpression="del_address" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
                    SelectCommand="SELECT Notification.c_id, Sales.sales_id, Product_img.image_path, Product.p_name, Sales_detail.qty, Sales_detail.amount, Sales.sales_date, Sales.del_date, Sales.delivery_status, Sales.del_address FROM Notification INNER JOIN Sales ON Notification.sales_id = Sales.sales_id INNER JOIN Sales_detail ON Sales.sales_id = Sales_detail.sales_id INNER JOIN Product ON Sales_detail.p_id = Product.p_id INNER JOIN Product_img ON Product.p_id = Product_img.p_id WHERE (Notification.status = 'notread')">
                </asp:SqlDataSource>

                <div class="panel panel-footer">
                <asp:Button runat=server Text="Seen" ID="seenbtn" onclick="Unnamed1_Click" />

                </div>



            </div>
        </div>
    </div>


    <div class="col-md-12">
        <div class="panel panel-success">
            <div class="panel panel-heading">
                Pending Order
            </div>
            <div class="panel panel-body">



                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataKeyNames="sales_id" DataSourceID="SqlDataSource2" 
                    ForeColor="#333333" GridLines="None" AllowSorting="True" 
                    AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="sales_id" HeaderText="sales_id" 
                            SortExpression="sales_id" ReadOnly="True" />
                            <asp:BoundField DataField="c_id" HeaderText="Cus_id" 
                            SortExpression="c_id" ReadOnly="True" />
                        <asp:ImageField HeaderText="Image" DataImageUrlField="image_path">
                            <ControlStyle Height="70px" Width="70px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="p_name" HeaderText="Product" 
                            SortExpression="p_name" />
                        <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
                        <asp:BoundField DataField="amount" HeaderText="amount" 
                            SortExpression="amount" />
                        <asp:BoundField DataField="sales_date" DataFormatString="{0:dd-MM-yyyy}" 
                            HeaderText="sales_date" SortExpression="sales_date" />
                        <asp:BoundField DataField="del_date" DataFormatString="{0:dd-MM-yyyy}" 
                            HeaderText="del_date" SortExpression="del_date" />
                        <asp:BoundField DataField="delivery_status" HeaderText="delivery_status" 
                            SortExpression="delivery_status" />
                        <asp:BoundField DataField="del_address" HeaderText="del_address" 
                            SortExpression="del_address" />
                        <asp:HyperLinkField DataNavigateUrlFields="sales_id" 
                            DataNavigateUrlFormatString="~/Default2.aspx?s_id={0}" Text="Delivered" />
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
                    
                    SelectCommand="SELECT Sales.sales_id, Product_img.image_path, Product.p_name, Sales_detail.qty, Sales_detail.amount, Sales.sales_date, Sales.del_date, Sales.delivery_status, Sales.del_address, Sales.c_id FROM Sales INNER JOIN Sales_detail ON Sales.sales_id = Sales_detail.sales_id INNER JOIN Product ON Sales_detail.p_id = Product.p_id INNER JOIN Product_img ON Product.p_id = Product_img.p_id WHERE (Sales.delivery_status = 'pending')" 
                    
                    UpdateCommand="UPDATE Sales SET delivery_status = 'Delivered' WHERE (sales_id = @s_id)">
                    <UpdateParameters>
                        <asp:Parameter Name="s_id" />
                    </UpdateParameters>
                </asp:SqlDataSource>



            </div>
        </div>
    </div>





    </asp:Content>
