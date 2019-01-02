Imports System.Windows.Forms

Partial Class Admin_Product_Product
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim result As DialogResult = MessageBox.Show("Confirm Delete?", _
                            "Warning", _
                            MessageBoxButtons.YesNo)

        If (result = DialogResult.No) Then
            e.Cancel = True



        End If
    End Sub
End Class
