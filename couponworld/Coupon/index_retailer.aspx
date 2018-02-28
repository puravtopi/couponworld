<%@ Page Title="" Language="C#" MasterPageFile="~/retailer.Master" AutoEventWireup="true" CodeBehind="index_retailer.aspx.cs" Inherits="Coupon.retailer.index_retailer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <ol class="breadcrumb breadcrumb1">
            <%--<li><a href="index_retailer.aspx">Home</a></li>--%>
            <li class="active">DashBoard</li>
        </ol>
        <br />
        <br />
        <div style="text-align: center">
            <label>
                <h3>Retailer DashBoard</h3>
            </label>
        </div>

        <div class="add-products">
            <div class="container">
                <div class="welcome">
                    <div class="container">
                        <div class="welcome-info">
                            <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                                <ul id="myTab" class=" nav-tabs" role="tablist">
                                    <li role="presentation">
                                        <a href="#">
                                            <i class="fa fa-asterisk" aria-hidden="true"></i>
                                            <h5>Offer</h5>
                                        </a>
                                    </li>
                                    <li role="presentation">
                                        <a href="#">
                                            <i class="fa fa-history" aria-hidden="true"></i>
                                            <h5>Transaction</h5>
                                        </a>
                                    </li>
                                    <%--<li role="presentation">
                                    <a href="#">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                        <h5>Retailer</h5>
                                    </a>
                                </li>
                                <li role="presentation">
                                    <a href="#">
                                        <i class="fa fa-home" aria-hidden="true"></i>
                                        <h5>Small Business</h5>
                                    </a>
                                </li>--%>
                                </ul>
                                <div class="clearfix"></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
