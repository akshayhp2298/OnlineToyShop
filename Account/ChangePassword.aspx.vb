
Partial Class Account_ChangePassword
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmb As New SqlCommand
    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        cn.Open()
        cmb.CommandText = "SELECT user_pass FROM Log_in WHERE user_name='" & Session("user") & "'"
        cmb.Connection = cn
        Dim opass As String = cmb.ExecuteScalar
        If opass = TextBox1.Text Then
            cmb.CommandText = "UPDATE Log_in SET user_pass= '" & PswdTB.Text & "' WHERE (user_name='" & Session("user") & "')"
            cmb.Connection = cn
            cmb.ExecuteNonQuery()
            MsgBox("Your Password has Succesfully Changed.")

        Else
            MsgBox("Your Old Password is Incorrect!")
        End If
        cn.Close()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user") = "" Then
            Response.Redirect("Login.aspx")
        End If
    End Sub
End Class
