
Partial Class ViewChildDetailaspx
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString())
    Dim cmb As New SqlCommand

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Label1.Visible = False
        Label2.Visible = False
        Label3.Visible = False
        Label4.Visible = False
        Button1.Visible = False


        TextBox1.Visible = True
        TextBox2.Visible = True
        RadioButtonList1.Visible = True

        TextBox3.Visible = True
        addbtn.Visible = True
        addbtn0.Visible = True






    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If Session("user") = "" Then
            Response.Redirect("/OnlineToyShop/Account/Login.aspx")

        End If
        cn.Open()

        cmb.CommandText = "SELECT * FROM Child WHERE child_id=(SELECT child_id FROM Child_detail WHERE c_id=" & Session("uid") & ")"
        cmb.Connection = cn
        Dim dr As SqlDataReader = cmb.ExecuteReader
        While dr.Read

            Label1.Text = dr.Item(1)
            Label2.Text = dr.Item(2)
            Label3.Text = dr.Item(3)
            TextBox1.Text = dr.Item(1)
            TextBox2.Text = dr.Item(2)


        End While
        cn.Close()



        cn.Open()
        cmb.Connection = cn
        cmb.CommandText = "SELECT relation From Child_detail WHERE c_id=" & Session("uid") & ""
        Label4.Text = cmb.ExecuteScalar
        TextBox3.Text = cmb.ExecuteScalar

        cn.Close()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       
    End Sub

    Protected Sub addbtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addbtn.Click
        cn.Open()
        cmb.CommandText = "UPDATE Child SET name='" & TextBox1.Text & "',DOB='" & TextBox2.Text & "',gender='" & RadioButtonList1.SelectedItem.ToString() & "' WHERE child_id=(select child_id from Child_detail where c_id=" & Session("uid") & ")"
        cmb.Connection = cn
        cmb.ExecuteNonQuery()


        cmb.CommandText = "UPDATE Child_detail SET relation='" & TextBox3.Text & "' where c_id=" & Session("uid") & ""
        cmb.Connection = cn
        cmb.ExecuteNonQuery()
        cn.Close()



        Response.Redirect("/OnlineToyShop/ViewChildDetailaspx.aspx")

    End Sub

    Protected Sub addbtn0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addbtn0.Click
        Label1.Visible = True
        Label2.Visible = True
        Label3.Visible = True
        Label4.Visible = True
        Button1.Visible = True


        TextBox1.Visible = False
        TextBox2.Visible = False
        RadioButtonList1.Visible = False

        TextBox3.Visible = False
        addbtn.Visible = False
        addbtn0.Visible = False

    End Sub
End Class
