
Partial Class Admin_user_Admin
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString)
    Dim cmb As New SqlCommand

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Session("admin") = "" Then
            Response.Redirect("/OnlineToyShop/Account/Login.aspx")
        End If

        cn.Open()

        cmb.CommandText = "SELECT * FROM Admin WHERE user_name='" & Session("admin") & "'"
        cmb.Connection = cn

        Dim dr As SqlDataReader
        dr = cmb.ExecuteReader
        While dr.Read
            fnameTextBox.Text = dr.Item("fname")
            lnameTextBox.Text = dr.Item("lname")
            Adddress_line1.Text = dr.Item("address1")
            Address_line2.Text = dr.Item("address2")
            ContactTextBox.Text = dr.Item("contact")
            EmailTextBox.Text = dr.Item("Email_id")
        End While

        cn.Close()
        Panel1.Visible = False
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("admin") = "" Then
            Response.Redirect("/OnlineToyShop/Account/Login.aspx")
        End If

        cn.Open()

        cmb.CommandText = "SELECT * FROM Admin WHERE user_name='" & Session("admin") & "'"
        cmb.Connection = cn

        Dim dr As SqlDataReader
        dr = cmb.ExecuteReader
        While dr.Read

            fnameLabel.Text = dr.Item("fname")
            lnameLabel.Text = dr.Item("lname")
            address1Label.Text = dr.Item("address1")
            address2Label.Text = dr.Item("address2")
            contactLabel.Text = dr.Item("contact")
            Email_idLabel.Text = dr.Item("Email_id")

          
        End While

        cn.Close()
        Panel1.Visible = False


    End Sub

    Protected Sub EditButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EditButton.Click
        Panel1.Visible = True
        Panel2.Visible = False

    End Sub

   
    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdateButton.Click
        cn.Open()
        cmb.Connection = cn
        cmb.CommandText = "Update Admin SET fname= '" & fnameTextBox.Text & "', lname='" & lnameTextBox.Text & "', address1='" & Adddress_line1.Text & "', address2='" & Address_line2.Text & "', contact=" & ContactTextBox.Text & ", Email_id='" & EmailTextBox.Text & "', area_id=" & AreaDropDownList.SelectedValue & " where (user_name = '" & Session("admin") & "')"
        cmb.ExecuteNonQuery()
        cn.Close()
        MsgBox("Record Updated")
        Panel2.Visible = True
        Panel1.Visible = False
        Response.Redirect("/OnlineToyShop/Admin/user/Admin.aspx")

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Panel2.Visible = True
        Panel1.Visible = False
    End Sub

   
    
End Class
