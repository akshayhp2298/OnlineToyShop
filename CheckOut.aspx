<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="CheckOut.aspx.vb" Inherits="CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="templatemo_content_right" style="padding-left: 30px;">
        <div class="col-md-12">
            <div class="panel panel-success">
                <div class="panel panel-heading">
                    Order Details..
                </div>
                <div class="panel panel-body">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="p_id,cart_id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:ImageField DataImageUrlField="image_path" HeaderText="Image">
                                <ControlStyle Height="100px" Width="100px" />
                            </asp:ImageField>
                            <asp:BoundField DataField="p_name" HeaderText="Product" 
                                SortExpression="p_name" />
                            <asp:BoundField DataField="p_id" HeaderText="p_id" ReadOnly="True" 
                                SortExpression="p_id" />
                            <asp:BoundField DataField="qty" HeaderText="Qty" SortExpression="qty" />
                            <asp:BoundField DataField="amount" HeaderText="Amount" 
                                SortExpression="amount" />
                            <asp:BoundField DataField="cart_date" HeaderText="Added Date" 
                                SortExpression="cart_date" />
                            <asp:BoundField DataField="cart_id" HeaderText="cart_id" ReadOnly="True" 
                                SortExpression="cart_id" />
                        </Columns>
                    </asp:GridView>
                   
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
                        DeleteCommand="DELETE FROM Cart_detail WHERE (p_id = @p_id)" 
                        SelectCommand="SELECT Product_img.image_path, Product.p_name, Cart_detail.p_id, Cart_detail.qty, Cart_detail.amount, Cart_detail.cart_date, Cart_detail.cart_id FROM Cart INNER JOIN Cart_detail ON Cart.cart_id = Cart_detail.cart_id INNER JOIN Product ON Cart_detail.p_id = Product.p_id INNER JOIN Product_img ON Product.p_id = Product_img.p_id WHERE (Cart.c_id = @c_id)">
                        <DeleteParameters>
                            <asp:Parameter Name="p_id" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="c_id" SessionField="uid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />

 Give Delivery Address...
    <asp:TextBox ID="deladd" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:LinkButton ID="LinkButton1" runat="server">Or Use Default Address..</asp:LinkButton>
        <br />
       
    
 <br />
   <br />
    <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Place Order" />

                </div>
                </div>
                </div>
                </div>
                
</asp:Content>
