<%@ Page Title="" Language="C#" MasterPageFile="~/retailer.Master" AutoEventWireup="true" CodeBehind="connectionlist_retailer.aspx.cs" Inherits="Coupon.connect.connectionlist_retailer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    <style>
        .progress {
            width: 90px;
            height: 90px;
            line-height: 100px;
            background: none;
            margin: 0 auto;
            box-shadow: none;
            position: relative;
        }

            .progress:after {
                content: "";
                width: 100%;
                height: 100%;
                border-radius: 50%;
                border: 12px solid #fff;
                position: absolute;
                top: 0;
                left: 0;
            }

            .progress > span {
                width: 50%;
                height: 100%;
                overflow: hidden;
                position: absolute;
                top: 0;
                z-index: 1;
            }

            .progress .progress-left {
                left: 0;
            }

            .progress .progress-bar {
                width: 100%;
                height: 100%;
                background: none;
                border-width: 6px;
                border-style: solid;
                position: absolute;
                top: 0;
            }

            .progress .progress-left .progress-bar {
                left: 100%;
                border-top-right-radius: 80px;
                border-bottom-right-radius: 80px;
                border-left: 0;
                -webkit-transform-origin: center left;
                transform-origin: center left;
            }

            .progress .progress-right {
                right: 0;
            }

                .progress .progress-right .progress-bar {
                    left: -100%;
                    border-top-left-radius: 80px;
                    border-bottom-left-radius: 80px;
                    border-right: 0;
                    -webkit-transform-origin: center right;
                    transform-origin: center right;
                    animation: loading-1 1.8s linear forwards;
                }

            .progress .progress-value {
                width: 90%;
                height: 90%;
                border-radius: 50%;
                background: #44484b;
                font-size: 12px;
                color: #fff;
                line-height: 80px;
                text-align: center;
                position: absolute;
                top: 5%;
                left: 5%;
            }


            .progress.blue .progress-bar {
                border-color: #049dff;
            }

            .progress.blue .progress-left .progress-bar {
                animation: loading-2 1.5s linear forwards 1.8s;
            }

            .progress.yellow .progress-bar {
                border-color: #fdba04;
            }

            .progress.yellow .progress-left .progress-bar {
                animation: loading-3 1s linear forwards 1.8s;
            }

            .progress.pink .progress-bar {
                border-color: #ed687c;
            }

            .progress.pink .progress-left .progress-bar {
                animation: loading-4 0.4s linear forwards 1.8s;
            }

            .progress.green .progress-bar {
                border-color: #1abc9c;
            }

            .progress.green .progress-left .progress-bar {
                animation: loading-5 1.2s linear forwards 1.8s;
            }

        @keyframes loading-1 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(180deg);
                transform: rotate(180deg);
            }
        }

        @keyframes loading-2 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(144deg);
                transform: rotate(144deg);
            }
        }

        @keyframes loading-3 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(90deg);
                transform: rotate(90deg);
            }
        }

        @keyframes loading-4 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(36deg);
                transform: rotate(36deg);
            }
        }

        @keyframes loading-5 {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(126deg);
                transform: rotate(126deg);
            }
        }

        @media only screen and (max-width: 990px) {
            .progress {
                margin-bottom: 20px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function openModel(divid) {


            $('#' + divid).modal('show');

        }

        function closeModel(divid) {

            $('#' + divid).modal('hide');

        }

    </script>

    <div class="login-page" style="padding-top: 10px">

        <asp:UpdatePanel runat="server" ID="upMain">
            <ContentTemplate>

                <h1 class="h1titel">My Request</h1>
                <hr />
                <br />


                <div class="container">
                    <div class="row">
                        <asp:Repeater runat="server" ID="rpview">

                            <ItemTemplate>
                                <div class="col-md-1 col-sm-2">
                                    <div class="progress blue">
                                        <span class="progress-left">
                                            <span class="progress-bar"></span>
                                        </span>
                                        <span class="progress-right">
                                            <span class="progress-bar"></span>
                                        </span>
                                        <div class="progress-value"><%# Eval("Total") %></div>

                                    </div>
                                    <div style="text-align: center; width: 100%; margin-left: 20%; margin-top: 10%">
                                        <span>
                                            <asp:LinkButton runat="server" ID="lnk_cat" CausesValidation="false" CommandArgument='<%# Eval("CatId") %>' OnClick="lnk_cat_Click"><%# Eval("Catname") %></asp:LinkButton></span>
                                    </div>


                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>


                    <div class="clear-fix"></div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div class="modal fade" id="message-modal" role="dialog">
        <div class="modal-dialog" style="width: 60%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Congratulation</h4>
                </div>
                <div class="modal-body">
                    <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                    <asp:UpdatePanel runat="server" ID="up_retailer">
                        <ContentTemplate>

                            <div class="col-md-12">

                                <div class="box-body">

                                    <div class="col-md-12">

                                        <asp:Repeater runat="server" ID="rpviewsubcat">

                                            <ItemTemplate>
                                                <div class="col-md-2 col-sm-2">
                                                    <div class="progress blue">
                                                        <span class="progress-left">
                                                            <span class="progress-bar"></span>
                                                        </span>
                                                        <span class="progress-right">
                                                            <span class="progress-bar"></span>
                                                        </span>
                                                        <div class="progress-value"><%# Eval("Total") %></div>

                                                    </div>
                                                    <div style="text-align: center; width: 100%; margin-left: 10%; margin-top: 10%">
                                                        <span>
                                                            <asp:LinkButton runat="server" ID="lnk_sub_cat" CausesValidation="false" OnClick="lnk_sub_cat_Click" CommandArgument='<%# Eval("Subcatid") %>'><%# Eval("subCatname") %></asp:LinkButton></span>
                                                    </div>


                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>

                            <div class="modal-footer">

                                <button type="button" class="btn btn-default" id="btnclose" data-dismiss="modal">Close</button>

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>
</asp:Content>
