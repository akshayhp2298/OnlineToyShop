Imports CrystalDecisions.CrystalReports.Engine

Partial Class Admin_Report_Product
    Inherits System.Web.UI.Page
    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("OTSProjectConnectionString1").ToString)
    Dim da As SqlDataAdapter
    Dim ds As New Product

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cn.Open()
        'MsgBox(“OK”)
        da = New SqlDataAdapter("select * from Product;SELECT * FROM Brand;SELECT * FROM Category;SELECT * FROM Subcategory", cn)
        da.TableMappings.Add("Table", "Product")
        da.TableMappings.Add("Table1", "Brand")
        da.TableMappings.Add("Table2", "Category")
        da.TableMappings.Add("Table3", "Subcategory")

        da.Fill(ds)
        Dim rep As New ReportDocument
        rep.Load(Server.MapPath("~/Admin/Report/ProductReport.rpt"))
        rep.SetDataSource(ds)
        CrystalReportViewer1.ReportSource = rep

    End Sub
End Class
