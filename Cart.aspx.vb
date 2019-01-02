Imports System.Windows.Forms

Partial Class AddToCart
    Inherits System.Web.UI.Page
    


    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString)
    Dim cmb As New SqlCommand

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim result As DialogResult = MessageBox.Show("Confirm Delete?", _
                            "Warning", _
                            MessageBoxButtons.YesNo)

        If (result = DialogResult.No) Then
            e.Cancel = True



        End If
    End Sub

  

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user") = "" Then
            Response.Redirect("/OnlineToyShop/Account/Login.aspx")
        End If
        cn.Open()
        cmb.CommandText = "SELECT COUNT(*) FROM Cart_detail WHERE cart_id=" & Session("uid") & ""
        cmb.Connection = cn
        If cmb.ExecuteScalar.ToString = 0 Then
            Button1.Visible = False
            Label1.Visible = True
            HyperLink1.Visible = True
        End If
        cn.Close()
    End Sub

    Protected Sub Button1_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
       
        Response.Redirect("/OnlineToyShop/CheckOut.aspx")
    End Sub
End Class
