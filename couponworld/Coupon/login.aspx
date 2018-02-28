<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/registration.Master" CodeBehind="login.aspx.cs" Inherits="Coupon.login" %>

<asp:Content runat="server" ID="cmain" ContentPlaceHolderID="ContentPlaceHolder1">

    <style>
        a:hover,
        a:focus {
            color: #FF5E00;
            text-decoration: underline;
        }
    </style>


    <div class="login-page" style="padding: 0em;">

        <div class="container">
            <ol class="breadcrumb breadcrumb1" style="text-align: left;">
                <li><a href='<%= ResolveUrl("~/home") %>'>Home</a></li>
                <li class="active">Login</li>
            </ol>
            <br />
            <br />
            <h3 class="w3ls-title w3ls-title1">Existing User</h3>
            <%--<div class="col-md-6 focus-grid">--%>
            <div class="login-body">
                <%--<asp:RequiredFieldValidator ID="rf22" runat="server" ErrorMessage="Select User" ControlToValidate="ddl_user" ForeColor="Red" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>--%>
                <input type="text" runat="server" id="txt_user" class="user" name="email" placeholder="Enter your email" />
                <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txt_user" ForeColor="Red" Display="Dynamic" ValidationGroup="login"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="re1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_user" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="login" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                <input type="password" runat="server" id="txt_password" name="password" class="lock" placeholder="Password" />
                <asp:RequiredFieldValidator ID="rf11" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txt_password" Display="Dynamic" ForeColor="Red" ValidationGroup="login"></asp:RequiredFieldValidator>
                <%--<input type="submit" value="Login" />--%>
                <asp:Button runat="server" Text="Login" ID="btn_login" CssClass="" OnClick="btn_login_Click" ValidationGroup="login" />
                <div class="">
                    <%-- <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>Remember me</label>--%>
                    <br />
                    <div class="">
                        <a href='<%= ResolveUrl("~/forgot-password") %>'>Forgot Password?</a>
                    </div>

                    <div class="clearfix"></div>
                </div>
                <div runat="server" id="divmess"></div>
            </div>
            <%--</div>--%>


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
        </div>

    </div>

</asp:Content>
