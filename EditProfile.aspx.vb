
Partial Class EditProfile
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection
    Dim cmb As New SqlCommand

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        cn.ConnectionString = ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString()
        cn.Open()

        cmb.CommandText = "SELECT * FROM Customer WHERE user_name='" & Session("user") & "'"
        cmb.Connection = cn
        Dim dr As SqlDataReader

        dr = cmb.ExecuteReader
        While dr.Read
            fnameTextBox.Text = dr.Item("fname")
            lnameTextBox.Text = dr.Item("lname")
            Adddress_line1.Text = dr.Item("address1")
            Address_line2.Text = dr.Item("address2")
            birthdate.Text = dr.Item("dob")
            ContactTextBox.Text = dr.Item("contact")
            EmailTextBox.Text = dr.Item("Email_id")



        End While




        cn.Close()

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("user") = "" Then
            Response.Redirect("/OnlineToyShop/Account/Login.aspx")
        End If


    End Sub

    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdateButton.Click
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString()
        cn.Open()
        cmb.Connection = cn

        cmb.CommandText = "Update Customer SET fname= '" & fnameTextBox.Text & "', lname='" & lnameTextBox.Text & "', address1='" & Adddress_line1.Text & "', address2='" & Address_line2.Text & "', gender='" & RadioButtonList1.SelectedItem.Text & "', dob='" & birthdate.Text & "', contact=" & ContactTextBox.Text & ", Email_id='" & EmailTextBox.Text & "', area_id=" & AreaDropDownList.SelectedValue & " where (c_id = " & Session("uid") & ")"


        cmb.ExecuteNonQuery()
        cn.Close()

    End Sub

  
End Class
