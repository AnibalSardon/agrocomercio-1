﻿using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Caching;
using System.Text;
using System.Linq;
using pryAgrocomercioBLL.EntityCollection;
using pryAgrocomercioDAL;
using System.Configuration;
using System.Globalization;
using System.Collections.Generic;
using System.Threading;

namespace AgrocomercioWEB.Ventas
{
    public partial class wfrmVentas : BasePage
    {
        public String _click = "";
        public String gcOpeTipo = "V";
        private Thread oThread;

#region PROPIEDADES FORMULARIO

        /// PROPIEDADES DE LA OPERACION
        public string cProceso
        {
            get { return lblProceso.Value; }
        }
        public long nOpeCod
        {
            get { return lblNroPedido.Text.Trim() == "" ? 0 : Convert.ToInt64(lblNroPedido.Text); }
        }
        public DateTime dOpeFecEmision
        {
            get { return DateTime.Parse(txtFecha.Text); }
        }
        public string cZonCod
        {
            get { return ddlZonas.SelectedValue; }
        }
        public int nOpeCliCod
        {
            get { return int.Parse(ddlClientes.SelectedValue); }
        }
        public string cOpeMoneda
        {
            get { return ddlMoneda.SelectedValue.Trim(); }
        }
        public string cOpeTipPago
        {
            get { return ddlTipoVenta.SelectedValue.Trim(); }
        }
        public int nOpeVendedor
        {
            get { return Convert.ToInt32( ddlVendedores.SelectedValue.Trim()); }
        }

        public Decimal nOpeSubTotal
        {
            get { return (Decimal)GetNumero(txtValorVenta.Text); }
            set { txtValorVenta.Text = SetFormatNum((double)value); }
        }
        public Decimal nOpeDscto
        {
            get { return (Decimal)GetNumero(txtDescuento.Text); }
            set { txtDescuento.Text = SetFormatNum((double)value); }
        }
        public Decimal nOpeImpuesto
        {
            get { return (Decimal)GetNumero(txtIgv.Text); }
            set { txtIgv.Text = SetFormatNum((double)value); }
        }
        public Decimal nOpeFlete
        {
            get { return (Decimal)GetNumero(txtFlete.Text); }
            set { txtFlete.Text = SetFormatNum((double)value); }
        }
        public Decimal nOpeTotal
        {
            get { return (Decimal)GetNumero(txtTotal.Text); }
            set { txtTotal.Text = SetFormatNum((double)value); }
        }
        public int ntcmCod
        {
            get { return lbltcmCod.Value == "" ? -1 : Convert.ToInt32(lbltcmCod.Value); }
        }
        public double nTipoCambioOri
        {
            get { return lblTipCambio.Value == "" ? 0.0 : Convert.ToDouble(lblTipCambio.Value); }
        }
        public double nTipoCambio
        {
            get { return txtTipCambio.Text == "" ? 0.0 : Convert.ToDouble(txtTipCambio.Text); }
        }

        /// PROPIEDADES DE LA DOCUMENTOS OPERACION
        public string cdopNroSerie
        {
            get { return lblNroDocumento.Text.Split('-')[0].Trim(); }
        }
        public string cdopNumero
        {
            get { return lblNroDocumento.Text.Split('-')[1].Trim(); }
        }
        public int ntdoCod
        {
            get { return int.Parse(lblTipoDoc.Value); }
        }
        public long ndopCod
        {
            get { return lbldopCod.Value.Trim() == "" ? 0 : Convert.ToInt64(lbldopCod.Value); }
        }
        



        /// PROPIEDADES DE CLIENTES
        public int nCliCod
        {
            get { return txtCliCod.Text.Trim() == "" ? 0 : Convert.ToInt32(txtCliCod.Text); }
        }
        public string cCliNumDoc
        {
            get { return txtNroDoc.Text.Trim(); }
        }
        public string cCliTipoDoc
        {
            get { return ddlTipDoc.SelectedValue; }
        }
        public string cCliTipoPer
        {
            get { return ddlTipoPer.SelectedValue; }
        }
        public string cCliNombre
        {
            get { return txtNombre.Text.Trim(); }
        }
        public string cCliDireccion
        {
            get { return txtCliDireccion.Text.Trim(); }
        }
        public string cCliRepresen
        {
            get { return txtRepresentante.Text.Trim(); }
        }
        public string cCliTelefono
        {
            get { return lblTelefono.Text.Trim(); }
        }
        public DateTime dCliFecRegis
        {
            get { return (txtFecRegis.Text == "" ? DateTime.Today : DateTime.Parse(txtFecRegis.Text)); }
        }

#endregion
        
#region FUNCIONES DEL FORMULARIO
        protected void Page_Load(object sender, EventArgs e)
        {
            int _selectedIndex = 0;
            String _selectedValue = "";

            if (Page.IsPostBack)
            {
                if (lblEstado.Value != "")
                {
                    switch (lblEstado.Value)
                    {
                        case ("DGVCOM_SIMPLECLICK"):
                            _selectedIndex = int.Parse(Request.Params["__EVENTARGUMENT"].ToString());

                            if (dgvDetalleVenta.Rows[_selectedIndex].Cells[2].Text.Trim() != "&nbsp;" && dgvDetalleVenta.Rows[_selectedIndex].Cells[2].Text.Trim() != "")
                            {
                                dgvDetalleVenta.SelectedIndex = _selectedIndex;
                                HabilitarBtn(btnEliminar, true);
                            }
                            else
                            {
                                dgvDetalleVenta.SelectedIndex = -1;
                                HabilitarBtn(btnEliminar, false);
                            }

                            break;
                        case ("DGVLIS_SIMPLECLICK"):
                            _selectedIndex = int.Parse(Request.Params["__EVENTARGUMENT"].ToString());

                            if (dgvListOperVentas.Rows[_selectedIndex].Cells[2].Text.Trim() != "&nbsp;" && dgvListOperVentas.Rows[_selectedIndex].Cells[2].Text.Trim() != "")
                            {
                                dgvListOperVentas.SelectedIndex = _selectedIndex;
                                HabilitarBtn(btnAnular, dgvListOperVentas.Rows[_selectedIndex].Cells[7].Text != "Cerrado");
                                HabilitarBtn(btnEditar, true);
                            }
                            else
                            {
                                dgvListOperVentas.SelectedIndex = -1;
                                HabilitarBtn(btnAnular, false);
                                HabilitarBtn(btnEditar, false);
                            }

                            break;
                        case ("DGVDOC_SIMPLECLICK"):
                            _selectedIndex = int.Parse(Request.Params["__EVENTARGUMENT"].ToString());

                            if (dgvDocumentos.Rows[_selectedIndex].Cells[2].Text.Trim() != "&nbsp;" && dgvDocumentos.Rows[_selectedIndex].Cells[2].Text.Trim() != "")
                            {
                                dgvDocumentos.SelectedIndex = _selectedIndex;
                                dgvDocumentos_SelectedIndexChanged(sender, e);
                            }
                            else
                            {
                                dgvDocumentos.SelectedIndex = -1;
                            }

                            break;
                        case ("ART_SELECT"):
                            _selectedValue = Request.Params["__EVENTARGUMENT"].ToString();
                            lsbArticulos.SelectedValue = _selectedValue;
                            lsbArticulos_SelectedIndexChanged(sender, e);
                            break;
                        case ("CLI_SELECT"):
                            _selectedValue = Request.Params["__EVENTARGUMENT"].ToString();
                            ddlClientes.SelectedValue = _selectedValue;
                            ddlClientes_SelectedIndexChanged(sender, e);
                            break;

                    }
                    lblEstado.Value = "";
                }
            }
            else
            {
                IniciarCampos();
            }

        }
        protected void dgvDetalleVenta_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            AddCLickToGridView(ref dgvDetalleVenta);            
        }
        protected void dgvListOperVentas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            AddCLickToGridView(ref dgvListOperVentas);            
        }
        protected void dgvDocumentos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            AddCLickToGridView(ref dgvDocumentos);
        }
        protected void dgvDocumentos_SelectedIndexChanged(object sender, EventArgs e)
        {
            long ndopCod = 0;
            if (lblOpeEstado.Value.Trim() == "R")
            {
                clsDocumenOperacion lstDocumenOpe = new clsDocumenOperacion();
                lstDocumenOpe.Guardar(this, ref ndopCod);
                lbldopCod.Value = ndopCod.ToString();
            }

            int nDopCod = int.Parse(dgvDocumentos.Rows[dgvDocumentos.SelectedIndex].Cells[1].Text);
            string cDopDescri = dgvDocumentos.Rows[dgvDocumentos.SelectedIndex].Cells[2].Text;

            CargarCamposDocumento(nDopCod, cDopDescri);
        }
        protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            int nCliCod = 0;
            nCliCod = int.Parse(ddlClientes.SelectedValue);

            if (nCliCod == 999)
            {
                txtCliente.Text = "";
                ModalPopupNuevoCli.Show();
                IniciarCamposCliente();
                btnNuevoCliente_Click(sender, e);
            }
            else if (nCliCod == 0)
            {
                txtDocCli.Text = "";
                txtDireccion.Text = "";
                txtTelefono.Text = "";
            }
            else
            {
                clsClientes lstClientes = new clsClientes();
                Clientes Cliente = new Clientes();

                Cliente = lstClientes.GetCliente(nCliCod);

                txtCliente.Text = Cliente.CliNombre.ToString();
                txtDocCli.Text = Cliente.CliNumDoc.ToString();
                txtDireccion.Text = Cliente.CliDireccion.ToString();
                txtTelefono.Text = Cliente.CliTelefono.ToString();

                lstClientes = null;
                Cliente = null;
            }
        }
        protected void ddlTransportistas_SelectedIndexChanged(object sender, EventArgs e)
        {
            int nTraCod = 0;
            nTraCod = int.Parse(ddlTransportistas.SelectedValue);

            ModalPopupGirarCompra.Show();
            if (nTraCod != 0)
            {
                clsTransportistas lstTransportistas = new clsTransportistas();
                Transportistas transportista = new Transportistas();

                transportista = lstTransportistas.GetTransportista(nTraCod);
                txtRucTrans.Text = transportista.TraRuc.ToString();

                lstTransportistas = null;
                transportista = null;
            }
        }
        protected void chkPorEstado_CheckedChanged(object sender, EventArgs e)
        {
            ddlEstados.Enabled = chkPorEstado.Checked;
            CargarListaOpeVenta(nNroDetPed);
        }
        protected void ddlEstados_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarListaOpeVenta(nNroDetPed);
        }
        protected void chkPorFecha_CheckedChanged(object sender, EventArgs e)
        {
            txtFecIni.Enabled = chkPorFecha.Checked;
            txtFecFin.Enabled = chkPorFecha.Checked;
            if (chkPorFecha.Checked)
            {
                txtFecIni.Text = DateTime.Today.ToString("yyyy-MM-dd");
                txtFecFin.Text = DateTime.Today.ToString("yyyy-MM-dd");
            }
            else
            {
                txtFecIni.Text = "";
                txtFecFin.Text = "";
            }
            CargarListaOpeVenta(nNroDetPed);
        }
        protected void txtFecIni_TextChanged(object sender, EventArgs e)
        {
            CargarListaOpeVenta(nNroDetPed);
        }
        protected void txtFecFin_TextChanged(object sender, EventArgs e)
        {
            CargarListaOpeVenta(nNroDetPed);
        }
        protected void ddlClienteFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarListaOpeVenta(nNroDetPed);
        }
        protected void chkPorCliente_CheckedChanged(object sender, EventArgs e)
        {
            ddlClienteFiltro.Enabled = chkPorCliente.Checked;
            CargarListaOpeVenta(nNroDetPed);
        }
        protected void ddlMoneda_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnTipCam.Visible = ddlMoneda.SelectedValue == "USD";
            CargarTipoCambio();
            CalcularPago(g_dtDetOperacion);
        }
        protected void txtTipCambio_TextChanged(object sender, EventArgs e)
        {
            g_nTipoCambio = double.Parse(txtTipCambio.Text);
            CalcularPago(g_dtDetOperacion);
        }
