Public Class login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btn_aceptar_Click(sender As Object, e As EventArgs) Handles btn_aceptar.Click
        Dim strUsuario As String
        Dim strContraseña As String
        Dim intResult As Integer
        Dim objDataSet As New DataSet
        Dim objParcial As New ClaseBuscaLogin

        strUsuario = inputNroUsuario.Text
        strContraseña = inputPassword.Text
        intResult = objParcial.recuperaUsuarioContrasena(objDataSet, strUsuario, strContraseña)

        If intResult > 0 Then
            'lbl_info.Text = "Bienvenido"
            Response.Redirect("Ej2.3.aspx")
        Else
            lbl_info.Text = "Usuario/Contraseña Incorrecto/a"
        End If
    End Sub
End Class