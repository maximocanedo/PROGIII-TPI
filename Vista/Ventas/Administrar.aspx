﻿<%@ Page MasterPageFile="/Root.Master" Language="C#" AutoEventWireup="true" CodeBehind="Administrar.aspx.cs" Inherits="Vista.Ventas.Administrar" %>

<%@ Import Namespace="Entidades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Ventas</h2>
    <div class="searchbox">
        <asp:TextBox ID="txtBuscar" placeholder="Buscar por código de compra" runat="server"></asp:TextBox>
        <asp:Button ID="btnBuscar" CssClass="material-icons mdc-icon-button" OnClick="btnBuscar_Click" runat="server" Text="search" />
    </div>
    <div class="mdc-data-table">

            <asp:GridView ID="gvDatos" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="gvDatos_PageIndexChanging"
                AllowPaging="True" OnRowCreated="gvDatos_RowCreated" PageSize="15" AutoGenerateSelectButton="False"
                OnSelectedIndexChanging="gvDatos_SelectedIndexChanging">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href="/Ventas/VerFactura.aspx?ID=<%# Eval(Venta.Columns.Id) %>" class="mdc-button mdc-card__action mdc-card__action--button">
                                  <div class="mdc-button__ripple"></div>
                                  <span class="mdc-button__label mcardbl-act">Abrir</span>
                                  <i class="material-icons mdc-button__icon" aria-hidden="true">open_in_new</i>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label CssClass="mdc-typography--body2" ID="gvDatosItemTemplate__ID" runat="server"
                                Text='<%# Eval(Venta.Columns.Id) %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha y hora">
                        <ItemTemplate>
                            <asp:Label CssClass="mdc-typography--body2" ID="gvDatosItemTemplate__Fecha" runat="server"
                                Text='<%# Eval(Venta.Columns.Fecha) %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Empleado gestor">
                        <ItemTemplate>
                            <a href="/Empleados/Perfil.aspx?DNI=<%# Eval(Venta.Columns.DNI) %>" class="mdc-button mdc-card__action mdc-card__action--button">
                                  <div class="mdc-button__ripple"></div>
                                  <i class="material-icons mdc-button__icon" aria-hidden="true">person</i>
                                  <span class="mdc-button__label mcardbl-act"><%# Eval(Empleado.Columns.Nombre) %> <%# Eval(Empleado.Columns.Apellido) %></span>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Medio de pago">
                        <ItemTemplate>
                            <asp:Label CssClass="mdc-typography--body2" ID="gvDatosItemTemplate__TipoPago" runat="server"
                                Text='<%# Eval(Venta.Columns.TipoPago) %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total">
                        <ItemTemplate>
                            <asp:Label CssClass="mdc-typography--body2" ID="gvDatosItemTemplate__Total" runat="server"
                                Text='<%# Eval(Venta.Columns.Total) %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerTemplate>
                    <div class="pager">
                        <span class="mdc-typography--body2" style="white-space: nowrap;">Filas por página: </span>
                        <label class="mdc-text-field mdc-text-field--outlined mdc-text-field--no-label page-roll">
                            <span class="mdc-notched-outline">
                                <span class="mdc-notched-outline__leading"></span>
                                <span class="mdc-notched-outline__trailing"></span>
                            </span>
                            <asp:DropDownList ID="ddlFilasPorPaginaPagerTemplate" CssClass="mdc-text-field__input"
                                AutoPostBack="true" runat="server"
                                OnSelectedIndexChanged="ddlFilasPorPaginaPagerTemplate_SelectedIndexChanged">

                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem Selected="True">15</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>

                            </asp:DropDownList>
                        </label>
                        <div class="pager-space"></div>
                        <asp:LinkButton ID="gvDatosPagerFirst" runat="server" CommandName="Page" CommandArgument="First"
                            CssClass="mdc-icon-button mdc-button--primary">
                <span class="mdc-icon-button__ripple"></span>
                <i class="material-icons mdc-button__icon" aria-hidden="true">first_page</i>
                <!--span class="mdc-button__label"></span-->
                        </asp:LinkButton>
                        <asp:LinkButton ID="gvDatosPagerPrev" runat="server" CommandName="Page" CommandArgument="Prev"
                            CssClass="mdc-icon-button mdc-button--primary">
                <span class="mdc-icon-button__ripple"></span>
                <i class="material-icons mdc-button__icon" aria-hidden="true">chevron_left</i>
                <!--span class="mdc-button__label"></span-->
                        </asp:LinkButton>
                        <label class="mdc-text-field mdc-text-field--outlined mdc-text-field--no-label page-roll">
                            <span class="mdc-notched-outline">
                                <span class="mdc-notched-outline__leading"></span>
                                <span class="mdc-notched-outline__trailing"></span>
                            </span>
                            <asp:TextBox type="number" CssClass="mdc-text-field__input" ID="gvDatosPagerPageTxtBox" runat="server"
                                OnTextChanged="gvProductsPagerPageTxtBox_TextChanged" AutoPostBack="true"></asp:TextBox>
                        </label>
                        <asp:LinkButton ID="gvDatosPagerNext" runat="server" CommandName="Page" CommandArgument="Next"
                            CssClass="mdc-icon-button mdc-button--primary">
                <span class="mdc-icon-button__ripple"></span>
                <i class="material-icons mdc-button__icon" aria-hidden="true">chevron_right</i>
                <!--span class="mdc-button__label"></span-->
                        </asp:LinkButton>
                        <asp:LinkButton ID="gvDatosPagerLast" runat="server" CommandName="Page" CommandArgument="Last"
                            CssClass="mdc-icon-button mdc-button--primary">
                <span class="mdc-icon-button__ripple"></span>
                <i class="material-icons mdc-button__icon" aria-hidden="true">last_page</i>
                <!--span class="mdc-button__label"></span-->
                        </asp:LinkButton>
                    </div>
                </PagerTemplate>
            </asp:GridView>

        </div>

</asp:Content>
