<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false" CodeFile="PurchaseReturn.aspx.vb" Inherits="Admin_PurchaseReturn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="col-md-12">
        <div class="panel panel-success">
            <div class="panel panel-heading">
               Purchase Return
            </div>
            <div class="panel panel-body">



    <p>
        Select Product :
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="p_name" DataValueField="p_id" 
            AutoPostBack="True">
        </asp:DropDownList>
        <div style="display:none">

         <asp:DropDownList ID="DropDownList2" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="purchase_id" 
            DataValueField="purchase_id" AutoPostBack="True" ViewStateMode="Enabled">
        </asp:DropDownList>
        
</div>        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
            SelectCommand="SELECT Product.p_name, Product.p_id, Purchase_details.purchase_id FROM Product INNER JOIN Purchase_details ON Product.p_id = Purchase_details.p_id INNER JOIN Purchase ON Purchase_details.purchase_id = Purchase.purchase_id">
        </asp:SqlDataSource>
    </p>
    <p>
        Amount :&nbsp; 
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        Quantity :
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </p>
    <p>
        Date :
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:TextBox ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
    </p>
    <p>
        <asp:Button  class="btn btn-success" ID="Button1" runat="server" Text="Return" />
    </p>
    </div>
    </div>
    </div>

</asp:Content>

