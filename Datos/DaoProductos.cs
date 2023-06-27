﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Datos {
    public class DaoProductos {
        public DaoProductos() { }
        private static readonly string ALL_COLUMNS = $"[{Producto.Columns.Codigo_Prod}], " +
                                    $"[{Producto.Columns.CUITProv}], " +
                                   $"[{Producto.Columns.CodTipoProducto}], " +
                                   $"[{Producto.Columns.Nombre}], " +
                                   $"[{Producto.Columns.Marca}], " +
                                   $"[{Producto.Columns.Descripcion}], " +
                                   $"[{Producto.Columns.Stock}], " +
                                   $"[{Producto.Columns.Precio}], " +
                                   $"[{Producto.Columns.Estado}] ";


        public static class Procedures {
            public static string Crear = "SP_Productos_Crear";
            public static string ActualizarProducto = "SP_Productos_Actualizar";
            public static string EliminarProducto = "SP_Productos_Eliminar";
        }


        public static Response ObtenerListaDeProductos() {
            Connection connection = new Connection(Connection.Database.Pets);
            return connection.Response.ErrorFound
                ? connection.Response
                : connection.FetchData(
                        query: $"SELECT {ALL_COLUMNS} FROM {Producto.Table} WHERE [{Producto.Columns.Estado}] = 1"
                    );
        }


        public static Response BuscarProductoPorCod(string ID) {
            string consulta = $"SELECT {ALL_COLUMNS} FROM {Producto.Table} WHERE [{Producto.Columns.Codigo_Prod}] = @ID ";
            Connection connection = new Connection(Connection.Database.Pets);
            return connection.Response.ErrorFound
                ? connection.Response
                : connection.FetchData(
                        query: consulta,
                        parameters: new Dictionary<string, object> {
                            { "@ID", ID }
                        }
                    );
        }

        public static Response IngresarProducto(Producto Pr) {
            Connection con = new Connection(Connection.Database.Pets);
            Response response = con.ExecuteStoredProcedure(
                        storedProcedureName: Procedures.Crear,
                        parameters: new Dictionary<string, object> 
                        {
                            { "@Codigo", Pr.Codigo },
                            { "@CUIT", Pr.Proveedor.CUIT },
                            { "@Tipo", Pr.Categoria.tipoDeProducto},
                            { "@Nombre", Pr.Nombre },
                            { "@Marca", Pr.Marca },
                            { "@Desc", Pr.Descripcion },
                            { "@Stock", Pr.Stock },
                            { "@Imagen", "" },
                            { "@Precio", Pr.Precio },
                            { "@Estado", Pr.Estado }
                        }
                    );
            return response.ErrorFound ? response : con.Response;
        }

        public static Response ActualizarProducto(Producto Pr)
        {
            Connection con = new Connection(Connection.Database.Pets);
            return con.Response.ErrorFound
                ? con.Response
                : con.ExecuteStoredProcedure(
                        storedProcedureName: Procedures.ActualizarProducto,
                        parameters: new Dictionary<string, object>
                        {
                            { "@Codigo", Pr.Codigo },
                            { "@CUIT", Pr.Proveedor.CUIT },
                            { "@Tipo", Pr.Categoria.tipoDeProducto},
                            { "@Nombre", Pr.Nombre },
                            { "@Marca", Pr.Marca },
                            { "@Desc", Pr.Descripcion },
                            { "@Stock", Pr.Stock },
                            { "@Imagen", "" },
                            { "@Precio", Pr.Precio }
                            
                        }
                    );         
        }


        public static Response EliminarProducto(Producto Pr)//SOLO DA LA BAJA LOGICA
        {
            Connection con = new Connection(Connection.Database.Pets);
            return con.Response.ErrorFound
                ? con.Response
                : con.ExecuteStoredProcedure(
                        storedProcedureName: Procedures.EliminarProducto,
                        parameters: new Dictionary<string, object> {
                            { "@Codigo", Pr.Codigo },
                        }
                    );
        }


        public static Response VerificarExiste(string ID)
        {
            string consulta = $"SELECT COUNT ({Producto.Columns.Codigo_Prod}) AS [Cantidad] FROM {Producto.Table} WHERE [{Producto.Columns.Codigo_Prod}] = @ID ";
            Connection connection = new Connection(Connection.Database.Pets);
            return connection.Response.ErrorFound
                ? connection.Response
                : connection.FetchData(
                        query: consulta,
                        parameters: new Dictionary<string, object> {
                            { "@ID", ID }
                        }
                    );
        }
        /*
        public static Response ActualizarEstadoProducto(Producto Pr) {
            Connection con = new Connection(Connection.Database.Pets);
            return con.Response.ErrorFound
                ? con.Response
                : con.ExecuteStoredProcedure(
                        storedProcedureName: Procedures.ActualizarEstado,
                        parameters: new Dictionary<string, object> {
                            { "@Codigo", Pr.Codigo },
                            { "@Estado",Pr.Estado }
                        }
                    );
        }
        
        public static Response ActualizarPrecio(Producto Pr) {
            Connection con = new Connection(Connection.Database.Pets);
            return con.Response.ErrorFound
                ? con.Response
                : con.ExecuteStoredProcedure(
                        storedProcedureName: Procedures.ActualizarPrecio,
                        parameters: new Dictionary<string, object> {
                            { "@Codigo", Pr.Codigo },
                            { "@Precio", Pr.Precio }

                        }
                    );
        }

        public static Response ActualizarStock(Producto Pr) {
            Connection con = new Connection(Connection.Database.Pets);
            return con.Response.ErrorFound
                ? con.Response
                : con.ExecuteStoredProcedure(
                        storedProcedureName: Procedures.ActualizarPrecio,
                        parameters: new Dictionary<string, object> {
                            { "@Codigo", Pr.Codigo },
                            { "@Stock", Pr.Stock }

                        }
                    );
        }
        */
    }

}
