<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/adminMaster.master" AutoEventWireup="false"
    CodeFile="Area.aspx.vb" Inherits="Admin_Product_Subcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        
       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataKeyNames="area_id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display."
            ForeColor="#333333" GridLines="None" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="area_id" HeaderText="ID" ReadOnly="True"
                    SortExpression="area_id" InsertVisible="False" />
                <asp:BoundField DataField="name" HeaderText="Area" 
                    SortExpression="name" />
                <asp:BoundField DataField="pincode" HeaderText="Pincode" 
                    SortExpression="pincode" />
                <asp:BoundField DataField="Expr1" HeaderText="City" SortExpression="Expr1" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>"
            DeleteCommand="DELETE FROM [Area] WHERE [area_id] = @area_id"
            InsertCommand="INSERT INTO [Area] ([name], [city_id], [pincode]) VALUES (@name, @city_id, @pincode)"
            SelectCommand="SELECT Area.area_id, Area.name, Area.pincode, City.name AS Expr1 FROM Area INNER JOIN City ON Area.city_id = City.city_id"
            
            
            UpdateCommand="UPDATE [Area] SET [name] = @name, [pincode] = @pincode WHERE [area_id] = @area_id">
            <DeleteParameters>
                <asp:Parameter Name="area_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="city_id" Type="Int32" />
                <asp:Parameter Name="pincode" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="GridView1" Name="name" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="GridView1" Name="pincode" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="GridView1" Name="area_id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <div class="col-md-12">
            <div class="panel panel-success">
                <div class="panel panel-heading">
                    Add Subcagory
                </div>
                <div class="panel panel-body">
                    <table align="center">
                        <tr>
                            <td>
                                Area Name :-
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" placeholder="Enter Area name..." runat="server"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                        <td>&nbsp</td>
                        </tr>
                        <tr>
                            <td>
                                Select City :-
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="SqlDataSource2" DataTextField="name" 
                                    DataValueField="city_id" Width="88px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:OTSProjectConnectionString1 %>" 
                                    SelectCommand="SELECT * FROM [City]"></asp:SqlDataSource>
                            </td>
                        </tr>
                         <tr>
                        <td>&nbsp</td>
                        </tr>
                        <tr>

                        <td>
                                Pincode :-
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" placeholder="Enter Pincode..." runat="server"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </div>
                <div class="panel panel-footer" align="center">
                    <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Add" />
                </div>
            </div>
        </div>
        <br />
        </form>
    
</asp:Content>
