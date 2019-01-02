Imports System.Windows.Forms

Partial Class Admin_Product_Subcategory
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmb As New SqlCommand
    Dim da As New SqlDataAdapter("select * from Category", cn)
    Dim ds As New Data.DataSet
    Dim category_id As Integer


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim s_id As Integer
        cn.Open()
        cmb.CommandText = "SELECT MAX(subcategory_id) FROM Subcategory"
        cmb.Connection = cn
        s_id = cmb.ExecuteScalar + 1
        cn.Close()
        MsgBox("sub " & s_id)
        cn.Open()
        cmb.CommandText = "INSERT INTO Subcategory VALUES(" & s_id & ",'" & TextBox1.Text & "'," & DropDownList1.SelectedValue & ");"
        cmb.Connection = cn

        cmb.ExecuteNonQuery()
        cn.Close()
        Response.Write("SubCategory is added Succesfully")
        TextBox1.Text = ""
        Response.Redirect("/OnlineToyShop/Admin/Product/Subcategory.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
      
    End Sub




    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged

        cn.Open()
        cmb.CommandText = "SELECT category_id FROM Category Where category_name='" & DropDownList1.SelectedItem.ToString() & "'"

        cmb.Connection = cn
        category_id = cmb.ExecuteScalar
        cn.Close()
    End Sub

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridView1.RowDeleted
       
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
