Public Class ClaseBuscaLogin
    Inherits CladPadre
    Public Function recuperaUsuarioContrasena(arDataSet As DataSet, Usuario As String, Contra As String) As Integer
        Dim intRetorno As Integer
        Dim strSQL As String

        strSQL = "Select usuario,clave FROM usuarios Where usuario = '" + Usuario + "' AND clave = '" + Contra + "'"
        intRetorno = Me.RecuperaDataSet(arDataSet, strSQL, "login")
        Return intRetorno
    End Function

    Public Function RecuperaMenuNav(ByRef arDataSet As DataSet) As Integer
        Dim varInt As Integer
        Dim strSQL As String

        strSQL = "SELECT * FROM zf_formularios WHERE estado = 'ACT' ORDER BY formulario"
        varInt = Me.RecuperaDataSet(arDataSet, strSQL, "Menu")
        Return varInt
    End Function
End Class
