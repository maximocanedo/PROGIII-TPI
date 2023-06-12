﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrar.aspx.cs" Inherits="Vista.Empleados.Administrar" %>


<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Plantilla</title>
  <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
  <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
    href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
    rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="./index.css" />
</head>

<body>
  <header class="mdc-top-app-bar mdc-top-app-bar--fixed">
    <div class="mdc-top-app-bar__row">
      <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
        <button class="material-icons mdc-top-app-bar__navigation-icon mdc-icon-button"
          aria-label="Open navigation menu">menu</button>
        <span class="mdc-top-app-bar__title">Pet Shop</span>
      </section>
      <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end" role="toolbar">
        <button class="mdc-button mdc-top-app-bar__action-item">
          <span class="mdc-button__ripple"></span>
          <span class="mdc-button__label">Proveedores</span>
        </button>
        <button class="mdc-button mdc-top-app-bar__action-item">
          <span class="mdc-button__ripple"></span>
          <span class="mdc-button__label">Clientes</span>
        </button>
        <button class="material-icons mdc-top-app-bar__action-item mdc-icon-button" aria-label="Search">search</button>
        <button class="material-icons mdc-top-app-bar__action-item mdc-icon-button"
          aria-label="Options">more_vert</button>
      </section>
    </div>
  </header>
  <main class="mdc-top-app-bar--fixed-adjust obj--main">
    <h2>Empleados</h2>
    <div class="searchbox">
      <span class="text">Buscar</span>
      <span class="material-icons">search</span>
    </div>
    <div class="mdc-data-table">
      <div class="mdc-data-table__table-container">
        <table class="mdc-data-table__table" aria-label="Dessert calories">
          <thead>
            <tr class="mdc-data-table__header-row">
              <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Acciones</th>
              <th class="mdc-data-table__header-cell" role="columnheader" scope="col">DNI</th>
              <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Nombre</th>
              <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Apellido</th>
              <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Sexo</th>
              <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Sueldo</th>
              <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Dirección</th>
              <th class="mdc-data-table__header-cell" role="columnheader" scope="col">Estado</th>
            </tr>
          </thead>
          <tbody class="mdc-data-table__content">
            <tr class="mdc-data-table__row">
              <td class="mdc-data-table__cell"><button
                class="material-icons mdc-icon-button btn-edit">edit</button><button
                class="material-icons mdc-icon-button btn-delete">delete</button></td>
              <td class="mdc-data-table__cell">45 000 001</td>
              <td class="mdc-data-table__cell">Axel Tomás</td>
              <td class="mdc-data-table__cell">Barrientos</td>
              <td class="mdc-data-table__cell">M</td>
              <td class="mdc-data-table__cell">$ 345.000</td>
              <td class="mdc-data-table__cell">Alberdi 638, Tigre, Buenos Aires, Argentina (B1648)</td>
              <td class="mdc-data-table__cell">En servicio</td>
            </tr>
            <tr class="mdc-data-table__row">
              <td class="mdc-data-table__cell"><button
                  class="material-icons mdc-icon-button btn-edit">edit</button><button
                  class="material-icons mdc-icon-button btn-delete">delete</button></td>
              <td class="mdc-data-table__cell">45 000 002</td>
              <td class="mdc-data-table__cell">Ana María de los Dolores</td>
              <td class="mdc-data-table__cell">Buscaroli de Musicardi</td>
              <td class="mdc-data-table__cell">F</td>
              <td class="mdc-data-table__cell">$ 405.000</td>
              <td class="mdc-data-table__cell">Chile 1300, Tigre, Buenos Aires, Argentina (B1648)</td>
              <td class="mdc-data-table__cell">En servicio</td>
            </tr>
            <tr class="mdc-data-table__row">
              <td class="mdc-data-table__cell"><button
                  class="material-icons mdc-icon-button btn-edit">edit</button><button
                  class="material-icons mdc-icon-button btn-delete">delete</button></td>
              <td class="mdc-data-table__cell">45 000 003</td>
              <td class="mdc-data-table__cell">Héctor</td>
              <td class="mdc-data-table__cell">Da Silva</td>
              <td class="mdc-data-table__cell">M</td>
              <td class="mdc-data-table__cell">$ 3.645.000</td>
              <td class="mdc-data-table__cell">Lisboa 5069, Tigre, Buenos Aires, Argentina (B1648)</td>
              <td class="mdc-data-table__cell">No disponible</td>
            </tr>
            <tr class="mdc-data-table__row">
              <td class="mdc-data-table__cell"><button
                  class="material-icons mdc-icon-button btn-edit">edit</button><button
                  class="material-icons mdc-icon-button btn-delete">delete</button></td>
              <td class="mdc-data-table__cell">45 000 001</td>
              <td class="mdc-data-table__cell">Horacio</td>
              <td class="mdc-data-table__cell">Suárez</td>
              <td class="mdc-data-table__cell">M</td>
              <td class="mdc-data-table__cell">$ 345.000</td>
              <td class="mdc-data-table__cell">Lavalle 1200, Tigre, Buenos Aires, Argentina (B1648)</td>
              <td class="mdc-data-table__cell">En servicio</td>
            </tr>
            <tr class="mdc-data-table__row">
              <td class="mdc-data-table__cell"><button
                  class="material-icons mdc-icon-button btn-edit">edit</button><button
                  class="material-icons mdc-icon-button btn-delete">delete</button></td>
              <td class="mdc-data-table__cell">45 000 002</td>
              <td class="mdc-data-table__cell">Juan Alberto</td>
              <td class="mdc-data-table__cell">Pérez García</td>
              <td class="mdc-data-table__cell">M</td>
              <td class="mdc-data-table__cell">$ 270.000</td>
              <td class="mdc-data-table__cell">Albarellos 500, Tigre, Buenos Aires, Argentina (B1648)</td>
              <td class="mdc-data-table__cell">En servicio</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </main>
</body>

</html>