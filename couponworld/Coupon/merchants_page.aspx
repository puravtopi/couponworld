<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="merchants_page.aspx.cs" Inherits="Coupon.merchants_page" %>

<%@ Register Src="~/controls/uc_member_page.ascx" TagPrefix="uc1" TagName="uc_member_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="values">
        <div class="container">
            <h3 class="w3ls-title w3ls-title1" style="margin: 0 0 1em;">MERCHANT BENEFITS</h3>
            <p>
                Seva Connect can place your business directly in front of 100’s of Schools, Churches and Charitable Organizations. Seva Connect consumers raise funds by purchasing your products and services! Merchants talked and we listened. At Seva Connect we understand how important cost is to your bottom line and went great depths to provide you with an economical business solution.
            </p>

            <div class="clearfix"></div>
            <br />
            <div class="w3values-row">
                <div class="col-md-12 w3values-grids">
                    <h6>Q: On average how much do you spend on your monthly coupon/marketing promotions?</h6>

                </div>
                <div class="col-md-5 w3values-grids">
                    <img src="images/chart.png" width="100%" />
                </div>
                <div class="col-md-6 w3values-grids">
                    <p>If you answered A, you are paying too much. </p>

                    <p>If you answered B or C, then you need to drop what you are doing and call us right now!</p>

                </div>

            </div>


            <div class="clearfix"></div>
            <br />
            <div class="w3values-row">
                <div class="col-md-4 w3values-grids">
                    <h6>MARKETING</h6>
                    <hr />
                    <p>Seva Connects provide you with performance base marketing, if our members do not purchase your products/services you don’t pay! </p>
                </div>
                <div class="col-md-4 w3values-grids">
                    <h6>FLEXIBILITY</h6>
                    <hr />
                    <p>You get to control when your promotions will be accessible to consumers. You also have the ability to promote your business further with additional marketing opportunities, including online advertising, member communications, Seva Connect events, challenges and games.</p>
                </div>
                <div class="col-md-4 w3values-grids">
                    <h6>CONNECT</h6>
                    <hr />
                    <p>As a Se-va Merchant you can reduce your marketing budget, increase your promotional opportunities, and show your support of the community, all while setting yourself apart from the competition, at only a fraction of the cost you are currently paying.</p>
                </div>

            </div>

        </div>
    </div>


    <div class="clearfix"></div>
    <br />
    <div class="w3l-services">
        <div class="container">
            <uc1:uc_member_page runat="server" ID="uc_member_page" />
        </div>
    </div>
    <br />

    <div class="clearfix"></div>


</asp:Content>
