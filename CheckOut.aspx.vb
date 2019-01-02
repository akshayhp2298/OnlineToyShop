
Partial Class CheckOut
    Inherits System.Web.UI.Page
    Dim cn, cn1 As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmb, cmb1 As New SqlCommand
    Dim p_id, amt As Integer
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        If deladd.Text Is "" Then
            MsgBox("Delivery Address is Empty!!!")
        Else
            cn.Open()
            cmb.CommandText = "SELECT max(sales_id) FROM Sales"
            cmb.Connection = cn
            Dim sales_id As Integer = cmb.ExecuteScalar + 1

            cmb.CommandText = "INSERT INTO Sales(sales_id,c_id,sales_date,del_date,delivery_status,del_address) values(" & sales_id & "," & Session("uid") & ",'" & Date.Now.Date & "','" & Date.Now.Date.AddDays(7) & "','Pending','" & deladd.Text & "')"
            cmb.Connection = cn
            cmb.ExecuteNonQuery()



            Dim str As String
            str = "SELECT * FROM Cart_detail Where cart_id=(SELECT cart_id FROM Cart Where c_id=" & Session("uid") & ")"
            cmb.CommandText = str
            Dim dr As SqlDataReader
            cmb.Connection = cn
            dr = cmb.ExecuteReader
            While dr.Read

                cn1.Open()
                cmb1.CommandText = "INSERT INTO Sales_detail VALUES (" & sales_id & "," & dr.Item("p_id") & "," & dr.Item("qty") & "," & dr.Item("amount") & " )"
                cmb1.Connection = cn1
                cmb1.ExecuteNonQuery()
                cn1.Close()

            End While
            cn.Close()

            cn.Open()
            cmb.CommandText = "SELECT SUM(amount) FROM Cart_detail WHERE Cart_detail.cart_id=(SELECT cart_id FROM Cart WHERE c_id=" & Session("uid") & ")"
            cmb.Connection = cn
            amt = cmb.ExecuteScalar
            cn.Close()


            cn.Open()
            cmb.Connection = cn
            cmb.CommandText = "SELECT MAX(sales_payment_id) FROM Sales_payment"
            Dim s_p_id As Integer = cmb.ExecuteScalar + 1
            cmb.Connection = cn
            cmb.CommandText = "INSERT INTO Sales_payment VALUES(" & s_p_id & "," & sales_id & "," & amt & "," & amt * 6 / 100 & "," & amt * 6 / 100 & ")"
            cmb.ExecuteNonQuery()
            cn.Close()
            MsgBox("Order Placed Succesfully!!!")


            cn.Open()
            Dim strq As String = "DELETE FROM Cart_detail WHERE cart_id=(SELECT cart_id FROM Cart WHERE c_id=" & Session("uid") & ") "
            cmb.CommandText = strq
            cmb.Connection = cn
            cmb.ExecuteNonQuery()
            MsgBox(strq)
            cn.Close()

            cn.Open()
            cmb.Connection = cn
            cmb.CommandText = "SELECT MAX(id) FROM Notification"
            Dim notification_id As Integer = cmb.ExecuteScalar + 1
            cmb.Connection = cn
            cmb.CommandText = "INSERT INTO Notification(id,c_id,sales_id,status) VALUES(" & notification_id & "," & Session("uid") & "," & sales_id & ",'notread')"
            cmb.ExecuteNonQuery()
            cn.Close()



            Response.Redirect("OrderInvoice.aspx?s_id=" & sales_id & "")

        End If
        

    End Sub

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

    
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user") = "" Then
            Response.Redirect("/OnlineToyShop/Account/Login.aspx")
        End If
    End Sub
End Class
