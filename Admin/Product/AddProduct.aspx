<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false"
    CodeFile="AddProduct.aspx.vb" Inherits="Admin_Product_AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div class="col-md-12">
        <div class="panel panel-success">
            <div class="panel panel-heading">
                Add New Product
            </div>
            <div class="panel panel-body">
                <table class="style4">
                    <tr>
                        <td class="style5">
                            Product Name:-
                        </td>
                        <td>
                            <asp:TextBox ID="p_name" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Product Name is Required..." ControlToValidate="p_name" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                            </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Product Description:-
                        </td>
                        <td>
                            <asp:TextBox ID="p_desc" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Product Description is Required..." ControlToValidate="p_desc" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                            </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Product Price:-
                        </td>
                        <td>
                            <asp:TextBox ID="p_price" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Product Price is Required..." ControlToValidate="p_price" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                            </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Category:-
                        </td>
                        <td>
                            <asp:DropDownList ID="CatDropDown" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                                DataTextField="category_name" DataValueField="category_id">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
                                SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            SubCategory:-
                        </td>
                        <td class="style7">
                            <asp:DropDownList ID="SubCatDropDown" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2"
                                DataTextField="subcategory_name" DataValueField="subcategory_id">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
                                SelectCommand="SELECT * FROM [Subcategory] WHERE ([category_id] = @category_id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="CatDropDown" Name="category_id" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Brand:-
                        </td>
                        <td>
                            <asp:DropDownList ID="BrandDropDown" runat="server" DataSourceID="brand" DataTextField="b_name"
                                DataValueField="brand_id" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="brand" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
                                SelectCommand="SELECT * FROM [Brand]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Quantity
                        </td>
                        <td>
                            <asp:TextBox ID="qty" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Product Quantity is Required..." ControlToValidate="qty" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                            </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Image Path:-
                        </td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Product Image is Required..." ControlToValidate="FileUpload1" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                            </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                </table>
                <div class="panel panel-footer" align="center">
                <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Add Product" />
                </div>
            </div>
            </div>
            </div>
    
</asp:Content>
