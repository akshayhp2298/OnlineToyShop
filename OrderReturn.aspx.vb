
Partial Class OrderReturn
    Inherits System.Web.UI.Page
    Dim sales_id, p_id As Integer
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString)

    Dim cmb As New SqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sales_id = Request.QueryString("s_id")
        p_id = Request.QueryString("p_id")
        If Session("user") = "" Then
            Response.Redirect("/OnlineToyShop/Account/Login.aspx")
        End If
        cn.Open()
        Dim d As Date
        cmb.CommandText = "SELECT del_date FROM Sales WHERE sales_id=" & sales_id & ""
        cmb.Connection = cn

        d = cmb.ExecuteScalar
        If d.AddDays(7) > Date.Now Then

        Else
            MsgBox("Product cannot Return After 7 days of Delivered..")
            Response.Redirect("/OnlineToyShop/MngOrder.aspx")
            cn.Close()

        End If
        cn.Close()


    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        cn.Open()
        Dim s_r_id, amount, qty As Integer
        cmb.CommandText = "SELECT Max(sales_return_id) FROM Sales_return"
        cmb.Connection = cn
        If IsDBNull(cmb.ExecuteScalar) = True Then
            s_r_id = 1
        Else
            s_r_id = cmb.ExecuteScalar

        End If

        cmb.CommandText = "SELECT amount,qty FROM Sales_detail WHERE sales_id=" & sales_id & " and p_id=" & p_id & ""
        cmb.Connection = cn
        Dim dr As SqlDataReader
        dr = cmb.ExecuteReader
        While dr.Read
            amount = dr.Item(0)
            qty = dr.Item(1)
        End While
        cn.Close()

        cn.Open()
        cmb.CommandText = "INSERT INTO Sales_return VALUES(" & s_r_id & "," & sales_id & "," & amount & ",'" & Date.Now & "') "
        cmb.Connection = cn
        cmb.ExecuteNonQuery()

        cmb.CommandText = "SELECT MAX(id) FROM Notification"
        cmb.Connection = cn
        Dim n_id As Integer = cmb.ExecuteScalar + 1
        cmb.CommandText = "INSERT INTO Notification(id,c_id,sales_return_id,status) VALUES(" & n_id & "," & Session("uid") & "," & s_r_id & ",'notread')"
        cmb.Connection = cn
        cmb.ExecuteNonQuery()


        cmb.CommandText = "INSERT INTO Sales_return_details VALUES(" & s_r_id & "," & p_id & "," & qty & ")"
        cmb.Connection = cn
        cmb.ExecuteNonQuery()

        cn.Close()
        MsgBox("Product will be picked up FROM Delivery Address with in TWO DAYS")
        Response.Redirect("/OnlineToyShop/MngOrder.aspx")

    End Sub
End Class
