<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="Cart.aspx.vb" Inherits="AddToCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="templatemo_content_right" style="padding-left: 30px;">
        <div class="col-md-12">
            <div class="panel panel-success">
                <div class="panel panel-heading">
                    Cart Details...
                </div>
                <div class="panel panel-body">
                    <asp:Label ID="Label1" runat="server" Text="There is no Item In your Cart..." Visible=false></asp:Label>
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Default.aspx" runat="server" Visible=false>Buy Now.</asp:HyperLink>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                    DataKeyNames="cart_id,p_id">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:ImageField DataImageUrlField="image_path" HeaderText="Image">
                            <ControlStyle Height="100px" Width="100px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="p_name" HeaderText="Product" 
                            SortExpression="p_name" />
                        <asp:BoundField DataField="qty" HeaderText="Qty" SortExpression="qty" />
                        <asp:BoundField DataField="amount" HeaderText="Amount" 
                            SortExpression="amount" />
                        <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
                        <asp:BoundField DataField="cart_date" HeaderText="Added Date" SortExpression="cart_date"
                            DataFormatString="{0:d}" />
                        <asp:BoundField DataField="cart_id" HeaderText="cart_id" ReadOnly="True" SortExpression="cart_id" Visible=false />
                        <asp:BoundField DataField="p_id" HeaderText="p_id" ReadOnly="True" SortExpression="p_id" Visible=false />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
                    DeleteCommand="DELETE FROM [Cart_detail] WHERE [cart_id] = @cart_id AND [p_id] = @p_id"
                    InsertCommand="INSERT INTO [Cart_detail] ([cart_id], [p_id], [qty], [amount], [cart_date]) VALUES (@cart_id, @p_id, @qty, @amount, @cart_date)"
                    SelectCommand="SELECT Product_img.image_path, Product.p_name, Cart_detail.qty, Cart_detail.amount, Cart_detail.qty * Cart_detail.amount AS Total, Cart_detail.cart_date, Cart_detail.cart_id, Cart_detail.p_id FROM Cart_detail INNER JOIN Cart ON Cart_detail.cart_id = Cart.cart_id INNER JOIN Product ON Cart_detail.p_id = Product.p_id INNER JOIN Product_img ON Product.p_id = Product_img.p_id WHERE (Cart.c_id = @c_id)"
                    UpdateCommand="UPDATE [Cart_detail] SET [qty] = @qty, [amount] = @amount, [cart_date] = @cart_date WHERE [cart_id] = @cart_id AND [p_id] = @p_id">
                    <DeleteParameters>
                        <asp:Parameter Name="cart_id" Type="Int32" />
                        <asp:Parameter Name="p_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="cart_id" Type="Int32" />
                        <asp:Parameter Name="p_id" Type="Int32" />
                        <asp:Parameter Name="qty" Type="Int32" />
                        <asp:Parameter Name="amount" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="cart_date" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="c_id" SessionField="uid" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="qty" Type="Int32" />
                        <asp:Parameter Name="amount" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="cart_date" />
                        <asp:Parameter Name="cart_id" Type="Int32" />
                        <asp:Parameter Name="p_id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </div>
            </div>
            <div class="panel panel-footer">
                <br />
                <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="CheckOut" />
                <br />
            </div>
        </div>
    </div>
</asp:Content>
