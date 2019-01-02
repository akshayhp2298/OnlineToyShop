
Partial Class ProductDetail
    Inherits System.Web.UI.Page

    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())



    Dim cmb As New SqlCommand


    Dim dr As SqlDataReader
    Dim ID As Integer


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        ID = Request.QueryString("id")
        Dim str As String
        str = "SELECT * From Product Where p_id=" & ID & ""
        cn.Open()
        Dim bid, category, subcategory As Integer
        cmb.Connection = cn
        cmb.CommandText = str
        dr = cmb.ExecuteReader
        While dr.Read
            bid = dr.Item("brand_id")
            subcategory = dr.Item("subcategory_id")
            Price.Text = dr.Item("p_price")
            ProductName.Text = dr.Item("p_name")
            Desc.Text = dr.Item("p_desc")
        End While
        cn.Close()



        'brand name
        cn.Open()
        cmb.CommandText = "SELECT b_name FROM Brand WHERE brand_id=" & bid & ""
        cmb.Connection = cn
        BrandName.Text = cmb.ExecuteScalar
        cn.Close()
        'subcategory name
        cn.Open()
        cmb.CommandText = "SELECT subcategory_name FROM Subcategory WHERE subcategory_id=" & subcategory & ""
        cmb.Connection = cn
        SubcategoryName.Text = cmb.ExecuteScalar
        cn.Close()
        'category name
        cn.Open()
        cmb.CommandText = "SELECT category_id FROM Subcategory WHERE subcategory_id=" & subcategory & ""
        cmb.Connection = cn
        category = cmb.ExecuteScalar
        cmb.CommandText = "SELECT category_name FROM Category WHERE Category_id=" & category & ""
        cmb.Connection = cn
        CategoryName.Text = cmb.ExecuteScalar
        cn.Close()

        'image
        cn.Open()
        cmb.CommandText = "SELECT image_path FROM Product_img WHERE p_id=" & ID & ""
        cmb.Connection = cn
        ProductImage.ImageUrl = cmb.ExecuteScalar
        cn.Close()


        'offer
        cn.Open()
        cmb.CommandText = "SELECT Offer.discount FROM Product INNER JOIN Product_img ON Product.p_id = Product_img.p_id INNER JOIN Brand ON Product.brand_id = Brand.brand_id INNER JOIN Subcategory ON Product.subcategory_id = Subcategory.subcategory_id INNER JOIN Category ON Subcategory.category_id = Category.category_id LEFT OUTER JOIN Offer_detail ON Product.p_id = Offer_detail.p_id LEFT OUTER JOIN Offer ON Offer_detail.offer_id = Offer.offers_id AND { fn CURDATE() } > Offer.start_date AND { fn CURDATE() } < Offer.end_date WHERE(Product.p_id = " & ID & ")"
        cmb.Connection = cn
        If IsDBNull(cmb.ExecuteScalar) = True Then
            discount.Text = 0
        Else
            discount.Text = cmb.ExecuteScalar
        End If
        cn.Close()



        'rating
        cn.Open()
        cmb.CommandText = "SELECT Avg(rating) FROM Rating WHERE p_id=" & ID & ""
        cmb.Connection = cn
        If IsDBNull(cmb.ExecuteScalar) Then
            Rating1.CurrentRating = 0
        Else
            cmb.CommandText = "SELECT Avg(rating) FROM Rating WHERE p_id=" & ID & ""
            cmb.Connection = cn
            Dim rat As Integer = cmb.ExecuteScalar
            Rating1.CurrentRating = rat
        End If
        cn.Close()


    End Sub

    Protected Sub AddToCartImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles AddToCartImageButton.Click
        If Session("uid") Is "" Then
            Response.Redirect("~/Account/Login.aspx")
        Else
            Try
                Dim uid As Integer = Session("uid")
                Dim str As String
                Dim cart_id As Integer
                Dim i, a As Integer
                cn.Open()
                cmb.CommandText = "SELECT p_id FROM Cart_detail where cart_id=(select cart_id FROM Cart where c_id=" & uid & ")"
                cmb.Connection = cn
                Dim dr As SqlDataReader = cmb.ExecuteReader

                While dr.Read
                    If ID = dr.Item("p_id") Then
                        a = 1
                    End If

                End While

                cn.Close()

                If a = 1 Then
                    MsgBox("Product is Already in your Cart")
                    'Response.Redirect("Cart.aspx")
                Else

                    cn.Open()
                    cmb.CommandText = "SELECT cart_id FROM Cart where c_id=" & uid & ""
                    cmb.Connection = cn
                    cart_id = cmb.ExecuteScalar
                    cn.Close()

                    Dim date1 As Date
                    date1 = Date.Now.Date
                    cn.Open()
                    cmb.Connection = cn

                    Dim amount As Integer
                    amount = Price.Text - (Price.Text * CInt(Int(discount.Text)) / 100)
                    str = "INSERT INTO Cart_detail(cart_id,p_id,qty,amount,cart_date) VALUES (" & cart_id & "," & ID & "," & qtyTextBox.Text & "," & amount * qtyTextBox.Text & ",'" & date1 & "');"
                    cmb.CommandText = str
                    cmb.ExecuteNonQuery()
                    cn.Close()
                    MsgBox("Product Added SuccesFully in your CART")
                End If
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Session("uid") Is "" Then
            Response.Redirect("~/Account/Login.aspx")
        Else
            cn.Open()
            Dim str As String
            str = "SELECT Max(feedback_id) From Feedback"
            cmb.Connection = cn
            cmb.CommandText = str
            Dim f_id As Integer = cmb.ExecuteScalar + 1


            str = "INSERT INTO Feedback VALUES(" & f_id & "," & Session("uid") & "," & ID & ",'" & feedbackTextBox.Text & "','" & Date.Now & "');"
            cmb.Connection = cn
            cmb.CommandText = str
            cmb.ExecuteNonQuery()
            cn.Close()
            MsgBox("feedback is submited")
            Response.Redirect("~/ProductDetail.aspx?id=" & ID & "")

        End If
    End Sub

    Protected Sub WishlistImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles WishlistImageButton.Click
        If Session("uid") Is "" Then
            Response.Redirect("/OnlineToyShop/Account/Login.aspx")

        Else
            cn.Open()
            Dim str As String
            Dim a As Integer


            str = "SELECT p_id FROM Wishlist WHERE c_id=" & Session("uid") & ""
            cmb.CommandText = str
            Dim dr As SqlDataReader = cmb.ExecuteReader
            While dr.Read
                If ID = dr.Item("p_id") Then
                    a = 1

                End If
            End While

            If a = 1 Then
                str = "DELETE FROM Wishlist WHERE c_id=" & Session("user") & ",p_id=" & ID & ""
                cmb.Connection = cn
                cmb.CommandText = str
                cmb.ExecuteNonQuery()
                MsgBox("Product Removed From the Wishlist")
            Else

                str = "INSERT INTO WishList VALUES(" & Session("uid") & "," & ID & ");"

                cmb.Connection = cn
                cmb.CommandText = str
                cmb.ExecuteNonQuery()
                cn.Close()
                MsgBox("Product Added To the Wishlist")
            End If

        End If
    End Sub

    
    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If Session("user") = "" Then
            Response.Redirect("~/Account/Login.aspx")
        Else


            cn.Open()
            Dim str As String
            str = "Select count(rating_id) from Rating WHERE c_id=" & Session("uid") & " and p_id=" & ID & ""
            cmb.Connection = cn
            cmb.CommandText = str

            Dim i As Integer = cmb.ExecuteScalar
            If i = 0 Then

                str = "SELECT Max(rating_id) From Rating"
                cmb.Connection = cn
                cmb.CommandText = str
                Dim r_id As Integer = cmb.ExecuteScalar + 1
                str = "INSERT INTO Rating VALUES(" & r_id & "," & Session("uid") & "," & ID & ",'" & Rating1.CurrentRating.ToString() & "','" & Date.Now.Date & "');"
                cmb.Connection = cn
                cmb.CommandText = str
                cmb.ExecuteNonQuery()
                cn.Close()
                MsgBox("Rating is submited")
                Response.Redirect("~/ProductDetail.aspx?id=" & ID & "")
            Else
                str = "Select count(rating_id) from Rating WHERE c_id=" & Session("uid") & " and p_id=" & ID & ""
                cmb.Connection = cn
                Dim rid As Integer = cmb.ExecuteScalar
                str = "Update Rating SET rating='" & Rating1.CurrentRating.ToString & "',rating_date='" & Date.Now.Date & "' where rating_id=" & rid & ""
                cmb.Connection = cn

                cmb.CommandText = str


                cmb.ExecuteNonQuery()


            End If
        End If

    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Response.Redirect("~/Order.aspx?p_id=" & ID & "")


    End Sub

  
End Class