#endregion

#region FUNCIONES DE BOTONES FORMULARIO
        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            int nMainTipo = 0;
            try
            {
                clsDocumenOperacion lstDocumentos = new clsDocumenOperacion();

                if (((Button)sender).ToolTip == btnNuevo.ToolTip)
                {
                    HabilitarCampos(true);
                    CargarCombos();
                    CargarTransportistas();
                    CargarVendedores();
                    nMainTipo = 2;
                    lblProceso.Value = "NEW";
                    ddlTipoDocu.Enabled = true;                    
                }
                else
                {
                    txtNroDocu.Enabled = true;
                    txtNroSerie.Enabled = true;
                    nMainTipo = 3;
                    lblProceso.Value = "NEWDOC";
                    ddlTipoDocu.Enabled = true;
                }

                if (ddlTipoDocu.Items.Count > 1)
                {
                    if (ddlTipoDocu.Items.Count > nMainTipo - 1)
                        ddlTipoDocu.SelectedIndex = nMainTipo;
                    else
                        ddlTipoDocu.SelectedIndex = 0;

                    txtNroSerie.Text = lstDocumentos.MaxDopNroSerie(Convert.ToInt32(ddlTipoDocu.SelectedValue));
                    txtNroDocu.Focus();
                    HabilitarBtn(btnAgregar, true);
                    ModalPopupNuevoDocumento.Show();
                }
                else
                    MessageBox("No hay ningun Tipo de Documento registrado. Por favor registrar alguno antes de Comenzar.");

            }
            catch (Exception ex)
            {
                MessageBox("Error Interno: " + ex.Message);
            }

        }
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            oThread = new Thread(delegate() { Esperar(1000); });
            oThread.Start();

            clsOperaciones lstOperaciones = new clsOperaciones();
            clsDetOperacion lstDetOperacion = new clsDetOperacion();

            Operaciones Operacion = new Operaciones();
            DocumenOperacion DocumenOpe = new DocumenOperacion();
            DataTable dtDetOperacion;
            int nOpeCod = 0;
            int nDopCod = 0;
            string cDopDescri = "";

            try
            {
                HabilitarCampos(true);
                CargarCombos();
                CargarClientes();
                CargarTransportistas();
                CargarVendedores();

                txtDireccion.Enabled = false;
                txtDocCli.Enabled = false;
                txtTelefono.Enabled = false;

                nOpeCod = int.Parse(dgvListOperVentas.Rows[dgvListOperVentas.SelectedIndex].Cells[2].Text);

                SetPanelDocumento(nOpeCod);
                nDopCod = int.Parse(dgvDocumentos.Rows[0].Cells[1].Text);
                cDopDescri = dgvDocumentos.Rows[0].Cells[2].Text;

                CargarCamposOperacion(nOpeCod);
                CargarCamposDocumento(nDopCod, cDopDescri);
                ddlClientes_SelectedIndexChanged(sender, e);

                dtDetOperacion = lstDetOperacion.GetListDetOperacion(nOpeCod);
                g_dtDetOperacion = dtDetOperacion;
                RellenarGrilla(ref dgvDetalleVenta, dtDetOperacion, nNroDetPed);

                lblProceso.Value = lblOpeEstado.Value == "C" ? "CLOSE" : "EDIT";
                SetBotones(lblProceso.Value);

                GuardarDtCabeceraDocumento();
                oThread.Join();
               
            }
            catch (Exception ex)
            {
                oThread.Abort();
                MessageBox("Error Interno: " + ex.Message);
            }
            
        }
        protected void btnAnular_Click(object sender, EventArgs e)
        {
            oThread = new Thread(delegate() { Esperar(1000); });
            oThread.Start();

            clsOperaciones lstOperaciones = new clsOperaciones();
            int nOpeCod = 0;

            try
            {
                nOpeCod = int.Parse(dgvListOperVentas.Rows[dgvListOperVentas.SelectedIndex].Cells[2].Text);

                if (lstOperaciones.ValidarAnulacion(nOpeCod))
                {
                    lstOperaciones.Anular(nOpeCod);

                    CargarListaOpeVenta(nNroDetPed);
                    SetBotones("ANULAR");
                    oThread.Join();
                    MessageBox("La Operacion Fue Anulada Correctamente.");
                }
                else
                {
                    MessageBox("Esta vente no se puede ANULAR.");
                }
            }
            catch (Exception ex)
            {
                oThread.Abort();
                MessageBox("Error Interno: " + ex.Message);
            }
        }
        protected void btnSalir_Click(object sender, EventArgs e)
        {
            IniciarCampos();
            ddlMoneda.SelectedValue = "000";
            ddlTipoVenta.SelectedValue = "000";
            ddlTipoDocu.SelectedValue = "000";
            ddlClientes.SelectedValue = "000";
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string cMensaje = "";
            try
            {
                if (ValidarDatos("OPE", ref cMensaje))
                {
                    txtFleteTra.Text = Math.Round(GetNumero(txtSubTotal.Text) / 100, 2).ToString();
                    txtFlete.Text = SetFormatNum(Math.Round(GetNumero(txtSubTotal.Text) / 100, 2));

                    if (lblProceso.Value == "NEW")
                    {
                        clsOperaciones lstOperaciones = new clsOperaciones();
                        long nOpeCod = lstOperaciones.MaxOpeCod() + 1;
                        lblNroPedido.Text = nOpeCod.ToString().PadLeft(10, '0');
                        if (ddlTransportistas.Items.Count == 2)
                        {
                            ddlTransportistas.SelectedIndex = 1;
                            ddlTransportistas_SelectedIndexChanged(sender, e);
                        }
                        txtDesEspec.Text = "0.0";
                        ddlVendedores.SelectedValue = ddlListaVendedores.SelectedValue;
                        ddlVendedores.Enabled = false;

                        ModalPopupGirarCompra.Show();               

                    }
                    else if (lblProceso.Value == "EDIT")
                    {
                        btnGuardarDocu_Click(sender, e);
                    }
                }
                else
                {
                    MessageBox(cMensaje);
                }
            }
            catch (Exception ex)
            {
                MessageBox("Error Interno: " + ex.Message);
            }
        }
        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            string cMensaje = "";
            clsOperaciones lstOperaciones = new clsOperaciones();

            long ndopCod = 0;
            int ntcmCod = 0;
            try
            {
                if (ValidarDatos("OPE", ref cMensaje))
                {
                    if (lblProceso.Value == "NEW")
                    {
                        txtFleteTra.Text = Math.Round(GetNumero(txtSubTotal.Text) / 100, 2).ToString();
                        txtFlete.Text = SetFormatNum(Math.Round(GetNumero(txtSubTotal.Text) / 100, 2));
                        long nOpeCod = lstOperaciones.MaxOpeCod() + 1;
                        lblNroPedido.Text = nOpeCod.ToString().PadLeft(10, '0');                        
                        txtDesEspec.Text = "0.0";
                    }

                    lstOperaciones.Procesar(this, gcOpeTipo, ref ndopCod, ref ntcmCod);
                    lbldopCod.Value = ndopCod.ToString();
                    lbltcmCod.Value = ntcmCod.ToString();
                    lblOpeEstado.Value = "P";

                    GuardarDtCabeceraDocumento();
                    MessageBox("La Operacion fue Procesada con Exito, Ahora puede imprimir.");
                    lblProceso.Value = "EDIT";
                    SetBotones(lblProceso.Value);


                }
                else
                {
                    MessageBox(cMensaje);
                }
            }
            catch (Exception ex)
            {
                MessageBox("Error Interno: " + ex.Message);
            }
           
        }
        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            string cMensaje = "";
            clsOperaciones lstOperaciones = new clsOperaciones();

            try
            {
                if (ValidarDatos("OPE", ref cMensaje))
                {
                    lstOperaciones.Cerrar(this);
                    lblOpeEstado.Value = "C";

                    GuardarDtCabeceraDocumento();
                    MessageBox("La Operacion fue Cerrada.");
                    lblProceso.Value = "CLOSE";
                    SetBotones(lblProceso.Value);
                }
                else
                {
                    MessageBox(cMensaje);
                }
            }
            catch (Exception ex)
            {
                MessageBox("Error Interno: " + ex.Message);
            }

        }
        protected void btnImprimir_Click(object sender, EventArgs e)
        {
            clsDocumenOperacion lstDocumenOpe = new clsDocumenOperacion();
            int nDopCod = 0;
            try
            {
                nDopCod = int.Parse(lbldopCod.Value);
                lstDocumenOpe.ActualizarImpresion(nDopCod);
            }
            catch (Exception ex)
            {
                MessageBox(ex.Message);
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            IniciarCamposArticulos();
            if (lsbArticulos.Items.Count > 0 && lsbArticulos.Items[0].Value != "0")
            {
                ModalPopupAgregar.Show();
            }
            else
                MessageBox("Por Favor Primero debe Registrar articulos antes de Continuar!");   

        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string ArtCod = dgvDetalleVenta.Rows[dgvDetalleVenta.SelectedIndex].Cells[2].Text;

            DataTable dtDetalleCompra;
            try
            {
                dtDetalleCompra = g_dtDetOperacion;
                if (dtDetalleCompra.Rows.Count > 0)
                {
                    for (int i = 0; i < dtDetalleCompra.Rows.Count; i++)
                    {
                        if (dtDetalleCompra.Rows[i]["ArtCod"].ToString() == ArtCod.ToString())
                        {
                            dtDetalleCompra.Rows.Remove(dtDetalleCompra.Rows[i]);
                        }
                    }
                }
                g_dtDetOperacion = dtDetalleCompra;
                CalcularPago(dtDetalleCompra);
                RellenarGrilla(ref dgvDetalleVenta, dtDetalleCompra, this.nNroDetPed);
                dgvDetalleVenta.SelectedIndex = -1;
                HabilitarBtn(btnEliminar, false);
            }
            catch (Exception ex)
            {
                MessageBox(ex.Message);
            }
        }
        protected void btnAceptarNuevoDoc_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtNroDocu.Text != "")
                {
                    lblTipoDoc.Value = ddlTipoDocu.SelectedValue;
                    lblDescriDocumento.Text = ddlTipoDocu.SelectedItem.Text;
                    lblNroDocumento.Text = txtNroSerie.Text + " - " + txtNroDocu.Text;

                    if (lblProceso.Value == "NEW")
                    {
                        HabilitarCampos(true);
                        g_dtDetOperacion.Rows.Clear();
                        RellenarGrilla(ref dgvDetalleVenta, g_dtDetOperacion, this.nNroDetPed);
                        CargarCombos();
                        CargarClientes();

                        txtDireccion.Enabled = false;
                        txtDocCli.Enabled = false;
                        txtTelefono.Enabled = false;

                        txtSubTotal.Text = "0.00";
                        txtDescuento.Text = "0.00";
                        txtFlete.Text = "0.00";
                        txtIgv.Text = "0.00";
                        txtTotal.Text = "0.00";

                        txtFecha.Text = DateTime.Today.ToString("yyyy-MM-dd");
                        SetBotones(lblProceso.Value);

                    }
                    else if (lblProceso.Value == "NEWDOC")
                    {
                        clsDocumenOperacion lstDocumenOpe = new clsDocumenOperacion();

                        long ndopCod = 0;
                        int OpeCod = int.Parse(lblNroPedido.Text);

                        lstDocumenOpe.Guardar(this, ref ndopCod);
                        lbldopCod.Value = ndopCod.ToString();

                        SetPanelDocumento(OpeCod);
                        lblProceso.Value = "EDIT";                        
                    }
                    
                }
                else
                {
                    MessageBox("Debe poner un Numero de Documento");
                }
            }
            catch (Exception ex)
            {
                MessageBox("Error Interno: " + ex.Message);
            }
        }
        protected void btnGuardarDocu_Click(object sender, EventArgs e)
        {
            oThread = new Thread(delegate() { Esperar(1000); });
            oThread.Start();

            long ndopCod = 0;
            int ntcmCod = 0;
            clsOperaciones lstOperaciones = new clsOperaciones();
            try
            {
                txtDescuento.Text = txtDesEspec.Text;
                lstOperaciones.Guardar(this, gcOpeTipo, ref ndopCod, ref ntcmCod);  //GUARDAR OPERACION    
                lbldopCod.Value = ndopCod.ToString();
                lbltcmCod.Value = ntcmCod.ToString();

                HabilitarBtn(btnProcesar, true);
                oThread.Join();
                if (sender != btnProcesar)
                {
                    MessageBox("La Operacion de Venta se Guardo con Exito ");
                }

                lblProceso.Value = "EDIT";
                SetPanelDocumento((int)nOpeCod);
                pnDocumentos.Visible = true;

            }
            catch (Exception ex)
            {
                oThread.Abort();
                MessageBox("Error Interno: " + ex.Message);
            }
        }
