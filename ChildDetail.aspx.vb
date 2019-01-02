
Partial Class ChildDetail
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmb As New SqlCommand
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        cn.Open()
        cmb.CommandText = "SELECT MAX(child_id) FROM Child"
        cmb.Connection = cn
        Dim child_id As Integer = cmb.ExecuteScalar + 1
        cmb.CommandText = "INSERT INTO Child VALUES(" & child_id & ",'" & TextBox1.Text & "','" & TextBox2.Text & "','" & RadioButtonList1.SelectedItem.ToString() & "')"
        cmb.Connection = cn
        cmb.ExecuteNonQuery()

        cmb.CommandText = "INSERT INTO Child_detail VALUES(" & Session("uid") & "," & child_id & ",'" & TextBox3.Text & "')"
        cmb.Connection = cn
        cmb.ExecuteNonQuery()

        cn.Close()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user") = "" Then
            Response.Redirect("/OnlineToyShop/Account/Login.aspx")

        End If
    End Sub
End Class
