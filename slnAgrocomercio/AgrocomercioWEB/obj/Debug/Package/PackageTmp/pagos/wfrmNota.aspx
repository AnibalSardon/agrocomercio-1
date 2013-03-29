<%@ Page Title=".:Notas:." Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="wfrmNota.aspx.cs" Inherits="AgrocomercioWEB.Compras.wfrmNota" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../App_Themes/TemaAgrocomercio/ventas.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">

       function dgvDetalleVentaClickEvent(event, rowindex) {

           document.getElementById('lblEstado').value = "DGVCOM_" + event;
           __doPostBack('MainUpdatePanel', rowindex);
       }
       function dgvListNotasClickEvent(event, rowindex) {

           document.getElementById('lblEstado').value = "DGVLIS_" + event;
           __doPostBack('MainUpdatePanel', rowindex);
       }

       function AbrirVentana() {
           window.open('', '', 'width=200,height=100')
       }

       function setArtCod(source, eventargs) {
           document.getElementById('lblEstado').value = "ART_SELECT";
           __doPostBack('MainUpdatePanel', eventargs.get_value());
       }

    </script>
    <style type="text/css">
        .style1
        {
            height: 45px;
        }
        .style2
        {
            height: 21px;
        }
        .style3
        {
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="MainUpdatePanel" runat="server" ClientIDMode="Static">
        <ContentTemplate>
            <table style="width: 691px; margin: 0 auto;">
                <tr>
                    <td colspan="2" class="style5">
                        <h2 class="clsTituloInterior">
                            NOTAS DE AGROCOMERCIO S.R.L.</h2>
                        <asp:HiddenField ID="lblEstado" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="lbid_nota" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="lbmomento" runat="server" />
                        <asp:HiddenField ID="HiddenField4" runat="server" />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="style5">
                        <table class="tabLista">
                            <tr>
                                <td class="tabIzquierda" valign="top">
                                    <asp:Panel ID="pnNotas" runat="server" BackColor="White">
                                        <table class="tabFormularios">
                                            <tr>
                                                <td colspan="3">
                                                    <h3>
                                                        Filtro de busqueda:</h3>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style2">
                                                    Estado:
                                                </td>
                                                <td class="style2">
                                                    Proveedor:
                                                </td>
                                                <td class="style2">
                                                    Fecha:
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    &nbsp;<asp:DropDownList ID="ddlEstado" runat="server">
                                                        <asp:ListItem Value="N">Disponibles</asp:ListItem>
                                                        <asp:ListItem Value="C">No Disponibles</asp:ListItem>
                                                        <asp:ListItem Value="T">Ambas</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="style3">
                                                    <asp:DropDownList ID="ddlProveedor" runat="server" DataTextField="PrvRazon" DataValueField="PrvCod"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlProveedor_SelectedIndexChanged"
                                                        Width="250px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="style3">
                                                    <table class="fec">
                                                        <tr>
                                                            <td>
                                                                Desde:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtFecDesde" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
                                                                <asp:CalendarExtender ID="txtFecDesde_CalendarExtender" runat="server" Enabled="True"
                                                                    Format="yyyy-MM-dd" PopupButtonID="Image2" TargetControlID="txtFecDesde">
                                                                </asp:CalendarExtender>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Hasta:
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtFechaHasta" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
                                                                <asp:CalendarExtender ID="txtFechaHasta_CalendarExtender" runat="server" Enabled="True"
                                                                    Format="yyyy-MM-dd" PopupButtonID="Image2" TargetControlID="txtFechaHasta">
                                                                </asp:CalendarExtender>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" align="right">
                                                    <asp:Button ID="btnBuscar" runat="server" CssClass="clsBtnEditar" Height="41px" OnClick="btnBuscar_Click"
                                                        Text="Buscar" Width="99px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <asp:Panel ID="pnlista" runat="server" BorderColor="#549900" 
                                                        BorderStyle="Solid">
                                                        <asp:GridView ID="dgvlistNotas" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                            CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" Width="462px" 
                                                            OnRowDataBound="dgvListNotas_RowDataBound">

                                                            <Columns>
                                                            <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                                            <asp:ButtonField Text="DoubleClick" CommandName="DoubleClick" Visible="False" />
                                                                <asp:BoundField HeaderText="icodNota" DataField="inota" DataFormatString="{0:D4}"/>
                                                                <asp:BoundField HeaderText="CodNota" DataField="ccodnota" />
                                                                <asp:BoundField HeaderText="Fec.Emision" DataField="FecEmesion" DataFormatString="{0:d}" />
                                                                <asp:BoundField HeaderText="Proveedor" DataField="PrvRazon" />
                                                                <asp:BoundField HeaderText="Monto" DataField="nmontoNota" DataFormatString=" {0:C}" />
                                                                <asp:BoundField HeaderText="mnt.Utilizado" DataField="nmntutilizado" DataFormatString="{0:C}" />
                                                                <asp:BoundField HeaderText="estado" DataField="estado" />
                                                                <asp:BoundField DataField="cobservaciones" HeaderText="Observaciones" 
                                                                    Visible="False" />
                                                            </Columns>
                                                             <EmptyDataTemplate>
                                                                <i>
                                                                    <div class="clsError1" id="lblError1" runat="server">
                                                                        No se ha Registro Ninguna Letra</div>
                                                                </i>
                                                            </EmptyDataTemplate>
                                                            <PagerStyle CssClass="pgr" />
                                                            <SelectedRowStyle CssClass="selrow" />
                                                        </asp:GridView>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                <asp:Panel ID="pnNuevo" runat="server" BorderColor="#549900" 
                                                    BorderStyle="Solid">
                                                        <table class="Nuevo">
                                                            <tr>
                                                                <td colspan="2">
                                                                    <h3>
                                                                        Nueva Nota:</h3>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    Proveedor:
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlproveedor_new" runat="server" DataTextField="PrvRazon" DataValueField="PrvCod"
                                                                        AutoPostBack="true" Width="250px">
                                                                    </asp:DropDownList>
                                                                    (*)
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    Fecha de Registro:
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtfecpro" runat="server"  Width="100px"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="txtfecpro_CalendarExtender" runat="server" Enabled="True"
                                                                        Format="yyyy-MM-dd" PopupButtonID="Image2" TargetControlID="txtfecpro">
                                                                    </asp:CalendarExtender>
                                                                    (*)
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="style2" align="right">
                                                                    Codigo:
                                                                </td>
                                                                <td class="style2">
                                                                    <asp:TextBox ID="txtCodNota" runat="server"></asp:TextBox>
                                                                    (*)
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    Monto:
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtmonto" runat="server"></asp:TextBox>
                                                                    (*)
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    Monto Utilizado:
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtmontoutl" runat="server" Enabled =false Text = "0.00"></asp:TextBox>                                                                    
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    Observaciones:
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtobservaciones" runat="server" Height="61px" TextMode="MultiLine"
                                                                        Width="297px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <asp:Label ID="lbmensaje" runat="server" Text="Es necesario llenar todos los campos solicitados (*)"
                                                                        ForeColor="Red" Font-Size="Large"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                                <td class="tabDerecha" valign="top">
                                    <div class="divDerecha">
                                        <asp:Panel runat="server" ID="pnBotones" CssClass="clspntablaDerecha">
                                            <table class="tablaDerecha">
                                                <tr>
                                                    <td colspan="2" align="left">
                                                        <h3>
                                                            Opciones</h3>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top" class="style1">
                                                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="clsBtnNuevo" OnClick="btnNuevo_Click"
                                                            CausesValidation="False" Height="41px" Width="106px" />
                                                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="clsBtnGuardar"
                                                            OnClick="btnGuardar_Click" Height="41px" Width="110px" />
                                                    </td>
                                                    <td valign="top" class="style1">
                                                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="clsBtnCancelar"
                                                            OnClick="btnCancelar_Click" CausesValidation="False" Height="41px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top" class="style2">
                                                        <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="clsBtnEditar" OnClick="btnEditar_Click"
                                                            Height="41px" Width="99px" />
                                                    </td>
                                                    <td valign="top" class="style2">
                                                        <asp:Button ID="btnAnular" runat="server" Text="Anular" CssClass="clsBtnAnular" Height="41px"
                                                            OnClick="btnAnular_Click" Width="101px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top" class="style1">
                                                        <asp:Button ID="btnProcesar" runat="server" Text="Procesar" CssClass="clsBtnProcesar"
                                                            OnClick="btnProcesar_Click" Height="41px" />
                                                    </td>
                                                    <td valign="top" class="style1">
                                                        <asp:Button ID="btnImprimir" runat="server" Text="Imprimir" CssClass="clsBtnImprimir"
                                                            Height="38px" Width="102px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
