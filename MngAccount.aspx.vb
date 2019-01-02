
Partial Class MngAccount
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection
    Dim cmb As New SqlCommand


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("user") = "" Then
            Response.Redirect("/OnlineToyShop/Account/Login.aspx")
        End If

        cn.ConnectionString = ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString()
        cn.Open()

        cmb.CommandText = "SELECT * FROM Customer WHERE c_id='" & Session("uid") & "'"
        cmb.Connection = cn
        Dim dr As SqlDataReader
        dr = cmb.ExecuteReader
        While dr.Read
            fnameLabel.Text = dr.Item("fname")
            lnameLabel.Text = dr.Item("lname")
            address1Label.Text = dr.Item("address1")
            address2Label.Text = dr.Item("address2")
            genderLabel.Text = dr.Item("gender")
            dobLabel.Text = dr.Item("dob")
            contactLabel.Text = dr.Item("contact")
            Email_idLabel.Text = dr.Item("Email_id")


        End While
       
        cn.Close()


    End Sub
End Class
