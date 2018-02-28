<%@ Page Title="" Language="C#" MasterPageFile="~/member.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="Coupon.member_user.product" %>

<%@ Register Src="~/controls/uc_product.ascx" TagPrefix="uc1" TagName="uc_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <uc1:uc_product runat="server" id="uc_product" />


</asp:Content>
