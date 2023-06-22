﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrar.aspx.cs" Inherits="Vista.Proveedores.Administrar" %>

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
    <link rel="stylesheet" href="/index.css" />
    <script src="/index.js"></script>
</head>

<body>
    <style>
        .template-field {
    max-width: 200px;
}

    </style>
    <form id="form1" runat="server">
        <div class="contents">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <header class="mdc-top-app-bar mdc-top-app-bar--fixed">
            <div class="mdc-top-app-bar__row">
                <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
                    <span class="mdc-top-app-bar__title" runat="server" id="spanPageTitle">PetShop</span>
                </section>
                <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end" role="toolbar">
                    <asp:LinkButton ID="lbIniciarSesion" runat="server" OnClick="IniciarSesion" CssClass="mdc-button mdc-button--raised _header-important-btn mdc-top-app-bar__action-item">
                        <span class="mdc-button__ripple"></span>
                        <span class="mdc-button__label">Iniciar sesión</span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="lbActualUser" OnClick="VerPerfilActual" runat="server" CssClass="mdc-button mdc-top-app-bar__action-item _header-profile-btn">
                        <span class="mdc-button__ripple"></span>
                        <span class="mdc-button__label"><b runat="server" id="lbAUNombre"></b>
                            <br>
                            <span runat="server" id="lbAURol"></span></span>
                    </asp:LinkButton>
                </section>
            </div>
        </header>
            <main class="mdc-top-app-bar--fixed-adjust obj--main">
                <h2>Proveedores</h2>

                <div class="searchbox">
                    <asp:TextBox ID="txtBuscar" runat="server" ValidationGroup="GrupoBuscar"></asp:TextBox>
                    <asp:Button ID="btnBuscar"  CssClass="material-icons mdc-icon-button"  runat="server" Text="search" OnClick="btnBuscar_Click" ValidationGroup="GrupoBuscar" />
                     </div>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                        runat="server" ErrorMessage="no es un cuit"
                        ValidationExpression="^\d{10}$"
                        ValidationGroup="GrupoBuscar" ControlToValidate="txtBuscar">Cuit incorrecto</asp:RegularExpressionValidator>
                <br />
                <div class="mdc-data-table">
                    <div class="mdc-data-table__table-container">

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" OnRowEditing="GridView1_RowEditing" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField HeaderText="CUIT" ItemStyle-CssClass="template-field">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CUIT_Prov") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CUIT_Prov") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Razon Social" ItemStyle-CssClass="template-field">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RazonSocial_Prov") %>'>
                                        </asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("RazonSocial_Prov") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nonbre de contacto">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("NombreDeContacto_Prov") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("NombreDeContacto_Prov") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Correo Electronico">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CorreoElectronico_Prov") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CorreoElectronico_Prov") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Telefono">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Telefono_Prov") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Telefono_Prov") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Direccion">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Direccion_Prov") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Direccion_Prov") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Provincia">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Provincia_Prov") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Provincia_Prov") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Localidad">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Localidad_Prov") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Localidad_Prov") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pais">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Pais_Prov") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Pais_Prov") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Codigo Postal">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("CodigoPostal_Prov") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CodigoPostal_Prov") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>
                </div>
            </main>
        </div>

    </form>

</body>

</html>
