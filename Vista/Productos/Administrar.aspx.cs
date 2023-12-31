﻿using System;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using System.Data;

namespace Vista.Productos {
    public partial class Editar : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                // Página accesible para empleados y administradores.
                Session[Utils.AUTH] = AuthorizationVista.ValidateSession(this, Authorization.ONLY_EMPLOYEES_STRICT);
                CargarDatos();
                CargarDDL();
                if (Request.QueryString["CODIGO"] != null)
                {
                    string userId = Request.QueryString["CODIGO"];
                   
                    CargarDatos(userId, true);
                    
                    

                }
            }
        }


        protected void CargarDDL()
        {
            ddlFiltro.Items.Add(new ListItem("Sin Stock", "2"));
            ddlFiltro.Items.Add(new ListItem("Bajo Stock", "3"));
            ddlFiltro.Items.Add(new ListItem("Alto Stock", "4"));
            ddlFiltro.Items.Insert(0, new ListItem("Todos", "1"));


        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
           // int fil = Convert.ToInt32(ddlFiltro.SelectedValue);
          //  CargarDatos(fil);
        }


        protected void GrdProductos_RowEditing(object sender, GridViewEditEventArgs e) {
            gvDatos.EditIndex = e.NewEditIndex;
            CargarDatos();
        }
        protected void GrdProductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e) {
            gvDatos.EditIndex = -1;
            CargarDatos();
        }
       
        protected void GrdProductos_RowDeleting(object sender, GridViewDeleteEventArgs e) {
            Eliminar(e);            
        }
        protected void GrdProductos_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            // gvDatos.PageIndex = e.NewPageIndex;
            // CargarDatos();
            if (e.NewPageIndex >= 0 && e.NewPageIndex < gvDatos.PageCount)
            {
                gvDatos.PageIndex = e.NewPageIndex;
                CargarDatos();
            }
        } 
        protected void BtnBuscar_Click(object sender, EventArgs e) {
            CargarDatos();
        }      
        protected void GvDatos_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            int newPageIndex = e.NewPageIndex;
            if (newPageIndex >= 0 && newPageIndex < gvDatos.PageCount) {
                gvDatos.PageIndex = newPageIndex;
                CargarDatos();
            }
        }
        protected void GvDatos_RowCreated(object sender, GridViewRowEventArgs e) {
            if (e.Row.RowType == DataControlRowType.Pager) {
                if (e.Row.FindControl("gvDatosPagerPageTxtBox") is TextBox txtPagerTextBox) {
                    txtPagerTextBox.Text = (gvDatos.PageIndex + 1) + "";
                }
                if (e.Row.FindControl("ddlFilasPorPaginaPagerTemplate") is DropDownList ddlPager) {
                    ddlPager.SelectedValue = gvDatos.PageSize + "";
                }
            }
        }
        protected void GvDatosPagerPageTxtBox_TextChanged(object sender, EventArgs e) {
            int intendedPage = int.Parse(((TextBox)sender).Text) - 1;
            if (intendedPage <= gvDatos.PageCount - 1) {
                gvDatos.PageIndex = intendedPage;
                CargarDatos();
            }
            else {
                ((TextBox)sender).Text = gvDatos.PageIndex + "";
            }
        }
        protected void DdlFilasPorPaginaPagerTemplate_SelectedIndexChanged(object sender, EventArgs e) {
            int filasPorPaginaN = int.Parse(((DropDownList)sender).SelectedValue);
            if (filasPorPaginaN > 0) {
                gvDatos.PageSize = filasPorPaginaN;
                CargarDatos();
            }
        }
        protected void GvDatos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e) {

        }

        /// <summary>
        /// Carga los datos en la tabla.
        /// </summary>
        public void CargarDatos(string cod=null, bool u = false) {
            Response response;
            string codigo = txtBuscar.Text;
            if (cod!=null) {
                 codigo = cod;
            }
            response = u ? ProductoNegocio.BuscarPorCodigo(codigo) : ProductoNegocio.BuscarProductos(codigo);
            if (!response.ErrorFound) {
                gvDatos.DataSource = (DataSet)response.ObjectReturned;
                gvDatos.DataBind();
            }
        }
        protected void filtrar_btn_Click(object sender, EventArgs e)
        {
            Response response;
            txtBuscar.Text = "";
            bool estado = CheckBox1.Checked ? false : true;
            //se selecciona el stock
            int tipoStock = int.Parse(ddlFiltro.SelectedIndex.ToString());
            response = ProductoNegocio.BuscarProductosXStock(tipoStock,estado);
            if (!response.ErrorFound)
            {
                gvDatos.DataSource = (DataSet)response.ObjectReturned;
                gvDatos.DataBind();
            }
        }
     
        protected void Lb_Command(object sender, CommandEventArgs e) {
            var producto = new Producto {
                Codigo = e.CommandArgument.ToString()
            };
            var auth = Session[Utils.AUTH] as SessionData;
            var respuesta = Entidades.Response.ErrorDesconocido;
            if(e.CommandName == "Habilitar") {
                respuesta = ProductoNegocio.HabilitarProducto(auth, producto);
            } if(e.CommandName == "Deshabilitar") {
                respuesta = ProductoNegocio.EliminarProducto(auth, producto);
            }
            Utils.ShowSnackbar(respuesta.Message, this);
            CargarDatos();
        }

        /// <summary>
        /// Manda a actualizar un producto e informa el resultado obtenido.
        /// </summary>
        protected void Actualizar(GridViewUpdateEventArgs e) {
            var auth = Session[Utils.AUTH] as SessionData;
            var proveedor = new Proveedor() { CUIT = ((TextBox)gvDatos.Rows[e.RowIndex].FindControl("txt_eit_Prov")).Text };
            var categoria = new TipoProducto() { tipoDeProducto = ((TextBox)gvDatos.Rows[e.RowIndex].FindControl("txt_eit_Tipo")).Text };
            if (!int.TryParse(((TextBox)gvDatos.Rows[e.RowIndex].FindControl("txt_eit_Stock")).Text, out int stock)) {
                Utils.ShowSnackbar("Valor inválido de stock. ", this);
                return;
            }
            if (!double.TryParse(((TextBox)gvDatos.Rows[e.RowIndex].FindControl("txt_eit_Precio")).Text, out double precio)) {
                Utils.ShowSnackbar("Valor inválido de precio. ", this);
                return;
            }
            var producto = new Producto() {
                Codigo = ((Label)gvDatos.Rows[e.RowIndex].FindControl("lbl_eit_codigo")).Text,
                Proveedor = proveedor,
                Categoria = categoria,
                Nombre = ((TextBox)gvDatos.Rows[e.RowIndex].FindControl("txt_eit_Nombre")).Text,
                Marca = ((TextBox)gvDatos.Rows[e.RowIndex].FindControl("txt_eit_Marca")).Text,
                Descripcion = ((TextBox)gvDatos.Rows[e.RowIndex].FindControl("txt_eit_Desc")).Text,
                Stock = stock,
                Precio = precio,
                //Estado = Estado
            };
            var respuesta = ProductoNegocio.ActualizarProducto(auth, producto);
            Utils.ShowSnackbar(respuesta.Message, this);
            gvDatos.EditIndex = -1;
            CargarDatos();
        }

        /// <summary>
        /// Manda a eliminar un producto e informa el resultado obtenido.
        /// </summary>
        protected void Eliminar(GridViewDeleteEventArgs e) {
            var auth = Session[Utils.AUTH] as SessionData;
            string codigo = ((Label)gvDatos.Rows[e.RowIndex].FindControl("lbl_it_codigo")).Text;
            var producto = new Producto {
                Codigo = codigo
            };
            var respuesta = ProductoNegocio.EliminarProducto(auth, producto);
            Utils.ShowSnackbar(respuesta.Message, this);
            CargarDatos();
        }

       
    }



}