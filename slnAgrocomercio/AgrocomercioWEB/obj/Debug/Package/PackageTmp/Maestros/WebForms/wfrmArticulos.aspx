<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfrmArticulos.aspx.cs" 
Inherits="AgrocomercioWEB.Maestros.WebForms.wfrmArticulos" Theme="TemaAgrocomercio" StylesheetTheme="TemaAgrocomercio" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel11" runat="server">
    <ContentTemplate>
    
            <table style="width: 645px; margin:0 auto;" >
            <tr>
                <td> <h2 class="clsTituloInterior">Administración de Productos</h2>
                </td>
            </tr>
            <tr>
            <td class="clsCellDatos">
                <div id="pnlTipoProductos" visible="true" runat="server" 
                        style="background-color: #FFFFFF">
                       
                <asp:Panel ID="pnlBusqueda" runat="server">
                <table class=clsSubTituloInterior>
                    <tr>
                        <td class="clsPanelBusquedaTitulo">
                                <asp:Label ID="Label8" runat="server" Text="Ingrese el Nombre del Producto a Buscar:"></asp:Label>
                            </td>
                            <td rowspan="2" class="clsPanelBusquedaBotones">
                                <asp:ImageButton ID="imbBuscarEspecial" runat="server" Height="30px" 
                                    ImageUrl="~/iconos/img_buscar16.png" Width="30px" BorderColor="White" 
                                    BorderWidth="2px" ToolTip="Buscar Producto" 
                                    onclick="imbBuscarEspecial_Click" oninit="imbBuscarEspecial_Init"  />
                                    
                                    &nbsp;&nbsp;
                                    
                                    <asp:ImageButton ID="imbNuevoProducto" runat="server" Height="30px" 
                                    ImageUrl="~/iconos/img_adicionar8.png" Width="30px" BorderColor="White" 
                                    BorderWidth="2px" ToolTip="Nuevo Producto" 
                                    onclick="imbNuevoProducto_Click" oninit="imbNuevoProducto_Init" />
                            </tr>
                    <tr>
                        <td class="clsPanelBusquedaTitulo">
                                <asp:TextBox ID="txtBusqueda" runat="server" Width="370px" 
                                    CssClass="clsCellDatos"></asp:TextBox>
                            </td>
                    </tr>
                   
                </table>
                </asp:Panel>                       
                       
                       
                </div>
            </td>
            </tr>
            <tr>
            <td>
            <div id="pnlProductos" visible="true" runat="server" 
                    style="background-color: #FFFFFF">
                <asp:GridView ID="gvwProductos" runat="server" Width="648px" 
                    AutoGenerateColumns="False" 
                    DataKeyNames="artCod" BackColor="White" 
                    onrowdatabound="gvwProductos_RowDataBound"
                    OnRowCommand="gvwProducto_RowCommand" AllowPaging="True" 
                    onpageindexchanging="gvwProductos_PageIndexChanging" PageSize="15">
                    <Columns>
                    <asp:TemplateField  ItemStyle-Font-Size="10pt">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnbSeleccionaProducto" runat="server" 
                            CommandName="SeleccionaProducto" 
                            CommandArgument='<%# Eval("ArtCod") %>'>[Editar]</asp:LinkButton>
                        </ItemTemplate>                
                        <HeaderStyle Font-Size="10px" Width="8px" />
                        <ItemStyle Font-Size="8pt" Width="8px"  HorizontalAlign="Center"/>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnbEliminaProducto" runat="server"
                            CommandName="EliminaProducto" 
                            CommandArgument='<%#Eval("ArtCod")%>'>[Eliminar]</asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="10px" Width="8px" />
                        <ItemStyle Font-Size="8pt" Width="8px"  HorizontalAlign="Center"/>
                    </asp:TemplateField>
                        <asp:BoundField DataField="artCod" HeaderText="#" InsertVisible="False" ReadOnly="True"
                            SortExpression="artCod"  ItemStyle-Font-Size="10pt">
                            <ItemStyle Width="20px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="artDescripcion" HeaderText="Descripción del Producto"
                            SortExpression="ArtDescripcion" >
                            <ItemStyle Width="500px" Font-Size="10pt" />
                            <ControlStyle Width="500px" Font-Size="10pt"/>
                        </asp:BoundField>
                    </Columns>
                    <SelectedRowStyle BackColor="#CCCCCC" />
                    <HeaderStyle CssClass="clsBotones" />
                    <EditRowStyle Width="500px" />
                    <AlternatingRowStyle BackColor="#EEEEEE" />
                </asp:GridView>
                            <br />
                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" 
                    CssClass="clsBtnNuevo" onclick="btnNuevo_Click" ForeColor="Black" 
                    Visible="False" />
                
            </div>
            </td>
            </tr>
            <tr>
            <td>
                <asp:Panel id="pnlEditProductos" runat="server" Visible="false" BackColor="White">
                
                <table>
                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label1" runat="server" Text="Código :" 
                                ForeColor="Black" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCodigo" runat="server" Width="40px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label2" runat="server" Text="Descripción :" 
                                ForeColor="Black" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDescripcion" runat="server" Width="400px"
                             CssClass="clsFormTextMayusculas"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtDescripcion" Display="Dynamic" 
                                ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label10" runat="server" Text="Unidad Medida :" 
                                ForeColor="Black" ></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlUnidadMedida" runat="server" 
                                DataTextField="UniDescripcion" DataValueField="UniCod">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label3" runat="server" Text="Stock :" 
                                ForeColor="Black" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtStock" runat="server" Width="100px" 
                                CssClass="clsFormTextMayusculas"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtStock" Display="Dynamic" 
                                ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToValidate="txtStock" ErrorMessage="Ingrese un Stock Correcto" 
                                Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label4" runat="server" Text="Costo Promedio :" 
                                ForeColor="Black" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCostoPromedio" runat="server" Width="100px"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                ControlToValidate="txtCostoPromedio" 
                                ErrorMessage="Costo Promedio Ingrese un Monto" Operator="DataTypeCheck" 
                                Type="Double">*</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label6" runat="server" Text="Stock Máximo:" 
                                ForeColor="Black" Visible="False" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtStockMax" runat="server" Width="100px" Visible="False"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                ControlToValidate="txtStockMax" ErrorMessage="Ingrese Stock Máximo Correcto" 
                                Operator="DataTypeCheck" Type="Double" Visible="False">*</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label7" runat="server" Text="Stock Mínimo :" 
                                ForeColor="Black" Visible="False" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtStockMin" runat="server" Width="100px" Visible="False"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                ControlToValidate="txtStockMin" 
                                ErrorMessage="Ingrese un ´Stock Mínimo Correcto" Operator="DataTypeCheck" 
                                Type="Double" Visible="False">*</asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label9" runat="server" Text="Fec.Vencimiento :" 
                                ForeColor="Black" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFecVencimiento" runat="server" Width="150px"></asp:TextBox>
                              <asp:CalendarExtender ID="txtFechaCompra_CalendarExtender" runat="server" 
                                    TargetControlID="txtFecVencimiento" Format="yyyy-MM-dd"
                                    PopupButtonID="Image2" Enabled="True" >
                                </asp:CalendarExtender>
                        </td>
                    </tr>

                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label5" runat="server" Text="Estado :" 
                                ForeColor="Black" ></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkestado" runat="server" />
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label11" runat="server" Text="Laboratorio :" 
                                ForeColor="Black" ></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlProveedor" runat="server" Height="29px" Width="328px" 
                                DataTextField="prvRazon" DataValueField="prvCod">
                            </asp:DropDownList>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td style="text-align:center;">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" 
                                CssClass="clsBtnGuardar" onclick="btnGuardar_Click" ForeColor="Black" />
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
                                CssClass="clsBtnCancelar" onclick="btnCancelar_Click" 
                                ForeColor="Black" />
                        </td>
                    </tr>

                </table>
                
                
                </asp:Panel>
            </td>
            </tr>
            
            <tr><td>
                <asp:Label ID="lblMensajes" runat="server" CssClass="clsError"></asp:Label>
            </td></tr>

        </table>
    </ContentTemplate>
</asp:UpdatePanel>

</asp:Content>