#endregion

#region FUNCIONES DE CARGA DE LISTAS DE DATOS
        public void CargarCombos()
        {
            clsAtributos Atributos = new clsAtributos();

            //Cargamos combo de Monedas
            ddlMoneda.DataSource = Atributos.ListAtributos(1);
            ddlMoneda.DataBind();
            ddlMoneda.SelectedValue = "PEN";
            ddlMoneda.Items.Insert(0, new ListItem("", "000"));

            //Cargamos combo de Tipo de Venta
            ddlTipoVenta.DataSource = Atributos.ListAtributos(2);
            ddlTipoVenta.DataBind();
            ddlTipoVenta.Items.Insert(0, new ListItem("", "000"));

            //Cargamos combo de Tipo de Documento
            ddlTipoDocu.DataSource = Atributos.ListAtributos(3);
            ddlTipoDocu.DataBind();
            ddlTipoDocu.Items.Insert(0, new ListItem("", "000"));

            //Cargamos combo de Zonas
            ddlZonas.DataSource = Atributos.ListAtributos(4);
            ddlZonas.DataBind();

            lblTasIGV.Value = ((List<Atributos>)Atributos.ListAtributos(7)).FirstOrDefault().AtrDescripcion;

            CargarTipoCambio();
            Atributos = null;
        }
        public void CargarClientes()
        {
            clsClientes lstClientes = new clsClientes();

            ddlClientes.DataSource = lstClientes.GetAll();
            ddlClientes.DataBind();
            ddlClientes.Items.Add(new ListItem("[NUEVO CLIENTE]", "999"));
            ddlClientes.Items.Insert(0, new ListItem("", "000"));

            ddlClienteFiltro.DataSource = lstClientes.GetAll();
            ddlClienteFiltro.DataBind();            

            lstClientes = null;
        }
        public void CargarTransportistas()
        {
            clsTransportistas lstTransportistas = new clsTransportistas();

            ddlTransportistas.DataSource = lstTransportistas.GetAll();
            ddlTransportistas.DataBind();
            if (ddlTransportistas.Items.Count == 0)
                ddlTransportistas.Items.Insert(0, new ListItem("Sin Transportistas", "000"));

            lstTransportistas = null;
        }
        public void CargarVendedores()
        {
            Usuarios objUsuario = (Usuarios)(LeerVariableSesion("oUsuario"));
            clsPersonal lstPersonal = new clsPersonal();
            var lstVendedores = lstPersonal.GetPersonalPorTipo(2);

            ddlVendedores.DataSource = lstVendedores;
            ddlVendedores.DataBind();

            ddlListaVendedores.DataSource = lstVendedores;
            ddlListaVendedores.DataBind();

            if (ddlVendedores.Items.Count == 0)
                ddlVendedores.Items.Insert(0, new ListItem("Sin Vendedores", "000"));

            if (ddlListaVendedores.Items.Count == 0)
            {
                ddlListaVendedores.Enabled = false;
                ddlListaVendedores.Items.Insert(0, new ListItem("Sin Vendedores", "000"));
            }

            if (objUsuario != null)
                ddlListaVendedores.Enabled = (objUsuario.Roles.rolDescripcion != "Vendedor");
            else
                ddlListaVendedores.Enabled = true;

            lstPersonal = null;
        }
        public void CargarTipoCambio()
        {
            clsTipoCambios oTipCamp = new clsTipoCambios();

            var oTip = oTipCamp.GetLastTipoCambio(ddlMoneda.SelectedValue);
            if (oTip != null)
            {
                lbltcmCod.Value = oTip.tcmCod.ToString();
                lblTipCambio.Value = oTip.tcmCambio.ToString();
                txtTipCambio.Text = lblTipCambio.Value;
                g_nTipoCambio = double.Parse(lblTipCambio.Value);
            }
            else
            {
                lbltcmCod.Value = "-1";
                lblTipCambio.Value = "0.0";
                txtTipCambio.Text = "0.0";
                g_nTipoCambio = 0.0;
                MessageBox("Debe Ingresar un Tipo de Cambio.");
                txtTipCambio.Focus();
            }

        }  
        protected void CargarListaOpeVenta(int _nNroReg)
        {
            clsOperaciones lstOperaciones = new clsOperaciones();
            DataTable dtOpeVenta;
            string cEstado = "";
            int nCliCod = 0;
            DateTime dFecIni = DateTime.Today;
            DateTime dFecFin = DateTime.Today;

            try
            {
                if (chkPorEstado.Checked)
                    cEstado = ddlEstados.SelectedValue;

                if (chkPorFecha.Checked)
                {
                    dFecIni = DateTime.Parse(txtFecIni.Text);
                    dFecFin = DateTime.Parse(txtFecFin.Text);
                }

                if (chkPorCliente.Checked)
                    nCliCod = int.Parse(ddlClienteFiltro.SelectedValue);

                dtOpeVenta = lstOperaciones.GetListOperaciones(gcOpeTipo, chkPorFecha.Checked, dFecIni, dFecFin, cEstado, 0, nCliCod);

                if (dtOpeVenta.Rows.Count == 0)
                    dtOpeVenta = CreatDTListaOpeVenta();

                RellenarGrilla(ref dgvListOperVentas, dtOpeVenta, _nNroReg);
            }
            catch (Exception ex)
            {
                MessageBox("Error Interno: " + ex.Message);
            }
            lstOperaciones = null;

        }
