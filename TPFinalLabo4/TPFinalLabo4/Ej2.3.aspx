<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Ej2.3.aspx.vb" Inherits="TPFinalLabo4.Ej2_3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3>Busqueda de Socios</h3>
    <hr />
    <table>
        <tr>
            <td>Apellido:</td>
            <td>
                <asp:TextBox class="form-control" placeholder="Apellido" ID="txtApellidoSocio" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese un apellido" ControlToValidate="txtApellidoSocio" Display="none"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Nombre:</td>
            <td>
                <asp:TextBox class="form-control" placeholder="Nombre" ID="txtNombreSocio" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese un nombre" ControlToValidate="txtnombreSocio" Display="none"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnBuscarSocio" runat="server" class="btn btn-success" Text="Buscar" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblResultados" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
    <hr />
    <asp:GridView ID="gvSocios" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:HyperLinkField HeaderText="Socio" DataNavigateUrlFields="nro_socio_int" DataNavigateUrlFormatString="SociosDetalles.aspx?g={0}" DataTextField="apenomb" />
            <asp:BoundField HeaderText="Documento" DataField="nro_documento" />
            <asp:BoundField HeaderText="Ape y Nom" DataField="apenomb" />
            <asp:BoundField HeaderText="Fec de Nac" DataField="fecha_nacimiento" />
            <asp:BoundField HeaderText="Sexo" DataField="sexoVAR" />
            <asp:BoundField HeaderText="Nro. Socio" DataField="nro_socio" />
            <asp:BoundField HeaderText="Nro. Socio Titular" DataField="nro_socio_titular" />
            <asp:BoundField HeaderText="Parentesco" DataField="parentescoVAR" />
            <asp:BoundField HeaderText="Plan" DataField="plan_os" />
            <asp:BoundField HeaderText="Direccion" DataField="direccion" />
            <asp:BoundField HeaderText="CP" DataField="cp" />
            <asp:BoundField HeaderText="Teléfono" DataField="telefonos" />
            <asp:BoundField HeaderText="Email" DataField="mail" />
            <asp:BoundField HeaderText="Estado" DataField="estadoVAR" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>

</asp:Content>
