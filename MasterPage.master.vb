
Imports System
Imports System.Data.SqlClient
Imports System.Data.Sql


Partial Class MasterPage
    Inherits System.Web.UI.MasterPage



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim con As New Data.SqlClient.SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=E:\OnlineToyShop\App_Data\OTSProject.mdf;Integrated Security=True;User Instance=True")
        Dim cmd As New Data.SqlClient.SqlCommand
        Dim dr As Data.SqlClient.SqlDataReader
        con.Open()
        cmd.CommandText = "select * from Category"
        cmd.Connection = con
        dr = cmd.ExecuteReader()
        DataList1.DataSource = dr
        DataList1.DataBind()
        con.Close()
        If Session("user") Is "" Then
            loginlbl.Text = "Login"
        Else
            loginlbl.Text = "Logout"
        End If
    End Sub
    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

        Dim p As Panel = CType(e.Item.FindControl("panelsubcat"), Panel)
        Dim l As HtmlInputButton = CType(e.Item.FindControl("MainCat"), HtmlInputButton)
        l.Attributes.Add("onclick", "showsubmenu('" & p.ClientID & "')")
        Dim con As New Data.SqlClient.SqlConnection
        con.ConnectionString = ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString()
        Dim cmd As New Data.SqlClient.SqlCommand
        Dim dr As Data.SqlClient.SqlDataReader
        con.Open()
        Dim id As Label = CType(e.Item.FindControl("ID"), Label)
        Dim catid As Integer = Convert.ToInt16(id.Text.ToString())
        cmd.CommandText = "select * from Subcategory where category_id=" & catid
        cmd.Connection = con
        dr = cmd.ExecuteReader()
        Dim d As DataList = CType(e.Item.FindControl("subcat"), DataList)
        d.DataSource = dr
        d.DataBind()
        con.Close()


    End Sub


    Protected Sub loginlink_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles loginlink.Click


        If Session("user") Is "" Then
            Response.Redirect("~/Account/Login.aspx")

        Else
            Session("user") = ""
            Session("uid") = ""

            Response.Redirect("~/Account/Login.aspx")
        End If

    End Sub



End Class

