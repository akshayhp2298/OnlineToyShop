<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="OrderInvoice.aspx.vb" Inherits="OrderInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="templatemo_content_right">
        <div class="col-md-12">
            <div class="panel panel-success">
                
                <div class="panel panel-body">
                    <div id="">
                        <!-- /. ROW  -->
                        <div class="templatemo_product_box123">
                            <div class="col-md-12">
                                <div>
                                   
                                    <div align="center">
                                    Invoice
                                    </div>
                                    <hr />
                                    <table width=100%>
                                    <tr>
                                    <td>
                                        <div align="left">
                                          <asp:Image ID="mehtatoyshopimg" runat="server" ImageUrl="~/images/mehtatoyshop.png" Width="178px" />
                      
                                        </div>
                                        </td><td>
                                        <div align="right">
                                            <strong>Mehta Toy Shop</strong>
                                            <br />
                                            <i>Address :</i> 24 B
                                            <br />
                                            Naranpura, Ahmedabad
                                            <br />
                                            <span><strong>Email : </strong>abc@gmail.com </span>
                                            <br />
                                            <span><strong>Call : </strong>8866132298 </span>
                                        </div>
                                        </td>
                                        </tr>
                                        </table>
                                        <hr />
                                    <table width="100%">
                                    <tr>
                                    <td>
                                    &nbsp
                                    </td>
                                    <td align="right"><span><strong>Date : </strong></span> 
                                        <asp:Label ID="DateLabel" runat="server" Text=""></asp:Label>
                                    </td>
                                    </tr></table>
                                    <hr />
                                    <div class="row pad-top-botm client-info">
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                           
                                                <strong>Client Information :</strong>
                                                <br />
                                            <strong>
                                                <asp:Label ID="cusname" runat="server" Text="Label"></asp:Label>
                                               </strong>
                                            <br />
                                            <b>Address :</b>
                                            <asp:Label ID="add" runat="server" Text="del add"></asp:Label>
                                            <br />
                                            <b>Call :</b>
                                            <asp:Label ID="contact" runat="server" Text="contact"></asp:Label>
                                            <br />
                                            <b>E-mail :</b>
                                            <asp:Label ID="email" runat="server" Text="email"></asp:Label>
                                        </div>
                                    </div>
                                    <hr />
                                    <b>Order Detail : </b>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="table-responsive" align="center">
                                              
                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width=90%
                                                                                                        
                                                        DataSourceID="SqlDataSource1" BorderStyle="None">
                                                        <Columns>
                                                            <asp:ImageField DataImageUrlField="image_path" HeaderText="Image">
                                                                <ControlStyle Height="70px" Width="70px" />
                                                            </asp:ImageField>
                                                            <asp:BoundField DataField="p_name" HeaderText="Product" 
                                                                SortExpression="p_name" />
                                                            <asp:BoundField DataField="qty" HeaderText="Quantity" 
                                                                SortExpression="qty" />
                                                            <asp:BoundField DataField="amount" HeaderText="Amount" 
                                                                SortExpression="amount" />
                                                        </Columns>
                                                    </asp:GridView>
                                                
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
                                                        SelectCommand="SELECT Product_img.image_path, Product.p_name, Sales_detail.qty, Sales_detail.amount FROM Product INNER JOIN Product_img ON Product.p_id = Product_img.p_id INNER JOIN Sales_detail ON Product.p_id = Sales_detail.p_id INNER JOIN Sales ON Sales_detail.sales_id = Sales.sales_id WHERE (Sales.sales_id = @s_id)">
                                                        <SelectParameters>
                                                            <asp:QueryStringParameter Name="s_id" QueryStringField="s_id" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                
                                            </div>
                                            <hr />
                                            <div class="ttl-amts" style="font-size: 18px">
                                                <h5 align="right">
                                                    Total Amount :
                                                    <asp:Label ID="total" runat="server" Text="total"></asp:Label>
                                                </h5>
                                            </div>
                                            <hr />
                                            <div class="ttl-amts" style="font-size: 16px">
                                                <h5 align="right">
                                                    CGST :
                                                    <asp:Label ID="cgst" runat="server" Text="cgst"></asp:Label>
                                                    <br />
                                                    SGST :
                                                    <asp:Label ID="sgst" runat="server" Text="sgst"></asp:Label>
                                                </h5>
                                            </div>
                                            <hr />
                                            <div class="ttl-amts" style="font-size: 20px">
                                                <h4 align="right">
                                                    <strong>Bill Amount :
                                                        <asp:Label ID="billamount" runat="server" Text="bill amount"></asp:Label>
                                                    </strong>
                                                </h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