#endregion

#region FUNCIONES GENERALES
        private void IniciarCampos()
        {
            HabilitarCampos(false);

            SetBotones("INI");

            txtSubTotal.Text = "0.00";
            txtDescuento.Text = "0.00";
            txtFlete.Text = "0.00";
            txtValorVenta.Text = "0.00";
            txtIgv.Text = "0.00";
            txtTotal.Text = "0.00";
            lblDescuentoEsp.Value = "0.00";
            txtFecIni.Text = "";
            txtFecFin.Text = "";

            txtDireccion.Text = "";
            txtTelefono.Text = "";
            txtDocCli.Text = "";
            txtNroDocu.Text = "";
            txtFecha.Text = "";
            txtDireccion.Enabled = false;
            txtDocCli.Enabled = false;
            txtTelefono.Enabled = false;
            txtFecIni.Enabled = false;
            txtFecFin.Enabled = false;
            ddlEstados.Enabled = false;
            ddlClienteFiltro.Enabled = false;

            lblProceso.Value = "";
            lblEstado.Value = "";
            txtTipCambio.Attributes.Add("onFocus", "JavaScript:this.select();");

            CargarListaOpeVenta(nNroDetPed);
            CargarEstados(ref ddlEstados);
            CargarClientes();
            ddlEstados.SelectedValue = "R";
        }
        private void HabilitarCampos(Boolean Value)
        {
            ddlTipoDocu.Enabled = Value;
            txtNroDocu.Enabled = Value;
            ddlClientes.Enabled = Value;
            txtDireccion.Enabled = Value;
            txtDocCli.Enabled = Value;
            txtTelefono.Enabled = Value;
            ddlMoneda.Enabled = Value;
            ddlTipoVenta.Enabled = Value;
            txtFecha.Enabled = Value;
            txtCliente.Enabled = Value;
            ddlListaVendedores.Enabled = Value;
        }
        private void SetBotones(string pcTipo)
        {
            switch (pcTipo)
            {
                case ("INI"):
                    btnNuevo.Visible = true;
                    btnSalir.Visible = true;
                    btnEditar.Visible = true;
                    btnAnular.Visible = true;
                    btnAgregar.Visible = false;
                    btnImprimir.Visible = false;
                    btnGuardar.Visible = false;
                    btnProcesar.Visible = false;
                    btnCerrar.Visible = false;
                    HabilitarBtn(btnNuevo, true);
                    HabilitarBtn(btnSalir, false);
                    HabilitarBtn(btnAnular, false);
                    HabilitarBtn(btnEditar, false);
                    pnListOperVentas.Visible = true;
                    pnResultadoOper.Visible = false;
                    pnDocVenta.Visible = false;
                    pnDocumentos.Visible = false;
                    pnMenuArticulos.Visible = false;
                    pnTipCam.Visible = false;
                    break;
                case ("NEW"):
                    btnNuevo.Visible = false;
                    btnGuardar.Visible = true;
                    btnEditar.Visible = false;
                    btnAnular.Visible = false;
                    btnAgregar.Visible = true;
                    btnProcesar.Visible = true;
                    btnImprimir.Visible = true;
                    btnCerrar.Visible = false;

                    HabilitarBtn(btnSalir, true);
                    HabilitarBtn(btnImprimir, false);
                    HabilitarBtn(btnGuardar, false);
                    HabilitarBtn(btnProcesar, false);
                    HabilitarBtn(btnEliminar, false);

                    pnListOperVentas.Visible = false;
                    pnResultadoOper.Visible = true;
                    pnDocVenta.Visible = true;
                    pnMenuArticulos.Visible = true;
                    pnDocumentos.Visible = false;
                    pnTipCam.Visible = false;
                    break;
                case ("EDIT"):
                    btnNuevo.Visible = false;
                    btnGuardar.Visible = true;
                    btnEditar.Visible = false;
                    btnAnular.Visible = false;
                    btnAgregar.Visible = true;
                    btnProcesar.Visible = true;
                    btnImprimir.Visible = true;

                    if (lblOpeEstado.Value.Trim() == "R")
                    {
                        HabilitarBtn(btnSalir, true);
                        HabilitarBtn(btnImprimir, false);
                        HabilitarBtn(btnGuardar, true);
                        HabilitarBtn(btnProcesar, true);
                        HabilitarBtn(btnEliminar, false);
                        pnMenuArticulos.Visible = true;
                    }
                    else if (lblOpeEstado.Value.Trim() == "P")
                    {
                        btnCerrar.Visible = true;
                        btnProcesar.Visible = false;
                        HabilitarCampos(false);
                        HabilitarBtn(btnSalir, true);
                        HabilitarBtn(btnImprimir, true);
                        HabilitarBtn(btnGuardar, false);
                        HabilitarBtn(btnProcesar, false);
                        HabilitarBtn(btnEliminar, false);
                        HabilitarBtn(btnAgregar, false);
                        HabilitarBtn(btnCerrar, ddlTipoVenta.SelectedValue == "CO");
                        pnMenuArticulos.Visible = false;
                    }
                    pnListOperVentas.Visible = false;
                    pnResultadoOper.Visible = true;
                    pnDocVenta.Visible = true;
                    pnDocumentos.Visible = true;
                    pnTipCam.Visible = (ddlMoneda.SelectedValue == "USD");
                    break;
                case ("ANULAR"):
                    HabilitarBtn(btnEditar, false);
                    HabilitarBtn(btnAnular, false);
                    break;
                case ("CLOSE"):
                    btnNuevo.Visible = false;
                    btnGuardar.Visible = true;
                    btnEditar.Visible = false;
                    btnAnular.Visible = false;
                    btnAgregar.Visible = true;
                    btnImprimir.Visible = true;
                    btnCerrar.Visible = true;
                    btnProcesar.Visible = false;
                    HabilitarCampos(false);
                    HabilitarBtn(btnSalir, true);
                    HabilitarBtn(btnImprimir, true);
                    HabilitarBtn(btnGuardar, false);
                    HabilitarBtn(btnProcesar, false);
                    HabilitarBtn(btnEliminar, false);
                    HabilitarBtn(btnAgregar, false);
                    HabilitarBtn(btnNuevoDocumento, false);
                    HabilitarBtn(btnCerrar, false);
                    pnMenuArticulos.Visible = false;
                    pnListOperVentas.Visible = false;
                    pnResultadoOper.Visible = true;
                    pnDocVenta.Visible = true;
                    pnDocumentos.Visible = true;
                    pnTipCam.Visible = (ddlMoneda.SelectedValue == "USD");
                    break;

            }
        }
        protected DataTable CreatDTCabeceraVenta()
        {
            DataTable dtResult = new DataTable();
            dtResult.Columns.Add(new DataColumn("cRazonSocial", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cDireccion", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cTelefono", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cNroGuia", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cNroPedido", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cRuc", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cFormaPago", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cAnio", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cMes", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cDia", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cValorVenta", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cFlete", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cIGV", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cTotal", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cTotalSinFlete", typeof(String)));
            dtResult.Columns.Add(new DataColumn("cTotalLetras", typeof(String)));
            dtResult.Columns.Add(new DataColumn("Destinatario", typeof(String)));
            dtResult.Columns.Add(new DataColumn("PLlegada", typeof(String)));
            dtResult.Columns.Add(new DataColumn("NroFactura", typeof(String)));
            dtResult.Columns.Add(new DataColumn("Unidad", typeof(String)));

            return dtResult;
        }
        protected DataTable CreatDTListaOpeVenta()
        {
            DataTable dtResult = new DataTable();
            dtResult.Columns.Add(new DataColumn("OpeCod", typeof(int)));
            dtResult.Columns.Add(new DataColumn("CliNombre", typeof(String)));
            dtResult.Columns.Add(new DataColumn("OpeMoneda", typeof(String)));
            dtResult.Columns.Add(new DataColumn("OpeTotal", typeof(Double)));
            dtResult.Columns.Add(new DataColumn("OpeFecEmision", typeof(DateTime)));
            dtResult.Columns.Add(new DataColumn("OpeEstado", typeof(String)));
            dtResult.Columns.Add(new DataColumn("AtrDescripcion", typeof(String)));
            return dtResult;
        }
        protected void GuardarDtCabeceraDocumento()
        {
            DocumenOperacion DocumenOpe = new DocumenOperacion();
            clsDocumenOperacion lstDocumenOpe = new clsDocumenOperacion();
            DataTable dtCabeceraOperacion = CreatDTCabeceraVenta();

            int OpeCod = int.Parse(lblNroPedido.Text);
            string NroGuia = "";
            string NroPedido = "";

            DocumenOpe = lstDocumenOpe.GetDocumenOperacion(OpeCod, 2);
            if (DocumenOpe != null)
            {
                NroGuia = DocumenOpe.dopNroSerie.ToString() + " - " + DocumenOpe.dopNumero.ToString();
            }
            DocumenOpe = lstDocumenOpe.GetDocumenOperacion(OpeCod, 4);
            if (DocumenOpe != null)
            {
                NroPedido = DocumenOpe.dopNroSerie.ToString() + " - " + DocumenOpe.dopNumero.ToString();
            }

            
            DataRow newRow = dtCabeceraOperacion.NewRow();
            newRow["cRazonSocial"] = ddlClientes.SelectedItem.Text;
            newRow["cDireccion"] = txtDireccion.Text;
            newRow["cTelefono"] = txtTelefono.Text;
            newRow["cNroGuia"] = NroGuia;
            newRow["cNroPedido"] = NroPedido;
            newRow["cRuc"] = txtDocCli.Text;
            newRow["cFormaPago"] = ddlTipoVenta.SelectedItem.Text;
            newRow["cAnio"] = DateTime.Parse(txtFecha.Text).Year.ToString();
            newRow["cMes"] = DateTime.Parse(txtFecha.Text).Month.ToString();
            newRow["cDia"] = DateTime.Parse(txtFecha.Text).Day.ToString();
            newRow["cValorVenta"] = SetFormatNum(GetNumero(txtValorVenta.Text) -GetNumero(txtDescuento.Text));
            newRow["cFlete"] = txtFlete.Text;
            newRow["cIGV"] = txtIgv.Text;
            newRow["cTotal"] = txtTotal.Text;
            newRow["cTotalSinFlete"] = SetFormatNum(GetNumero(newRow["cValorVenta"].ToString()) * (nTasIGV+1));
            newRow["cTotalLetras"] = ConvertiraLetras(decimal.Parse((txtTotal.Text.Replace("S/.", "").Trim()).Replace("$", "").Trim()));
            newRow["Destinatario"] = "";
            newRow["PLlegada"] = "";
            newRow["NroFactura"] = "";
            newRow["Unidad"] = "";

            dtCabeceraOperacion.Rows.Add(newRow);
            AgregarVariableSession("dtCabeceraOperacion", dtCabeceraOperacion);

        }
        protected void CalcularPago(DataTable dtDetVenta)
        {
            double lnPrecioCompra = 0, lnDescuento = 0, lnSubTotal = 0, lnIgv = 0, lnCostoTotal = 0;

            if (txtFleteTra.Text.Trim() == "")
                txtFleteTra.Text = "0.0";

            if (txtDesEspec.Text.Trim() == "")
                txtDesEspec.Text = "0.0";            

            nTasIGV = double.Parse(lblTasIGV.Value);
            CalcularTotales(dtDetVenta, gcOpeTipo, Double.Parse(txtFleteTra.Text), nTasIGV, Double.Parse(txtFleteTra.Text), 
                ref lnPrecioCompra, ref lnDescuento, ref lnSubTotal, ref lnIgv, ref lnCostoTotal);

            nOpeSubTotal = (Decimal)lnPrecioCompra;
            nOpeDscto = (Decimal)lnDescuento;
            nOpeImpuesto = (Decimal)lnIgv;
            txtSubTotal.Text = SetFormatNum(lnSubTotal);
            nOpeFlete = Decimal.Parse(txtFleteTra.Text);
            nOpeTotal = (Decimal)lnCostoTotal;

            Boolean bValue = dtDetVenta.Rows.Count > 0;

            HabilitarBtn(btnGuardar, bValue);
            HabilitarBtn(btnProcesar, bValue); 

        }
        private Boolean ValidarDatos(string cTipo, ref string cMensaje)
        {
            Boolean bRes = true;

            switch (cTipo)
            {
                case "ART":
                    if (lsbArticulos.Items.Count == 1 && lsbArticulos.Items[0].Value == "0")
                    {
                        cMensaje = "Por favor Debe Registrar Algun articulo antes de Continuar.";
                        lsbArticulos.Focus();
                        return false;
                    }
                    if (lsbArticulos.SelectedIndex < 0)
                    {
                        cMensaje = "Debe Escoger un Articulo.";
                        lsbArticulos.Focus();
                        return false;
                    }
                    if (double.Parse(txtStockFis.Text) <= 0)
                    {
                        cMensaje = "Este Articulo se encuentra SIN STOCK.";
                        txtArtPreUnitario.Focus();
                        return false;
                    }
                    if (double.Parse(txtArtCant.Text) <= 0)
                    {
                        cMensaje = "La Cantidad a Vender debe se mayor a 0.";
                        txtArtPreUnitario.Focus();
                        return false;
                    }
                    if (double.Parse(txtArtCant.Text) > double.Parse(txtStockFis.Text))
                    {
                        cMensaje = "No puede Vender esta Cantidad ya que sobrepasa el STOCK.";
                        txtArtPreUnitario.Focus();
                        return false;
                    }
                    if (txtArtPreUnitario.Text.Trim() == "")
                    {
                        cMensaje = "Debe Ingresar un Precio de Venta para el Articulo.";
                        txtArtPreUnitario.Focus();
                        return false;
                    }
                    if (double.Parse(txtArtPreUnitario.Text) <= 0)
                    {
                        cMensaje = "Debe Ingresar un Precio de Venta para el Articulo.";
                        txtArtPreUnitario.Focus();
                        return false;
                    }
                    if (double.Parse(txtArtDescuento.Text) > 100)
                    {
                        cMensaje = "El Descuento no Puede superar el 100%.";
                        txtArtDescuento.Focus();
                        return false;
                    }
                    if (double.Parse(txtStockFis.Text) != double.Parse(hideStockLote.Value))
                    {
                        cMensaje = "El Stock Fisico (" + txtStockFis.Text + ") y el Stock de Lotes (" + hideStockLote.Value + ") son Diferentes, Primero debe Ajustar Estas diferencias para Continuar.";
                        txtStockFis.Focus();
                        return false;
                    }
                    if (txtLotVenci.Text.Trim() == string.Empty)
                    {
                        cMensaje = "Debe Ingresar una Fecha de Vencimiento.";
                        txtLotVenci.Focus();
                        return false;
                    }
                    break;
                case "OPE":
                    if ((ddlMoneda.Items.Count == 1 && ddlMoneda.Items[0].Value == "000") ||
                    (ddlTipoVenta.Items.Count == 1 && ddlTipoVenta.Items[0].Value == "000") ||
                    (ddlVendedores.Items.Count == 1 && ddlVendedores.Items[0].Value == "000") ||
                    (ddlZonas.Items.Count == 0))
                    {
                        MessageBox("Por favor Registrar los tipos de Moneda, Tipo de Zonas, Tipo de Pago y Un Vendedores antes de Continuar. ");
                        return false;
                    }
                    if (ddlClientes.SelectedValue == "000")
                    {
                        cMensaje = "Debe Escoger un Cliente";
                        ddlClientes.Focus();
                        return false;
                    }
                    if (ddlMoneda.SelectedValue == "000")
                    {
                        cMensaje = "Debe Escoger la Moneda";
                        ddlMoneda.Focus();
                        return false;
                    }
                    if (ddlTipoVenta.SelectedValue == "000")
                    {
                        cMensaje = "Debe Escoger el Tipo de Pago";
                        ddlTipoVenta.Focus();
                        return false;
                    }
                    break;
                default:
                    break;
            }


            return bRes;
        }
        private void CargarCamposOperacion(int _OpeCod)
        {
            clsOperaciones lstOperaciones = new clsOperaciones();
            Operaciones Operacion = new Operaciones();

            try
            {
                Operacion = lstOperaciones.GetOperacion(_OpeCod);

                //DATOS DE LA NUEVA OPERACION
                lbltcmCod.Value = Operacion.tcmCod.ToString();
                lblTipCambio.Value = Operacion.TipoCambios.tcmCambio.ToString();
                txtTipCambio.Text = lblTipCambio.Value;
                g_nTipoCambio = (Double)Operacion.TipoCambios.tcmCambio;

                lblNroPedido.Text = Operacion.OpeCod.ToString();
                txtFecha.Text = ((DateTime)Operacion.OpeFecEmision).ToString("yyyy-MM-dd");
                ddlZonas.SelectedValue = Operacion.ZonCod.ToString().Trim();
                if (Operacion.PerCod != null)
                {
                    ddlVendedores.SelectedValue = Operacion.PerCod.ToString();
                    ddlListaVendedores.SelectedValue = Operacion.PerCod.ToString();
                }
                if (Operacion.TraCod != null)
                    ddlTransportistas.SelectedValue = Operacion.TraCod.ToString();
                ddlClientes.SelectedValue = Operacion.CliCod.ToString();
                ddlMoneda.SelectedValue = Operacion.OpeMoneda.ToString().Trim();
                ddlTipoVenta.SelectedValue = Operacion.OpeTipPago.ToString().Trim();
                txtValorVenta.Text = SetFormatNum((double)Operacion.OpeSubTotal); 
                txtDescuento.Text = SetFormatNum((double)Operacion.OpeDscto);
                txtFlete.Text = SetFormatNum((double)Operacion.OpeFlete);
                txtSubTotal.Text = SetFormatNum((double)(Operacion.OpeTotal - Operacion.OpeImpuesto));
                txtIgv.Text = SetFormatNum((double)Operacion.OpeImpuesto);
                txtTotal.Text = SetFormatNum((double)Operacion.OpeTotal);
                lblOpeEstado.Value = Operacion.OpeEstado.ToString();
                txtDesEspec.Text = SetFormatNum(0.0);


            }
            catch (Exception ex)
            {
                MessageBox("Error Interno: " + ex.Message);
            }
        }
        private void CargarCamposDocumento(int _dopCod, string cDopDescri)
        {
            clsDocumenOperacion lstDocumenOpe = new clsDocumenOperacion();
            DocumenOperacion DocumenOpe = new DocumenOperacion();

            try
            {
                DocumenOpe = lstDocumenOpe.GetDocumenOperacion(_dopCod);

                lblTipoDoc.Value = ddlTipoDocu.SelectedValue;
                lblDescriDocumento.Text = cDopDescri;

                lblTipoDoc.Value = DocumenOpe.tdoCod.ToString();
                lbldopCod.Value = DocumenOpe.dopCod.ToString();
                lblNroDocumento.Text = DocumenOpe.dopNroSerie.ToString() + " - " + DocumenOpe.dopNumero.ToString();
                txtFecha.Text = ((DateTime)DocumenOpe.dopFecEmision).ToString("yyyy-MM-dd");
                
                switch (lblTipoDoc.Value)
                {
                    case "2":
                        btnImprimir.OnClientClick = "AbrirVentanaGuia()";
                        break;
                    case "4":
                        btnImprimir.OnClientClick = "AbrirVentanaNota()";
                        break;
                    case "5":
                        btnImprimir.OnClientClick = "AbrirVentanaBoleta()";
                        break;
                    default:
                        btnImprimir.OnClientClick = "AbrirVentanaFactura()";
                        break;
                }
            }
            catch (Exception ex)
            {
                MessageBox("Error Interno: " + ex.Message);
            }
        }
        private void SetPanelDocumento(int nOpeCod)
        {
            clsDocumenOperacion lstDocumenOpe = new clsDocumenOperacion();
            dgvDocumentos.DataSource = lstDocumenOpe.GetListDocumenOperacion(nOpeCod);
            dgvDocumentos.DataBind();

            HabilitarBtn(btnNuevoDocumento, dgvDocumentos.Rows.Count < 6);
        }

        #endregion

