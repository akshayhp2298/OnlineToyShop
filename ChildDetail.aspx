<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="ChildDetail.aspx.vb" Inherits="ChildDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="templatemo_content_right" style="padding-left: 30px;">
        <div class="col-md-12">
            <div class="panel panel-success">
                <div class="panel panel-heading">
                    Child Details...
                </div>
                <div class="panel panel-body" align="center">
                  <table>
                  <tr>
                  <td>
                  Child Name :-
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox1" Placeholder="Child Name" runat="server"></asp:TextBox>
                  </td>
                  </tr>
                  <tr>
                  <td>
                &nbsp
                  </td>
                  <td>
                  </td>
                  </tr>
                  <tr>
                  <td>
                  Birthdate :-
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox2" runat="server" placeholder=" Child's Birthdate" 
                          TextMode="Date"></asp:TextBox>
                  </td>
                  </tr>
                  <tr>
                  <td>
                  &nbsp
                  </td>
                  <td>
                  </td>
                  </tr>
                  <tr>
                  <td>
                  Gender :-
                  </td>
                  <td>
                      <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                          <asp:ListItem>Male</asp:ListItem>
                          <asp:ListItem>Female</asp:ListItem>

                        
                      </asp:RadioButtonList>

                  </td>
                  </tr>
                  <tr>
                  <td>
                  &nbsp
                  </td>
                  <td>
                  </td>
                  </tr>
                  <tr>
                  <td>
                  Your Relation with Child :-
                  </td>
                  <td>
                      <asp:TextBox ID="TextBox3" Placeholder="Relation with child..." runat="server"></asp:TextBox>
                  </td>
                  </tr>
                  </table>

                  <br />
                    <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Add Details" />
                    
                </div>
                <div class="panel panel-footer">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
