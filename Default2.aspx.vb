
Partial Class Default2
    Inherits System.Web.UI.Page
    Dim Cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmb As New SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim s_id As Integer = Request.QueryString("s_id")
        Cn.Open()
        cmb.CommandText = "UPDATE Sales SET delivery_status='Delivered' WHERE sales_id=" & s_id & ""
        cmb.Connection = Cn
        cmb.ExecuteNonQuery()
        Cn.Close()
        Response.Redirect("/OnlineToyShop/Admin/AdminMainPage.aspx")

    End Sub
End Class
