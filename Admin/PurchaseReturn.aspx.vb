
Partial Class Admin_PurchaseReturn
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmb As New SqlCommand
    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        DropDownList1.SelectedIndex = DropDownList2.SelectedIndex

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        cn.Open()
        cmb.CommandText = "SELECT MAX(purchase_return_id) FROM Purchase_return"
        cmb.Connection = cn
        Dim p_r_id As Integer
        If IsDBNull(cmb.ExecuteScalar) Then
            p_r_id = 1
        Else
            p_r_id = cmb.ExecuteScalar + 1

        End If


        cmb.CommandText = "INSERT INTO Purchase_return VALUES(" & p_r_id & "," & DropDownList2.SelectedValue & "," & TextBox1.Text & ",'" & TextBox3.Text & "')"
        cmb.Connection = cn
        cmb.ExecuteScalar()

        cmb.CommandText = "INSERT INTO Purchase_return_detail VALUES(" & p_r_id & "," & DropDownList1.SelectedValue & "," & TextBox2.Text & ")"
        cmb.Connection = cn
        cmb.ExecuteScalar()



        cn.Close()




        Response.Redirect("~/Admin/PurchaseReturn.aspx")


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
