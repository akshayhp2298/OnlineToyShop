<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
                
        .Star
        {
            background-image: url(images/Star.gif);
            height: 17px;
            width: 17px;
        }
        .WaitingStar
        {
            background-image: url(images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }
        .FilledStar
        {
            background-image: url(images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
    </style>
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
                                    <asp:Label ID="p_priceLabel" runat="server" Text='<%# Eval("p_price") %>' />&nbsp-
                                    <asp:Label ID="offerlbl" runat="server"  Text='<%# Eval("discount") %>' />%Off
                                </td>
                            </tr>
                        </table>
                        
                        <div  style="margin-left: -120px;">
                        
                            <cc1:Rating ID="Rating1" runat="server" EmptyStarCssClass="Star" readonly=true
                                FilledStarCssClass="FilledStar" StarCssClass="Star" CurrentRating='<%# Eval("rating") %>'
                                WaitingStarCssClass="WaitingStar">
                            </cc1:Rating>
                           
                            
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
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
             
             SelectCommand="SELECT Product_img.image_path, Product.p_id, Product.p_name, Brand.b_name, Category.category_name, Subcategory.subcategory_name, Product.p_price, Offer.discount, (SELECT CASE WHEN AVG(rating) IS NULL THEN 0 ELSE AVG(rating) END AS Expr1 FROM Rating WHERE (p_id = Product.p_id)) AS Rating FROM Product INNER JOIN Product_img ON Product.p_id = Product_img.p_id INNER JOIN Brand ON Product.brand_id = Brand.brand_id INNER JOIN Subcategory ON Product.subcategory_id = Subcategory.subcategory_id LEFT OUTER JOIN Category ON Subcategory.category_id = Category.category_id LEFT OUTER JOIN Rating AS Rating_1 ON Product.p_id = Rating_1.p_id LEFT OUTER JOIN Offer_detail ON Product.p_id = Offer_detail.p_id LEFT OUTER JOIN Offer ON Offer_detail.offer_id = Offer.offers_id AND { fn CURDATE() } &gt; Offer.start_date AND { fn CURDATE() } &lt; Offer.end_date">
        </asp:SqlDataSource>
    </div>
</asp:Content>
