
Partial Class Admin_Purchase
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString)
    Dim cmb As New SqlCommand
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        cn.Open()
        cmb.CommandText = "SELECT MAX(purchase_id) FROM Purchase"
        cmb.Connection = cn
        Dim pur_id As Integer = cmb.ExecuteScalar + 1


        cmb.Connection = cn
        cmb.CommandText = "INSERT INTO Purchase VALUES(" & pur_id & "," & DropDownList1.SelectedValue & "," & TextBox2.Text & "," & TextBox3.Text & "," & TextBox4.Text & ")"
        cmb.ExecuteNonQuery()

        cmb.Connection = cn
        cmb.CommandText = "INSERT INTO Purchase_details VALUES(" & pur_id & "," & DropDownList2.SelectedValue & "," & TextBox5.Text & ")"
        cmb.ExecuteNonQuery()

        cmb.CommandText = "SELECT qty FROM Product WHERE p_id = " & DropDownList2.SelectedValue & ""
        cmb.Connection = cn
        Dim qty As Integer = cmb.ExecuteScalar

        cmb.CommandText = "UPDATE Product SET qty=" & qty + TextBox5.Text & " WHERE p_id = " & DropDownList2.SelectedValue & ""
        cmb.Connection = cn
        cmb.ExecuteNonQuery()
        cn.Close()

        Response.Redirect("/OnlineToyShop/Admin/Purchase.aspx")


    End Sub
End Class
