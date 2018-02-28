<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="Coupon.products" EnableEventValidation="true" %>

<%@ Register Src="~/controls/uc_product.ascx" TagPrefix="uc1" TagName="uc_product" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:uc_product runat="server" ID="uc_product" />

</asp:Content>
