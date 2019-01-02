
Partial Class OrderInvoice
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())

    Dim cmb As New SqlCommand
    Dim dr As SqlDataReader

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user") = "" Then
            Response.Redirect("/OnlineToyShop/Account/Login.aspx")
        Else
            cn.Open()


            cmb.CommandText = "SELECT name,pincode FROM Area WHERE area_id=(SELECT area_id FROM Customer where c_id=" & Session("uid") & ")"
            cmb.Connection = cn
            Dim Area, pincode As String
            dr = cmb.ExecuteReader
            While dr.Read


                Area = dr.Item(0)
                pincode = dr.Item(1)

            End While
            cn.Close()
            cn.Open()

            cmb.CommandText = "SELECT name FROM City WHERE City_id=(SELECT City_id FROM Area where name='" & Area & "')"
            cmb.Connection = cn
            Dim City As String = cmb.ExecuteScalar

            cmb.CommandText = "SELECT fname,lname,address1,address2,contact,Email_id FROM Customer where c_id =" & Session("uid") & ""
            cmb.Connection = cn
            dr = cmb.ExecuteReader
            While dr.Read
                cusname.Text = dr.Item("fname") & " " & dr.Item("lname")
                add.Text = dr.Item("address1") & vbCrLf & dr.Item("address2") & vbCrLf & Area & "-" & pincode & vbCrLf & City
                contact.Text = dr.Item("contact")
                email.Text = dr.Item("Email_id")
            End While
            cn.Close()


            cn.Open()
            cmb.CommandText = "SELECT amount,SGST,CGST FROM Sales_payment WHERE sales_id=" & Request.QueryString("s_id") & ""
            cmb.Connection = cn
            dr = cmb.ExecuteReader
            While dr.Read
                total.Text = dr.Item(0)
                sgst.Text = dr.Item(1)
                cgst.Text = dr.Item(2)


            End While
            billamount.Text = CInt(total.Text) + CInt(sgst.Text) + CInt(cgst.Text)
            cn.Close()

            cn.Open()
            cmb.CommandText = "SELECT sales_date FROM Sales WHERE sales_id=" & Request.QueryString("s_id") & ""
            cmb.Connection = cn
            Dim d As Date = cmb.ExecuteScalar
            DateLabel.Text = d.Day & "-" & d.Month & "-" & d.Year
            cn.Close()




        End If

    End Sub
End Class
