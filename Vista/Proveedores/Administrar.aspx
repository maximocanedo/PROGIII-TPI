﻿<%@ Page Language="C#" MasterPageFile="/Root.Master" AutoEventWireup="true" CodeBehind="Administrar.aspx.cs" Inherits="Vista.Proveedores.Administrar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <style>
        .TextBoxEdit{
  width: 80px; 
            }
    </style>
    <h2>Proveedores</h2>

    <div class="searchbox">
        <asp:TextBox ID="txtBuscar" runat="server" ValidationGroup="GrupoBuscar"></asp:TextBox>
        <asp:Button ID="btnBuscar" CssClass="material-icons mdc-icon-button" runat="server" Text="search" OnClick="btnBuscar_Click" ValidationGroup="GrupoBuscar" />
    </div>
    <br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
        runat="server" ErrorMessage="no es un cuit"
        ValidationExpression="^\d{10}$"
        ValidationGroup="GrupoBuscar" ControlToValidate="txtBuscar">CUIT incorrecto</asp:RegularExpressionValidator>
    <br />
    <div class="mdc-data-table">
        <div class="mdc-data-table__table-container">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit">
                <Columns>
                    <asp:TemplateField HeaderText="CUIT" ItemStyle-CssClass="template-field">
                        <EditItemTemplate>
                            <asp:Label ID="cuitEditar_lb" runat="server" Text='<%# Bind("CUIT_Prov") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CUIT_Prov_lb" runat="server" Text='<%# Bind("CUIT_Prov") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Razon Social" ItemStyle-CssClass="template-field">
                        <EditItemTemplate>
                            <asp:TextBox CssClass="TextBoxEdit" ID="TextBox2" runat="server" Text='<%# Bind("RazonSocial_Prov") %>'>
                            </asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="RazonSocial_Prov_lb" runat="server" Text='<%# Bind("RazonSocial_Prov") %>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nonbre de contacto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" CssClass="TextBoxEdit" runat="server" Text='<%# Bind("NombreDeContacto_Prov") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="NombreDeContacto_Prov_lb" runat="server" Text='<%# Bind("NombreDeContacto_Prov") %>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Correo Electronico">
                        <EditItemTemplate>
                            <asp:TextBox CssClass="TextBoxEdit" ID="TextBox4"  runat="server" Text='<%# Bind("CorreoElectronico_Prov") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CorreoElectronico_Prov_lb" runat="server" Text='<%# Bind("CorreoElectronico_Prov") %>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" CssClass="TextBoxEdit" runat="server" Text='<%# Bind("Telefono_Prov") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Telefono_Prov_lb" runat="server" Text='<%# Bind("Telefono_Prov") %>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Direccion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" CssClass="TextBoxEdit" runat="server" Text='<%# Bind("Direccion_Prov") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Direccion_Prov_lb" runat="server" Text='<%# Bind("Direccion_Prov") %>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Provincia">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" CssClass="TextBoxEdit" runat="server" Text='<%# Bind("Provincia_Prov") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Provincia_Prov_lb" runat="server" Text='<%# Bind("Provincia_Prov") %>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Localidad">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" CssClass="TextBoxEdit" runat="server" Text='<%# Bind("Localidad_Prov") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Localidad_Prov_lb" runat="server" Text='<%# Bind("Localidad_Prov") %>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pais">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" CssClass="TextBoxEdit" runat="server" Text='<%# Bind("Pais_Prov") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Pais_Prov_lb" runat="server" Text='<%# Bind("Pais_Prov") %>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Codigo Postal">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox10" CssClass="TextBoxEdit" runat="server" Text='<%# Bind("CodigoPostal_Prov") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CodigoPostal_Prov_lb" runat="server" Text='<%# Bind("CodigoPostal_Prov") %>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
            <asp:Label ID="pruebalb" runat="server" Text="Label"></asp:Label>
            <br />
        </div>
    </div>
</asp:Content>
