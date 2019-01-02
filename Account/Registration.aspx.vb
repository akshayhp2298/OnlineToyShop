
Partial Class Account_Registration
    Inherits System.Web.UI.Page


    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmd As New SqlCommand
    Dim da As New SqlDataAdapter("select * from Log_in", cn)
    Dim ds As New Data.DataSet
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        cn.Open()
        da.Fill(ds, "Log_in")
        'checking username exists or not
        cmd.Connection = cn
        cmd.CommandText = "SELECT COUNT(*) FROM Log_in WHERE user_name='" & UserNameTextBox.Text & "'"



        Try
            If cmd.ExecuteScalar = 1 Then
                MsgBox("Username is alreay exsist try with another username")

            Else


                Dim str As String
                'insert login details
                str = "INSERT INTO Log_in VALUES ('" & UserNameTextBox.Text & "','" & PasswordTextBox.Text & "','" & secque.Text & "','" & secans.Text & "');"
                cmd.CommandText = str
                cmd.Connection = cn
                cmd.ExecuteNonQuery()
                'fetching last customer id
                str = "SELECT max(c_id) from Customer"
                cmd.CommandText = str
                cmd.Connection = cn
                Dim c_id As Integer = cmd.ExecuteScalar() + 1

                'insert customer details
                Dim city As Integer = cmd.ExecuteScalar
                str = "INSERT INTO Customer(c_id,fname,lname,address1,address2,area_id,gender,dob,contact,Email_id,user_name,company_id) VALUES ('" & c_id & "','" & fnameTextBox.Text & "','" & lnameTextBox.Text & "','" & Adddress_line1.Text & "','" & Address_line2.Text & "','" & AreaDropDownList.SelectedValue & "','" & RadioButtonList1.SelectedItem.ToString() & "','" & birthdate.Text & "','" & ContactTextBox.Text & "','" & EmailTextBox.Text & "','" & UserNameTextBox.Text & "',1);"
                cmd.CommandText = str
                cmd.Connection = cn
                cmd.ExecuteNonQuery()

                'create cart id
                str = "Insert Into Cart Values(" & c_id & "," & c_id & ");"
                cmd.CommandText = str
                cmd.Connection = cn
                cmd.ExecuteNonQuery()
                cn.Close()

                Response.Redirect("~/Account/Login.aspx")

            End If
        Catch ex As Exception
            MsgBox(ex.Message)

        End Try

        


    End Sub

   
   
End Class
