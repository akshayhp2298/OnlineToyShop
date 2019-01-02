
Partial Class Admin_adminMaster
    Inherits System.Web.UI.MasterPage
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString)
    Dim cmb As New SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("admin") = "" Then
            Response.Redirect("~/Default.aspx")
        End If

        cn.Open()
        cmb.Connection = cn

        cmb.CommandText = "SELECT fname,lname FROM Admin WHERE user_name='" & Session("admin") & "'"
        Dim dr As SqlDataReader = cmb.ExecuteReader
        Dim fn, ln As String
        While dr.Read
            fn = dr.Item(0)
            ln = dr.Item(1)
        End While
        UserNameLiteral.Text = fn & " " & ln


        cn.Close()



    End Sub
   
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Session("admin") = ""
        Response.Redirect("/OnlineToyShop/Default.aspx")
    End Sub
End Class

