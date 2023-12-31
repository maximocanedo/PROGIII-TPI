﻿using System;
using System.Security.Claims;
using System.Text;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System.Web;
using System.Diagnostics;
using Entidades;
using Datos;
using System.Data;

namespace Negocio {
    public class Token {
        private readonly string secretKey = "H3LJ4HL231K4H23L4KJHL12KJ37H534IU5OB3I4U5O3I42U5BOIUBO3U4B4HE5";
        public string DNI { get; set; }
        public DateTime FechaEmision { get; set; }

        public Token() {

        }

        public string Generar() {
            byte[] secretKeyBytes = Encoding.UTF8.GetBytes(secretKey);
            var signingKey = new SymmetricSecurityKey(secretKeyBytes);

            // Crear las claims, que son como los datos a guardar dentro del token.
            var claims = new[] {
                new Claim("dni", this.DNI),
                new Claim("fe", this.FechaEmision.ToString())
            };

            // Crear el token en sí (Token JWT)
            var token = new JwtSecurityToken(
                issuer: "TPI",
                audience: "PROG",
                claims: claims,
                expires: DateTime.UtcNow.AddHours(8),
                signingCredentials: new SigningCredentials(signingKey, SecurityAlgorithms.HmacSha256)
            );

            // Firmar el token generado
            var tokenHandler = new JwtSecurityTokenHandler();
            string tokenString = tokenHandler.WriteToken(token);

            return tokenString;

        }

        public bool Decodificar(string token) {
            var tokenHandler = new JwtSecurityTokenHandler();

            // Configurar opciones de validación del token
            var validationParameters = new TokenValidationParameters {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey)),
                ValidateIssuer = true,
                ValidIssuer = "TPI",
                ValidateAudience = true,
                ValidAudience = "PROG",
                ClockSkew = TimeSpan.Zero // No permitir margen de tiempo para la expiración
            };

