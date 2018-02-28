<%@ Page Title="" Language="C#" MasterPageFile="~/connect_mst.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Coupon.connect.home" %>

<asp:Content runat="server" ID="cp" ContentPlaceHolderID="cpHead">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cpMain" runat="server">
    <div class="login-page">

        <div class="container">

            <h1 class="h1titel">What you are looking for ?</h1>
            <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                <ul id="myTab" class=" nav-tabs" role="tablist">
                    <asp:Repeater runat="server" ID="rpview">
                        <ItemTemplate>
                            <li role="presentation" class="litab">
                                <a href='<%# "services.aspx?cid="+Eval("int_connect_cat_id") %>'>
                                    <h5><%# Eval("str_cat") %></h5>
                                </a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>

                </ul>
            </div>
        </div>
    </div>
    <br />
    <div class="container">
        <h1 class="h1titel">How it works ?</h1>
    </div>
</asp:Content>
