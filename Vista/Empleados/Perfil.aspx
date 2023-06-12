﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Vista.Empleados.Perfil" %>

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
    <link rel="stylesheet" href="./index.css" />
    <script src="./index.js"></script>
</head>
<body>
    <header class="mdc-top-app-bar mdc-top-app-bar--fixed">
        <div class="mdc-top-app-bar__row">
          <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
            <button class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button" aria-label="Open navigation menu">menu</button>
            <span class="mdc-top-app-bar__title">Pet Shop</span>
          </section>
          <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end" role="toolbar"> 
            <button class="mdc-button mdc-top-app-bar__action-item">
                <span class="mdc-button__ripple"></span>
                <span class="mdc-button__label">Proveedores</span>
            </button>
            <button class="mdc-button mdc-top-app-bar__action-item">
                <span class="mdc-button__ripple"></span>
                <span class="mdc-button__label">Productos</span>
            </button>
            <button class="mdc-button mdc-top-app-bar__action-item">
                <span class="mdc-button__ripple"></span>
                <span class="mdc-button__label">Clientes</span>
            </button>
            <button class="material-icons mdc-top-app-bar__action-item mdc-icon-button" aria-label="Search">search</button>
            <button class="material-icons mdc-top-app-bar__action-item mdc-icon-button" aria-label="Options">more_vert</button>
          </section>
        </div>
      </header>
      <main class="mdc-top-app-bar--fixed-adjust obj--main main-grid">
        <div class="col perfil">
          <img src="https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80" alt="" />
          <h2>Alejandro Gutiérrez</h2>
          <ul>
            <li>Masculino</li>
            <li>Nac. el 27 de feb. 1989</li>
            <li>Contratado el 14 de may. 2015</li>
            <li>Sueldo: <b>$150.000</b>/mes</li>
            <li>Albarellos 1470, Tigre, Bs. As. Arg.</li>
          </ul>
        </div>
        <div class="col principal">
          <h1>Ventas que realizó</h1>
          <br>
          <br>
          <span> *** Tabla de facturas "WHERE Empleado = Alejandro Gutiérrez" *** </span>
        </div>

      </main>
</body>
</html>
