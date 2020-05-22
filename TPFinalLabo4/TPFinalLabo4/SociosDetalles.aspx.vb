Public Class SociosDetalles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim strNro As String
            strNro = Request.QueryString("g")
            If Not IsNothing(strNro) AndAlso strNro.Length > 0 Then
                strNro = strNro.Trim()
                Me.lbl_NroSocioTit.Text = strNro
                RecuperaSocioPorNroInt(strNro)
            End If
        End If
    End Sub

    Public Sub RecuperaSocioPorNroInt(ByVal arNroInt As String)
        Dim intResult As Integer
        Dim objDataSet As New DataSet
        Dim objSocio As New ClaseSocios
        Dim strNroSocio, strNroTitular As String
        intResult = objSocio.RecuperaSocioPorNroInt(objDataSet, arNroInt)

        If intResult > 0 Then
            strNroTitular = objDataSet.Tables("Socio").Rows(0).Item("nro_socio_titular").ToString.Trim()
            strNroSocio = objDataSet.Tables("Socio").Rows(0).Item("nro_socio").ToString.Trim()
            Me.lbl_nroSocio.Text = strNroSocio
            Me.lbl_Apellido.Text = objDataSet.Tables("Socio").Rows(0).Item("apellido").ToString.Trim()
            Me.lbl_Nombre.Text = objDataSet.Tables("Socio").Rows(0).Item("nombre").ToString.Trim()
            Me.lbl_NroDoc.Text = objDataSet.Tables("Socio").Rows(0).Item("nro_documento").ToString.Trim()
            Me.lbl_FechaNac.Text = Date.Parse(objDataSet.Tables("Socio").Rows(0).Item("fecha_nacimiento").ToString.Trim())
            Me.lbl_Sexo.Text = objDataSet.Tables("Socio").Rows(0).Item("sexoVAR").ToString.Trim()
            Me.lbl_Parentesco.Text = objDataSet.Tables("Socio").Rows(0).Item("parentescoVAR").ToString.Trim()
            Me.lbl_Plan.Text = objDataSet.Tables("Socio").Rows(0).Item("plan_os").ToString.Trim()
            Me.lbl_Direccion.Text = objDataSet.Tables("Socio").Rows(0).Item("direccion").ToString.Trim()
            Me.lbl_cp.Text = objDataSet.Tables("Socio").Rows(0).Item("cp").ToString.Trim()
            Me.lbl_Tel.Text = objDataSet.Tables("Socio").Rows(0).Item("telefonos").ToString.Trim()
            Me.lbl_Mail.Text = objDataSet.Tables("Socio").Rows(0).Item("mail").ToString.Trim()
            Me.lbl_estado.Text = objDataSet.Tables("Socio").Rows(0).Item("estadoVAR").ToString.Trim()

            Dim intResultTitular As Integer
            Dim objDataSet1 As New DataSet
            intResultTitular = objSocio.RecuperaSocioPorNroInt(objDataSet1, strNroTitular)
            If intResultTitular <> 0 Then
                Me.lbl_NroSocioTit.Text = objDataSet1.Tables("Socio").Rows(0).Item("apVAR").ToString.Trim()
            End If

            RecuperaGrupoFamiliarPorNroSocio(strNroSocio)
            Else
            Me.lbl_nroSocio.Text = ""
            Me.lbl_Apellido.Text = ""
            Me.lbl_Nombre.Text = ""
            Me.lbl_NroDoc.Text = ""
            Me.lbl_NroDoc.Text = ""
            Me.lbl_FechaNac.Text = ""
            Me.lbl_Sexo.Text = ""
            Me.lbl_NroSocioTit.Text = ""
            Me.lbl_Parentesco.Text = ""
            Me.lbl_Plan.Text = ""
            Me.lbl_Direccion.Text = ""
            Me.lbl_cp.Text = ""
            Me.lbl_Tel.Text = ""
            Me.lbl_Mail.Text = ""
            Me.lbl_estado.Text = ""
            Me.gvGrupoFamiliar.DataSource = Nothing
            Me.gvGrupoFamiliar.DataBind()
        End If
        objDataSet.Dispose()
    End Sub

    Public Sub RecuperaGrupoFamiliarPorNroSocio(ByVal arNroSocio As String)
        Dim intResult As Integer
        Dim objDataSet As New DataSet
        Dim objSocio As New ClaseSocios

        intResult = objSocio.RecuperaGrupoFamiliarPorNroSocio(objDataSet, arNroSocio)

        If intResult > 0 Then
            Me.gvGrupoFamiliar.DataSource = objDataSet.Tables("GrupoFamiliar")
            gvGrupoFamiliar.DataBind()
        Else
            Me.gvGrupoFamiliar.DataSource = Nothing
            Me.gvGrupoFamiliar.DataBind()
        End If
        objDataSet.Dispose()
    End Sub

End Class