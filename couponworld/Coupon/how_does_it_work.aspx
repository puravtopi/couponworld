<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="how_does_it_work.aspx.cs" Inherits="Coupon.how_does_it_work" %>

<%@ Register Src="~/controls/uc_member_page.ascx" TagPrefix="uc1" TagName="uc_member_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .titlehr {
            width: 50px;
            height: 2px;
            border-top: 1px solid #F99D22;
            text-align: center;
        }
    </style>

    <div class="values">
        <div class="container">
            <h3 class="w3ls-title w3ls-title1" style="margin: 0 0 .5em;">HOW IT WORKS</h3>
            <hr class="titlehr" />

            <uc1:uc_member_page runat="server" ID="uc_member_page" />
            <div class="clearfix"></div>
            <br />
            <div class="w3values-row">
              <%--  <div class="col-md-6 w3values-grids">
                    <h6>THE CONCEPT</h6>
                    <hr />
                    <p>As a Se-va Consumer no more clipping, printing and or forgetting coupons, because all Se-va virtual coupons are stored on one electronic card. Within the Se-va network, you can choose where to spend and save, and what school, charity or community organization you want to give to, all without changing your daily spending habits.</p>
                    <br />
                    <p>As a Se-va Merchant you can reduce your marketing budget, increase your promotional opportunities, and show your support of the community, all while setting yourself apart from the competition, at only a fraction of the cost you are currently paying. </p>
                    <br />
                    <p>As a School, Charity or Community Organization Se-va provides an innovative way to raise charitable funds on a consistent daily basis, and allows your supporters to become more involved in your growth.</p>
                </div>--%>
                <div class="col-md-12 w3values-grids">
                    <h6>WHAT SETS US APART</h6>
                    <hr />
                    <ul style="font-size: 1em; color: #6E6D6C; line-height: 1.8em; font-weight: normal;">
                        <li>Se-va provides an innovative way for schools, charities and community organizations to raise funds ona consistent, daily basis.</li>
                        <li>Supporters can increase their donations without changing their daily spending habits.</li>
                        <li>Se-va provides schools with a child-safe way of raising funds.</li>
                        <li>Se-va manages the program for the schools so volunteers and staff do not have additional responsibilities like collecting money and handling inventory.</li>
                        <li>Se-va provides the school and their PTA with a fully automated fundraising program that can be easily tracked by the school and monitored by Se-va.</li>
                        <li>As a Se-va School Partner we provide you with promotional tools as well as networking opportunities to learn from other schools, charities and community organizations.</li>
                    </ul>
                </div>

            </div>
            <div class="clearfix"></div>
            <br />
            <div class="w3l-services">
                <div class="container">
                    <p>
                        Families are looking for more efficient and innovate ways to manage their lives, saving time and money, while at the same time enjoying discounts and deals.Merchants and Business Owners are looking for more innovative and economical ways to connect with customers, build loyalty, and be part of the community.Schools, Charities and Community Organizations are looking for new innovative ways to raise needed funds on a consistent daily basis. Se-va addresses these concerns and empowers the community to work together by saving, giving, and sharing, using state-of-the-art, innovative technology.
                
                    </p>

                </div>
            </div>
            <br />
        </div>
    </div>
</asp:Content>
