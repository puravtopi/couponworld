<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="select_login.aspx.cs" Inherits="Coupon.select_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<div class="login-page">
        <div class="container">
           

            <div class="row">
                <div class="col-sm-6">

                    <asp:Button runat="server" ID="btn_existing" Text="Existing Member" />
                </div>
                <div class="col-sm-6">

                    <asp:Button runat="server" ID="btn_new" Text="New Member" />
                </div>
            </div>
            <br />
     
        </div>
    </div>--%>

    <h3 class="w3ls-title w3ls-title1">Login to your account</h3>
    <div class="deals">
        <div class="container">
            <div class="deals-row">
                <div class="col-md-6 focus-grid">
                    <a href="login.aspx" class="wthree-btn">
                        <div class="focus-image"><i class=""></i></div>
                        <h4 class="clrchg">Existing Member</h4>
                    </a>
                </div>
                <div class="col-md-6 focus-grid">
                    <a href="retailer_sign_up.aspx" class="wthree-btn">
                        <div class="focus-image"><i class=""></i></div>
                        <h4 class="clrchg">New Member</h4>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="login-page-bottom social-icons" style="text-align: center;">
        <h5>Login with</h5>
        <ul>
            <li><a href="#" class="fa fa-facebook icon facebook"></a></li>
            <li><a href="#" class="fa fa-twitter icon twitter"></a></li>
            <li><a href="#" class="fa fa-google-plus icon googleplus"></a></li>
            <li><a href="#" class="fa fa-dribbble icon dribbble"></a></li>
            <li><a href="#" class="fa fa-rss icon rss"></a></li>
        </ul>
    </div>
</asp:Content>
