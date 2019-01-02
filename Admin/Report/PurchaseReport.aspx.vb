Imports CrystalDecisions.CrystalReports.Engine

Partial Class Admin_Report_PurchaseReport
    Inherits System.Web.UI.Page
  

  
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        GridView1.DataSourceID = "SqlDataSource4"

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        GridView1.DataSourceID = "SqlDataSource3"

    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        GridView1.DataSourceID = "SqlDataSource3"

    End Sub
End Class
