
Partial Class Order
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmb As New SqlCommand
    Dim p_id, amt As Integer
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        cn.Open()
        cmb.CommandText = "SELECT Customer.address1,Customer.address2,Area.name,Area.pincode,City.name as city from Customer,Area,City Where Customer.area_id=Area.area_id and Area.city_id=City.city_id and Customer.c_id=" & Session("uid") & ""

        cmb.Connection = cn
        Dim dr As SqlDataReader
        dr = cmb.ExecuteReader
        While dr.Read

            deladd.Text = dr.Item("address1") & vbCrLf & dr.Item("address2") & vbCrLf & dr.Item("name") & " " & dr.Item("pincode") & vbCrLf & dr.Item("city")
        End While


        cn.Close()




    End Sub

    
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If deladd.Text Is "" Then
            MsgBox("Delivery Address is Empty!!!")
        Else
            cn.Open()
            cmb.CommandText = "SELECT max(sales_id) FROM Sales"
            cmb.Connection = cn
            Dim sales_id As Integer = cmb.ExecuteScalar + 1

            cmb.CommandText = "SELECT qty FROM Product WHERE p_id=" & p_id & ""
            cmb.Connection = cn
            Dim p_qty As Integer = cmb.ExecuteScalar

            If p_qty <= qtyTextBox.Text Then
                MsgBox("Currently Stock is not available " & vbCrLf & "Try Again Later")
            Else



                p_qty = p_qty - qtyTextBox.Text

                cmb.CommandText = "UPDATE Product SET qty=" & p_qty & " WHERE p_id=" & p_id & ""

                cmb.Connection = cn
                cmb.ExecuteNonQuery()


                cmb.CommandText = "INSERT INTO Sales(sales_id,c_id,sales_date,del_date,delivery_status,del_address) values(" & sales_id & "," & Session("uid") & ",'" & Date.Now & "','" & Date.Now.Date.AddDays(5) & "','Pending','" & deladd.Text & "')"
                cmb.Connection = cn
                cmb.ExecuteNonQuery()

                cmb.CommandText = "INSERT INTO Sales_detail VALUES (" & sales_id & "," & p_id & "," & qtyTextBox.Text & "," & (amt * qtyTextBox.Text) & " )"
                cmb.Connection = cn
                cmb.ExecuteNonQuery()


                cmb.Connection = cn
                cmb.CommandText = "SELECT SUM(amount) FROM Sales_detail WHERE sales_id=" & sales_id & ""
                amt = cmb.ExecuteScalar




                cmb.Connection = cn
                cmb.CommandText = "SELECT MAX(sales_payment_id) FROM Sales_payment"
                Dim s_p_id As Integer = cmb.ExecuteScalar + 1
                cmb.Connection = cn
                cmb.CommandText = "INSERT INTO Sales_payment VALUES(" & s_p_id & "," & sales_id & "," & amt & "," & amt * 6 / 100 & "," & amt * 6 / 100 & ")"
                cmb.ExecuteNonQuery()



                cmb.Connection = cn
                cmb.CommandText = "SELECT MAX(id) FROM Notification"
                Dim notification_id As Integer = cmb.ExecuteScalar + 1
                cmb.Connection = cn
                cmb.CommandText = "INSERT INTO Notification(id,c_id,sales_id,status) VALUES(" & notification_id & "," & Session("uid") & "," & sales_id & ",'notread')"
                cmb.ExecuteNonQuery()



                cn.Close()
                MsgBox("Order Placed Succesfully.")
                Response.Redirect("OrderInvoice.aspx?s_id=" & sales_id & "")

            End If
            cn.Close()


        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user") = "" Then
            Response.Redirect("/OnlineToyShop/Account/Login.aspx")
        End If



        p_id = Request.QueryString("p_id")
        cn.Open()
        cmb.CommandText = "SELECT distinct Offer.discount FROM Offer INNER JOIN Offer_detail ON Offer.offers_id = Offer_detail.offer_id WHERE (Offer_detail.p_id =" & p_id & ")"

        cmb.Connection = cn
        Dim dis As Integer = cmb.ExecuteScalar

        cmb.CommandText = "SELECT p_price FROM Product WHERE p_id=" & p_id & ""
        cmb.Connection = cn
        Dim price As Integer = cmb.ExecuteScalar

        amt = price - (price * dis / 100)
        cn.Close()




        




    End Sub
End Class
