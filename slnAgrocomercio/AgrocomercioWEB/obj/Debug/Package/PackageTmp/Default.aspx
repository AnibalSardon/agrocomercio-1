﻿<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="AgrocomercioWEB._Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<asp:UpdatePanel runat="server" ID="up1">  
                <ContentTemplate>  
    <h2>
        ASP.NET
    </h2>
    <p>
        Para obtener más información acerca de ASP.NET, visite <a href="http://www.asp.net" title="Sitio web de ASP.NET">www.asp.net</a>.
    </p>
    <p>
        También puede encontrar <a href="http://go.microsoft.com/fwlink/?LinkID=152368"
            title="Documentación de ASP.NET en MSDN">documentación sobre ASP.NET en MSDN</a>.
    </p>
    <asp:GridView ID="gvTipos" runat="server" DataKeyNames="AtrCodigo" 
        onselectedindexchanged="gvTipos_SelectedIndexChanged">
        <Columns>
            <asp:CommandField SelectText="[Editar]" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>

    <table>
    <tr>
        <td>Codigo</td>
        <td><asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="PrvNroDocRequired"
            runat="server" ControlToValidate="txtCodigo" 
            ErrorMessage="<b>El Ruc es Obligatorio.</b>" Display="None" >
        </asp:RequiredFieldValidator>
        <asp:ValidatorCalloutExtender runat="Server" ID="NReqE"  
            TargetControlID="PrvNroDocRequired"  
            HighlightCssClass="validatorCalloutHighlight" />  
        </td>
    </tr>
    <tr>
        <td>Descripcion</td>
        <td><asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Uso</td>
        <td><asp:TextBox ID="txtUso" runat="server"></asp:TextBox>


        </td>
    </tr>
    <tr>
        <td></td>
        <td> 
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" onclick="btnSubmit_Click" 
                 />
            <asp:Button ID="btnInsert" runat="server" Text="Insertar" 
                onclick="btnInsert_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="Eliminar" 
                onclick="btnDelete_Click" />             
            <asp:Button ID="btnSave" runat="server" Text="Guardar" 
                onclick="btnSave_Click" />

           
                    
                
        </td>
    </tr>
    </table>
    <table>
    <tr>
        <td>
              <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
<asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtCountry"
MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="1" CompletionInterval="1000" ServiceMethod="GetCountries" >
</asp:AutoCompleteExtender>
        </td>
    </tr>
    </table>
    </ContentTemplate>  
                <Triggers>  
                    <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click" />  
                </Triggers>  
            </asp:UpdatePanel>  

    
</asp:Content>
