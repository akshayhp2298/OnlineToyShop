<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Order.aspx.vb" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Admin/assets/css/invoice.css" rel="stylesheet" type="text/css" />
    
    <link href="Admin/assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div id="templatemo_content_right" style="padding-left: 30px;">
      
        <div class="col-md-12">
            <div class="panel panel-success">
                <div class="panel panel-heading">
                    Order Details..
                </div>
                <div class="panel panel-body">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:ImageField DataImageUrlField="image_path" HeaderText="Image">
                <ControlStyle Height="100px" Width="100px" />
            </asp:ImageField>
            <asp:BoundField DataField="p_name" HeaderText="Product" 
                SortExpression="p_name" />
            <asp:BoundField DataField="p_price" HeaderText="Price" 
                SortExpression="p_price" />
            <asp:BoundField DataField="Discount" HeaderText="Discount" ReadOnly="True" 
                SortExpression="Discount" />
               
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
        
                        SelectCommand="SELECT Product_img.image_path, Product.p_name, Product.p_price, Product.p_price * Offer.discount / 100 AS Discount, Product.p_price - Product.p_price * Offer.discount / 100 AS Amount FROM Product INNER JOIN Product_img ON Product.p_id = Product_img.p_id LEFT OUTER JOIN Offer_detail ON Product.p_id = Offer_detail.p_id LEFT OUTER JOIN Offer ON Offer_detail.offer_id = Offer.offers_id WHERE (Product.p_id = @p_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="p_id" QueryStringField="p_id" />
           
        </SelectParameters>
    </asp:SqlDataSource>
    <br />


    </div>

  
    Give Delivery Address...
    <asp:TextBox ID="deladd" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:LinkButton ID="LinkButton1" runat="server">Or Use Default Address..</asp:LinkButton>
        <br />
        <div>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="qtyTextBox"
                            ErrorMessage="Qty can not be less then 1" ForeColor="Red" MaximumValue="50" MinimumValue="1"
                            Type="Integer"></asp:RangeValidator>
                        Quantity:-<asp:TextBox ID="qtyTextBox" runat="server" Height="25px" Width="43px"
                            CausesValidation="False" TextMode="Number">1</asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="qtyTextBox"
                            ErrorMessage="Qty is Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>


        </div>
    
         
 <br />

 




   <br />
    <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Confirm Order"  />


    </div>
    </div>

    </div>
    

</asp:Content>

