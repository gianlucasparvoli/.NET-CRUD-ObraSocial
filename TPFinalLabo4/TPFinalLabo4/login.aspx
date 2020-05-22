<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="TPFinalLabo4.login" %>

<!DOCTYPE html>

<html lang="es">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="Css/bootstrap.min.css" />
    <link rel="stylesheet" href="Css/styles.css" />
    <title>Obra Social PAMI</title>
</head>
<body class="text-center">

    <form class="form-signin" runat="server">
        <img class="mb-4" src="img/login.png" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">Identifícate</h1>
        <label for="inputNroUsuario" class="sr-only">Nro Usuario</label>
        <asp:TextBox ID="inputNroUsuario" runat="server" class="form-control" placeholder="Nro Usuario"></asp:TextBox>
        <label for="inputPassword" class="sr-only">Contraseña</label>
        <asp:TextBox ID="inputPassword" runat="server" type="password" class="form-control" placeholder="Contraseña"></asp:TextBox>
        <asp:Button class="btn btn-lg btn-primary btn-block" ID="btn_aceptar" runat="server" Text="Aceptar" />
        <asp:Label ID="lbl_info" runat="server" Text=""></asp:Label>       
        <p class="mt-5 mb-3 text-muted">Gianluca Sparvoli &copy; 2019</p>
    </form>

    <script type="text/javascript" src="JQuery/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="JQuery/bootstrap.min.js"></script>
</body>
</html>