#region FUNCIONES DE MANTENIMIENTO DE CLIENTES
        private void IniciarCamposCliente()
        {
            txtCliCod.Text = "";
            txtNombre.Text = "";
            txtNroDoc.Text = "";
            txtCliDireccion.Text = "";
            txtCliTelefono.Text = "";
            txtRepresentante.Text = "";
            txtFecRegis.Text = "";
            lblDocumento.Text = "Nro. de RUC: ";
            lblNombre.Text = "Razon Social: ";
            lblRequired.Visible = false;
            HabilitarCamposCliente(false);
        }
        private void HabilitarCamposCliente(Boolean Value)
        {
            txtNombre.Enabled = Value;
            txtCliDireccion.Enabled = Value;
            txtCliTelefono.Enabled = Value;
            txtRepresentante.Enabled = Value;
            txtFecRegis.Enabled = Value;
            txtNroDoc.Enabled = Value;

            btnNuevoCliente.Visible = !Value;
            btnGuardarCliente.Visible = Value;
        }
        protected void btnNuevoCliente_Click(object sender, EventArgs e)
        {
            HabilitarCamposCliente(true);
            txtFecRegis.Text = DateTime.Today.ToString("yyyy-MM-dd");
            ddlClientes.SelectedValue = "000";

            clsClientes lstCliente = new clsClientes();
            int nCliCod = lstCliente.MaxCliCod() + 1;
            txtCliCod.Text = nCliCod.ToString().PadLeft(6, '0');
            lstCliente = null;

            ModalPopupNuevoCli.Show();
        }
        protected void btnCancelarCliente_Click(object sender, EventArgs e)
        {
            IniciarCamposCliente();
            ddlClientes.SelectedValue = "000";
            txtCliente.Text = "";
            ModalPopupNuevoCli.Show();
        }
        protected void btnGuardarCliente_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                clsClientes lstCliente = new clsClientes();

                lblRequired.Visible = false;
                lstCliente.Insert(this); //GUARDAR PROVEEDOR
                lstCliente = null;

                CargarClientes();
                ddlClientes.SelectedValue = int.Parse(txtCliCod.Text).ToString();
                ddlClientes_SelectedIndexChanged(sender, e);
            }
            else
            {
                lblRequired.Visible = true;
                ModalPopupNuevoCli.Show();
            }
            
        }
        protected void VentaCliente_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                args.IsValid = (args.Value.Trim() != "");
            }
            catch (Exception ex)
            {
                args.IsValid = false;
                MessageBox(ex.Message);
            }
        }
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] BuscarClientes(string prefixText)
        {
            String[] sList = null;
            List<string> sClienteList = new List<string>();
            clsClientes lstClientes = new clsClientes();

            try
            {
                DataTable dtClientes = lstClientes.BuscarClientes(prefixText);

                if (dtClientes.Rows.Count > 0)
                {
                    for (int i = 0; i < dtClientes.Rows.Count; i++)
                    {
                        sClienteList.Add(AjaxControlToolkit.AutoCompleteExtender.
                          CreateAutoCompleteItem(dtClientes.Rows[i]["CliNombre"].ToString(), dtClientes.Rows[i]["CliCod"].ToString()));
                    }
                    sList = new String[10];
                    sList = sClienteList.ToArray();
                }
                else
                {
                    sClienteList.Add(AjaxControlToolkit.AutoCompleteExtender.
                          CreateAutoCompleteItem("[NUEVO CLIENTE]", "999"));

                    sList = new String[1];
                    sList = sClienteList.ToArray();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                lstClientes = null;
            }
            return sList;
        }

        #endregion

#region FUNCIONES DE VENTANA DE ARTICULOS
        private void LimpiarCamposArticulos()
        {
            txtArtCod.Text = "";
            txtArtUniMed.Text = "";
            txtStockFact.Text = "";
            txtStockFis.Text = "";
            txtArtPreUnitario.Text = "0.0";
            txtArtDescuento.Text = "0";
            txtArtCant.Text = "0";
            txtImpTotal.Text = "0.0";
            txtLotVenci.Text = "";
            txtLotNro.Text = "";
        }
        private void IniciarCamposArticulos()
        {
            LimpiarCamposArticulos();
            
            txtArtPreUnitario.Attributes.Add("onFocus", "JavaScript:this.select();");
            txtArtDescuento.Attributes.Add("onFocus", "JavaScript:this.select();");
            txtArtCant.Attributes.Add("onFocus", "JavaScript:this.select();");

            clsProveedores lstProveedor = new clsProveedores();
            ddlLaboratorios.DataSource = lstProveedor.GetAll();
            ddlLaboratorios.DataBind();
            ddlLaboratorios.Items.Insert(0, new ListItem("Todos", "-1"));

            clsArticulos oArticulos = new clsArticulos();
            lsbArticulos.DataSource = oArticulos.GetArticulosStock();
            lsbArticulos.DataBind();

            if (lsbArticulos.Items.Count == 0)
            {
                lsbArticulos.Items.Add(new ListItem("No existen Articulos en Stock", "0"));
            }
        }
        private void CalcularTotalArticulo()
        {
            double nTotal = 0.0;
            if (txtArtPreUnitario.Text.Trim() != "" && txtArtCant.Text.Trim() != "")
            {
                nTotal = double.Parse(txtArtPreUnitario.Text) * double.Parse(txtArtCant.Text);
                nTotal -= nTotal * (double.Parse(txtArtDescuento.Text) / 100);
                txtImpTotal.Text = nTotal.ToString();
            }

            ModalPopupAgregar.Show();
        }        
        private Boolean BuscarArticulo(int ArtCod, ref int LotNro, ref double LprPrecio, ref double LprDscto)
        {
            DataTable dgvDetalleVenta = g_dtDetOperacion;
            if (dgvDetalleVenta != null)
            {
                var Rows = dgvDetalleVenta.Select("ArtCod = " + ArtCod.ToString());
                if (Rows.Length > 0)
                {
                    LotNro = int.Parse(Rows[0]["LotNro"].ToString());
                    LprPrecio = double.Parse(Rows[0]["dtpPrecioVen"].ToString());
                    LprDscto = double.Parse(Rows[0]["dtpDscto"].ToString());
                    return true;
                }
            }
            return false;
        }
        protected void lsbArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            nTasIGV = double.Parse(lblTasIGV.Value);
            int ArtCod = 0;
            int PrvCod = 0;
            int LotNro = 0;
            double LprPrecio = 0.0;
            double LprDscto = 0.0;
            double nPrecio = 0.0;
            ArtCod = int.Parse(lsbArticulos.SelectedValue);
            PrvCod = int.Parse(ddlLaboratorios.SelectedValue);

            txtLotVenci.Text = "";
            txtLotNro.Text = "";
            txtLotStock.Text = "0";

            clsArticulos lstArticulos = new clsArticulos();
            clsListaPrecios lstPrecios = new clsListaPrecios();
            clsLotesArt lstLotesArt = new clsLotesArt();
            Articulos oArticulo = new Articulos();
            ListaPrecios oPrecio = new ListaPrecios();
            LotesArt oLoteArt = new LotesArt();

            txtLotNro.Enabled = false;
            txtLotVenci.Enabled = false;
            txtLotStock.Enabled = false;
            txtArtDescuento.Enabled = true;

            oPrecio = lstPrecios.GetArticuloPrecio(ArtCod);
            oLoteArt = lstLotesArt.GetLoteArt(ArtCod);

            //oLoteArt.ListaPrecios.Articulos

            oArticulo = lstArticulos.GetArticulo(ArtCod);
            if (oArticulo != null)
            {
                txtArtCod.Text = oArticulo.ArtCod.ToString();
                txtArtUniMed.Text = oArticulo.Unidades.UniDescripcion;
                txtStockFact.Text = oArticulo.ArtStockFac.ToString();
                txtStockFis.Text = oArticulo.ArtStock.ToString();
                hideStockLote.Value = lstLotesArt.GetLoteArtStock(ArtCod).ToString();                

                if (oLoteArt != null)
                {
                    txtLotNro.Text = oLoteArt.LotNro.ToString();
                    txtLotStock.Text = oLoteArt.LotStock.ToString();
                    if (oLoteArt.LotFecVenci != null)
                        txtLotVenci.Text = ((DateTime)oLoteArt.LotFecVenci).ToString("yyyy-MM-dd");
                }


                if (oArticulo.ArtStock <= 0)
                    txtStockFis.ForeColor = System.Drawing.Color.Red;
                else
                    txtStockFis.ForeColor = System.Drawing.Color.Gray;

                txtArtPreUnitario.Text = lstPrecios.GetCostoPromedio(ArtCod, nTasIGV).ToString();

                //if (oPrecio == null)
                //    txtArtPreUnitario.Text = "0.0";
                //else
                //{
                //    nPrecio = (double)oPrecio.LprPrecio;
                //    var nDcto = Math.Round((nPrecio * (double)oPrecio.LprDscto / 100), 2);
                //    nPrecio -= nDcto;
                //    var nFlete = Math.Round(nPrecio / 100, 2);
                //    nPrecio += nFlete;
                //    var nIgv = Math.Round(nPrecio * nTasIGV, 2);
                //    nPrecio += nIgv;
                //    if (oArticulo.Proveedores.PrvGanancia != 0)
                //        nPrecio = Math.Round((nPrecio * (double)oArticulo.Proveedores.PrvGanancia), 2);
                //    txtArtPreUnitario.Text = nPrecio.ToString();
                //}

                if (BuscarArticulo(oArticulo.ArtCod, ref LotNro, ref LprPrecio, ref LprDscto))
                {
                    txtArtDescuento.Enabled = false;
                    txtArtDescuento.Text = LprDscto.ToString();
                }
                else
                {
                    txtArtDescuento.Enabled = true;
                    txtArtDescuento.Text = "0";
                }
                txtArtCant.Text = "1";
            }
            else
                txtArtCant.Text = "0";            
            
            txtImpTotal.Text = "0.0";

            lstArticulos = null;
            oArticulo = null;
            lstPrecios = null;
            oPrecio = null;

            CalcularTotalArticulo();
            lsbArticulos.Focus();
        }
        protected void ddlLaboratorios_SelectedIndexChanged(object sender, EventArgs e)
        {
            clsArticulos colArticulos = new clsArticulos();
            int PrvCod = Int32.Parse(ddlLaboratorios.SelectedValue);

            if (PrvCod == -1)
                lsbArticulos.DataSource = colArticulos.GetArticulosStock();
            else
                lsbArticulos.DataSource = colArticulos.GetArticulosStockByPrvCod(PrvCod);
            lsbArticulos.DataBind();
            if (lsbArticulos.Items.Count == 0)
            {
                lsbArticulos.Items.Add(new ListItem("Sin Articulos en Stock", "0"));
            }
            colArticulos = null;
            
            if (lsbArticulos.SelectedIndex >= 0)
                lsbArticulos_SelectedIndexChanged(sender, e);

            ModalPopupAgregar.Show();
        }
        
        protected void btnAgregarArticulo_Click(object sender, EventArgs e)
        {
            DataTable dtDetalleCompra;
            DataRow NewRow;
            bool bExiste = false;
            double nPrecio = 0.0;
            double nCantidad = 0.0;
            double nDescuento = 0.0;
            double nTotal = 0.0;
            string cMensaje = "";

            try
            {
                if (ValidarDatos("ART", ref cMensaje))
                {
                    //AGREGAMOS ARTICULO A LISTA DE ARTICULOS
                    dtDetalleCompra = g_dtDetOperacion;

                    if (dtDetalleCompra.Rows.Count > 0)
                    {
                        for (int i = 0; i < dtDetalleCompra.Rows.Count; i++)
                        {
                            if (dtDetalleCompra.Rows[i]["ArtCod"].ToString() == txtArtCod.Text)
                            {
                                nPrecio = Double.Parse(dtDetalleCompra.Rows[i]["dtpPrecioVen"].ToString());
                                nCantidad = Double.Parse(dtDetalleCompra.Rows[i]["dtpCantidad"].ToString()) + double.Parse(txtArtCant.Text);
                                nTotal = Double.Parse(dtDetalleCompra.Rows[i]["dtpSubTotal"].ToString());
                                nTotal += Double.Parse(txtImpTotal.Text);
                                nDescuento = 100 - ((100 * nTotal) / (nPrecio * nCantidad));

                                dtDetalleCompra.Rows[i]["dtpCantidad"] = nCantidad.ToString();
                                dtDetalleCompra.Rows[i]["dtpDscto"] = nDescuento;
                                dtDetalleCompra.Rows[i]["dtpSubTotal"] = nTotal.ToString();
                                i = dtDetalleCompra.Rows.Count + 10;
                                bExiste = true;
                            }
                        }
                    }

                    if (!bExiste)
                    {
                        NewRow = dtDetalleCompra.NewRow();
                        NewRow["ArtCod"] = txtArtCod.Text;
                        NewRow["LotNro"] = txtLotNro.Text;
                        NewRow["ArtDescripcion"] = lsbArticulos.SelectedItem.Text;
                        NewRow["UniAbrev"] = txtArtUniMed.Text;
                        NewRow["dtpCantidad"] = txtArtCant.Text;
                        NewRow["dtpPrecioVen"] = txtArtPreUnitario.Text;
                        if (ddlTipDcto.SelectedValue == "%")
                            NewRow["dtpDscto"] = txtArtDescuento.Text;
                        else
                            NewRow["dtpDscto"] = (double.Parse(txtArtDescuento.Text) * 100) / (double.Parse(txtArtPreUnitario.Text) * double.Parse(txtArtCant.Text));
                        NewRow["dtpSubTotal"] = txtImpTotal.Text;
                        dtDetalleCompra.Rows.Add(NewRow);
                    }

                    CalcularPago(dtDetalleCompra);
                    g_dtDetOperacion = dtDetalleCompra;
                    RellenarGrilla(ref dgvDetalleVenta, dtDetalleCompra, this.nNroDetPed);                    
                }
                else
                {
                    ModalPopupAgregar.Show();
                    MessageBox(cMensaje);
                }

            }
            catch (Exception ex)
            {
                MessageBox(ex.Message);
            }
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static String[] BuscarArticulos(string prefixText)
        {
            String[] sList = null;
            List<string> sArticuloList = new List<string>();
            clsArticulos lstArticulos = new clsArticulos();

            try
            {
                DataTable dtArticulos = lstArticulos.BuscarArticulos(prefixText,true);

                if (dtArticulos.Rows.Count > 0)
                {
                    for (int i = 0; i < dtArticulos.Rows.Count; i++)
                    {
                        sArticuloList.Add(AjaxControlToolkit.AutoCompleteExtender.
                          CreateAutoCompleteItem(dtArticulos.Rows[i]["ArtDescripcion"].ToString(), dtArticulos.Rows[i]["ArtCod"].ToString()));
                    }
                    sList = new String[10];
                    sList = sArticuloList.ToArray();
                }
                else
                {
                    sList = new String[1];
                    sList[0] = "Sin Resultados";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                lstArticulos = null;
            }
            return sList;
        }

        #endregion

       



    }
}
