
Partial Class Admin_user_Supplier
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString)
    Dim cmb As New SqlCommand


    
    Protected Sub InsertButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        cn.Open()
        cmb.CommandText = "SELECT MAX(s_id) From Supplier"
        cmb.Connection = cn
        Dim supp_id As Integer = cmb.ExecuteScalar + 1
        Dim t As TextBox = CType(FormView1.FindControl("s_idTextBox"), TextBox)
        t.Text = supp_id
        cn.Close()
    End Sub
End Class