            try {
                var principal = tokenHandler.ValidateToken(token, validationParameters, out _);

                // Acceder a los claims
                var claims = principal.Claims;
                foreach (var claim in claims) {
                    if (claim.Type == "dni") this.DNI = claim.Value;
                    if (claim.Type == "fe") this.FechaEmision = DateTime.Parse(claim.Value);
                }
                return true;
            } catch(SecurityTokenExpiredException) {

                return false;
            }
            
        }

    }
    public class SesionNegocio {
        
        public static string Base64UrlEncode(string input) {
            byte[] inputBytes = System.Text.Encoding.UTF8.GetBytes(input);
            string base64 = Convert.ToBase64String(inputBytes);
            string base64Url = base64.Replace('+', '-').Replace('/', '_').TrimEnd('=');
            return base64Url;
        }

        public static string Base64UrlDecode(string base64Url) {
            string base64 = base64Url.Replace('-', '+').Replace('_', '/');
            switch (base64.Length % 4) {
                case 2: base64 += "=="; break;
                case 3: base64 += "="; break;
            }
            byte[] base64Bytes = Convert.FromBase64String(base64);
            string decoded = System.Text.Encoding.UTF8.GetString(base64Bytes);
            return decoded;
        }

        public static class ErrorCode {
            public const string NO_ROWS = "NO_ROWS";
            public const string NO_SESSION_FOUND = "NO_SESSION_FOUND";
            public const string EXPIRED_TOKEN = "EXPIRED_TOKEN";
            public const string UNAUTHORIZED = "UNAUTHORIZED";
        }
        public static readonly string AUTH_COOKIE = "_au";

        public SesionNegocio() { }

        /// <summary>
        /// Crea una cookie HTTPONLY y sólo accesible desde el mismo sitio.
        /// </summary>
        /// <param name="key">Propiedad</param>
        /// <param name="value">Valor</param>
        /// <param name="expirationDays">Días de vigencia</param>
        public static void SetCookie(string key, string value, int expirationDays = 0) {
            var cookie = new HttpCookie(key, value);

            if (expirationDays > 0)
                cookie.Expires = DateTime.Now.AddDays(expirationDays);

            cookie.HttpOnly = true;
            cookie.SameSite = SameSiteMode.Strict;

            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        /// <summary>
        /// Obtiene el valor de una cookie.
        /// </summary>
        /// <param name="key">Propiedad</param>
        /// <returns>El contenido de la cookie, si existe. Caso contrario devuelve null.</returns>
        public static string GetCookieValue(string key) {
            if (HttpContext.Current.Request.Cookies[key] != null) {
                return HttpContext.Current.Request.Cookies[key].Value;
            }
            else {
                return null;
            }
        }

        /// <summary>
        /// Elimina una cookie.
        /// </summary>
        /// <param name="key">La propiedad.</param>
        public static void EliminarCookie(string key) {
            if (HttpContext.Current.Request.Cookies[key] != null) {
                var cookie = new HttpCookie(key) {
                    Expires = DateTime.Now.AddDays(-1) // Establece la fecha de expiración en el pasado para eliminar la cookie
                };
                HttpContext.Current.Response.Cookies.Add(cookie);
            }
        }

        public static class ExtractResult {
            public static Response Ok = new Response {
                ErrorFound = false
            };
            public static Response NoRows = new Response {
                ErrorFound = true,
                Message = "No se encontró el registro solicitado. ",
                ObjectReturned = null
            };
        }
        /// <summary>
        /// Toma un DataSet y establece un objeto Sesion a partir del primer registro encontrado.
        /// </summary>
        /// <param name="resultDataSet">El DataSet en cuestión.</param>
        /// <returns>Un Response con el resultado de la operación.</returns>
        public static Response ExtractDataFromDataSet(DataSet resultDataSet) {
            var res = Response.ErrorDesconocido;
            if (resultDataSet.Tables.Count > 0 && resultDataSet.Tables[0].Rows.Count > 0) {
                DataRow primerRegistro = resultDataSet.Tables[0].Rows[0];
                Sesion obj = new Sesion() {
                    Codigo = Convert.ToInt32(primerRegistro[Sesion.Columns.Codigo].ToString()),
                    Empleado = new Empleado() { DNI = primerRegistro[Sesion.Columns.DNI].ToString() },
                    FechaAlta = primerRegistro[Sesion.Columns.FechaAlta].ToString(),
                    Token = primerRegistro[Sesion.Columns.Token].ToString(),
                    Estado = Convert.ToBoolean(primerRegistro[Sesion.Columns.Estado].ToString())
                };
                res = ExtractResult.Ok;
                res.ObjectReturned = obj;
            }
            else {
                res = ExtractResult.NoRows;
            }
            return res;

        }

        /// <summary>
        /// Verifica que el token no se haya deshabilitado.
        /// </summary>
        /// <param name="token">El token a buscar.</param>
        /// <param name="dni">El DNI del usuario en cuestión.</param>
        /// <returns></returns>
        public static bool VerificarAutorizacionToken(string token, string dni) {
            Response datos = SesionDatos.ObtenerSesion(token, dni);
            if (datos.ErrorFound) return false;
            else {
                DataSet dt = datos.ObjectReturned as DataSet;
                Response converted = ExtractDataFromDataSet(dt);
                if (converted.ErrorFound) {
                    return false;
                }
                Sesion sesionActual = converted.ObjectReturned as Sesion;
                if(!sesionActual.Estado) {
                    // El token fue deshabilitado. Lo eliminamos de la cookie.
                    EliminarCookie(AUTH_COOKIE);
                }
                return sesionActual.Estado;
            }
        }

        /// <summary>
        /// Guarda una sesión.
        /// </summary>
        /// <param name="dni">DNI del usuario.</param>
        /// <returns>Response con el resultado de la transacción.</returns>
        public static Response AbrirSesion(string dni) {
            Token i = new Token() {
                DNI = dni,
                FechaEmision = DateTime.Now
            };
            string token = i.Generar();
            Sesion obj = new Sesion() {
                Empleado = new Empleado() {
                    DNI = dni
                },
                Token = token
            };
            SetCookie(AUTH_COOKIE, token);
            return SesionDatos.AbrirSesion(obj);
        }

        /// <summary>
        /// Cierra la sesión actual y borra la cookie de AUTH.
        /// </summary>
        /// <returns>Response con el resultado de la operación.</returns>
        public static Response CerrarSesion() {
            if (GetCookieValue(AUTH_COOKIE) != null) {
                string token = GetCookieValue(AUTH_COOKIE);
                Token k = new Token();
                k.Decodificar(token);
                string dni = k.DNI;
                Sesion obj = new Sesion() {
                    Empleado = new Empleado() { DNI = dni },
                    Token = token
                };
                Response res = SesionDatos.CerrarSesion(obj);
                if (!res.ErrorFound) {
                    EliminarCookie(AUTH_COOKIE);
                }
                return res;
            }
            else return new Response() {
                ErrorFound = true,
                Message = ErrorCode.NO_SESSION_FOUND
            };
        }

        public static Response RevocarSesion(Sesion obj) {
            var respuesta = Response.ErrorDesconocido;
            Autenticar(a => {
                var res = SesionDatos.CerrarSesion(obj);
                respuesta = new Response {
                    ErrorFound = res.ErrorFound,
                    Message = !res.ErrorFound
                        ? $"Se revocó el token #{obj.Codigo}"
                        : "Ocurrió un error al intentar revocar. "
                };
            }, err => {
                respuesta = Response.TokenCaducado;
            });
            return respuesta;
        }
        public static Response ReabrirSesion(Sesion obj) {
            var respuesta = Response.ErrorDesconocido;
            Autenticar(a => {
                var res = SesionDatos.ReabrirSesion(obj);
                respuesta = new Response {
                    ErrorFound = res.ErrorFound,
                    Message = !res.ErrorFound
                        ? $"Se autorizó el token #{obj.Codigo}"
                        : "Ocurrió un error al intentar autorizar. "
                };
            }, err => {
                respuesta = Response.TokenCaducado;
            });
            return respuesta;
        }
        public static Response RevocarTodasLasSesiones(Sesion obj) {
            var respuesta = Response.ErrorDesconocido;
            Autenticar(a => {
                var res = SesionDatos.CerrarTodasLasSesiones(obj);
                respuesta = new Response {
                    ErrorFound = res.ErrorFound,
                    Message = !res.ErrorFound
                        ? $"Se revocaron todos los tokens. "
                        : "Ocurrió un error al intentar revocar todos los tokens. "
                };
            }, err => {
                respuesta = Response.TokenCaducado;
            });
            return respuesta;
        }

        /// <summary>
        /// Autentica. Verifica que el token sea válido, útil para antes de realizar una acción.
        /// </summary>
        /// <returns>True si el token es válido, false en caso contrario.</returns>
        public static bool Autenticar() {
            string token = GetCookieValue(AUTH_COOKIE);
            if(token != null) {
                Token tk = new Token();
                tk.Decodificar(token);
                return VerificarAutorizacionToken(token, tk.DNI);
            }
            return false;

        }

        public static class AuthenticationResult {
            public static Response NoSessionFound = new Response {
                ErrorFound = true,
                Message = "No hay sesión guardada en este navegador."
            };
            public static Response ExpiredToken = new Response {
                ErrorFound = true,
                Message = "Tu sesión expiró. Volvé a iniciar sesión. "
            };
            public static Response Unauthorized = new Response {
                ErrorFound = true,
                Message = "La sesión fue revocada. Volvé a iniciar sesión. "
            };
            public static Response Ok = new Response { 
                ErrorFound = false,
                Message = "Autenticado con éxito. "
            };
        }
        public static bool Autenticar(Action<Response> onSuccess, Action<Response> onError) {
            string token = GetCookieValue(AUTH_COOKIE);
            if (token == null) {
                onError(AuthenticationResult.NoSessionFound);
                return false;
            } 
            else {
                Token tk = new Token();
                bool dec = tk.Decodificar(token);
                if (!dec) {
                    onError(AuthenticationResult.ExpiredToken);
                    return false;
                }
                bool verificacionFinal = VerificarAutorizacionToken(token, tk.DNI);
                onSuccess(verificacionFinal ? AuthenticationResult.Ok : AuthenticationResult.Unauthorized);
                return verificacionFinal;
            }
        }

        /// <summary>
        /// Devuelve los datos del empleado que inició sesión.
        /// </summary>
        /// <returns>Response con el resultado de la operación.</returns>
        public static Response ObtenerDatosEmpleadoActual() {
            string token = GetCookieValue(AUTH_COOKIE);
            if (token != null) {
                Token tk = new Token();
                bool rtk = tk.Decodificar(token);
                if (!rtk) return AuthenticationResult.ExpiredToken;
                Response empleado_data = EmpleadoDatos.BuscarEmpleadoPorDNI(tk.DNI);
                if (!empleado_data.ErrorFound) {
                    DataSet dt = empleado_data.ObjectReturned as DataSet;
                    Response emp = EmpleadoNegocio.ExtractDataFromDataSet(dt);
                    return emp;
                }
                return empleado_data;
            }
            else return AuthenticationResult.NoSessionFound;
        }

        public static Response ObtenerSesionesAbiertasDeEmpleado(string DNI) {
            return SesionDatos.ObtenerSesionesAbiertasDeEmpleado(DNI);
        }
    }
}
