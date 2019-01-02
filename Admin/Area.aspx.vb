Imports System.Windows.Forms

Partial Class Admin_Product_Subcategory
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmb As New SqlCommand
    Dim da As New SqlDataAdapter("select * from Area", cn)
    Dim ds As New Data.DataSet
    Dim category_id As Integer


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If TextBox1.Text = "" And TextBox2.Text = "" Then
            MsgBox("Filed is empty")
        Else

            Dim area_id As Integer
            cn.Open()
            cmb.CommandText = "SELECT MAX(area_id) FROM Area"
            cmb.Connection = cn
            area_id = cmb.ExecuteScalar + 1
            cn.Close()

            cn.Open()
            cmb.CommandText = "INSERT INTO Area VALUES(" & area_id & ",'" & TextBox1.Text & "'," & DropDownList1.SelectedValue & "," & TextBox2.Text & ");"


            cmb.Connection = cn

            cmb.ExecuteNonQuery()
            cn.Close()
            Response.Write("Area is added Succesfully")
            TextBox1.Text = ""
            Response.Redirect("/OnlineToyShop/Admin/Area.aspx")

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
