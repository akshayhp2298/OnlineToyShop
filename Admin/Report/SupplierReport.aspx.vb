Imports CrystalDecisions.CrystalReports.Engine

Partial Class Admin_Report_SupplierReport
    Inherits System.Web.UI.Page

    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString)
    Dim da As SqlDataAdapter
    Dim ds As New supplier



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        cn.Open()
        'MsgBox(“OK”)
        da = New SqlDataAdapter("select * from Supplier", cn)
        da.Fill(ds, "Supplier")
        Dim rep As New ReportDocument
        rep.Load(Server.MapPath("~/SupplierReport.rpt"))
        rep.SetDataSource(ds)
        CrystalReportViewer1.ReportSource = rep
    End Sub
End Class
