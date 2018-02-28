<%@ Page Title="" Language="C#" MasterPageFile="~/connect_mst.Master" AutoEventWireup="true" CodeBehind="services.aspx.cs" Inherits="Coupon.connect.services" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">
   
    <div class="login-page">

        <div class="container">
            <h1 class="h1titel">Which Seva Connect service can we help you with?</h1>
            <div class="col-md-3">
                &nbsp;
            </div>
            <div class="col-md-3">
                <asp:DropDownList runat="server" ID="rbl_serv" CssClass="form-control bfh-states" Style="height: 42px">
                </asp:DropDownList>

            </div>
            <div class="col-md-2">

                <asp:Button runat="server" ID="btn_submit" Text="Submit" OnClick="btn_submit_Click" Style="margin: 0px" />

            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator runat="server" ID="req" ErrorMessage="Select Services" ForeColor="Red" Display="Dynamic" ControlToValidate="rbl_serv" InitialValue="0"></asp:RequiredFieldValidator>
            </div>
            <div class="clearfix"></div>

            <div class="clearfix"></div>
            <br />
        </div>
    </div>

</asp:Content>
