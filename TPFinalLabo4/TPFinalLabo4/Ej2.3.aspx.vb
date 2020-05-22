Public Class Ej2_3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Me.lblResultados.Text = ""
        End If
    End Sub

    Protected Sub btnBuscarSocio_Click(sender As Object, e As EventArgs) Handles btnBuscarSocio.Click
        Dim intResult As Integer
        Dim objDataSet As New DataSet
        Dim objSocio As New ClaseSocios
        Dim strApellido, strNombre As String

        strApellido = Me.txtApellidoSocio.Text.Trim
        strNombre = Me.txtNombreSocio.Text.Trim
        intResult = objSocio.RecuperaSociosPorApeNomb(objDataSet, strApellido, strNombre)
        If intResult > 0 Then
            Me.lblResultados.Text = "Socios encontrados: " & intResult.ToString
            Me.gvSocios.DataSource = objDataSet.Tables("Socios")
        Else
            lblResultados.Text = "No se encontraron Socios"
            gvSocios.DataSource = Nothing
        End If
        gvSocios.DataBind()
        objDataSet.Dispose()
    End Sub
End Class