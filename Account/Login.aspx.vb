
Partial Class Account_Login
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())


    Dim cmb As New SqlCommand
    Dim da As New SqlDataAdapter("select * from Log_in", cn)
    Dim ds As New Data.DataSet
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If ((Not (Request.Cookies("UserName")) Is Nothing) _
                        AndAlso (Not (Request.Cookies("Password")) Is Nothing)) Then
                UserNameTB.Text = Request.Cookies("UserName").Value
                PswdTB.Attributes("value") = Request.Cookies("Password").Value
            End If
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        
        cn.Open()
        da.Fill(ds, "Log_in")
        cmb.CommandText = "SELECT COUNT(*) FROM Log_in WHERE user_name='" & UserNameTB.Text & "'"
        cmb.Connection = cn
        Dim i As Integer = cmb.ExecuteScalar

        If i = 1 Then
            cmb.CommandText = "SELECT COUNT(*) FROM Admin WHERE user_name='" & UserNameTB.Text & "'"
            Dim a As Integer = cmb.ExecuteScalar
            cmb.CommandText = "SELECT user_pass FROM Log_in WHERE user_name='" & UserNameTB.Text & "'"
            cmb.Connection = cn
            Dim pass As String
            pass = cmb.ExecuteScalar
            Response.Write(pass)
            If pass = PswdTB.Text Then

                If (checkbox1.Checked) Then

                    Response.Cookies("UserName").Expires = DateTime.Now.AddDays(30)
                    Response.Cookies("Password").Expires = DateTime.Now.AddDays(30)


                Else

                    Response.Cookies("UserName").Expires = DateTime.Now.AddDays(-1)
                    Response.Cookies("Password").Expires = DateTime.Now.AddDays(-1)
                End If

                Response.Cookies("UserName").Value = UserNameTB.Text.Trim()
                Response.Cookies("Password").Value = PswdTB.Text.Trim()


                If a = 1 Then
                    Session("admin") = UserNameTB.Text
                    

                    Response.Redirect("~/Admin/AdminMainPage.aspx")
                Else
                    cmb.CommandText = "SELECT c_id FROM Customer WHERE user_name='" & UserNameTB.Text & "'"
                    cmb.Connection = cn
                    Session("uid") = cmb.ExecuteScalar()
                    Session("user") = UserNameTB.Text

                    
                    Response.Redirect("~/Default.aspx")


                End If

            Else
                Response.Clear()
                Response.Write("User Name or Password is not correct")


            End If
        Else
            Response.Clear()
            Response.Write("User Name or Password is not correct")

        End If
        cn.Close()

        
    End Sub
End Class
