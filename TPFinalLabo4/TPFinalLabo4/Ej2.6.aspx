<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Ej2.6.aspx.vb" Inherits="TPFinalLabo4.Ej2_6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3>Solicitud Cambio Plan</h3>
    <hr />

    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>SOCIO TIT. NRO.:</td>
                        <td>
                            <asp:TextBox class="form-control" placeholder="Socio Titular" ID="txtNroSocio" runat="server" AutoPostBack="true"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblApeNomb" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Plan actual:</td>
                        <td colspan="2">
                            <asp:Label ID="lblPlanActual" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Nuevo plan:</td>
                        <td colspan="2">
                            <asp:DropDownList ID="cboPlanOS" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>

            </td>
            <td >GRUPO FAMILIAR
                <asp:Label ID="lblGrupoFamiliar" runat="server" Text=""></asp:Label>
                <asp:GridView ID="gvGrupoFamiliar" runat="server" AutoGenerateColumns="False" CellPadding="3" GridLines="Horizontal" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="#F7F7F7"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField HeaderText="Socio" DataField="nro_socio_int" />
                        <asp:BoundField HeaderText="Documento" DataField="documento" />
                        <asp:BoundField HeaderText="Ape. y Nombre" DataField="apenomb" />
                        <asp:BoundField HeaderText="Nro. Socio" DataField="nro_socio" />
                        <asp:BoundField HeaderText="Parentesco" DataField="parentescoVAR" />
                    </Columns>

                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C"></FooterStyle>

                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Right" BackColor="#E7E7FF" ForeColor="#4A3C8C"></PagerStyle>

                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C"></RowStyle>

                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#F4F4FD"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#5A4C9D"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#D8D8F0"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#3E3277"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnEnviar" runat="server" class="btn btn-success" Text="Enviar" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblMensajes" runat="server" Text=""></asp:Label>

</asp:Content>
