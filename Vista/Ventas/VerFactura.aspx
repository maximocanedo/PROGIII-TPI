﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerFactura.aspx.cs" Inherits="Vista.Ventas.VerFactura" %>

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
        <div class="col perfil"><ul class="mdc-card mdc-card--outlined mdc-list mdc-list--two-line">
          <li class="mdc-list-item" tabindex="0">
            <span class="mdc-list-item__ripple"></span>
            <span class="mdc-list-item__text">
              <span class="mdc-list-item__primary-text"><b>$ 1,861.58</b></span>
              <span class="mdc-list-item__secondary-text">Total de la compra</span>
            </span>
          </li>
          <li class="mdc-list-item" tabindex="0">
            <span class="mdc-list-item__ripple"></span>
            <span class="mdc-list-item__text">
              <span class="mdc-list-item__primary-text">Héctor da Silva</span>
              <span class="mdc-list-item__secondary-text">Empleado que gestionó esta compra</span>
            </span>
          </li>
          <li class="mdc-list-item">
            <span class="mdc-list-item__ripple"></span>
            <span class="mdc-list-item__text">
              <span class="mdc-list-item__primary-text">Efectivo</span>
              <span class="mdc-list-item__secondary-text">Medio de pago utilizado</span>
            </span>
          </li>
          <li class="mdc-list-item">
            <span class="mdc-list-item__ripple"></span>
            <span class="mdc-list-item__text">
              <span class="mdc-list-item__primary-text">12 de agosto de 2021 16:30</span>
              <span class="mdc-list-item__secondary-text">Fecha y hora de registro</span>
            </span>
          </li>
        </ul></div>
        <div class="col">
          <h2>Factura #0003</h2>
          <div class="mdc-data-table"><div class="mdc-data-table__table-container"><table class="mdc-data-table__table" aria-label="Dessert calories"><thead><tr class="mdc-data-table__header-row"><th class="mdc-data-table__header-cell" role="columnheader" scope="col">Acciones</th><th class="mdc-data-table__header-cell" role="columnheader" scope="col">Producto</th><th class="mdc-data-table__header-cell" role="columnheader" scope="col">Proveedor</th><th class="mdc-data-table__header-cell" role="columnheader" scope="col">Cantidad</th><th class="mdc-data-table__header-cell" role="columnheader" scope="col">Precio Unitario</th><th class="mdc-data-table__header-cell" role="columnheader" scope="col">Subtotal</th></tr></thead><tbody class="mdc-data-table__content"><tr class="mdc-data-table__row"><td class="mdc-data-table__cell"><button class="material-icons mdc-icon-button btn-edit">edit</button><button class="material-icons mdc-icon-button btn-erase">delete</button></td><td class="mdc-data-table__cell">Whiskas Sabor Pollo 530gr</td><td class="mdc-data-table__cell">WHISKAS ARG.</td><td class="mdc-data-table__cell">3</td><td class="mdc-data-table__cell">$ 300.00</td><td class="mdc-data-table__cell">$ 900.00</td></tr><tr class="mdc-data-table__row"><td class="mdc-data-table__cell"><button class="material-icons mdc-icon-button btn-edit">edit</button><button class="material-icons mdc-icon-button btn-erase">delete</button></td><td class="mdc-data-table__cell">Dogui Sabor Primavera 200gr</td><td class="mdc-data-table__cell">DOGUI ARG.</td><td class="mdc-data-table__cell">1</td><td class="mdc-data-table__cell">$ 100.00</td><td class="mdc-data-table__cell">$ 100.00</td></tr><tr class="mdc-data-table__row"><td class="mdc-data-table__cell"><button class="material-icons mdc-icon-button btn-edit">edit</button><button class="material-icons mdc-icon-button btn-erase">delete</button></td><td class="mdc-data-table__cell">Sabrositos Sabor Pescado 400gr</td><td class="mdc-data-table__cell">SABROSITOS CHL.</td><td class="mdc-data-table__cell">2</td><td class="mdc-data-table__cell">$ 430.79</td><td class="mdc-data-table__cell">$ 861.58</td></tr></tbody></table></div></div>
        </div>
        
      </main>
</body>
</html>