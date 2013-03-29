<%@ Page Title=".:Registro de Letras:." Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="wfrmLetrasCompras.aspx.cs" Inherits="AgrocomercioWEB.pagos.wfrmLetras"
    Theme="TemaAgrocomercio" StylesheetTheme="TemaAgrocomercio" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../App_Themes/TemaAgrocomercio/ventas.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        function dgvDetalleVentaClickEvent(event, rowindex) {

            document.getElementById('lblEstado').value = "DGVCOM_" + event;
            __doPostBack('MainUpdatePanel', rowindex);
        }
        function dgvListOperLetrasClickEvent(event, rowindex) {

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
            height: 46px;
        }
        .style2
        {
            height: 41px;
        }
        .style3
        {
            height: 37px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="MainUpdatePanel" runat="server" ClientIDMode="Static">
        <ContentTemplate>
            <table style="width: 800px; margin: 0 auto;">
                <tr>
                    <td colspan="2">
                        <h2 class="clsTituloInterior">
                            LETRAS DE AGROCOMERCIO S.R.L.</h2>
                        <asp:HiddenField ID="lblEstado" runat="server" ClientIDMode="Static" />
                         <asp:HiddenField ID="lblPaso" runat="server" ClientIDMode="Static" />   
                        <asp:HiddenField ID="lblProceso" runat="server" />
                        <asp:HiddenField ID="lblOpeEstado" runat="server" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table class="tabLista">
                            <tr>
                                <td class="tabIzquierda" valign="top">
                                    <asp:Panel ID="pnListOperLetras" runat="server">
                                        <table class="tableIzquierda">
                                            <tr>
                                                <td>
                                                    <h3>
                                                        Lista de Letras</h3>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="pnListOperaciones" runat="server" Height="320px" ScrollBars="Auto">
                                                        <asp:GridView ID="dgvListOperLetras" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                            CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" OnRowDataBound="dgvListOperLetras_RowDataBound">                                                            
                                                            <Columns>
                                                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                                                <asp:ButtonField Text="DoubleClick" CommandName="DoubleClick" Visible="False" />
                                                                <asp:BoundField DataField="numDoc" HeaderText="Codigo Oper." ConvertEmptyStringToNull="False"
                                                                    NullDisplayText=" ">
                                                                    <ItemStyle HorizontalAlign="Left" Width="10px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="fac_acum" HeaderText="Fac. Acum">
                                                                    <ItemStyle Width="20px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="fec_nxtpg" HeaderText="Fec. Prox. Pago" DataFormatString="{0:d}">
                                                                    <ItemStyle Width="20px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PrvRazon" HeaderText="Proveedor">
                                                                    <ItemStyle HorizontalAlign="Left" Width="140px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="itotcuota" HeaderText="Num. Cuotas">
                                                                    <ItemStyle Width="20px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="nmontocuota" HeaderText="Importe Total">
                                                                    <ItemStyle Width="20px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="pagpendiente" HeaderText="Importe Pendiente">
                                                                    <ItemStyle Width="20px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="nintpag" HeaderText="Interes Pagado">
                                                                    <ItemStyle Width="20px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="estado" HeaderText="Estado">
                                                                    <ItemStyle Width="20px" HorizontalAlign="Center" />
                                                                </asp:BoundField>
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
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="pnDocLetra" runat="server" Height="928px">
                                        <table class="tableIzquierda">
                                            <tr>
                                                <td style="width: 20%;">
                                                </td>
                                                <td style="width: 45%;" colspan="3">
                                                </td>
                                                <td style="width: 15%;">
                                                </td>
                                                <td style="width: 20%;">
                                                    <asp:HiddenField ID="lblTipoDoc" runat="server" />
                                                    <asp:HiddenField ID="lbldopCod" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="clsCellTituloDatos2">
                                                    Fecha:
                                                </td>
                                                <td class="clsCellDatos2" colspan="2">
                                                    <asp:TextBox ID="txtFecha" runat="server" Width="100px" ReadOnly="True"></asp:TextBox>
                                                    <asp:CalendarExtender ID="txtFecha_CalendarExtender" runat="server" TargetControlID="txtFecha"
                                                        Format="yyyy-MM-dd" PopupButtonID="Image2" Enabled="True">
                                                    </asp:CalendarExtender>
                                                </td>
                                                <td colspan="3" align="right">
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
                                                    Proveedor:
                                                </td>
                                                <td class="clsCellDatos2" colspan="3">
                                                    <asp:DropDownList ID="ddlProveedor" runat="server" Width="250px" AutoPostBack="True"
                                                        DataTextField="PrvRazon" DataValueField="PrvCod" OnSelectedIndexChanged="ddlProveedor_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="clsCellTituloDatos2">
                                                    <asp:Label ID="lblDocCli" runat="server" Text="R.U.C.:"></asp:Label>
                                                </td>
                                                <td class="clsCellDatos2">
                                                    <asp:TextBox ID="txtDocCli" runat="server" Width="100px" ReadOnly="True"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="clsCellTituloDatos2">
                                                    Numero de Cuotas:
                                                </td>
                                                <td class="clsCellDatos2" colspan="3">
                                                    <asp:TextBox ID="txtNumCuotas" runat="server" Width="33px" OnTextChanged="txtnumCuotas_TextChange"
                                                        AutoPostBack="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    &nbsp;&nbsp;
                                                    <asp:HiddenField ID="lblDescuentoEsp" runat="server" Value="0.0" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <asp:Panel ID="pnaddfactura" runat="server">
                                                        <asp:Panel ID="Pnokaddfactura" runat="server" Font-Bold="True" ForeColor="#006600">
                                                            <h3>
                                                                ENLAZAR FACTURAS A LA LETRA</h3>
                                                            <asp:GridView ID="dgvListFact" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" Style="margin-top: 0px; padding-top: 0px;"
                                                                PageSize="5" Width="233px" OnSelectedIndexChanged="dgvListFact_SelectedIndexChanged">
                                                                <Columns>
                                                                    <asp:ButtonField CommandName="SingleClick" Text="SingleClick" Visible="False" />
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked="false" OnCheckedChanged="grdchk_CheckedChanged"
                                                                                AutoPostBack="true" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="dopcod" HeaderText="dop.cod" >
                                                                        <ItemStyle Width="20px" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="dfecemision" HeaderText="Fec. Facturacion" DataFormatString="{0:d}">
                                                                        <ItemStyle Width="20px" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="numfac" HeaderText="Nro. de Factura" ReadOnly="True">
                                                                        <HeaderStyle Width="100px" />
                                                                        <ItemStyle HorizontalAlign="Left" Width="100px" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="opetotpagar" HeaderText="S/.">
                                                                        <ItemStyle HorizontalAlign="Right" Width="50px" />
                                                                    </asp:BoundField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            Monto Facturado:
                                                            <asp:Label ID="lbSuma" runat="server" Text="0.00"></asp:Label>
                                                        </asp:Panel>
                                                        <asp:Panel ID="Pnerraddfactura" runat="server" Width="456px">
                                                            <asp:Label ID="nofactpend" runat="server" Text="NO EXISTEN FACTURAS PENDIENTES DE REGISTRO DE LETRA PARA ESTE PROVEEDOR"
                                                                Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <asp:Panel ID="pnNotas" runat="server">
                                                        <asp:Panel ID="pnaddNotas" runat="server" Font-Bold="True" ForeColor="#006600">
                                                            <h3>
                                                                ENLAZAR Notas de credito al pago</h3>
                                                            <asp:GridView ID="dgvNotas" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" Style="margin-top: 0px; padding-top: 0px;"
                                                                PageSize="5" Width="233px" OnSelectedIndexChanged="dgvListFact_SelectedIndexChanged">
                                                                <Columns>
                                                                    <asp:ButtonField CommandName="SingleClick" Text="SingleClick" Visible="False" />
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="CheckBox1" runat="server" Checked="False" OnCheckedChanged="grdchknota_CheckedChanged"
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
                                                            </asp:GridView>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            Monto Deducido:
                                                            <asp:Label ID="lbresta" runat="server" Text="0.00"></asp:Label>
                                                        </asp:Panel>
                                                        <asp:Panel ID="pnnotasempty" runat="server" Width="456px">
                                                            <asp:Label ID="Label2" runat="server" Text="No hay Notas de credito disponibles para este Proveedor."
                                                                Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:Label>
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6" align="right" >
                                                    &nbsp;<asp:Label ID="Label4" runat="server" Text="TOTAL A PAGAR:" 
                                                        Font-Bold="True" Font-Size="Medium" ForeColor="#006600"></asp:Label>
                                                    <asp:Label ID="lbpago" runat="server" Text="0.00" Font-Bold="True" 
                                                        Font-Size="Medium" ForeColor="#006600"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6" align="right" class="style3">
                                                    <asp:Button ID="btgenCuotas" runat="server" Text="Generar" CssClass="clsBtnAgregar"
                                                        OnClick="btnGenerar_Click" Visible="false" Height="41px" Width="105px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                <asp:Panel ID="pnCuotas" runat="server">
                        
                                                    <asp:GridView ID="dgvcuotas" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                        CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" Style="margin-top: 0px; padding-top: 0px;"
                                                        Height="30px" PageSize="5" Width="483px">
                                                        <Columns>
                                                            <asp:BoundField HeaderText="Cuota" />
                                                            <asp:TemplateField HeaderText="Fec.Vencimiento">
                                                                <ItemTemplate>
                                                                   <asp:TextBox ID="txtFecVen" runat="server" Width="100px" ></asp:TextBox>
                                                    <asp:CalendarExtender ID="txtFecha_CalendarExtender" runat="server" TargetControlID="txtFecVen"
                                                        Format="yyyy-MM-dd" PopupButtonID="Image2" Enabled="True">
                                                    </asp:CalendarExtender>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Nro.Letra">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="num_let" runat="server"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Cod.Unico">
                                                            <ItemTemplate>
                                                                    <asp:TextBox ID="cod_unic" runat="server"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Monto">
                                                            <ItemTemplate>
                                                                    <asp:TextBox ID="monto" runat="server"></asp:TextBox>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    &nbsp;</td>
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
                                                    <td valign="top">
                                                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" CssClass="clsBtnNuevo" OnClick="btnNuevo_Click"
                                                            CausesValidation="False" Height="41px" Width="98px" />
                                                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="clsBtnGuardar"
                                                            OnClick="btnGuardar_Click" Height="41px" Width="110px" />
                                                    </td>
                                                    <td valign="top">
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
                                                            Width="106px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top" class="style1">
                                                        <asp:Button ID="btnProcesar" runat="server" Text="Procesar" CssClass="clsBtnProcesar"
                                                            OnClick="btnProcesar_Click" Height="41px" />
                                                    </td>
                                                    <td valign="top" class="style1">
                                                        <asp:Button ID="btnImprimir" runat="server" Text="Imprimir" CssClass="clsBtnImprimir"
                                                            Height="38px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:Panel runat="server" ID="pnMenuArticulos" Height="80px" CssClass="clspntablaDerecha">
                                            <table class="tablaDerecha" style="height: 100%;">
                                                <tr>
                                                    <td colspan="2" align="left" valign="top">
                                                        <h3>
                                                            OPCIONES ARTICULOS</h3>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="clsBtnAgregar"
                                                            OnClick="btnAgregar_Click" />
                                                    </td>
                                                    <td valign="top">
                                                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="clsBtnEliminar"
                                                            OnClick="btnEliminar_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:Panel runat="server" ID="pnDocumentos" Height="110px" CssClass="clspntablaDerecha">
                                            <table class="tablaDerecha" style="height: 100%;">
                                                <tr>
                                                    <td colspan="2" align="left" valign="top">
                                                        <h3>
                                                            Fac. Pend. Letras</h3>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <asp:GridView ID="dgvDocumentos" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                            CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" Style="margin-top: 0px; padding-top: 0px;"
                                                            Height="30px" PageSize="5">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <Columns>
                                                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                                                <asp:ButtonField Text="DoubleClick" CommandName="DoubleClick" Visible="False" />
                                                                <asp:BoundField DataField="dopCod" HeaderText="NRO" Visible="False" NullDisplayText=" ">
                                                                    <ItemStyle HorizontalAlign="Left" Width="10px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="numfac" HeaderText="Nro" ReadOnly="True">
                                                                    <ItemStyle HorizontalAlign="Left" Width="50px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="PrvRazon" HeaderText="Proveedor">
                                                                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="opetotpagar" HeaderText="S/.">
                                                                    <ItemStyle HorizontalAlign="Right" Width="50px" />
                                                                </asp:BoundField>
                                                            </Columns>
                                                            <EmptyDataTemplate>
                                                                <i>
                                                                    <div class="clsError1" id="lblError1" runat="server">
                                                                        No se ha Registro Ninguna Compra</div>
                                                                </i>
                                                            </EmptyDataTemplate>
                                                            <PagerStyle CssClass="pgr" />
                                                            <SelectedRowStyle CssClass="selrow" />
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <asp:Panel runat="server" ID="pnResultadoOper" CssClass="clspntablaDerecha">
                                            <table class="tablaDerecha">
                                                <tr>
                                                    <td colspan="2" align="left">
                                                        <h3>
                                                            Resultado</h3>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloSmall" style="width: 90px">
                                                        SUB TOTAL:
                                                    </td>
                                                    <td style="width: 80px">
                                                        <asp:Label ID="txtSubTotal" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloSmall">
                                                        DESCUENTO (-):
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtDescuento" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloSmall">
                                                        FLETE (+):
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtFlete" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloSmall" style="width: 70px">
                                                        VALOR DE COMPRA:
                                                    </td>
                                                    <td style="width: 80px">
                                                        <asp:Label ID="txtValorCompra" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloSmall">
                                                        IGV (18%):
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="txtIgv" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloSmall">
                                                        PRECIO DE COMPRA:
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="clsCellDatosLarge2">
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:Label ID="txtTotal" runat="server" Text="S/. 0.00"></asp:Label>
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
                <tr>
                    <td>
                        <div style="display: none;">
                            <asp:Button ID="btnNuevoPrvTMP" runat="server" Text="Nuevo Proveedor" />
                        </div>
                        <asp:ModalPopupExtender ID="ModalPopupNuevoPrv" runat="server" CancelControlID="btnClose"
                            TargetControlID="btnNuevoPrvTMP" PopupControlID="pnPopNuevoProveedor" BackgroundCssClass="ModalPopupBG"
                            Enabled="True">
                        </asp:ModalPopupExtender>
                        <asp:Panel ID="pnPopNuevoProveedor" Style="display: none" runat="server">
                            <div class="clsModalPopup">
                                <div class="PopupHeader" id="PopupHeader">
                                    REGISTRO DE NUEVO PROVEEDOR</div>
                                <div class="PopupClose" id="PopupClose">
                                    <asp:Button ID="btnClose" runat="server" Text="X" CssClass="clsBtnCerrar2" /></div>
                                <div class="PopupBody">
                                    <table class="TablePopupBody">
                                        <tr>
                                            <td class="BodyContent">
                                                <asp:Panel ID="pnCliente" runat="server">
                                                    <fieldset style="height: 100%;">
                                                        <legend>Datos del Proveedor</legend>
                                                        <table style="width: 460px; height: 100%;">
                                                            <tr>
                                                                <td class="clsCellTituloDatos2" valign="top" style="width: 20%;">
                                                                    Codigo:
                                                                </td>
                                                                <td class="clsCellDatos2" valign="top">
                                                                    <asp:Label ID="txtCliCod" runat="server" Text=" "></asp:Label>
                                                                </td>
                                                                <td class="clsCellTituloDatos2" valign="top">
                                                                    <asp:Label ID="lblDocumento" runat="server" Text="Nro. de RUC: "></asp:Label>
                                                                </td>
                                                                <td class="clsCellDatos2" valign="bottom">
                                                                    <asp:TextBox ID="txtNroDoc" runat="server" Width="120px" MaxLength="12"></asp:TextBox>
                                                                    <asp:CustomValidator ID="txtNroDocRequired" runat="server" ErrorMessage="<b>*</b>"
                                                                        ControlToValidate="txtNroDoc" ValidateEmptyText="true" Display="Dynamic" ForeColor="#CC0000"
                                                                        OnServerValidate="VentaProveedor_ServerValidate" CssClass="clsValidateAster"
                                                                        SetFocusOnError="True" />
                                                                    <asp:FilteredTextBoxExtender ID="txtNroDocFilteredExtender" runat="server" TargetControlID="txtNroDoc"
                                                                        FilterType="Numbers">
                                                                    </asp:FilteredTextBoxExtender>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="clsCellTituloDatos2">
                                                                    <asp:Label ID="lblNombre" runat="server" Text="Razon Social: "></asp:Label>
                                                                </td>
                                                                <td class="clsCellDatos2" colspan="3">
                                                                    <asp:TextBox ID="txtNombre" runat="server" Width="340px"></asp:TextBox>
                                                                    <asp:CustomValidator ID="txtNombreRequired" runat="server" ErrorMessage="<b>*</b>"
                                                                        ControlToValidate="txtNombre" ValidateEmptyText="true" Display="Dynamic" ForeColor="#CC0000"
                                                                        OnServerValidate="VentaProveedor_ServerValidate" CssClass="clsValidateAster"
                                                                        SetFocusOnError="True" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="clsCellTituloDatos2">
                                                                    Dirección:
                                                                </td>
                                                                <td class="clsCellDatos2" colspan="3">
                                                                    <asp:TextBox ID="txtCliDireccion" runat="server" Width="340px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="clsCellTituloDatos2">
                                                                    Contacto:
                                                                </td>
                                                                <td class="clsCellDatos2" colspan="3">
                                                                    <asp:TextBox ID="txtRepresentante" runat="server" Width="340px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="clsCellTituloDatos2">
                                                                    <asp:Label ID="lblTelefono" runat="server" Text="Telefono: "></asp:Label>
                                                                </td>
                                                                <td class="clsCellDatos2">
                                                                    <asp:TextBox ID="txtCliTelefono" runat="server" Width="100px"></asp:TextBox>
                                                                </td>
                                                                <td class="clsCellTituloDatos2">
                                                                    Fecha de Ingreso:
                                                                </td>
                                                                <td class="clsCellDatos2">
                                                                    <asp:TextBox ID="txtFecRegis" runat="server" Width="117px"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="txtFecRegis_CalendarExtender" runat="server" TargetControlID="txtFecRegis"
                                                                        Format="yyyy-MM-dd" PopupButtonID="Image2" Enabled="True">
                                                                    </asp:CalendarExtender>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </fieldset>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Controls" style="position: relative;">
                                                <asp:Label ID="lblRequired" runat="server" Text="* Campos Obligatorios" ForeColor="#CC0000"
                                                    Font-Bold="True" Font-Size="12px" Style="position: absolute; bottom: 20px; left: 10px;"></asp:Label>
                                                <div style="text-align: center;">
                                                    <asp:Button ID="btnNuevoProveedor" runat="server" Text="Nuevo" CssClass="clsBtnNuevo"
                                                        OnClick="btnNuevoProveedor_Click" CausesValidation="False" />
                                                    &nbsp;
                                                    <asp:Button ID="btnGuardarProveedor" runat="server" Text="Guardar" CssClass="clsBtnGuardar"
                                                        OnClick="btnGuardarProveedor_Click" />
                                                    &nbsp;
                                                    <asp:Button ID="btnCancelarProveedor" runat="server" Text="Cancelar" CssClass="clsBtnCancelar"
                                                        OnClick="btnCancelarProveedor_Click" CausesValidation="False" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </asp:Panel>
                    </td>
                    <td>
                        <div style="display: none;">
                            <asp:Button ID="btnAgregarTMP" runat="server" Text="Nuevo Cliente" />
                        </div>
                        <asp:ModalPopupExtender ID="ModalPopupAgregar" runat="server" CancelControlID="btnClose2"
                            TargetControlID="btnAgregarTMP" PopupControlID="pnPopAgregarArticulo" BackgroundCssClass="ModalPopupBG"
                            Enabled="True" DynamicServicePath="">
                        </asp:ModalPopupExtender>
                        <asp:Panel ID="pnPopAgregarArticulo" Style="display: none" runat="server" DefaultButton="btnAgregarArticulo">
                            <div class="clsModalPopup">
                                <div class="PopupHeader" id="Div1">
                                    AGREGAR UN ARTICULO</div>
                                <div class="PopupClose" id="Div2">
                                    <asp:Button ID="btnClose2" runat="server" Text="X" CssClass="clsBtnCerrar2" /></div>
                                <div class="PopupBody">
                                    <table class="TablePopupBody">
                                        <tr>
                                            <td class="BodyContent">
                                                <asp:Panel ID="pnDatosArticulo" runat="server">
                                                    <table>
                                                        <tr>
                                                            <td valign="top">
                                                                <table style="width: 200px; height: 100%;">
                                                                    <tr>
                                                                        <td class="clsCellTituloDatos2" valign="top">
                                                                            Laboratorio:
                                                                        </td>
                                                                        <td class="clsCellDatos2" valign="top">
                                                                            <asp:DropDownList ID="ddlLaboratorios" runat="server" Width="200px" AutoPostBack="True"
                                                                                DataTextField="PrvRazon" DataValueField="PrvCod" OnSelectedIndexChanged="ddlLaboratorios_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="clsCellTituloDatos2" valign="top">
                                                                            Articulos:
                                                                        </td>
                                                                        <td class="clsCellDatos2" valign="top">
                                                                            <asp:TextBox ID="txtBuscarArt" runat="server" Width="196px"></asp:TextBox>
                                                                            <asp:TextBoxWatermarkExtender ID="txtBuscarArt_waterMark" runat="server" TargetControlID="txtBuscarArt"
                                                                                WatermarkCssClass="clsWaterMark" WatermarkText="Buqueda de Articulos..." Enabled="true">
                                                                            </asp:TextBoxWatermarkExtender>
                                                                            <div id="listPlacement" class="cls_listPlacement">
                                                                            </div>
                                                                            <asp:AutoCompleteExtender ID="txtBuscarArt_AutoCompleteExtender" MinimumPrefixLength="2"
                                                                                TargetControlID="txtBuscarArt" EnableCaching="true" ShowOnlyCurrentWordInCompletionListItem="true"
                                                                                CompletionSetCount="10" CompletionInterval="100" ServiceMethod="BuscarArticulos"
                                                                                runat="server" OnClientItemSelected="setArtCod" CompletionListElementID="listPlacement">
                                                                            </asp:AutoCompleteExtender>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="clsCellTituloDatos2" valign="top">
                                                                        </td>
                                                                        <td class="clsCellDatos2" valign="top">
                                                                            <asp:ListBox ID="lsbArticulos" runat="server" Width="200px" Height="150px" DataTextField="ArtDescripcion"
                                                                                DataValueField="ArtCod" OnSelectedIndexChanged="lsbArticulos_SelectedIndexChanged"
                                                                                AutoPostBack="True"></asp:ListBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td valign="top">
                                                                <table style="width: 200px; height: 100%;">
                                                                    <tr>
                                                                        <td style="width: 50%;">
                                                                        </td>
                                                                        <td style="width: 50%;">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="clsCellTituloDatos2" valign="top">
                                                                            Codigo : &nbsp;
                                                                        </td>
                                                                        <td class="clsCellDatos2" valign="top">
                                                                            <asp:TextBox ID="txtArtCod" runat="server" Width="100px" Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="clsCellTituloDatos2" valign="top">
                                                                            Unidad de Med. : &nbsp;
                                                                        </td>
                                                                        <td class="clsCellDatos2" valign="top">
                                                                            <asp:TextBox ID="txtArtUniMed" runat="server" Width="100px" Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="clsCellTituloDatos2" valign="top">
                                                                            Stock Fact : &nbsp;
                                                                        </td>
                                                                        <td class="clsCellDatos2" valign="top">
                                                                            <asp:TextBox ID="txtStockFact" runat="server" Width="100px" Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="clsCellTituloDatos2" valign="top">
                                                                            Stock Fisico : &nbsp;
                                                                        </td>
                                                                        <td class="clsCellDatos2" valign="top">
                                                                            <asp:TextBox ID="txtStockFis" runat="server" Width="100px" Enabled="false" ForeColor="Red"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="clsCellTituloDatos2" valign="top">
                                                                            P.Unitario : &nbsp;
                                                                        </td>
                                                                        <td class="clsCellDatos2" valign="top">
                                                                            <asp:TextBox ID="txtArtPreUnitario" runat="server" Width="100px" Enabled="false"
                                                                                AutoPostBack="True" OnTextChanged="txtArtPreUnitario_TextChanged"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="clsCellTituloDatos2" valign="top" style="font-weight: bold; color: #444444;">
                                                                            Cantidad : &nbsp;
                                                                        </td>
                                                                        <td class="clsCellDatos2" valign="top">
                                                                            <asp:TextBox ID="txtArtCant" runat="server" Width="100px" AutoPostBack="True" OnTextChanged="txtArtCant_TextChanged"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="clsCellTituloDatos2" valign="top" style="font-weight: bold; color: #444444;">
                                                                            Descuento(%) : &nbsp;
                                                                        </td>
                                                                        <td class="clsCellDatos2" valign="top">
                                                                            <asp:TextBox ID="txtArtDescuento" runat="server" Width="100px" AutoPostBack="True"
                                                                                OnTextChanged="txtArtDescuento_TextChanged"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="clsCellTituloDatos2" valign="top" style="font-weight: bold; color: #444444;">
                                                                            Importe Total : &nbsp;
                                                                        </td>
                                                                        <td class="clsCellDatos2" valign="top">
                                                                            <asp:TextBox ID="txtImpTotal" runat="server" Width="100px" Enabled="false"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="clsCellTituloDatos2" style="font-weight: bold; color: #444444;">
                                                                            Vencimiento : &nbsp;
                                                                        </td>
                                                                        <td class="clsCellDatos2">
                                                                            <asp:TextBox ID="txtArtVenci" runat="server" Width="100px"></asp:TextBox>
                                                                            <asp:CalendarExtender ID="txtArtVenci_CalendarExtender" runat="server" TargetControlID="txtArtVenci"
                                                                                Format="yyyy-MM-dd" PopupButtonID="Image2" Enabled="True">
                                                                            </asp:CalendarExtender>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Controls">
                                                <div style="text-align: center;">
                                                    <asp:Button ID="btnAgregarArticulo" runat="server" Text="Agregar" CssClass="clsBtnAgregar"
                                                        OnClick="btnAgregarArticulo_Click" />
                                                    &nbsp;
                                                    <asp:Button ID="btnCancelarArticulo" runat="server" Text="Cancelar" CssClass="clsBtnCancelar" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </asp:Panel>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="display: none;">
                            <asp:Button ID="btnGirarCompraTMP" runat="server" Text="Girar Compra" />
                        </div>
                        <asp:ModalPopupExtender ID="ModalPopupGirarCompra" runat="server" CancelControlID="btnClose3"
                            TargetControlID="btnGirarCompraTMP" PopupControlID="pnPopGirarCompra" BackgroundCssClass="ModalPopupBG"
                            Enabled="True" DynamicServicePath="">
                        </asp:ModalPopupExtender>
                        <asp:Panel ID="pnPopGirarCompra" Style="display: none" runat="server">
                            <div class="clsModalPopup">
                                <div class="PopupHeader" id="Div3">
                                    DATOS ADICIONALES DE LA COMPRA</div>
                                <div class="PopupClose" id="Div4">
                                    <asp:Button ID="btnClose3" runat="server" Text="X" CssClass="clsBtnCerrar2" /></div>
                                <div class="PopupBody">
                                    <table class="TablePopupBody">
                                        <tr>
                                            <td class="BodyContent">
                                                <asp:Panel ID="pnDatosAdicionales" runat="server">
                                                    <table style="width: 450px; height: 100%;">
                                                        <tr>
                                                            <td class="clsCellTituloDatos2" valign="top" style="width: 23%;">
                                                                Nro Pedido:
                                                            </td>
                                                            <td class="clsCellDatos2" valign="top" colspan="3">
                                                                <asp:Label ID="lblNroPedido" runat="server" Text="999999"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="clsCellTituloDatos2" valign="top">
                                                                Transportista:
                                                            </td>
                                                            <td class="clsCellDatos2" valign="top" colspan="3">
                                                                <asp:DropDownList ID="ddlTransportistas" runat="server" Width="220px" DataTextField="TraRazonSocial"
                                                                    DataValueField="TraCod" AutoPostBack="True" OnSelectedIndexChanged="ddlTransportistas_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="clsCellTituloDatos2" valign="top">
                                                                Ruc trans:
                                                            </td>
                                                            <td class="clsCellDatos2" valign="top" colspan="3">
                                                                <asp:TextBox ID="txtRucTrans" runat="server" Width="100px" ReadOnly="True"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="clsCellTituloDatos2">
                                                                Descuento Esp:
                                                            </td>
                                                            <td class="clsCellDatos2">
                                                                <asp:TextBox ID="txtDesEspec" runat="server" Width="120px"></asp:TextBox>
                                                            </td>
                                                            <td class="clsCellTituloDatos2">
                                                                Flete de Trans:
                                                            </td>
                                                            <td class="clsCellDatos2">
                                                                <asp:TextBox ID="txtFleteTra" runat="server" Width="100px" ReadOnly="True"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="clsCellTituloDatos2">
                                                                Vendedor:
                                                            </td>
                                                            <td class="clsCellDatos2">
                                                                <asp:DropDownList ID="ddlVendedores" runat="server" Width="120px" DataTextField="PerNombres"
                                                                    DataValueField="PerCod">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="clsCellTituloDatos2">
                                                                Zona:
                                                            </td>
                                                            <td class="clsCellDatos2">
                                                                <asp:DropDownList ID="ddlZonas" runat="server" Width="120px" DataTextField="AtrDescripcion"
                                                                    DataValueField="AtrCodigo">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="clsCellTituloDatos2">
                                                                Fecha de Vencimiento:
                                                            </td>
                                                            <td class="clsCellDatos2">
                                                                <asp:TextBox ID="txtFechaVenc" runat="server" Width="120px"></asp:TextBox>
                                                                <asp:CalendarExtender ID="txtFechaVenc_CalendarExtender" runat="server" TargetControlID="txtFechaVenc"
                                                                    Format="yyyy-MM-dd" PopupButtonID="Image2" Enabled="True">
                                                                </asp:CalendarExtender>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Controls">
                                                <div style="text-align: center;">
                                                    <asp:Button ID="btnGuardarDocu" runat="server" Text="Guardar" CssClass="clsBtnGuardar"
                                                        OnClick="btnGuardarDocu_Click" />
                                                    &nbsp;
                                                    <asp:Button ID="btnCancelDocu" runat="server" Text="Cancelar" CssClass="clsBtnCancelar" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </asp:Panel>
                    </td>
                    <td>
                        <div style="display: none;">
                            <asp:Button ID="btnNuevoDocumentoTMP" runat="server" Text="Nuevo Documento" />
                        </div>
                        <asp:ModalPopupExtender ID="ModalPopupNuevoDocumento" runat="server" CancelControlID="btnClose4"
                            TargetControlID="btnNuevoDocumentoTMP" PopupControlID="pnPopNuevoDocumento" BackgroundCssClass="ModalPopupBG"
                            Enabled="True" DynamicServicePath="">
                        </asp:ModalPopupExtender>
                        <asp:Panel ID="pnPopNuevoDocumento" Style="display: none" runat="server" DefaultButton="btnAceptarNuevoDoc">
                            <div class="clsModalPopup">
                                <div class="PopupHeader" id="Div5">
                                    NUEVO DOCUMENTO</div>
                                <div class="PopupClose" id="Div6">
                                    <asp:Button ID="btnClose4" runat="server" Text="X" CssClass="clsBtnCerrar2" /></div>
                                <div class="PopupBody">
                                    <table class="TablePopupBody">
                                        <tr>
                                            <td class="BodyContent">
                                                <asp:Panel ID="pnDatosDocumentoNuevo" runat="server">
                                                    <table style="width: 380px; height: 100%;">
                                                        <tr>
                                                            <td class="clsCellTituloDatos2">
                                                                Tipo de Documento:
                                                            </td>
                                                            <td class="clsCellDatos2">
                                                                <asp:DropDownList ID="ddlTipoDocu" runat="server" Width="250px" DataTextField="AtrDescripcion"
                                                                    DataValueField="AtrCodigo">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="clsCellTituloDatos2">
                                                                Nro de Doc:
                                                            </td>
                                                            <td class="clsCellDatos2">
                                                                <asp:TextBox ID="txtNroSerie" runat="server" Width="30px" MaxLength="3" ToolTip="Nro de Serie del documento"></asp:TextBox>&nbsp;
                                                                - &nbsp;
                                                                <asp:TextBox ID="txtNroDocu" runat="server" Width="80px" MaxLength="10"></asp:TextBox>
                                                                <asp:FilteredTextBoxExtender ID="txtNroSerie_FilteredTextBox" runat="server" TargetControlID="txtNroSerie"
                                                                    FilterType="Numbers">
                                                                </asp:FilteredTextBoxExtender>
                                                                <asp:FilteredTextBoxExtender ID="txtNroDocu_FilteredTextBox" runat="server" TargetControlID="txtNroDocu"
                                                                    FilterType="Numbers">
                                                                </asp:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Controls">
                                                <div style="text-align: center;">
                                                    <asp:Button ID="btnAceptarNuevoDoc" runat="server" Text="Aceptar" CssClass="clsBtnAceptar"
                                                        OnClick="btnAceptarNuevoDoc_Click" />
                                                    &nbsp;
                                                    <asp:Button ID="btnCancelarNuevoDoc" runat="server" Text="Cancelar" CssClass="clsBtnCancelar" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
