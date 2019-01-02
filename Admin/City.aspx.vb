Imports System.Windows.Forms

Partial Class Admin_Product_Category
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmb As New SqlCommand

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If TextBox1.Text = "" Then
            MsgBox("Field is empty")
        Else




            cn.Open()
            cmb.CommandText = "SELECT MAX(city_id) from City"
            cmb.Connection = cn
            Dim i As Integer = cmb.ExecuteScalar + 1
            cmb.CommandText = "Insert Into City Values(" & i & ",'" & TextBox1.Text & "')"
            cmb.Connection = cn
            cmb.ExecuteNonQuery()
            cn.Close()
            TextBox1.Text = ""
            Response.Redirect("/OnlineToyShop/Admin/City.aspx")


        End If


    End Sub

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
