Public Class index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            CargaTramitesPen()
        End If
    End Sub

    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Dim cb_Aplicar As CheckBox
        Dim listSeleccionadas As New ListItemCollection
        Dim objPlan As New ClasePlan
        Dim intRes As Integer = 0
        Dim intReq As Integer = 0

        For x = 0 To Me.gv_CambioPlanPendiente.Rows.Count - 1
            cb_Aplicar = Me.gv_CambioPlanPendiente.Rows(x).FindControl("cb_Aplicar")
            If cb_Aplicar.Checked Then
                listSeleccionadas.Add(Me.gv_CambioPlanPendiente.Rows(x).Cells(1).Text)
                intReq += 1
            End If
        Next x
        If intReq > 0 Then
            intRes = objPlan.AutorizarTramitesPen(listSeleccionadas)
        End If
        If intRes > 0 Then
            lblMsn.Text = "Trámites autorizados: " + intReq.ToString()
            CargaTramitesPen()
        Else
            lblMsn.Text = "No se autorizaron nuevos trámites"
        End If
    End Sub

    Private Sub gv_CambioPlanPendiente_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv_CambioPlanPendiente.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.Cells(5).Text <> "PEN" Then
                e.Row.FindControl("cb_Aplicar").Visible = False
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#F0E430")
            End If
        End If
    End Sub

    Private Sub CargaTramitesPen()
        Dim objPlan As New ClasePlan
        Dim objDataSet As New DataSet
        Dim intResul As Integer
        intResul = objPlan.RecuperaTramitesPen(objDataSet)
        If intResul > 0 Then
            Me.gv_CambioPlanPendiente.DataSource = objDataSet.Tables("Planes")
            Me.gv_CambioPlanPendiente.DataBind()
        End If
        objDataSet.Dispose()
    End Sub

End Class