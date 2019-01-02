Imports System.Linq
Imports System.Collections.Generic
Imports System.Web.UI
Imports System.Web
Imports System.Web.UI.WebControls
Imports System
Imports CrystalDecisions.CrystalReports.Engine




Partial Class Admin_Report_Default
    Inherits System.Web.UI.Page

    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString)
    Dim da As SqlDataAdapter
    Dim ds As New customer



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        cn.Open()
        'MsgBox(“OK”)
        da = New SqlDataAdapter("select * from Customer", cn)
        da.Fill(ds, "Customer")
        Dim rep As New ReportDocument
        rep.Load(Server.MapPath("~/CrystalReport1.rpt"))
        rep.SetDataSource(ds)
        CrystalReportViewer1.ReportSource = rep



    End Sub


End Class
