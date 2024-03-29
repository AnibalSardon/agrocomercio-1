﻿<%@ Page Title=".:Registro de Compras:." Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfrmCompras.aspx.cs" Inherits="AgrocomercioWEB.Compras.wfrmCompras" 
Theme="TemaAgrocomercio" StylesheetTheme="TemaAgrocomercio"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../App_Themes/TemaAgrocomercio/ventas.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
   
    function dgvDetalleVentaClickEvent(event, rowindex) {

        document.getElementById('lblEstado').value = "DGVCOM_" + event;
        __doPostBack('MainUpdatePanel', rowindex);
    }
    function dgvListOperComprasClickEvent(event, rowindex) {

        document.getElementById('lblEstado').value = "DGVLIS_" + event;
        __doPostBack('MainUpdatePanel', rowindex);
    }
    function dgvDocumentosClickEvent(event, rowindex) {

        document.getElementById('lblEstado').value = "DGVDOC_" + event;
        __doPostBack('MainUpdatePanel', rowindex);
    }
    
    function AbrirVentanaFactura() {
        window.open('../Reportes/ImpresionFactura.aspx', '_blank', 'width=880px,height=600px,scrollbars=si,menubar=no,resizable=no,left=200px, top=70px');
    }
    function AbrirVentanaGuia() {
        window.open('../Reportes/ImpresionGuiaRemision.aspx', '_blank', 'width=880px,height=600px,scrollbars=si,menubar=no,resizable=no,left=200px, top=70px');
    }
    function AbrirVentanaBoleta() {
        window.open('../Reportes/ImpresionBoleta.aspx', '_blank', 'width=880px,height=600px,scrollbars=si,menubar=no,resizable=no,left=200px, top=70px');
    }
    function AbrirVentanaNota() {
        window.open('../Reportes/ImpresionNotaPedido.aspx', '_blank', 'width=880px,height=600px,scrollbars=si,menubar=no,resizable=no,left=200px, top=70px');
    }

    function setArtCod(source, eventargs) {
        document.getElementById('lblEstado').value = "ART_SELECT";
        __doPostBack('MainUpdatePanel', eventargs.get_value());
    }

    function setPrvCod(source, eventargs) {
        document.getElementById('lblEstado').value = "PRV_SELECT";
        __doPostBack('MainUpdatePanel', eventargs.get_value());
    }

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:UpdateProgress id="updateProgress" runat="server" 
                AssociatedUpdatePanelID="MainUpdatePanel"  dynamiclayout="true">
    <ProgressTemplate>
        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 8888888; background-color: #ffffff; opacity: 0.7; filter: alpha(opacity=70);">
            &nbsp;
        </div>
        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; ">
            <div style="padding: 10px;position:relative;top:30%; left:50%; height: 100px; width: 100px;">
                <asp:Image ID="imgUpdateProgress" runat="server" 
                ImageUrl="../images/ajax-loader.gif" AlternateText="Trabajando ..." 
                ToolTip="Trabajando ..." 
                style="height: 100px; width: 100px;" />
                <span style="padding: 10px; font-size:16px; font-weight:bold; color:#555555; " >Trabajando ... </span>
            </div>
        </div>
        
    </ProgressTemplate>
