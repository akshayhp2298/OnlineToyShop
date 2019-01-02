
Partial Class Admin_Product_AddProduct
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection


    Dim cmb As New SqlCommand
    Dim da As New SqlDataAdapter("select * from Product", cn)
    Dim ds As New Data.DataSet



    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString()

        Dim s_id, p_id, image_id As Integer
        da.Fill(ds, "Product")
        cn.Open()
        cmb.CommandText = "SELECT subcategory_id FROM Subcategory WHERE subcategory_name='" & SubCatDropDown.SelectedItem.ToString & "'"
        cmb.Connection = cn
        s_id = cmb.ExecuteScalar
        cn.Close()
        cn.Open()
        cmb.CommandText = "SELECT max(p_id) FROM Product"
        cmb.Connection = cn
        p_id = cmb.ExecuteScalar + 1
        cn.Close()
        cn.Open()

        Dim str As String
        str = "INSERT INTO Product(p_id,p_name,p_price,p_desc,brand_id,subcategory_id,qty) VALUES (" & p_id & ",'" & p_name.Text & "'," & p_price.Text & ",'" & p_desc.Text & "'," & BrandDropDown.SelectedIndex + 1 & "," & s_id & "," & qty.Text & ");"
        cmb.CommandText = str
        cmb.Connection = cn
        cmb.ExecuteNonQuery()
        cn.Close()
        cn.Open()
        cmb.CommandText = "SELECT max(p_image_id) FROM Product_img"
        cmb.Connection = cn
        image_id = cmb.ExecuteScalar + 1

        cn.Close()
        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") & FileUpload1.FileName)
        Dim image_path As String = "~/images/" & FileUpload1.FileName
        cn.Open()
        cmb.CommandText = "INSERT INTO Product_img(p_image_id,p_id,image_path) VALUES (" & image_id & "," & p_id & ",'" & image_path & "');"
        cmb.Connection = cn
        cmb.ExecuteNonQuery()
        cn.Close()

        Response.Clear()
        Response.Write("Product Is Added Succesfully...")
        Response.Redirect("~/Admin/Product/Product.aspx")

    End Sub
End Class
