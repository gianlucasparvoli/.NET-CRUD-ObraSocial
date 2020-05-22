<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage.Master" CodeBehind="Ej2.7.aspx.vb" Inherits="TPFinalLabo4.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td colspan="2">
                <h3>Cambios de plan</h3>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gv_CambioPlanPendiente" runat="server" CellPadding="3" GridLines="Horizontal" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px">

                    <AlternatingRowStyle BackColor="#F7F7F7" />

                    <Columns>
                        <asp:TemplateField HeaderText="Seleccion">
                            <ItemTemplate>
                                <asp:CheckBox ID="cb_Aplicar" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="nro_tramite" HeaderText="Nro. Tramite"></asp:BoundField>
                        <asp:BoundField DataField="apenomb" HeaderText="Apellido y nombre"></asp:BoundField>
                        <asp:BoundField DataField="plan_actual" HeaderText="Plan Actual"></asp:BoundField>
                        <asp:BoundField DataField="plan_nuevo" HeaderText="Nuevo Plan"></asp:BoundField>
                        <asp:BoundField DataField="estado" HeaderText="Estado"></asp:BoundField>
                    </Columns>
                    
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnEnviar" runat="server" class="btn btn-success" Text="Aplicar Cambios" /></td>
            <td>
                <asp:Label ID="lblMsn" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
</asp:Content>
