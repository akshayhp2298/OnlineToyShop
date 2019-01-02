
Partial Class _Default
    Inherits System.Web.UI.Page

    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmb As New SqlCommand
    Public Function GenerateURL(ByVal ID As Integer) As String
        Dim str As String
        str = "ProductDetail.aspx?id=" & ID
        Return str
    End Function
    


    Public Sub AddtoCart(ByVal productid As Integer, ByVal discount As Integer, ByVal price As Integer)
        If Session("uid") Is "" Then
            Response.Redirect("~/Account/Login.aspx")
        Else

            Dim uid As Integer = Session("uid")
            Dim str As String
            Dim cart_id As Integer
            Dim i, a As Integer
            cn.Open()
            cmb.CommandText = "SELECT p_id FROM Cart_detail where cart_id=(select cart_id FROM Cart where c_id=" & uid & ")"
            cmb.Connection = cn
            Dim dr As SqlDataReader = cmb.ExecuteReader

            While dr.Read
                If productid = dr.Item("p_id") Then
                    a = 1
                End If

            End While

            cn.Close()
            Try
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
                    amount = price - (price * CInt(Int(discount)) / 100)
                    str = "INSERT INTO Cart_detail(cart_id,p_id,qty,amount,cart_date) VALUES (" & cart_id & "," & productid & ",1," & amount & ",'" & date1 & "');"
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


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



    End Sub


    Protected Sub ImageButton1_Click1(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

        MsgBox("hello")

    End Sub

    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand
        If e.CommandName = "addtocart" Then
            Dim discount, price As Integer
            'offer
            cn.Open()
            cmb.CommandText = "SELECT Offer.discount FROM Product INNER JOIN Product_img ON Product.p_id = Product_img.p_id INNER JOIN Brand ON Product.brand_id = Brand.brand_id INNER JOIN Subcategory ON Product.subcategory_id = Subcategory.subcategory_id INNER JOIN Category ON Subcategory.category_id = Category.category_id LEFT OUTER JOIN Offer_detail ON Product.p_id = Offer_detail.p_id LEFT OUTER JOIN Offer ON Offer_detail.offer_id = Offer.offers_id AND { fn CURDATE() } > Offer.start_date AND { fn CURDATE() } < Offer.end_date WHERE(Product.p_id = " & e.CommandArgument.ToString() & ")"
            cmb.Connection = cn
            If IsDBNull(cmb.ExecuteScalar) = True Then
                discount = 0
            Else
                discount = cmb.ExecuteScalar
            End If
            cn.Close()

            'price
            cn.Open()
            cmb.CommandText = "SELECT p_price FROM product WHERE p_id=" & e.CommandArgument.ToString & ""
            cmb.Connection = cn
            price = cmb.ExecuteScalar
            cn.Close()


            AddtoCart(e.CommandArgument.ToString, discount, price)
        ElseIf e.CommandName = "buynow" Then

            Response.Redirect("~/Order.aspx?p_id=" & e.CommandArgument.ToString() & "")



        End If


    End Sub


End Class
