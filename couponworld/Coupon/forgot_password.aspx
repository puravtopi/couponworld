<%@ Page Title="" Language="C#" MasterPageFile="~/registration.Master" AutoEventWireup="true" CodeBehind="forgot_password.aspx.cs" Inherits="Coupon.forgot_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-page" style="padding: 0em; height: 575px;">
        <div class="container">
            <h3 class="w3ls-title w3ls-title1">Forogt Password</h3>
            <%--<div class="col-md-6 focus-grid">--%>
            <div class="login-body">
                <%--  <h3 class="w3ls-title w3ls-title1"></h3>--%>
                <asp:DropDownList runat="server" ID="ddl_user" CssClass="form-control bfh-states" Style="height: 45px;">
                    <asp:ListItem Value="0">-- Select User --</asp:ListItem>
                    <asp:ListItem Value="1">Consumer</asp:ListItem>
                    <asp:ListItem Value="2">Organization</asp:ListItem>
                    <asp:ListItem Value="3">Retailer</asp:ListItem>
                    <asp:ListItem Value="4">Small Business</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rf22" runat="server" ErrorMessage="Select User" ValidationGroup="login" ControlToValidate="ddl_user" ForeColor="Red" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                <br />
                <input type="text" runat="server" id="txt_user" class="user" name="email" placeholder="Enter your email" />
                <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txt_user" ForeColor="Red" Display="Dynamic" ValidationGroup="login"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="re1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_user" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="login" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                <asp:Button runat="server" Text="Submit" ID="btn_submit" CssClass="" OnClick="btn_submit_Click" ValidationGroup="login" />
                <br />
                <br />
                <br />
                <div runat="server" id="divmess"></div>
            </div>

            <br />
            <br />
            <div class="clearfix"></div>
        </div>

    </div>

</asp:Content>
