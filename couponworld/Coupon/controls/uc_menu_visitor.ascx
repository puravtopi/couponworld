<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_menu_visitor.ascx.cs" Inherits="Coupon.controls.uc_menu_visitor" %>
<div class="header-two">
    <!-- header-two -->
    <div class="container">
        <div class="header-logo">
            <h1><a href='<%= ResolveUrl("~/home") %>' style="margin-top: 15px;">
                <img src='<%= ResolveUrl("~/images/logo.png") %>' style="width: 250px" /></a></h1>
        </div>
        <div class="form-inline">
            <div class="header-search">
            </div>
        </div>
        <%--<div class="clearfix"></div>--%>

        <div class="w3ls-header">
            <!--header-one-->
            <div class="w3ls-header-left">
                <%--<p><a href="#">UPTO $50 OFF ON LAPTOPS | USE COUPON CODE LAPPY </a></p>--%>
                <asp:Label runat="server" ID="lbl_name" ForeColor="White"></asp:Label>
            </div>
            <div class="w3ls-header-right">
                <ul>
                    <li class="dropdown head-dpdn">
                        <a href='<%= ResolveUrl("~/home") %>' class="dropdown-toggle"><i aria-hidden="true"></i>HOME</a>
                    </li>
                    <li class="dropdown head-dpdn">
                        <a class="dropdown-toggle" data-toggle="dropdown">GET TO KNOW US<%--<span class="caret"></span>--%></a>
                        <ul class="dropdown-menu">
                            <li><a href='<%= ResolveUrl("~/how-it-work") %>'>HOW IT WORKS</a></li>
                            <li><a href='<%= ResolveUrl("~/what-set-us-a-part") %>'>WHAT SETS US APART</a></li>
                            <li><a href='<%= ResolveUrl("~/contact-us") %>'>CONTACT US</a></li>
                            <li><a href="offers.html">FAQ</a></li>
                        </ul>
                    </li>
                    <li class="dropdown head-dpdn">
                        <a class="dropdown-toggle" data-toggle="dropdown">SEVA COMMUNITY<%--<span class="caret"></span>--%></a>
                        <ul class="dropdown-menu">
                            <li><a href='<%= ResolveUrl("~/consumer-details") %>'>CONSUMERS</a></li>
                            <li><a href='<%= ResolveUrl("~/merchants-details") %>'>MERCHANTS</a></li>
                            <li><a href='<%= ResolveUrl("~/organization-details") %>'>ORGANIZATIONS</a></li>
                        </ul>
                    </li>
                    <li class="dropdown head-dpdn">
                        <a href="<%= ResolveUrl("~/market-place") %>" class="dropdown-toggle"><i aria-hidden="true"></i>MARKETPLACE </a>
                    </li>

                    <%--                        <% if (Session["uname"] == null)
                           {%>--%>
                    <% if (Session["cid"] == null)
                       {
                    %>
                    <li class="dropdown head-dpdn">
                        <a class="dropdown-toggle" data-toggle="dropdown"><i class="" aria-hidden="true"></i>SIGN UP<%--<span class="caret"></span>--%></a>
                        <ul class="dropdown-menu">
                            <li><a href='<%= ResolveUrl("~/consumer") %>'>CONSUMER</a></li>
                            <li><a href='<%= ResolveUrl("~/organization")%>'>ORGANIZATION</a></li>
                            <li><a href='<%= ResolveUrl("~/retailers")%>'>RETAILER</a></li>
                            <li><a href='<%= ResolveUrl("~/small-business")%>'>SMALL BUSINESS</a></li>

                        </ul>
                    </li>
                    <li class="dropdown head-dpdn">
                        <a class="dropdown-toggle" data-toggle="dropdown"><i class="" aria-hidden="true"></i>LOGIN<%--<span class="caret"></span>--%></a>
                        <ul class="dropdown-menu">
                            <li><a href='<%= ResolveUrl("~/login/consumer/1") %>'>CONSUMER</a></li>
                            <li><a href='<%= ResolveUrl("~/login/orgnization/2")%>'>ORGANIZATION</a></li>
                            <li><a href='<%= ResolveUrl("~/login/retailer/3")%>'>RETAILER</a></li>
                            <li><a href='<%= ResolveUrl("~/login/small-business/4")%>'>SMALL BUSINESS</a></li>

                        </ul>
                    </li>

                    <%}
                       else
                       { %>
                    <li class="dropdown head-dpdn">
                        <a href="<%= ResolveUrl("~/consumer-profile") %>" class="dropdown-toggle"><i aria-hidden="true"></i>PROFILE </a>
                    </li>
                    <li class="dropdown head-dpdn">
                        <a href='<%= ResolveUrl("~/logout")%>' class="dropdown-toggle" data-toggle="dropdown"><i class="" aria-hidden="true"></i>LOGOUT<%--<span class="caret"></span>--%></a>
                    </li>
                    <%} %>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>

    </div>
</div>
