Public Class ClasePlan
    Inherits CladPadre

    Public Function RecuperaTramitesPen(ByRef arDataSet As DataSet) As Integer
        Dim strSQL As String
        Dim intRes As Integer

        strSQL = "SELECT ltrim(rtrim(s.apellido)) + ' ' + ltrim(rtrim(s.nombre)) as apenomb, t.* FROM Tramites_cambio_plan t INNER JOIN Socios s ON t.nro_socio = s.nro_socio WHERE t.estado = 'PEN' OR (t.estado != 'PEN' AND DATEDIFF(DAY, getdate(), t.fecha_resolucion) < 35)"

        intRes = Me.RecuperaDataSet(arDataSet, strSQL, "Planes")
        Return intRes
    End Function

    Public Function AutorizarTramitesPen(ByVal arTram As ListItemCollection) As Integer
        Dim intRes As Integer
        Dim strSQL, fecha As String
        fecha = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff")
        strSQL = "UPDATE Tramites_cambio_plan SET Estado = 'APL', fecha_resolucion = '" & fecha & "', usuario_ult_modif = '" & HttpContext.Current.Session("user") & "' WHERE nro_tramite In ("
        For Each trami As ListItem In arTram
            strSQL &= trami.ToString() & ","
        Next trami
        strSQL = strSQL.TrimEnd(",") + ");"

        strSQL &= " DECLARE @nro_socio char(8); DECLARE @plan_nuevo char(4);DECLARE cursor_socios CURSOR FOR select nro_socio, plan_nuevo FROM Tramites_cambio_plan WHERE Estado = 'APL' AND fecha_resolucion = '" & fecha & "' AND usuario_ult_modif = '" & HttpContext.Current.Session("user") & "'; OPEN cursor_socios; FETCH NEXT FROM cursor_socios INTO @nro_socio, @plan_nuevo; WHILE @@FETCH_STATUS = 0 BEGIN UPDATE Socios SET plan_os = @plan_nuevo WHERE nro_socio_titular = @nro_socio;FETCH NEXT FROM cursor_socios INTO @nro_socio, @plan_nuevo; END CLOSE cursor_socios; DEALLOCATE cursor_socios;"

        intRes = Me.Ejecutar(strSQL)
        Return intRes
    End Function


    Public Function InsertCambioPlan(ByVal strNroSocio As String, ByVal strNuevoPlan As String) As String
        Dim intRes As Integer
        Dim strSQL As String
        strSQL = "INSERT INTO Tramites_cambio_plan VALUES (CASE WHEN NOT EXISTS(SELECT TOP 1 1 FROM Tramites_cambio_plan) THEN 1 ELSE (SELECT TOP 1 nro_tramite + 1 as nro_tramite From Tramites_cambio_plan order by nro_tramite desc) END,'" & strNroSocio & "'," & "(SELECT TOP 1 plan_os FROM Socios WHERE nro_socio = '" & strNroSocio & "'),'" & strNuevoPlan & "', 'PEN', '11/11/19', 'User');"
        intRes = Me.Ejecutar(strSQL)
        Return intRes
    End Function
End Class
