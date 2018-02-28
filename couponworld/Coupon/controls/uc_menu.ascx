<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_menu.ascx.cs" Inherits="Coupon.controls.uc_menu" %>
<nav class="main_menu drop_down right">
    <ul id="menu-top_menu" class="">

        <li class="menu-item menu-item-type-custom menu-item-object-custom  narrow"><a target="_blank" href='<%= ResolveUrl("~/home") %>'  class=" <%if (Coupon.Connect_Home.MenuId == 1)
                            { %>current<%} %>"  ><i class="menu_icon fa blank"></i><span>HOME</span><span class="plus"></span></a></li>
        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub narrow">
            <a href="#"  class=" <%if (Coupon.Coupon_Site.MenuId == 2)
                            { %>current<%} %>"><i class="menu_icon fa blank"></i><span>GET TO KNOW US</span><span class="plus"></span></a>
            <div class="second">
                <div class="inner">
                    <ul>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/about-us") %>' class=""><i class="menu_icon fa blank"></i><span>ABOUT US</span><span class="plus"></span></a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/how-it-work") %>' class=""><i class="menu_icon fa blank"></i><span>HOW IT WORKS</span><span class="plus"></span></a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/contact-us") %>' class=""><i class="menu_icon fa blank"></i><span>CONTACT US</span><span class="plus"></span></a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href="#" class=""><i class="menu_icon fa blank"></i><span>FAQ</span><span class="plus"></span></a></li>
                    </ul>
                </div>
            </div>
        </li>
        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub narrow">
            <a href="#" class=" <%if (Coupon.Coupon_Site.MenuId == 3)
                            { %>current<%} %>"><i class="menu_icon fa blank"></i><span>SEVA COMMUNITY</span><span class="plus"></span></a>
            <div class="second">
                <div class="inner">
                    <ul>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/consumer-details") %>' class=""><i class="menu_icon fa blank"></i><span>CONSUMERS</span><span class="plus"></span></a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/merchants-details") %>' class=""><i class="menu_icon fa blank"></i><span>MERCHANTS</span><span class="plus"></span></a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/organization-details") %>' class=""><i class="menu_icon fa blank"></i><span>ORGANIZATION</span><span class="plus"></span></a></li>
                    </ul>
                </div>
            </div>
        </li>
        <li class="menu-item menu-item-type-custom menu-item-object-custom  narrow"><a target="_blank" href='<%= ResolveUrl("~/market-place") %>' class=" <%if (Coupon.Coupon_Site.MenuId == 4)
                            { %>current<%} %>"><i class="menu_icon fa blank"></i><span>MarketPlace</span><span class="plus"></span></a></li>
        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub narrow">
            <a href="#" class=" <%if (Coupon.Coupon_Site.MenuId == 5)
                            { %>current<%} %>"><i class="menu_icon fa blank"></i><span>SIGN UP</span><span class="plus"></span></a>
            <div class="second">
                <div class="inner">
                    <ul>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/consumer") %>' class=""><i class="menu_icon fa blank"></i><span>CONSUMERS</span><span class="plus"></span></a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/organization")%>' class=""><i class="menu_icon fa blank"></i><span>MERCHANTS</span><span class="plus"></span></a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/retailers")%>' class=""><i class="menu_icon fa blank"></i><span>ORGANIZATION</span><span class="plus"></span></a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/small-business")%>' class=""><i class="menu_icon fa blank"></i><span>SMALL BUSINESS</span><span class="plus"></span></a></li>
                    </ul>
                </div>
            </div>
        </li>
        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children  has_sub narrow">
            <a href="#" class=" <%if (Coupon.Coupon_Site.MenuId == 6)
                            { %>current<%} %>"><i class="menu_icon fa blank"></i><span>LOGIN</span><span class="plus"></span></a>
            <div class="second">
                <div class="inner">
                    <ul>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/login/consumer/1") %>' class=""><i class="menu_icon fa blank"></i><span>CONSUMERS</span><span class="plus"></span></a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/login/orgnization/2")%>' class=""><i class="menu_icon fa blank"></i><span>MERCHANTS</span><span class="plus"></span></a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/login/retailer/3")%>' class=""><i class="menu_icon fa blank"></i><span>ORGANIZATION</span><span class="plus"></span></a></li>
                        <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/login/small-business/4")%>' class=""><i class="menu_icon fa blank"></i><span>SMALL BUSINESS</span><span class="plus"></span></a></li>
                    </ul>
                </div>
            </div>
        </li>
    </ul>
</nav>
<nav class="mobile_menu">
    <ul id="menu-top_menu-1" class="">
        <li class="menu-item menu-item-type-custom menu-item-object-custom "><a target="_blank" href='<%= ResolveUrl("~/home") %>' class=""><span>HOME</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-has-children  has_sub">
            <a href="#"><span>Get To Know Us</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span>
            <ul class="sub_menu">
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/about-us") %>' class=""><span>Abous Us</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/how-it-work") %>' class=""><span>How It Works</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/contact-us") %>' class=""><span>Contact Us</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href="#" class=""><span>FAQ</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
            </ul>
        </li>
        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-has-children  has_sub">
            <a href="#"><span>Seva Community</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span>
            <ul class="sub_menu">
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/consumer-details") %>' class=""><span>Consumers</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/merchants-details") %>' class=""><span>Marchants</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/organization-details") %>' class=""><span>Organizations</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
            </ul>
        </li>
        <li class="menu-item menu-item-type-custom menu-item-object-custom "><a target="_blank" href='<%= ResolveUrl("~/market-place") %>' class=""><span>Market Place</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-has-children  has_sub">
            <a href="#"><span>Sign Up</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span>
            <ul class="sub_menu">
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/consumer") %>' class=""><span>Consumers</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/organization")%>' class=""><span>Marchants</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/retailers")%>' class=""><span>Organizations</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/small-business")%>' class=""><span>Small Business</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
            </ul>
        </li>
        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-has-children  has_sub">
            <a href="#"><span>Login</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span>
            <ul class="sub_menu">
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/login/consumer/1") %>' class=""><span>Consumers</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/login/orgnization/2")%>' class=""><span>Marchants</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/login/retailer/3")%>' class=""><span>Organizations</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
                <li class="menu-item menu-item-type-post_type menu-item-object-page "><a href='<%= ResolveUrl("~/login/small-business/4")%>' class=""><span>Small Business</span></a><span class="mobile_arrow"><i class="fa fa-angle-right"></i><i class="fa fa-angle-down"></i></span></li>
            </ul>
        </li>
    </ul>
</nav>
