<%@ Page Title=".:Pagos-Ventas:." Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="wfrmLetrasVentas.aspx.cs" Inherits="AgrocomercioWEB.pagos.wfrmLetraVentas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../App_Themes/TemaAgrocomercio/ventas.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function dgvlistLtrPenVClickEvent(event, rowindex) {

            document.getElementById('lblEstado').value = "DGVLIS_" + event;
            __doPostBack('MainUpdatePanel', rowindex);
        }
        function dgvlistLtrVenClickEvent(event, rowindex) {
            document.getElementById('lblEstado').value = "DGVLVN_" + event;
            __doPostBack('MainUpdatePanel', rowindex);
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
        .style4
        {
            height: 19px;
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
                            Pagos de AGROCOMERCIO S.R.L.</h2>
                        <asp:HiddenField ID="lblEstado" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="lbid_letra" runat="server" ClientIDMode="Static" />
                        <asp:HiddenField ID="lbmomento" runat="server" />
                        <asp:HiddenField ID="lblId_Cliente" runat="server" ClientIDMode="Static" />
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
                                                <td colspan="4">
                                                    <h3>
                                                        Filtro de busqueda:</h3>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Estado:
                                                </td>
                                                <td>
                                                    Cliente:
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td class="style2">
                                                    Fecha Facturacion:&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    &nbsp;<asp:DropDownList ID="ddlEstado" runat="server">
                                                        <asp:ListItem Value="N">Pendiente</asp:ListItem>
                                                        <asp:ListItem Value="C">Cancelada</asp:ListItem>
                                                        <asp:ListItem Value="T">Ambas</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="style3">
                                                    <asp:TextBox ID="txtFilCliente" runat="server"></asp:TextBox>
                                                </td>
                                                <td class="style3">
                                                    &nbsp;
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
                                                <td class="style3" colspan="2" align="right">
                                                    <asp:Button ID="btnBusPend" runat="server" Height="41px" OnClick="btnBusPend_Click"
                                                        Text="Pendientes de Cntr. Pago" Width="187px" />
                                                </td>
                                                <td class="style3" colspan="2" align="right">
                                                    <asp:Button ID="btnBuscar" runat="server" CssClass="clsBtnEditar" Height="41px" OnClick="btnBuscar_Click"
                                                        Text="Buscar" Width="99px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3" colspan="4">
                                                    <asp:Panel ID="pnlista" runat="server" BorderColor="#549900" BorderStyle="Solid">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="dgvlistLtrVen" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                        CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" Width="462px" OnRowDataBound="dgvlistLtrVen_RowDataBound">
                                                                        <Columns>
                                                                            <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                                                            <asp:ButtonField Text="DoubleClick" CommandName="DoubleClick" Visible="False" />
                                                                            <asp:BoundField HeaderText="Cod. Letra" DataField="icodigo" DataFormatString="{0:D4}" />
                                                                            <asp:BoundField HeaderText="Fec. Gen" DataField="FecEmesion" DataFormatString="{0:d}" />
                                                                            <asp:BoundField HeaderText="Cliente" DataField="PrvRazon" />
                                                                            <asp:BoundField HeaderText="Monto" DataField="nmontocuota" DataFormatString=" {0:C}" />
                                                                            <asp:BoundField HeaderText="Monto Pagado" DataField="montoPag" DataFormatString=" {0:C}" />
                                                                            <asp:BoundField HeaderText="Monto Faltante" DataField="opetotPagpen" DataFormatString=" {0:C}" />
                                                                            <asp:BoundField HeaderText="Interes Pagado" DataField="opetotPagpen" DataFormatString=" {0:C}" />
                                                                            <asp:BoundField HeaderText="Tip. Pago" DataField="ctippago" />
                                                                            <asp:BoundField HeaderText="Est." DataField="estado" />
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
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    <asp:Button ID="BtnDetalle" runat="server" Text="Ver Detalle" CssClass="clsBtnEditar"
                                                                        OnClick="btnDetalle_Click" Height="41px" Width="114px" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3" colspan="4">
                                                    <asp:Panel ID="pnlistPend" runat="server" BorderColor="#549900" BorderStyle="Solid">
                                                        <asp:GridView ID="dgvlistLtrPenV" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                            CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" Width="462px" OnRowDataBound="dgvlistLtrPenV_RowDataBound">
                                                            <Columns>
                                                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                                                <asp:ButtonField Text="DoubleClick" CommandName="DoubleClick" Visible="False" />
                                                                <asp:BoundField HeaderText="icodFact" DataField="dopCod" DataFormatString="{0:D4}" />
                                                                <asp:BoundField HeaderText="Fec. Emision" DataField="dfecemision" DataFormatString="{0:d}" />
                                                                <asp:BoundField HeaderText="Num. Factura" DataField="numfac" />
                                                                <asp:BoundField HeaderText="Cod. Cli" DataField="PrvCod" />
                                                                <asp:BoundField HeaderText="Cliente" DataField="PrvRazon" />
                                                                <asp:BoundField HeaderText="Monto" DataField="opetotpagar" DataFormatString=" {0:C}" />
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
                                                <td class="style3" colspan="4">
                                                    <asp:Panel ID="pnNuevo" runat="server" BorderColor="#549900" BorderStyle="Solid">
                                                        <table class="tabNuevo">
                                                            <tr>
                                                                <td class="clsCellTituloDatos2">
                                                                    Fecha:
                                                                </td>
                                                                <td class="clsCellDatos2">
                                                                    <asp:TextBox ID="txtFecha" runat="server" Width="100px" ReadOnly="True"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="txtFecha_CalendarExtender" runat="server" TargetControlID="txtFecha"
                                                                        Format="yyyy-MM-dd" PopupButtonID="Image2" Enabled="True">
                                                                    </asp:CalendarExtender>
                                                                </td>
                                                                <td align="right">
                                                                    <table class="clsTitDocumento">
                                                                        <tr>
                                                                            <td align="center">
                                                                                <asp:Label ID="lblDescriDocumento" runat="server" Text="Letra" CssClass="clsTitDocumento_CAB"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center">
                                                                                <asp:Label ID="lblNroDocumento" runat="server" Text="Label" CssClass="clsTitDocumento_NUM"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="clsCellTituloDatos2">
                                                                    Cliente:
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:TextBox ID="txtcliente" runat="server" Width="247px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="clsCellTituloDatos2">
                                                                    &nbsp;
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:RadioButton ID="rbtletra" Text="por # de Letras" GroupName="GRUPO1" OnCheckedChanged="rbtdias_CheckedChanged"
                                                                        Checked="true" runat="server" AutoPostBack="true" />
                                                                    <asp:RadioButton ID="rbtdias" Text="# de dias" GroupName="GRUPO1" OnCheckedChanged="rbtdias_CheckedChanged"
                                                                        runat="server" AutoPostBack="true" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="clsCellTituloDatos2">
                                                                    <asp:Label ID="lblTipPag" runat="server" Text="Numero de LETRAS:"></asp:Label>
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:TextBox ID="txt_numPagos" runat="server" OnTextChanged="txtnumCuotas_TextChange"
                                                                        AutoPostBack="true"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">
                                                                    <h3>
                                                                        ENLAZAR Ventas de credito al pago</h3>
                                                                    <asp:GridView ID="dgvListFact" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                        CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" Style="margin-top: 0px; padding-top: 0px;"
                                                                        PageSize="5" Width="233px" OnSelectedIndexChanged="dgvListFact_SelectedIndexChanged">
                                                                        <Columns>
                                                                            <asp:ButtonField CommandName="SingleClick" Text="SingleClick" Visible="False" />
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="grdchk" runat="server" Checked="true" OnCheckedChanged="grdchk_CheckedChanged"
                                                                                        AutoPostBack="true" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="dopcod" HeaderText="Cod. Fact">
                                                                                <ItemStyle Width="20px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="dfecemision" HeaderText="Fec. Venta" DataFormatString="{0:d}">
                                                                                <ItemStyle Width="20px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="numfac" HeaderText="Nro. de Documento" ReadOnly="True">
                                                                                <HeaderStyle Width="100px" />
                                                                                <ItemStyle HorizontalAlign="Left" Width="100px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="PrvRazon" HeaderText="Cliente" ReadOnly="True">
                                                                                <HeaderStyle Width="100px" />
                                                                                <ItemStyle HorizontalAlign="Left" Width="100px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="opetotpagar" HeaderText="S/.">
                                                                                <ItemStyle HorizontalAlign="Right" Width="50px" />
                                                                            </asp:BoundField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3" align="right" class="style4">
                                                                    Monto Facturado:
                                                                </td>
                                                                <td class="style4">
                                                                    <asp:Label ID="lbSuma" runat="server" Text="0.00"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">
                                                                    <h3>
                                                                        ENLAZAR Notas de credito al pago</h3>
                                                                    <asp:GridView ID="dgvNotas" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                        CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" Style="margin-top: 0px; padding-top: 0px;"
                                                                        PageSize="5" Width="233px" OnSelectedIndexChanged="dgvListFact_SelectedIndexChanged">
                                                                        <Columns>
                                                                            <asp:ButtonField CommandName="SingleClick" Text="SingleClick" Visible="False" />
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="grdchknota" runat="server" Checked="False" OnCheckedChanged="grdchknota_CheckedChanged"
                                                                                        AutoPostBack="true" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="dfecreg" HeaderText="Fec. Nota" DataFormatString="{0:d}">
                                                                                <ItemStyle Width="20px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="inota" HeaderText="id" ReadOnly="True">
                                                                                <HeaderStyle Width="100px" />
                                                                                <ItemStyle HorizontalAlign="Left" Width="100px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="ccodnota" HeaderText="Codigo" ReadOnly="True">
                                                                                <HeaderStyle Width="100px" />
                                                                                <ItemStyle HorizontalAlign="Left" Width="100px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="nmontonota" HeaderText="Monto">
                                                                                <ItemStyle HorizontalAlign="Right" Width="50px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="cestadoNota" HeaderText="Estado">
                                                                                <ItemStyle HorizontalAlign="Right" Width="50px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="nmntutilizado" HeaderText="Monto Disponible">
                                                                                <ItemStyle HorizontalAlign="Right" Width="50px" />
                                                                            </asp:BoundField>
                                                                        </Columns>
                                                                        <EmptyDataTemplate>
                                                                            <i>
                                                                                <div class="clsError1" id="lblError1" runat="server">
                                                                                    No se ha Registro Ninguna Nota disponible</div>
                                                                            </i>
                                                                        </EmptyDataTemplate>
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3" align="right" class="style4">
                                                                    Monto Deducido:
                                                                </td>
                                                                <td class="style4">
                                                                    <asp:Label ID="lbresta" runat="server" Text="0.00"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4" align="right">
                                                                    &nbsp;<asp:Label ID="Label4" runat="server" Text="TOTAL A PAGAR:" Font-Bold="True"
                                                                        Font-Size="Medium" ForeColor="#006600"></asp:Label>
                                                                    <asp:Label ID="lbpago" runat="server" Text="0.00" Font-Bold="True" Font-Size="Medium"
                                                                        ForeColor="#006600"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4" align="right" class="style3">
                                                                    <asp:Button ID="btgenCuotas" runat="server" Text="Generar" CssClass="clsBtnAgregar"
                                                                        OnClick="btnGenerar_Click" Visible="false" Height="41px" Width="105px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3" align="right" class="style3">
                                                                    <asp:Panel ID="pnCuotas" runat="server">
                                                                        <asp:GridView ID="dgvcuotas" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                            CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" Style="margin-top: 0px; padding-top: 0px;"
                                                                            Height="30px" PageSize="5" Width="483px">
                                                                            <Columns>
                                                                                <asp:BoundField HeaderText="Cuota" />
                                                                                <asp:TemplateField HeaderText="Fec.Vencimiento">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtFecVen" runat="server" Width="86px"></asp:TextBox>
                                                                                        <asp:CalendarExtender ID="txtFecha_CalendarExtender" runat="server" TargetControlID="txtFecVen"
                                                                                            Format="yyyy-MM-dd" PopupButtonID="Image2" Enabled="True">
                                                                                        </asp:CalendarExtender>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Nro.Letra">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="num_let" runat="server" Width="68px"></asp:TextBox>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Cod.Unico">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="cod_unic" runat="server" Width="86px"></asp:TextBox>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Monto">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="monto" runat="server" Width="95px"></asp:TextBox>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:Panel ID="pnMensaje" runat="server">
                                                        <h3>
                                                            <asp:Label ID="lbMensaje" runat="server" Text="Label"></asp:Label></h3>
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
