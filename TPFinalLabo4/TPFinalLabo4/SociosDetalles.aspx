<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="SociosDetalles.aspx.vb" Inherits="TPFinalLabo4.SociosDetalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Socio Detalles</h3>
    <table class="table table-dark">
        <tr>
            <th>
                <table>
                    <tr>
                        <th scope="col">Nro Socio: </th>
                        <td>
                            <asp:Label ID="lbl_nroSocio" runat="server" Text="PUTOELQUE LEE"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Apellido: </th>
                        <td>
                            <asp:Label ID="lbl_Apellido" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Nombre: </th>
                        <td>
                            <asp:Label ID="lbl_Nombre" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Nro Documento: </th>
                        <td>
                            <asp:Label ID="lbl_NroDoc" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Fecha Nacimiento: </th>
                        <td>
                            <asp:Label ID="lbl_FechaNac" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Sexo: </th>
                        <td>
                            <asp:Label ID="lbl_Sexo" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Titular: </th>
                        <td>
                            <asp:Label ID="lbl_NroSocioTit" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
            </th>

            <th >
                <table>
                    <tr>
                        <th scope="col">Parentesco: </th>
                        <td>
                            <asp:Label ID="lbl_Parentesco" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Plan: </th>
                        <td>
                            <asp:Label ID="lbl_Plan" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Direccion: </th>
                        <td>
                            <asp:Label ID="lbl_Direccion" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Codigo Postal: </th>
                        <td>
                            <asp:Label ID="lbl_cp" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Telefonos: </th>
                        <td>
                            <asp:Label ID="lbl_Tel" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Mail: </th>
                        <td>
                            <asp:Label ID="lbl_Mail" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">Estado: </th>
                        <td>
                            <asp:Label ID="lbl_estado" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
            </th>
        </tr>
    </table>

    <asp:GridView ID="gvGrupoFamiliar" runat="server" AutoGenerateColumns="False" CellPadding="3" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField HeaderText="Socio" DataField="nro_socio_int" />
            <asp:BoundField HeaderText="Apellido" DataField="apellido" />
            <asp:BoundField HeaderText="Nombre" DataField="nombre"  />
            <asp:BoundField HeaderText="Documento" DataField="documento" />
            <asp:BoundField HeaderText="Fec. de nacimiento" DataField="fecha_nacimiento" />
            <asp:BoundField HeaderText="Sexo" DataField="sexoVAR" />
            <asp:BoundField HeaderText="Nro. Socio" DataField="nro_socio" />
            <asp:BoundField HeaderText="Parentesco" DataField="parentescoVAR" />
            <asp:BoundField HeaderText="Plan" DataField="plan_os" />
            <asp:BoundField HeaderText="Direccion" DataField="direccion" />
            <asp:BoundField HeaderText="Cod. Pos." DataField="cp" />
            <asp:BoundField HeaderText="Teléfono" DataField="telefonos" />
            <asp:BoundField HeaderText="Email" DataField="mail" />
            <asp:BoundField HeaderText="Estado" DataField="estadoVAR" />
        </Columns>

        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C"></FooterStyle>

        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7"></HeaderStyle>

        <PagerStyle HorizontalAlign="Right" BackColor="#E7E7FF" ForeColor="#4A3C8C"></PagerStyle>

        <RowStyle ForeColor="#4A3C8C" BackColor="#E7E7FF"></RowStyle>

        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F4F4FD"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#5A4C9D"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#D8D8F0"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#3E3277"></SortedDescendingHeaderStyle>
    </asp:GridView>

</asp:Content>