</asp:UpdateProgress>        
<asp:UpdatePanel ID="MainUpdatePanel" runat="server" ClientIDMode="Static">
<ContentTemplate>
<table style="width: 800px; margin:0 auto;" >
    <tr>
        <td colspan="2"> <h2 class="clsTituloInterior">COMPRAS DE AGROCOMERCIO S.R.L.</h2>
            <asp:HiddenField ID="lblEstado" runat="server" ClientIDMode="Static" />   
            &nbsp;<asp:HiddenField ID="lblProceso" runat="server" />
            <asp:HiddenField ID="lblOpeEstado" runat="server" />
            <br />    
            
        </td>
    </tr>
    <tr>
            <td colspan="2">
                <table class="tabPedidos">
                <tr>
                    <td class="tabIzquierda" valign="top">
                    <asp:panel id="pnListOperCompras" runat="server">
                        <table class="tableIzquierda">
                        <tr>
                            <td  colspan="4" >
                                <h3>Lista de Compras</h3>
                            </td>
                        </tr>   
                        <tr>
                            <td class="clsCellTituloDatos2" >
                               <asp:CheckBox ID="chkPorEstado" runat="server" Text="Por Estados:  " 
                                    AutoPostBack="True" oncheckedchanged="chkPorEstado_CheckedChanged" /> 
                            </td>
                            <td class="clsCellDatos2" >
                                <asp:DropDownList ID="ddlEstados" runat="server" Width="120px" 
                                    DataTextField="AtrDescripcion" DataValueField="AtrCodigo" AutoPostBack="True" 
                                    onselectedindexchanged="ddlEstados_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td class="clsCellTituloDatos2" >
                                <asp:CheckBox ID="chkPorFecha" runat="server" Text="Por Fecha:  " 
                                    AutoPostBack="True" oncheckedchanged="chkPorFecha_CheckedChanged" />
                               
                            </td>
                            <td class="clsCellDatos2" >
                                <asp:TextBox ID="txtFecPro" runat="server"  Width="120px" Height="16px" 
                                    AutoPostBack="True" ontextchanged="txtFecPro_TextChanged"></asp:TextBox>
                                <asp:CalendarExtender ID="CalendarExtender_txtFecPro" runat="server" 
                                    TargetControlID="txtFecPro" Format="yyyy-MM-dd"
                                    PopupButtonID="Image2" Enabled="True" ></asp:CalendarExtender>
                            </td>
                        </tr>   
                        <tr>
                            <td colspan="4" >
                                <asp:Panel ID="pnListOperaciones" runat="server" Height="325px" ScrollBars="Auto">
                                <asp:GridView ID="dgvListOperCompras" runat="server"  
                                    AutoGenerateColumns="False"
                                    GridLines="None"
                                    CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" 
                                    onrowdatabound="dgvListOperCompras_RowDataBound" >
                                    <AlternatingRowStyle CssClass="alt" />
                                    <Columns>
                                        <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                        <asp:ButtonField Text="DoubleClick" CommandName="DoubleClick" Visible="False" />
                                        <asp:BoundField DataField="OpeCod" HeaderText="Codigo Oper." 
                                            ConvertEmptyStringToNull="False" NullDisplayText=" " >
                                            <ItemStyle HorizontalAlign="Left" Width="10px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="PrvRazon" HeaderText="Proveedor">
                                            <ItemStyle HorizontalAlign="Left" Width="140px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="OpeTotal" HeaderText="Importe" >
                                            <ItemStyle Width="20px"  />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="OpeFecEmision" HeaderText="Fecha" DataFormatString="{0:d}">
                                            <ItemStyle Width="20px"  />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AtrDescripcion" HeaderText="Estado">
                                            <ItemStyle Width="20px" HorizontalAlign="Center" />
                                        </asp:BoundField>                                                   
                                    </Columns>
                                    <EmptyDataTemplate><i><div class="clsError1" id="lblError1" runat="server">No se ha Registro Ninguna Compra</div></i></EmptyDataTemplate>
                                    <PagerStyle CssClass="pgr" />
                                    <SelectedRowStyle CssClass="selrow" />
                                </asp:GridView>   
                                </asp:Panel>                                     
                            </td>
                        </tr>
                        </table>
                    </asp:panel>
                    <asp:panel id="pnDocCompra" runat="server">
                        <table class="tableIzquierda">
                        <tr>
                            <td style=" width:20%;" ></td>
                            <td style=" width:45%;"  colspan="3">
                            </td>
                            <td style=" width:15%;" ></td>
                            <td style=" width:20%;" >
                                <asp:HiddenField ID="lblTipoDoc" runat="server" />
                                <asp:HiddenField ID="lbldopCod" runat="server" />
                            </td>
                        </tr>   
                         
                        <tr>
                            <td class="clsCellTituloDatos2" >Fecha: </td>
                            <td  class="clsCellDatos2" colspan="2">
                                <asp:TextBox ID="txtFecha" runat="server" Width="100px" ></asp:TextBox>
                                <asp:CalendarExtender ID="txtFecha_CalendarExtender" runat="server" 
                                    TargetControlID="txtFecha" Format="yyyy-MM-dd"
                                    PopupButtonID="Image2" Enabled="True" ></asp:CalendarExtender>
                            </td> 
                            <td colspan="3" align="right" >
                                <table class="clsTitDocumento">
                                    <tr>
                                        <td align="center"><asp:Label ID="lblDescriDocumento" runat="server" Text="Label" CssClass="clsTitDocumento_CAB"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="center"><asp:Label ID="lblNroDocumento" runat="server" Text="Label" CssClass="clsTitDocumento_NUM"></asp:Label></td>
                                    </tr>
                                </table>                                
                            </td>
                        </tr>  
                        <tr>
                            <td class="clsCellTituloDatos2" >Proveedor: </td>
                            <td class="clsCellDatos2" colspan="3">
                                <asp:DropDownList ID="ddlProveedor" runat="server" Width="250px" 
                                    AutoPostBack="True" DataTextField="PrvRazon" DataValueField="PrvCod" 
                                    onselectedindexchanged="ddlProveedor_SelectedIndexChanged" style=" display:none;" >
                                            </asp:DropDownList>
                                <asp:TextBox ID="txtProveedor" runat="server" Width="270px" ></asp:TextBox>
                                <asp:TextBoxWatermarkExtender 
	                                ID="txtProveedor_TextBoxWatermarkExtender" runat="server"
	                                TargetControlID="txtProveedor" WatermarkCssClass = "clsWaterMark" 
	                                WatermarkText="Busqueda de Proveedores..." Enabled="true">
                                </asp:TextBoxWatermarkExtender>
                                <div id="PrvlistPlacement" class="cls_listPlacement" style=" overflow:auto; "></div>
                                <asp:AutoCompleteExtender ID="txtProveedor_AutoCompleteExtender"
	                                MinimumPrefixLength="2" TargetControlID="txtProveedor" 
                                    enablecaching="true" 
                                    showonlycurrentwordincompletionlistitem="true" 
	                                CompletionSetCount="10" CompletionInterval="100" 
	                                ServiceMethod="BuscarProveedores" 
	                                runat="server" OnClientItemSelected="setPrvCod" 
	                                CompletionListElementID="PrvlistPlacement">
                                </asp:AutoCompleteExtender>
                            </td>
                            <td class="clsCellTituloDatos2" >
                                <asp:Label ID="lblDocCli" runat="server" Text="R.U.C.:"></asp:Label></td>
                            <td  class="clsCellDatos2">
                                            <asp:TextBox ID="txtDocCli" runat="server" Width="100px" ReadOnly="True"></asp:TextBox>
                            </td>                                       
                        </tr>    
                        <tr>
                            <td class="clsCellTituloDatos2" >Dirección: </td>
                            <td class="clsCellDatos2" colspan="3">
                                <asp:TextBox ID="txtDireccion" runat="server" Width="270px" ReadOnly="True"></asp:TextBox></td>
                            <td class="clsCellTituloDatos2" >Telefono: </td>
                            <td  class="clsCellDatos2">
                                <asp:TextBox ID="txtTelefono" runat="server" Width="100px" ReadOnly="True"></asp:TextBox>
                            </td>                                       
                        </tr>    
                        <tr>
                            <td class="clsCellTituloDatos2" >Moneda: </td>
                            <td class="clsCellDatos2">
                                <asp:DropDownList ID="ddlMoneda" runat="server" Width="100px" DataTextField="AtrDescripcion" DataValueField="AtrCodigo">
                                            </asp:DropDownList></td>
                            <td class="clsCellTituloDatos2" >Compra Al: </td>
                            <td  class="clsCellDatos2">
                                <asp:DropDownList ID="ddlTipoVenta" runat="server" Width="100px" DataTextField="AtrDescripcion" DataValueField="AtrCodigo"></asp:DropDownList>
                            </td> 
                                                                   
                        </tr>
                        <tr>
                            <td colspan="6" >&nbsp;&nbsp;
                                <asp:HiddenField ID="lblDescuentoEsp" runat="server" Value="0.0" />
                            </td>                                    
                        </tr>      
                        <tr>
                            <td colspan="6">
                                <asp:Panel ID="pnGridPedido" runat="server" Height="320px" ScrollBars="Auto">
                                <asp:GridView ID="dgvDetalleVenta" runat="server"  
                                    AutoGenerateColumns="False"
                                    GridLines="None"
                                    CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" 
                                    onrowdatabound="dgvDetalleVenta_RowDataBound" >
                                    <AlternatingRowStyle CssClass="alt" />
                                    <Columns>
                                        <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                        <asp:ButtonField Text="DoubleClick" CommandName="DoubleClick" Visible="False" />
                                        <asp:BoundField DataField="ArtCod" HeaderText="Codigo" 
                                            ConvertEmptyStringToNull="False" NullDisplayText=" " >
                                            <ItemStyle HorizontalAlign="Left" Width="10px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LotNro" HeaderText="Nro Lote" 
                                            ConvertEmptyStringToNull="False" NullDisplayText=" " >
                                            <ItemStyle HorizontalAlign="Left" Width="10px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ArtDescripcion" HeaderText="Descripcion">
                                            <ItemStyle HorizontalAlign="Left" Width="140px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="UniAbrev" HeaderText="Unidad" >
                                            <ItemStyle Width="20px"  />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="dtpCantidad" HeaderText="Cant.">
                                            <ItemStyle Width="20px" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="dtpPrecioVen" HeaderText="P.Unit" DataFormatString="{0:N}">
                                            <ItemStyle Width="20px" />
                                        </asp:BoundField>    
                                        <asp:BoundField DataField="dtpDscto" HeaderText="Dcto." DataFormatString="{0:N}">
                                            <ItemStyle Width="20px" />
                                        </asp:BoundField>    
                                        <asp:BoundField DataField="dtpSubTotal" HeaderText="Importe" DataFormatString="{0:N}">
                                            <ItemStyle Width="20px" />
                                        </asp:BoundField>                                            
                                    </Columns>
                                    <EmptyDataTemplate><i><div class="clsError1" id="lblError1" runat="server">No hay Platos Disponibles</div></i></EmptyDataTemplate>
                                    <PagerStyle CssClass="pgr" />
                                    <SelectedRowStyle CssClass="selrow" />
                                </asp:GridView>   
                                </asp:Panel>                                     
                            </td>
                        </tr>
                        </table>
                    </asp:panel> 
                     
                    </td>
                    <td class="tabDerecha" valign="top">
                        <div class="divDerecha">
                                <asp:Panel runat="server" ID="pnBotones" CssClass="clspntablaDerecha" >
                                <table class="tablaDerecha" >
                                <tr>
                                    <td colspan="2" align="left"><h3>Opciones</h3></td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" ToolTip="Nuevo" CssClass="clsBtnNuevo" 
                                            onclick="btnNuevo_Click" CausesValidation="False" /> 
                                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" ToolTip="Guardar" 
                                            CssClass="clsBtnGuardar" onclick="btnGuardar_Click" />                                       
                                    </td>
                                    <td valign="top">
                                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" ToolTip="Cancelar"
                                            CssClass="clsBtnCancelar" onclick="btnCancelar_Click" CausesValidation="False"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:Button ID="btnEditar" runat="server" Text="Editar" ToolTip="Editar"  CssClass="clsBtnEditar" 
                                            onclick="btnEditar_Click" />
                                        
                                    </td>
                                    <td valign="top">
                                        <asp:Button ID="btnAnular" runat="server" Text="Anular" ToolTip="Anular" 
                                                    CssClass="clsBtnAnular" onclick="btnAnular_Click"  /></td>
                                </tr>
                                
                                <tr>
                                    <td valign="top">
                                        <asp:Button ID="btnProcesar" runat="server" Text="Procesar" ToolTip="Procesar" 
                                            CssClass="clsBtnProcesar" onclick="btnProcesar_Click" />
                                    </td>
                                    <td valign="top">
                                        <asp:Button ID="btnImprimir" runat="server" Text="Imprimir" ToolTip="Imprimir" 
                                            CssClass="clsBtnImprimir" OnClientClick="AbrirVentanaFactura()" onclick="btnImprimir_Click"  />
                                    </td>
                                </tr>
                                
                                </table>
                                </asp:Panel> 

                                <asp:Panel runat="server" ID="pnMenuArticulos" Height="80px" CssClass="clspntablaDerecha" >
                                <table class="tablaDerecha" style=" height:100%;" >
                                <tr>
                                    <td colspan="2" align="left" valign="top"><h3>OPCIONES ARTICULOS</h3></td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" ToolTip="Agregar"  CssClass="clsBtnAgregar" onclick="btnAgregar_Click" />
                                    </td>
                                    <td valign="top">
                                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" ToolTip="Eliminar" 
                                            CssClass="clsBtnEliminar" onclick="btnEliminar_Click"  /></td>
                                </tr>
                                </table>
                                </asp:Panel>

                                <asp:Panel runat="server" ID="pnDocumentos" style=" height:auto; " CssClass="clspntablaDerecha"  >
                                <table class="tablaDerecha" style=" height:100%;" >
                                <tr>
                                    <td colspan="2" align="left" valign="top"><h3>Documentos</h3></td>
                                </tr>
                                <tr>
                                    <td valign="top" >
                                        <asp:GridView ID="dgvDocumentos" runat="server"  
                                            AutoGenerateColumns="False"
                                            GridLines="None"
                                            CssClass="mGrid mGrid2" ShowHeaderWhenEmpty="True" 
                                            style=" margin:0px; padding:0px;  " 
                                            onrowdatabound="dgvDocumentos_RowDataBound" 
                                            onselectedindexchanged="dgvDocumentos_SelectedIndexChanged" >
                                            <AlternatingRowStyle CssClass="alt" />
                                            <Columns>
                                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                                <asp:BoundField DataField="dopCod" HeaderText="NRO" 
                                                    ConvertEmptyStringToNull="False" NullDisplayText=" " >
                                                    <ItemStyle HorizontalAlign="Left" Width="10px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="AtrDescripcion" HeaderText="Documento">
                                                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                                                </asp:BoundField>                                                
                                            </Columns>
                                            <EmptyDataTemplate><i><div class="clsError1" id="lblError1" runat="server">No se ha Registro Ninguna Compra</div></i></EmptyDataTemplate>
                                            <PagerStyle CssClass="pgr" />
                                            <SelectedRowStyle CssClass="selrow" />
                                        </asp:GridView>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td align="right" valign="Top">
                                        <asp:Button ID="btnNuevoDocumento" runat="server" Text="Canjear Factura" CssClass="clsBtnNuevoDoc" 
                                            CausesValidation="False" ToolTip="NuevoDoc" 
                                            onclick="btnNuevo_Click" /> 
                                    </td>
                                </tr>
                                </table>
                                </asp:Panel>

                                <asp:Panel runat="server" ID="pnResultadoOper" CssClass="clspntablaDerecha"  >
                                <table class="tablaDerecha" >
                                <tr>
                                    <td colspan="2" align="left"><h3>Resultado</h3></td>
                                </tr>
                                <tr>
                                    <td class="clsCellTituloSmall"  style=" width:90px">SUB TOTAL: </td>
                                    <td style=" width:80px"><asp:Label ID="txtSubTotal" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="clsCellTituloSmall">DESCUENTO (-): </td>
                                    <td><asp:Label ID="txtDescuento" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="clsCellTituloSmall">FLETE (+): </td>
                                    <td><asp:Label ID="txtFlete" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="clsCellTituloSmall"  style=" width:70px">VALOR DE COMPRA: </td>
                                    <td style=" width:80px"><asp:Label ID="txtValorCompra" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td  class="clsCellTituloSmall">IGV (18%): </td>
                                    <td><asp:Label ID="txtIgv" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                               
                                <tr>
                                    <td class="clsCellTituloSmall">PRECIO DE COMPRA: </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="clsCellDatosLarge2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="txtTotal" runat="server" Text="S/. 0.00"></asp:Label></td>
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
            <div style=" display:none; ">
                <asp:Button ID="btnNuevoPrvTMP" runat="server" Text="Nuevo Proveedor" />
            </div>
            <asp:modalpopupextender id="ModalPopupNuevoPrv" runat="server" 
	                cancelcontrolid="btnClose" 
	                targetcontrolid="btnNuevoPrvTMP" popupcontrolid="pnPopNuevoProveedor" 
	                backgroundcssclass="ModalPopupBG" Enabled="True"  >
            </asp:modalpopupextender>
            <asp:panel id="pnPopNuevoProveedor" style="display: none" runat="server">
	            <div class="clsModalPopup">
	                <div class="PopupHeader" id="PopupHeader">REGISTRO DE NUEVO PROVEEDOR</div>
	                <div class="PopupClose" id="PopupClose">
	                    <asp:Button ID="btnClose" runat="server" Text="X" CssClass="clsBtnCerrar2" /></div>
	                    <div class="PopupBody" >
                        
	                    <table class="TablePopupBody">
	                    <tr>
	                        <td class="BodyContent">
	                            <asp:panel id="pnCliente" runat="server" >
                                <fieldset style="height:100%;">
                                <legend>Datos del Proveedor</legend>
                                    <table style=" width:460px; height:100%;">
                                        <tr>
                                            <td class="clsCellTituloDatos2" valign="top" style=" width:20%;" >
                                                Codigo: </td>
                                            <td class="clsCellDatos2"  valign="top"  >
                                                <asp:Label ID="txtCliCod" runat="server" Text=" "></asp:Label>                       
                                            </td> 
                                            <td class="clsCellTituloDatos2" valign="top" >   
                                                <asp:Label ID="lblDocumento" runat="server" Text="Nro. de RUC: "></asp:Label>                        
                                            </td>
                                            <td class="clsCellDatos2"  valign="bottom" >
                                                <asp:TextBox ID="txtNroDoc" runat="server"  Width="120px" MaxLength="12"></asp:TextBox>
                                                <asp:CustomValidator ID="txtNroDocRequired" runat="server" ErrorMessage="<b>*</b>"
                                                    ControlToValidate="txtNroDoc" ValidateEmptyText="true" Display="Dynamic" 
                                                    ForeColor="#CC0000" onservervalidate="VentaProveedor_ServerValidate"  
                                                    CssClass="clsValidateAster" SetFocusOnError="True"  />
                                                 <asp:FilteredTextBoxExtender ID="txtNroDocFilteredExtender" runat="server" TargetControlID="txtNroDoc" FilterType="Numbers">
                                                </asp:FilteredTextBoxExtender>      
                                            </td>

                                        </tr>
                                        <tr>
                                            <td class="clsCellTituloDatos2" >
                                                <asp:Label ID="lblNombre" runat="server" Text="Razon Social: "></asp:Label></td>
                                            <td class="clsCellDatos2" colspan="3">
                                                <asp:TextBox ID="txtNombre" runat="server" Width="340px"></asp:TextBox>
                                                <asp:CustomValidator ID="txtNombreRequired" runat="server" ErrorMessage="<b>*</b>"
                                                    ControlToValidate="txtNombre" ValidateEmptyText="true" Display="Dynamic" 
                                                    ForeColor="#CC0000" 
                                                    onservervalidate="VentaProveedor_ServerValidate"  
                                                    CssClass="clsValidateAster" SetFocusOnError="True"  />   
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="clsCellTituloDatos2" >Dirección: </td>
                                            <td class="clsCellDatos2" colspan="3">
                                                <asp:TextBox ID="txtCliDireccion" runat="server" Width="340px"></asp:TextBox>
                                                               
                                            </td>  
                                        </tr>
                                        <tr>
                                            <td class="clsCellTituloDatos2" >Contacto: </td>
                                            <td class="clsCellDatos2" colspan="3"><asp:TextBox ID="txtRepresentante" runat="server" Width="340px"></asp:TextBox></td>                                                                    
                                             </tr>
                                        <tr>
                                            <td class="clsCellTituloDatos2" >
                                                <asp:Label ID="lblTelefono" runat="server" Text="Telefono: "></asp:Label> </td>
                                            <td class="clsCellDatos2" ><asp:TextBox ID="txtCliTelefono" runat="server" Width="100px"></asp:TextBox></td>                                                                        
                                            <td class="clsCellTituloDatos2" > Fecha de Ingreso:  </td>
                                            <td class="clsCellDatos2" >
                                                <asp:TextBox ID="txtFecRegis" runat="server" Width="117px" ></asp:TextBox>                                                                            
                                                <asp:CalendarExtender ID="txtFecRegis_CalendarExtender" runat="server" 
                                                    TargetControlID="txtFecRegis" Format="yyyy-MM-dd"
                                                    PopupButtonID="Image2" Enabled="True" ></asp:CalendarExtender>
                                            </td>
                                        </tr>
                                    </table>
                                    </fieldset>
                                    </asp:panel>                         
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="Controls" style=" position:relative;">
                                <asp:Label ID="lblRequired" runat="server" Text="* Campos Obligatorios" 
                                            ForeColor="#CC0000" Font-Bold="True" Font-Size="12px" style=" position:absolute; bottom:20px; left:10px;" ></asp:Label>
                                <div  style=" text-align:center;"> 
	                                <asp:Button ID="btnNuevoProveedor" runat="server" Text="Nuevo" ToolTip="Nuevo" 
                                        CssClass="clsBtnNuevo" onclick="btnNuevoProveedor_Click" CausesValidation="False"/>
                                    &nbsp;
                                    <asp:Button ID="btnGuardarProveedor" runat="server" Text="Guardar"  ToolTip="Guardar"
                                        CssClass="clsBtnGuardar" onclick="btnGuardarProveedor_Click"  />
                                    &nbsp;
                                    <asp:Button ID="btnCancelarProveedor" runat="server" Text="Cancelar" ToolTip="Cancelar" 
                                        CssClass="clsBtnCancelar" onclick="btnCancelarProveedor_Click" CausesValidation="False"/>
                                </div>                               
	                        </td>	                        
	                    </tr>
	                    </table> 
	                </div>
	            </div> 
            </asp:panel>
          
        </td>
        <td>
            <div style=" display:none; ">
                <asp:Button ID="btnAgregarTMP" runat="server" Text="Nuevo Cliente" />
            </div>
            <asp:modalpopupextender id="ModalPopupAgregar" runat="server" 
	                cancelcontrolid="btnClose2" 
	                targetcontrolid="btnAgregarTMP" popupcontrolid="pnPopAgregarArticulo" 
	                backgroundcssclass="ModalPopupBG" Enabled="True" DynamicServicePath="" >
            </asp:modalpopupextender>
            <asp:panel id="pnPopAgregarArticulo" style="display: none;" runat="server" DefaultButton="btnAgregarArticulo">
	            <div class="clsModalPopup">
	                <div class="PopupHeader" id="Div1">AGREGAR UN ARTICULO</div>
	                <div class="PopupClose" id="Div2">
	                    <asp:Button ID="btnClose2" runat="server" Text="X" CssClass="clsBtnCerrar2" /></div>
	                    <div class="PopupBody" >
	                    <table class="TablePopupBody">
	                    <tr>
	                        <td class="BodyContent">
	                            <asp:panel id="pnDatosArticulo" runat="server" >
                                    <table>
                                    <tr>
                                        <td valign="top">
                                            <table style=" width:200px; height:100%;">
                                                <tr>
                                                    <td class="clsCellTituloDatos2" valign="top" >
                                                        Laboratorio: </td>
                                                    <td class="clsCellDatos2"  valign="top" >
                                                        <asp:DropDownList ID="ddlLaboratorios" runat="server" Width="200px" 
                                                            AutoPostBack="True" DataTextField="PrvRazon" DataValueField="PrvCod" onselectedindexchanged="ddlLaboratorios_SelectedIndexChanged" >
                                                        </asp:DropDownList>                           
                                                    </td>                                                                         
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloDatos2" valign="top" >
                                                        Articulos: </td>
                                                    <td class="clsCellDatos2"  valign="top" > 
                                                        <asp:TextBox ID="txtBuscarArt" runat="server" Width="196px" ></asp:TextBox>
                                                        <asp:TextBoxWatermarkExtender 
	                                                        ID="txtBuscarArt_waterMark" runat="server"
	                                                        TargetControlID="txtBuscarArt" WatermarkCssClass = "clsWaterMark" 
	                                                        WatermarkText="Buqueda de Articulos..." Enabled="true">
                                                        </asp:TextBoxWatermarkExtender>
                                                        <div id="listPlacement" class="cls_listPlacement"></div>
                                                        <asp:AutoCompleteExtender ID="txtBuscarArt_AutoCompleteExtender"
	                                                        MinimumPrefixLength="2" TargetControlID="txtBuscarArt" 
                                                            enablecaching="true" 
                                                            showonlycurrentwordincompletionlistitem="true" 
	                                                        CompletionSetCount="10" CompletionInterval="100" 
	                                                        ServiceMethod="BuscarArticulos" 
	                                                        runat="server" OnClientItemSelected="setArtCod" 
	                                                        CompletionListElementID="listPlacement">
                                                        </asp:AutoCompleteExtender>
                                                    </td> 
                                                </tr>  
                                                <tr>
                                                    <td class="clsCellTituloDatos2" valign="top" ></td>
                                                    <td class="clsCellDatos2"  valign="top" > 
                                                        <asp:ListBox ID="lsbArticulos" runat="server" Width="200px" Height="150px" 
                                                            DataTextField="ArtDescripcion" DataValueField="ArtCod" 
                                                            onselectedindexchanged="lsbArticulos_SelectedIndexChanged" 
                                                            AutoPostBack="True"></asp:ListBox>                                                                    
                                                    </td> 
                                                </tr>                                                
                                            </table>
                                        </td>
                                        <td valign="top">
                                            <table style=" width:200px; height:100%;">
                                                <tr>
                                                    <td style=" width:50%;" ></td>
                                                    <td style=" width:50%;" ></td>                                                
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloDatos2" valign="top" >
                                                        Codigo : &nbsp;</td>
                                                    <td class="clsCellDatos2"  valign="top" >
                                                        <asp:TextBox ID="txtArtCod" runat="server"  Width="100px" Enabled="false" ></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr> 
                                                    <td class="clsCellTituloDatos2" valign="top" >
                                                        Unidad de Med. : &nbsp;</td>
                                                    <td class="clsCellDatos2"  valign="top" >
                                                        <asp:TextBox ID="txtArtUniMed" runat="server"  Width="100px" Enabled="false" ></asp:TextBox>              
                                                    </td>                     
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloDatos2" valign="top" >
                                                        Stock Fact : &nbsp;</td>
                                                    <td class="clsCellDatos2"  valign="top" >
                                                        <asp:TextBox ID="txtStockFact" runat="server"  Width="100px" Enabled="false" ></asp:TextBox>
                                                    </td> 
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloDatos2" valign="top" >
                                                        Stock Fisico : &nbsp;</td>
                                                    <td class="clsCellDatos2"  valign="top" >
                                                        <asp:TextBox ID="txtStockFis" runat="server"  Width="100px" Enabled="false" ForeColor="Red"></asp:TextBox>              
                                                    </td>                     
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloDatos2" style=" color:#444444;"> 
                                                        Nro Lote : &nbsp;</td>
                                                    <td class="clsCellDatos2" >
                                                        <asp:TextBox ID="txtLotNro" runat="server" Width="100px" ></asp:TextBox>                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloDatos2" style="  color:#444444;"> 
                                                        Vencim. Lote : &nbsp;</td>
                                                    <td class="clsCellDatos2" >
                                                        <asp:TextBox ID="txtLotVenci" runat="server" Width="100px" ></asp:TextBox>                                                                            
                                                        <asp:CalendarExtender ID="txtLotVenci_CalendarExtender" runat="server" 
                                                            TargetControlID="txtLotVenci" Format="yyyy-MM-dd"
                                                            PopupButtonID="Image2" Enabled="True" ></asp:CalendarExtender>
                                                       
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"> 
                                                    <HR>
                                                    </td>
                                                    
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloDatos2" valign="top" style=" font-weight:bold; color:#444444;">
                                                        P.Unitario : &nbsp;</td>
                                                    <td class="clsCellDatos2"  valign="top" >
                                                        <asp:TextBox ID="txtArtPreUnitario" runat="server"  Width="100px" 
                                                            Enabled="false" AutoPostBack="True" 
                                                            ontextchanged="txtArtPreUnitario_TextChanged" ></asp:TextBox>                                                                      
                                                    </td>                     
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloDatos2" valign="top" style=" font-weight:bold; color:#444444;">
                                                        Cantidad : &nbsp;</td>
                                                    <td class="clsCellDatos2"  valign="top" >
                                                        <asp:TextBox ID="txtArtCant" runat="server"  Width="100px" AutoPostBack="True" 
                                                            ontextchanged="txtArtCant_TextChanged" ></asp:TextBox>
                                                    </td> 
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloDatos2" valign="top" style=" font-weight:bold; color:#444444;" >
                                                        Descuento(%) : &nbsp;</td>
                                                    <td class="clsCellDatos2"  valign="top" >
                                                        <asp:TextBox ID="txtArtDescuento" runat="server"  Width="100px" 
                                                            AutoPostBack="True" ontextchanged="txtArtDescuento_TextChanged" ></asp:TextBox>
                                                    </td> 
                                                </tr>
                                                <tr>
                                                    <td class="clsCellTituloDatos2" valign="top" style=" font-weight:bold; color:#444444;">
                                                        Importe Total : &nbsp;</td>
                                                    <td class="clsCellDatos2"  valign="top" >
                                                        <asp:TextBox ID="txtImpTotal" runat="server"  Width="100px" Enabled="false" ></asp:TextBox>              
                                                    </td>                     
                                                </tr>                                                
                                            </table>
                                        </td>
                                    </tr>
                                    </table>
                                </asp:panel>                         
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="Controls">
	                        <div  style=" text-align:center;"> 
	                            <asp:Button ID="btnAgregarArticulo" runat="server" Text="Agregar"  ToolTip="Agregar"
                                    CssClass="clsBtnAgregar" onclick="btnAgregarArticulo_Click"  />
                                &nbsp;
                                <asp:Button ID="btnCancelarArticulo" runat="server" Text="Cancelar" ToolTip="Cancelar" 
                                    CssClass="clsBtnCancelar" />
                                
	                        </div>
	                        </td>	                        
	                    </tr>
	                    </table> 
	                </div>
	            </div>
            </asp:panel>
        </td>
    </tr>
    <tr>
        <td>
            <div style=" display:none; ">
                <asp:Button ID="btnGirarCompraTMP" runat="server" Text="Girar Compra" />
            </div>
            <asp:modalpopupextender id="ModalPopupGirarCompra" runat="server" 
	                cancelcontrolid="btnClose3" 
	                targetcontrolid="btnGirarCompraTMP" popupcontrolid="pnPopGirarCompra" 
	                backgroundcssclass="ModalPopupBG" Enabled="True" DynamicServicePath="" >
            </asp:modalpopupextender>
            <asp:panel id="pnPopGirarCompra" style="display: none;" runat="server">
	            <div class="clsModalPopup">
	                <div class="PopupHeader" id="Div3">DATOS ADICIONALES DE LA COMPRA</div>
	                <div class="PopupClose" id="Div4">
	                    <asp:Button ID="btnClose3" runat="server" Text="X" CssClass="clsBtnCerrar2" /></div>
	                    <div class="PopupBody" >
	                    <table class="TablePopupBody">
	                    <tr>
	                        <td class="BodyContent">
	                            <asp:panel id="pnDatosAdicionales" runat="server" >
                                    <table style=" width:450px; height:100%;">
                                        <tr>
                                            <td class="clsCellTituloDatos2" valign="top" style=" width:23%;" >
                                                Nro Pedido: </td>
                                            <td class="clsCellDatos2"  valign="top" colspan="3" >
                                                <asp:Label ID="lblNroPedido" runat="server" Text="999999"></asp:Label>
                                            </td>                 
                                        </tr>
                                        <tr>
                                            <td class="clsCellTituloDatos2" >Descuento Esp: </td>
                                            <td class="clsCellDatos2" ><asp:TextBox ID="txtDesEspec" runat="server" Width="120px"></asp:TextBox></td>
                                            <td class="clsCellTituloDatos2" >Flete de Trans: </td>
                                            <td class="clsCellDatos2" ><asp:TextBox ID="txtFleteTra" runat="server" 
                                                    Width="100px" ReadOnly="True"></asp:TextBox></td>                    
                                        </tr>
                                        <tr>
                                            <td class="clsCellTituloDatos2" >Zona: </td>
                                            <td class="clsCellDatos2" >
                                                <asp:DropDownList ID="ddlZonas" runat="server" Width="120px" 
                                                    DataTextField="AtrDescripcion" DataValueField="AtrCodigo" >
                                                </asp:DropDownList> 
                                            </td>
                                            <td class="clsCellTituloDatos2" > Fecha de Vencimiento:  </td>
                                            <td class="clsCellDatos2" >
                                                <asp:TextBox ID="txtFechaVenc" runat="server" Width="100px" ></asp:TextBox>                                                                            
                                                <asp:CalendarExtender ID="txtFechaVenc_CalendarExtender" runat="server" 
                                                    TargetControlID="txtFechaVenc" Format="yyyy-MM-dd"
                                                    PopupButtonID="Image2" Enabled="True" ></asp:CalendarExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:panel>                         
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="Controls">
	                        <div  style=" text-align:center;"> 
	                            <asp:Button ID="btnGuardarDocu" runat="server" Text="Guardar" ToolTip="Guardar" 
                                    CssClass="clsBtnGuardar" onclick="btnGuardarDocu_Click"  />
                                &nbsp;
                                <asp:Button ID="btnCancelDocu" runat="server" Text="Cancelar" ToolTip="Cancelar" 
                                    CssClass="clsBtnCancelar"  />
                                
	                        </div>
	                        </td>	                        
	                    </tr>
	                    </table> 
	                </div>
	            </div>
            </asp:panel>
        </td>
        <td>
            <div style=" display:none; ">
                <asp:Button ID="btnNuevoDocumentoTMP" runat="server" Text="Nuevo Documento" />
            </div>
            <asp:modalpopupextender id="ModalPopupNuevoDocumento" runat="server" 
	                cancelcontrolid="btnClose4" 
	                targetcontrolid="btnNuevoDocumentoTMP" popupcontrolid="pnPopNuevoDocumento" 
	                backgroundcssclass="ModalPopupBG" Enabled="True" DynamicServicePath="" >
            </asp:modalpopupextender>
            <asp:panel id="pnPopNuevoDocumento" style="display: none" runat="server" 
                DefaultButton="btnAceptarNuevoDoc">
	            <div class="clsModalPopup">
	                <div class="PopupHeader" id="Div5">NUEVO DOCUMENTO</div>
	                <div class="PopupClose" id="Div6">
	                    <asp:Button ID="btnClose4" runat="server" Text="X" CssClass="clsBtnCerrar2" /></div>
	                    <div class="PopupBody" >
	                    <table class="TablePopupBody">
                        <tr>
	                        <td class="BodyContent">
                                <asp:panel id="pnDatosDocumentoNuevo" runat="server" >
                                    <table style=" width:380px; height:100%;">
                                        <tr>
                                            <td class="clsCellTituloDatos2" >Tipo de Documento: </td>
                                            <td class="clsCellDatos2" >
                                                <asp:DropDownList ID="ddlTipoDocu" runat="server" Width="250px" 
                                                    DataTextField="AtrDescripcion" DataValueField="AtrCodigo">
                                                            </asp:DropDownList></td>
                                        </tr> 
                                        <tr>
                                            <td class="clsCellTituloDatos2" >Nro de Doc:</td>
                                            <td  class="clsCellDatos2">
                                                <asp:TextBox ID="txtNroSerie" runat="server"  Width="30px" MaxLength="3" 
                                                    ToolTip="Nro de Serie del documento" ></asp:TextBox>&nbsp; - &nbsp;                                                         
                                                <asp:TextBox ID="txtNroDocu" runat="server" Width="80px" MaxLength="10" ></asp:TextBox>    
                                                <asp:FilteredTextBoxExtender ID="txtNroSerie_FilteredTextBox" runat="server" TargetControlID="txtNroSerie" FilterType="Numbers">
                                                </asp:FilteredTextBoxExtender>                                            
                                                <asp:FilteredTextBoxExtender ID="txtNroDocu_FilteredTextBox" runat="server" TargetControlID="txtNroDocu" FilterType="Numbers">
                                                </asp:FilteredTextBoxExtender>                                            
                                            </td>                                    
                                        </tr> 
                                       
                                    </table>
                                </asp:panel>       
                            </td> 
	                    </tr>
	                    <tr>
	                        <td class="Controls">
	                        <div  style=" text-align:center;"> 
	                            <asp:Button ID="btnAceptarNuevoDoc" runat="server" Text="Aceptar" ToolTip="Aceptar"  
                                    CssClass="clsBtnAceptar" onclick="btnAceptarNuevoDoc_Click"  />
                                &nbsp;
                                <asp:Button ID="btnCancelarNuevoDoc" runat="server" Text="Cancelar" ToolTip="Cancelar"  
                                    CssClass="clsBtnCancelar"  />
                                
	                        </div>
	                        </td>	                        
	                    </tr>
                        </table>                       
	                    
	                </div>
	            </div>
            </asp:panel>
        </td>
    </tr>

</table>
</ContentTemplate>

</asp:UpdatePanel>

</asp:Content>
