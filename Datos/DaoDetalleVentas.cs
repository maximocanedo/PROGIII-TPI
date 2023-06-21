﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Datos
{
    public class DaoDetalleVentas
    {

        public DaoDetalleVentas() { }
        private static readonly string ALL_COLUMNS = $"[{DetalleVenta.Columns.CodVenta_Dv}], " +
                                $"[{DetalleVenta.Columns.CodProducto_Dv}], " +
                               $"[{DetalleVenta.Columns.CUITProv}], " +
                               $"[{DetalleVenta.Columns.Cantidad_Dv}], " +
                               $"[{DetalleVenta.Columns.PrecioUnitario_Dv}], " +
                               $"[{DetalleVenta.Columns.PrecioTotal_Dv}], " +
                               $"[{DetalleVenta.Columns.Estado_Dv}], ";


        public static class Procedures
        {
             public static string Agregar = "SP_DetalleDeVenta_Agregar";
            public static string Bajar = "SP_DetalleDeVenta_DarDeBaja";
            
        }

        public static Response ObtenerDetalleVenta(int Cod)
        {
            Connection connection = new Connection(Connection.Database.Pets);
            return connection.Response.ErrorFound
                ? connection.Response
                : connection.FetchData(
                        query: $"SELECT {ALL_COLUMNS} FROM {DetalleVenta.Table} WHERE [{DetalleVenta.Columns.CodVenta_Dv}] = @Codigo AND [{DetalleVenta.Columns.Estado_Dv}] = 1",
                        new Dictionary<string, object>
                        { {"@Codigo",Cod}
                        }
                    ) ;
        }

        public static Response AgregarRegistro(DetalleVenta Dv)
        {
            Connection con = new Connection(Connection.Database.Pets);
            Response response = con.ExecuteStoredProcedure(
                        storedProcedureName: Procedures.Agregar,
                        parameters: new Dictionary<string, object>
                        {
                            { "@CodigoVenta", Dv.Id },
                            { "@CodigoProducto", Dv.Producto.Codigo },
                            { "@CUITProveedor", Dv.Proveedor.CUIT},
                            { "@Cantidad", Dv.Cantidad }                                 
                        }
                    );
            return response.ErrorFound ? response : con.Response;
        }

        public static Response DarDeBajaRegistro(int Cod)//SOLO DA LA BAJA LOGICA
        {
            Connection con = new Connection(Connection.Database.Pets);
            return con.Response.ErrorFound
                ? con.Response
                : con.ExecuteStoredProcedure(
                        storedProcedureName: Procedures.Bajar,
                        parameters: new Dictionary<string, object> {
                            { "@Codigo", Cod },
                        }
                    );
        }

    }
}
