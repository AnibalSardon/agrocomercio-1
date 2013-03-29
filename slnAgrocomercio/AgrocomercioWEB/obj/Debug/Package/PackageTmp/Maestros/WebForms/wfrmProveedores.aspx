<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfrmProveedores.aspx.cs" 
Inherits="AgrocomercioWEB.Maestros.WebForms.wfrmProveedores" Theme="TemaAgrocomercio" StylesheetTheme="TemaAgrocomercio" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <asp:UpdatePanel ID="UpdatePanel11" runat="server">
    <ContentTemplate>
    
            <table style="width: 645px; margin:0 auto;" >
            <tr>
                <td> <h2 class="clsTituloInterior">Administración de Proveedores</h2>
                </td>
            </tr>

            <tr>
            <td>
            <div id="pnlProveedores" visible="true" runat="server" 
                    style="background-color: #FFFFFF">
                <asp:GridView ID="gvwProveedores" runat="server" Width="648px" 
                    AutoGenerateColumns="False" 
                    DataKeyNames="prvCod" BackColor="White" 
                    onrowdatabound="gvwProveedores_RowDataBound"
                    OnRowCommand="gvwProveedores_RowCommand1" AllowPaging="True" 
                    onpageindexchanging="gvwProveedores_PageIndexChanging1">
                    <Columns>
                    <asp:TemplateField  ItemStyle-Font-Size="10pt">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnbSeleccionaProveedor" runat="server" 
                            CommandName="SeleccionaProveedor" 
                            CommandArgument='<%# Eval("prvCod") %>'>[Editar]</asp:LinkButton>
                        </ItemTemplate>                
                        <HeaderStyle Font-Size="10px" Width="8px" />
                        <ItemStyle Font-Size="8pt" Width="8px"  HorizontalAlign="Center"/>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnbEliminaProveedor" runat="server"
                            CommandName="EliminaProveedor" 
                            CommandArgument='<%#Eval("prvCod")%>'>[Eliminar]</asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Font-Size="10px" Width="8px" />
                        <ItemStyle Font-Size="8pt" Width="8px"  HorizontalAlign="Center"/>
                    </asp:TemplateField>
                        <asp:BoundField DataField="prvCod" HeaderText="#" InsertVisible="False" ReadOnly="True"
                            SortExpression="prvCodigo"  ItemStyle-Font-Size="10pt">
                            <ItemStyle Width="20px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="prvRazon" HeaderText="Nombre del Proveedor"
                            SortExpression="prvNombre" >
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
                    CssClass="clsBtnNuevo" onclick="btnNuevo_Click" ForeColor="Black" />
                
            </div>
            </td>
            </tr>
            <tr>
            <td>
                <asp:Panel id="pnlEditProveedores" runat="server" Visible="false" BackColor="White">
                
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
                            <asp:Label ID="Label3" runat="server" Text="Nombre del Proveedor :" 
                                ForeColor="Black" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNombre" runat="server" Width="250px" 
                                CssClass="clsFormTextMayusculas"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtNombre" Display="Dynamic" 
                                ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label2" runat="server" Text="Dirección :" 
                                ForeColor="Black" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDireccion" runat="server" Width="350px"
                             CssClass="clsFormTextMayusculas"></asp:TextBox>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label6" runat="server" Text="Num.RUC :" 
                                ForeColor="Black" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNumDoc" runat="server" Width="150px"></asp:TextBox>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label7" runat="server" Text="Fec.Registro :" 
                                ForeColor="Black" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFecRegistro" runat="server" Width="180px"></asp:TextBox>
                              <asp:CalendarExtender ID="txtFechaCompra_CalendarExtender" runat="server" 
                                    TargetControlID="txtFecRegistro" Format="yyyy-MM-dd"
                                    PopupButtonID="Image2" Enabled="True" >
                                </asp:CalendarExtender>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="clsFormEtiquetas">
                            <asp:Label ID="Label4" runat="server" Text="Teléfono :" 
                                ForeColor="Black" ></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTelefono" runat="server" Width="150px"></asp:TextBox>
                           
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
            
            <tr><td colspan="2">
                <asp:Label ID="lblMensajes" runat="server" CssClass="clsError"></asp:Label>
            </td></tr>

        </table>
</ContentTemplate>        
</asp:UpdatePanel>




</asp:Content>
