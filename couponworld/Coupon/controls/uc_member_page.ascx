<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_member_page.ascx.cs" Inherits="Coupon.controls.uc_member_page" %>
 <style>
        a:hover,
        a:focus {
            color: #FF5E00;
            text-decoration: underline;
        }
    </style>

<div class="services-row" >
    <div class="col-md-3 services-grids">
        <i class="fa fa-line-chart" aria-hidden="true"></i>
        <h4><a href="<%= ResolveUrl("~/market-place") %>">Consumers</a> </h4>
        <p>As a Se-va Consumer no more clipping, printing and or forgetting coupons, because all Se-va virtual coupons are stored on one electronic card. Within the Se-va network, you can choose where to spend and save, and what school, charity or community organization you want to give to, all without changing your daily spending habits.</p>
    </div>
    <div class="col-md-3 services-grids">
        <i class="fa fa-user-plus" aria-hidden="true"></i>
        <h4><a href="<%= ResolveUrl("~/merchants") %>">Merchants</a> </h4>
        <p>As a Se-va Merchant you can reduce your marketing budget, increase your promotional opportunities, and show your support of the community, all while setting yourself apart from the competition, at only a fraction of the cost you are currently paying.</p>
    </div>
    <div class="col-md-3 services-grids">
        <i class="fa fa-industry" aria-hidden="true"></i>
        <h4><a href='<%= ResolveUrl("~/organization-list") %>'>Organizations</a> </h4>
        <p>As a School, Charity or Community Organization Se-va provides an innovative way to raise charitable funds on a consistent daily basis, and allows your supporters to become more involved in your growth.</p>
    </div>
    <div class="col-md-3 services-grids">
        <i class="fa fa-bar-chart" aria-hidden="true"></i>
        <h4><a href='<%= ResolveUrl("~/companys") %>'>Communities</a> </h4>
        <p>Se-va’s cycle of selfless service allows the community to work together, while simultaneously achieving their own individual goals in a seamless professional manner; a compassionate way of living.</p>
    </div>

    <div class="clearfix"></div>
</div>
