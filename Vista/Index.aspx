﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Vista.Index" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plantilla</title>
    <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
    <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="/index.css" />
    <script src="/index.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="contents">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <header class="mdc-top-app-bar mdc-top-app-bar--fixed">
            <div class="mdc-top-app-bar__row">
                <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
                    <span class="mdc-top-app-bar__title" runat="server" id="spanPageTitle">PetShop</span>
                </section>
                <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end" role="toolbar">
                    <ASP:LinkButton ID="lbIniciarSesion" runat="server" OnClick="IniciarSesion" CssClass="mdc-button mdc-button--raised _header-important-btn mdc-top-app-bar__action-item">
                        <span class="mdc-button__ripple"></span>
                        <span class="mdc-button__label">Iniciar sesión</span>
                    </ASP:LinkButton>
                    <ASP:LinkButton ID="lbActualUser" OnClick="VerPerfilActual" runat="server" CssClass="mdc-button mdc-top-app-bar__action-item _header-profile-btn">
                        <span class="mdc-button__ripple"></span>
                        <span class="mdc-button__label"><b runat="server" id="lbAUNombre"></b><br>
                            <span runat="server" id="lbAURol"></span></span>
                    </ASP:LinkButton>
                </section>
            </div>
        </header>
        <main class="mdc-top-app-bar--fixed-adjust obj--main">
            <div class="page">
                <h2 id="H2Titulo" runat="server">PetShop</h2>
                <ul>
                    <b>Empleados</b>
                    <li><a href="/Empleados/Administrar.aspx">Ver todos los empleados</a></li>
                    <b>Ventas</b>
                    <li><a href="/Ventas/Administrar.aspx">Ver todas las ventas</a></li>
                    <li><a href="/Ventas/Crear.aspx">Agregar venta</a></li>
                    <b>Productos</b>
                    <li><a href="/Productos/Administrar.aspx">Ver todos los productos</a></li>
                    <li><a href="/Productos/Agregar.aspx">Agregar producto (Sólo admins)</a></li>
                    <b>Proveedores</b>
                    <li><a href="/Proveedores/Administrar.aspx">Ver todos los proveedores</a></li>
                    <li><a href="/Proveedores/Agregar.aspx">Agregar proveedor (Sólo admins)</a></li>
                    <b>Animales</b>
                    <li><a href="/Animales/VerAnimales.aspx">Ver todos los animales</a></li>
                    <li><a href="/Animales/AgregarAnimal.aspx">Agregar animal (Sólo admins)</a></li>
                    <b>Tipos</b>
                    <li><a href="/Animales/VerTipoDeProducto.aspx">Ver todos los tipos</a></li>
                    <li><a href="/Animales/IgresarTipoDePrductos.aspx">Agregar tipos (Sólo admins)</a></li>
                </ul>
            </div>

        </main>
        <aside class="mdc-snackbar">
            <div class="mdc-snackbar__surface" role="status" aria-relevant="additions">
                <div class="mdc-snackbar__label" aria-atomic="false"></div>
            </div>
        </aside>

    </form>
</body>
</html>