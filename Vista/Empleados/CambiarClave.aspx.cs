﻿using System;
using System.Security.Cryptography;
using System.Text;
using System.Linq;
using System.Web.UI;
using Entidades;
using Negocio;
using System.Web;
using System.Globalization;

namespace Vista.Empleados {
    public partial class CambiarClave : System.Web.UI.Page {
        private readonly string actualUser = "Usuario_Actual";
        private readonly string editingUser = "Usuario_Perfil";
        public Empleado UsuarioActual;
        private Empleado UsuarioPerfil;
        protected bool CargarSesion() {
            Response res_b = SesionNegocio.ObtenerDatosEmpleadoActual();
            if (res_b.ErrorFound) {
                if (res_b.Message == SesionNegocio.ErrorCode.NO_SESSION_FOUND) {
                    // De no haber iniciado sesión, se envía a la página de Inicio de Sesión con argumento "next" para que luego pueda volver.
                    string login_url = "/Empleados/IniciarSesion.aspx";
                    string next_url = HttpContext.Current.Request.Url.AbsoluteUri;
                    Response.Redirect($"{login_url}?next={next_url}");
                }
                Utils.MostrarMensaje($"Error verificando tu sesión. Detalles: {res_b.Details}.", this.Page, GetType());
                return false;
            }
            else {
                //Utils.MostrarMensaje($"Empleado asignado. Nombre: {(res_b.ObjectReturned as Empleado).Nombre}", this.Page, GetType());
            }
            Session[actualUser] = res_b.ErrorFound ? null : res_b.ObjectReturned as Empleado;
            return true;
        }
        protected bool CargarPerfil() {
            UsuarioActual = Session[actualUser] as Empleado;
            string dni_empleado = Request.QueryString["DNI"];
            if (string.IsNullOrEmpty(dni_empleado)) {
                if (!string.IsNullOrEmpty(UsuarioActual.DNI)) {
                    dni_empleado = UsuarioActual.DNI;
                }
                else return false;
            }
            Response res_b = EmpleadoNegocio.BuscarEmpleadoPorDNI(dni_empleado);
            if (res_b.ErrorFound) {
                return false;
            }
            Session[editingUser] = res_b.ErrorFound ? null : res_b.ObjectReturned as Empleado;
            return true;
        }
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                bool inicioSesion = CargarSesion();
                bool cargoPerfil = CargarPerfil();
                if (inicioSesion && cargoPerfil) {
                    UsuarioActual = Session[actualUser] as Empleado;
                    UsuarioPerfil = Session[editingUser] as Empleado;
                    if (UsuarioActual.Rol == Empleado.Roles.ADMIN || UsuarioActual.DNI == UsuarioPerfil.DNI) {
                        // El usuario actual es ELLA/ÉL MISMO ó un ADMINISTRADOR.
                        
                    }
                    else {
                        Utils.MostrarMensaje($"No tenés permiso para cambiar la clave de alguien más. ", this.Page, GetType());
                        btnGuardarCambios.Enabled = false;
                        // *** Redirigir a página principal *** ///

                    }
                }

            }
        }

        protected void btnGuardarCambios_Click(object sender, EventArgs e) {
            UsuarioActual = Session[actualUser] as Empleado;
            UsuarioPerfil = Session[editingUser] as Empleado;
            string claveNueva = txtClave.Text;
            SesionNegocio.Autenticar((res) => {
                Response op = EmpleadoNegocio.CrearClaves(UsuarioPerfil.DNI, claveNueva);
                if (!op.ErrorFound) {
                    Utils.MostrarMensaje("Se cambió la clave correctamente. ", this.Page, GetType());
                }
                else {
                    Utils.MostrarMensaje("Error. " + op.Message + " " + op.Details, this.Page, GetType());
                }
            }, (err) => {
                Utils.MostrarMensaje("Caducó el token. Tenés que volver a iniciar sesión. ", this.Page, GetType());
            });

        }
    }
}
