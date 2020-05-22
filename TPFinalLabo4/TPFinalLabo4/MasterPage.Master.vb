Public Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim objDataSet As New DataSet
            Dim objnabbars As New ClaseBuscaLogin
            Dim intResul As Integer
            Dim strPag, strItemMenu As String

            intResul = objnabbars.RecuperaMenuNav(objDataSet)
            If intResul > 0 Then
                For x = 0 To intResul - 1
                    strPag = objDataSet.Tables("Menu").Rows(x).Item("pagina")
                    strItemMenu = objDataSet.Tables("Menu").Rows(x).Item("nombre_menu")

                    Dim objMenuItem As New MenuItem(strItemMenu.Trim, "", "", strPag.Trim)
                    Me.Menu.Items.Add(objMenuItem)
                Next x
            End If

        End If
    End Sub

End Class