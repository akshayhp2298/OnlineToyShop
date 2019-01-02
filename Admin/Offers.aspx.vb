Imports System.Windows.Forms

Partial Class Admin_Offers
    Inherits System.Web.UI.Page

    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())

    Dim cmb As New SqlCommand

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim result As DialogResult = MessageBox.Show("Confirm Delete?", _
                          "Warning", _
                          MessageBoxButtons.YesNo)

        If (result = DialogResult.No) Then
            e.Cancel = True



        End If
    End Sub


    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click

        If offdesc.Text = "" Then
            MsgBox("No Empty Data allowed")

        Else
            Dim Offer_id As Integer
            cn.Open()
            cmb.CommandText = "SELECT max(offers_id) FROM Offer"
            cmb.Connection = cn
            If IsDBNull(cmb.ExecuteScalar) = True Then
                Offer_id = 1
            Else
                Offer_id = cmb.ExecuteScalar + 1
            End If

            cn.Close()
            cn.Open()
            cmb.CommandText = "INSERT INTO Offer VALUES(" & Offer_id & ",'" & offdesc.Text & "'," & discount.Text & ",'" & Startdate.Text & "','" & Enddate.Text & "');"
            cmb.Connection = cn
            cmb.ExecuteNonQuery()
            cn.Close()

            Response.Redirect("/OnlineToyShop/Admin/Offers.aspx")

        End If


    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Panel1.Visible = True
        Panel2.Visible = False

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Panel1.Visible = False
        Panel2.Visible = True

    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        cn.Open()

        cmb.CommandText = "SELECT COUNT(*) FROM Offer_detail WHERE offer_id=" & DropDownList3.SelectedValue & " and p_id=" & DropDownList1.SelectedValue & ""
        cmb.Connection = cn
        If cmb.ExecuteScalar.ToString = "0" Then
            cmb.CommandText = "INSERT INTO Offer_detail VALUES(" & DropDownList3.SelectedValue & "," & DropDownList1.SelectedValue & ");"
            cmb.Connection = cn
            cmb.ExecuteNonQuery()
            cn.Close()
            Response.Redirect("/OnlineToyShop/Admin/Offers.aspx")
        Else
            MsgBox("Offer Is Already added.")
            Response.Redirect("/OnlineToyShop/Admin/Offers.aspx")
        End If
        cn.Close()

    End Sub
End Class
