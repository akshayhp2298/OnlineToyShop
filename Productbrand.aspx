<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Productbrand.aspx.vb" Inherits="Productbrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
            
             
            
            
        SelectCommand="SELECT Product_img.image_path, Product.p_id, Product.p_name, Brand.b_name, Category.category_name, Subcategory.subcategory_name, Product.p_price FROM Product INNER JOIN Product_img ON Product.p_id = Product_img.p_id INNER JOIN Brand ON Product.brand_id = Brand.brand_id INNER JOIN Subcategory ON Product.subcategory_id = Subcategory.subcategory_id INNER JOIN Category ON Subcategory.category_id = Category.category_id WHERE (Product.brand_id = @Brand_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Brand_id" QueryStringField="brand_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div id="templatemo_content_right">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="p_id" DataSourceID="SqlDataSource1"
            RepeatColumns="3" CellPadding="4" CellSpacing="3">
            <ItemTemplate>
                <div class="cleaner_with_width">
                    &nbsp;</div>
                <div class="templatemo_product_box">
                    <asp:Label ID="p_idLabel" runat="server" Text='<%# Eval("p_id") %>' Visible="false" />
                    <h1>
                        <span>
                            <asp:Label ID="p_nameLabel" runat="server" Text='<%# Eval("p_name") %>' /></span></h1>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image_path") %>' Width="100"
                        Height="127px" />
                    <div class="product_info">
                        <table>
                        <tr>
                                <td>
                                    Brand :-
                                </td>
                                <td>
                                    
                                       <asp:Label ID="p_brand" runat="server" Text='<%# Eval("b_name") %>' />
                                </td>
                            </tr>
                           <tr>
                                <td>
                                   Category :-
                                </td>
                                <td>
                                    
                                      <asp:Label ID="p_cat" runat="server" Text='<%# Eval("category_name") %>' />
                                </td>
                            </tr>
                             <tr>
                                <td>
                                   Sub-Category :-
                                </td>
                                <td>
                                    
                                      <asp:Label ID="p_subcat" runat="server" Text='<%# Eval("subcategory_name") %>' />
                                </td>
                            </tr>
                            
                          
                        
                            <tr>
                                <td>
                                    Price :-
                                </td>
                                <td>
                                    
                                        <asp:Label ID="p_priceLabel" runat="server" Text='<%# Eval("p_price") %>' />
                                </td>
                            </tr>

                        </table>
                        <div class="detail_button">
                            </div>
                        <br />
                        <br />
                    </div>
                    <br />
                    <br />
                    <br />
                    <br />
                    <div align="center">
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="30" ImageUrl="~/images/buy-now.png"
                            Width="100" CommandName="buynow" CommandArgument='<%# Eval("p_id") %>'/>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="30" ImageUrl="~/images/Addtocart.png"
                            Width="100" CommandName="addtocart" CommandArgument='<%# Eval("p_id") %>' />
                        <br />

                        <a href='<%#GenerateURL(Eval("p_id"))%>'>View Full Details...</a>
                        
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
       
       
    </div>
</asp:Content>

