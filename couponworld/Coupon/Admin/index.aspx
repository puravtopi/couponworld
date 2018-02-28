<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Coupon.Admin.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Administration Center
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">
    <%-- <style>
        .col-lg-2 {
            width: 20%;
        }
    </style>--%>
    <section class="content">
        <!-- Small boxes (Stat box) -->
        <div class="row">
            <div class="col-lg-2 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <h3>
                            <asp:Label runat="server" ID="lbl_org"></asp:Label>
                        </h3>
                        <p>
                            Organizations                                   
                        </p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-pie-graph"></i>
                    </div>
                    <a href="view_organization.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-2 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                        <h3>
                            <asp:Label runat="server" ID="lbl_offer"></asp:Label>
                        </h3>
                        <p>
                            Markets                                   
                        </p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-2 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-yellow">
                    <div class="inner">
                        <h3>
                            <asp:Label runat="server" ID="lbl_member"></asp:Label>
                        </h3>
                        <p>
                            Consumers
                                   
                        </p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
                    <a href="view_member.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-2 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <h3>
                            <asp:Label runat="server" ID="lbl_retailer"></asp:Label>
                        </h3>
                        <p>
                            Retailers
                                   
                        </p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
                    <a href="view_retailer.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>
            <div class="col-lg-2 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-blue">
                    <div class="inner">
                        <h3>
                            <asp:Label runat="server" ID="lbl_trans"></asp:Label>
                        </h3>
                        <p>
                            Transactions
                                   
                        </p>
                    </div>
                    <div class="icon">
                         <i class="ion ion-person-add"></i>
                    </div>
                    <a href="view_transaction.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>
            <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- top row -->
        <%--<div class="row">
            <div class="col-xs-12 connectedSortable">
            </div>
            <!-- /.col -->
        </div>--%>
        <!-- /.row -->
        <!-- Main row -->
        <!-- /.row (main row) -->
    </section>
</asp:Content>
