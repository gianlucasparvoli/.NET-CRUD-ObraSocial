Public Class Ej2_6
    Inherits System.Web.UI.Page

    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Dim strNroSocioInt, strNuevoPlan As String
        Dim intResul As Integer
        Dim objPlan As New ClasePlan
        strNroSocioInt = Me.txtNroSocio.Text
        strNuevoPlan = Me.cboPlanOS.SelectedValue

        intResul = objPlan.InsertCambioPlan(strNroSocioInt, strNuevoPlan)

        If intResul > 0 Then
            Me.lblMensajes.Text = "Solicitud procesada correctamente"
            Me.txtNroSocio.Text = ""
            Me.lblApeNomb.Text = ""
            Me.lblPlanActual.Text = ""
            Me.cboPlanOS.Items.Clear()
            Me.gvGrupoFamiliar.DataSource = Nothing
            Me.gvGrupoFamiliar.DataBind()
            Response.Redirect("Ej2.7.aspx")
        Else
            Me.lblMensajes.Text = "Hubo un problema. Intente de nuevo mas tarde"
        End If
    End Sub

    Protected Sub txtNroSocio_TextChanged(sender As Object, e As EventArgs) Handles txtNroSocio.TextChanged
        Dim intRes As Integer
        Dim strNroSocioInt, strPlanActual As String
        Dim objSocio As New ClaseSocios

        Dim objDataSet As New DataSet
        strNroSocioInt = Me.txtNroSocio.Text
        intRes = objSocio.RecuperaSocioPorNroParaCambioTitularidad(objDataSet, strNroSocioInt)

        Me.cboPlanOS.Items.Clear()
        Me.gvGrupoFamiliar.DataSource = Nothing
        Me.gvGrupoFamiliar.DataBind()

        If intRes > 0 Then
            strPlanActual = objDataSet.Tables("Socio").Rows(0).Item("plan_os")
            Me.lblApeNomb.Text = objDataSet.Tables("Socio").Rows(0).Item("apenomb")
            Me.lblPlanActual.Text = strPlanActual

            CargarGridViewParentesco(objDataSet.Tables("Socio").Rows(0).Item("nro_socio"))
            CargarComboBoxNuevoPlan(strPlanActual)
        Else
            Me.lblApeNomb.Text = ""
            Me.lblPlanActual.Text = ""
        End If
        objDataSet.Dispose()
    End Sub

    Public Sub CargarGridViewParentesco(ByVal arNroSocio As String)
        Dim intRes As Integer
        Dim objSocio As New ClaseSocios
        Dim objDataSet As New DataSet
        intRes = objSocio.RecuperaGrupoFamiliarPorNroSocio(objDataSet, arNroSocio)

        If intRes > 0 Then
            Me.gvGrupoFamiliar.DataSource = objDataSet.Tables("GrupoFamiliar")
            Me.gvGrupoFamiliar.DataBind()
        End If

        objDataSet.Dispose()
    End Sub
    Public Sub CargarComboBoxNuevoPlan(Optional ByVal arPlanActual As String = Nothing)
        Dim a(4) As String
        a(0) = "1000"
        a(1) = "2000"
        a(2) = "3000"
        a(3) = "5000"
        Dim x As Integer = 0
        For i = 0 To 3
            If arPlanActual <> a(i) Then
                cboPlanOS.Items.Insert(x, New ListItem(a(i), a(i)))
                x += 1
            End If
        Next i
    End Sub

End Class