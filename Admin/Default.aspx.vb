Imports System.IO
Imports System.Net
Imports System.Net.Mail

Partial Class Admin_Default
    Inherits System.Web.UI.Page




   
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim cn, cn1 As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString)
        Dim cmb, cmb1 As New SqlCommand
        cn.Open()
        cmb.CommandText = "SELECT DOB,name,child_id FROM Child"
        cmb.Connection = cn
        Dim dr As SqlDataReader = cmb.ExecuteReader
        While dr.Read


            Dim d, d1 As Date
            d = dr.Item(0)
            d1 = Date.Now.AddDays(5)
          
            If d.Day = d1.Day And d.Month = d1.Month Then

                cn1.Open()
                cmb1.CommandText = "SELECT Email_id FROM Customer WHERE c_id=(SELECT c_id FROM Child_detail WHERE child_id=" & dr.Item("child_id") & ")"
                cmb1.Connection = cn1
                sendmail(cmb1.ExecuteScalar, dr.Item("name"))
                cn1.Close()


            End If


        End While
        cn.Close()









    End Sub


    Sub sendmail(ByVal client_email As String, ByVal child_name As String)

        Using mm As New MailMessage("akshayhp2298@gmail.com", client_email)
            mm.Subject = "Birthdate"
            mm.Body = "send Gift To " & child_name & " ON his/her birthday...." & vbCrLf & " By a Toy From Our WebSite MehtaToyShop.com"

            mm.IsBodyHtml = True
            Dim smtp As New SmtpClient
            smtp.Host = "smtp.gmail.com"
            smtp.EnableSsl = True
            Dim NetworkCred As New NetworkCredential("akshayhp2298@gmail.com", "ahp@8866132298")
            smtp.UseDefaultCredentials = True
            smtp.Credentials = NetworkCred
            smtp.Port = 587
            smtp.Send(mm)
            ClientScript.RegisterStartupScript(mm.GetType, "alert ", "alert('email sent');", True)

        End Using
    End Sub
End Class
