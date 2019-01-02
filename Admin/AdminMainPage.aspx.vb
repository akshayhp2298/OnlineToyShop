
Partial Class Admin_Default
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmb As New SqlCommand
    Dim c_id, sales_id As Integer
   

   
  

    Protected Sub GridView2_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView2.RowCommand
        If e.CommandName = "delivered" Then
            MsgBox(e.CommandArgument)
            MsgBox(e.CommandSource)
        End If
    End Sub

    Protected Sub Unnamed1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles seenbtn.Click
        cn.Open()
        cmb.CommandText = "UPDATE Notification SET status='read'"
        cmb.Connection = cn
        cmb.ExecuteNonQuery()
        cn.Close()
    End Sub
End Class
