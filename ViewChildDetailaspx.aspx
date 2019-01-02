<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="ViewChildDetailaspx.aspx.vb" Inherits="ViewChildDetailaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                   <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                      <asp:TextBox ID="TextBox1" Placeholder="Child Name" runat="server" Visible="false"></asp:TextBox>
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
                      <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                      <asp:TextBox ID="TextBox2" runat="server" placeholder=" Child's Birthdate" visible=false
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
                      <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                      <asp:RadioButtonList ID="RadioButtonList1" runat="server" Visible=false>
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
                      <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                      <asp:TextBox ID="TextBox3" Placeholder="Relation with child..." Visible=false runat="server"></asp:TextBox>
                  </td>
                  </tr>
                  </table>

                  <br />
                    <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Edit Details" />
                     <asp:Button ID="addbtn" class="btn btn-success" runat="server" 
                        Text="Add Details" Visible="False" />
                    
                     <asp:Button ID="addbtn0" class="btn btn-success" runat="server" 
                        Text="Cancel" Visible="False" />
                    
                </div>
                <div class="panel panel-footer">
                </div>
            </div>
        </div>
    </div>
</asp:Content>

