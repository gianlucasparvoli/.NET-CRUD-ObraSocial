Public Class ClaseSocios
    Inherits CladPadre

    Public Function RecuperaSociosPorApeNomb(ByRef arDataSet As DataSet, ByVal arApellido As String, ByVal arNombre As String) As Integer
        Dim strSQL As String
        Dim intRes As Integer
        strSQL = "SELECT *, ltrim(rtrim(apellido)) + ', ' + ltrim(rtrim(nombre)) as apenomb, CASE WHEN sexo = 'F' THEN 'Femenino' ELSE 'Masculino' END as sexoVAR, CASE WHEN parentesco = 'PAD' THEN 'Padre' WHEN parentesco = 'TIT' THEN 'Titular' WHEN parentesco = 'CON' THEN 'Cónyugue' ELSE 'Hijo' END as parentescoVAR, CASE WHEN estado = 'ACT' THEN 'Activo' ELSE 'Baja' END As estadoVAR FROM Socios WHERE apellido LIKE '" & arApellido.Trim() & "%' AND nombre LIKE '" & arNombre.Trim() & "%' "
        intRes = Me.RecuperaDataSet(arDataSet, strSQL, "Socios")
        Return intRes
    End Function
    Public Function RecuperaSocioPorNroInt(ByRef arDataSet As DataSet, ByVal arNroSocio As String) As Integer
        Dim strSQL As String
        Dim intRes As Integer

        strSQL = "SELECT *, ltrim(rtrim(apellido)) + ', ' + ltrim(rtrim(nombre)) as apVAR, CASE WHEN sexo = 'f' THEN 'Femenino' ELSE 'Masculino' END as sexoVAR, CASE WHEN parentesco = 'PAD' THEN 'Padre' WHEN parentesco = 'TIT' THEN 'Titular' WHEN parentesco = 'CON' THEN 'Cónyugue' ELSE 'Hijo' END as parentescoVAR, CASE WHEN estado = 'ACT' THEN 'Activo' ELSE 'Baja' END As estadoVAR FROM  Socios WHERE nro_socio_int = " & arNroSocio.Trim()

        intRes = Me.RecuperaDataSet(arDataSet, strSQL, "Socio")
        Return intRes
    End Function

    Public Function RecuperaGrupoFamiliarPorNroSocio(ByRef arDataSet As DataSet, ByVal arNroSocio As String) As Integer
        Dim strSQL As String
        Dim intRes As Integer
        strSQL = "SELECT *, ltrim(rtrim(apellido)) + ', ' + ltrim(rtrim(nombre)) as apenomb, ltrim(rtrim(nro_documento)) as documento, CASE WHEN sexo = 'F' THEN 'Femenino' ELSE 'Masculino' END as sexoVAR, CASE WHEN parentesco = 'PAD' THEN 'Padre' WHEN parentesco = 'TIT' THEN 'Titular' WHEN parentesco = 'CON' THEN 'Cónyugue' ELSE 'Hijo' END as parentescoVAR, CASE WHEN estado = 'ACT' THEN 'Activo' ELSE 'Baja' END As estadoVAR FROM Socios WHERE nro_socio_titular = (SELECT TOP 1 nro_socio_titular FROM Socios WHERE nro_socio = '" & arNroSocio.Trim() & "') AND nro_socio != '" & arNroSocio.Trim() & "'"
        intRes = Me.RecuperaDataSet(arDataSet, strSQL, "GrupoFamiliar")
        Return intRes
    End Function


    Public Function RecuperaSocioPorNroParaCambioTitularidad(ByRef arDataSet As DataSet, ByVal arNroSocio As String) As Integer
        Dim strSQL As String
        Dim intRes As Integer
        strSQL = "SELECT TOP 1 ltrim(rtrim(S.apellido)) + ', ' + ltrim(rtrim(S.nombre)) as apenomb, S.plan_os, S.nro_socio FROM Socios S WHERE S.nro_socio = " & arNroSocio.Trim() & "AND Parentesco = 'TIT' AND Estado = 'ACT' AND S.nro_socio_int NOT IN (SELECT DISTINCT nro_socio FROM Tramites_cambio_plan WHERE Estado = 'PEN')"
        intRes = Me.RecuperaDataSet(arDataSet, strSQL, "Socio")
        Return intRes
    End Function
End Class
