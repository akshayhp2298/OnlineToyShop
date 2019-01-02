
Partial Class Account_ForgetPassword
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmb As New SqlCommand

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        cn.Open()
        cmb.CommandText = "SELECT Count(user_name) FROM Log_in Where user_name='" & UserName.Text & "'"
        cmb.Connection = cn
       
        If cmb.CommandText = "0" Then
            MsgBox("You Entered Wrong User Name" & vbCrLf & "Try Again...")
        Else
            Panel1.Visible = False
            Panel2.Visible = True
            cmb.CommandText = "SELECT security_que,security_ans FROM Log_in WHERE user_name='" & UserName.Text & "'"
            Dim dr As SqlDataReader
            dr = cmb.ExecuteReader
            While dr.Read
                secque.Text = dr.Item(0)

            End While
            RequiredFieldValidator1.Enabled = True
        End If
        cn.Close()

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        cn.Open()
        cmb.CommandText = "SELECT user_pass FROM Log_in Where user_name='" & UserName.Text & "'"
        cmb.Connection = cn
        Dim ans As String = cmb.ExecuteScalar
        If ans.CompareTo(secans.Text) Then
            Panel3.Visible = True
            Panel2.Visible = False
            Panel1.Visible = False
            RequiredFieldValidator13.Enabled = True
            C.Enabled = True


        Else
            MsgBox("Your asnwer is wrong")
        End If
        cn.Close()
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
       

        cn.Open()
        cmb.CommandText = "UPDATE Log_in SET user_pass= '" & PswdTB.Text & "' WHERE (user_name='" & UserName.Text & "')"
        cmb.Connection = cn
        cmb.ExecuteNonQuery()
        cn.Close()



        MsgBox("Your New Password Created Succesfully." & vbCrLf & "Now You Can Login")
        Response.Redirect("/OnlineToyShop/Account/Login.aspx")
    End Sub
End Class
