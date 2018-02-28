<%@ Page Title="" Language="C#" MasterPageFile="~/connect_mst.Master" AutoEventWireup="true" CodeBehind="merchantrequest.aspx.cs" Inherits="Coupon.connect.merchantrequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    <style>
        .detailsh3 {
            color: #F99D22;
        }

        .detailsdiv {
            padding-top: 10px;
        }

            .detailsdiv .info {
                padding-top: 10px;
                color: #6E6D6C;
            }

                .detailsdiv .info span {
                    color: #CEC8C1;
                }

            .detailsdiv p {
                padding-top: 20px;
                padding-bottom: 20px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">

    <div style="text-align: left">

        <div class="container">


            <div class="detailsdiv">

                <asp:Repeater runat="server" ID="rep_details">
                    <ItemTemplate>

                        <h3><%# Eval("str_title") %>
                        </h3>

                        <div class="info">
                            <div class="col-md-2" style="padding-left: 0px">
                                <span class="fa fa-clock-o fa-lg" aria-hidden="true"></span>
                                <%# Eval("int_no_of_days")!=DBNull.Value?Eval("int_no_of_days").ToString():" NA"  %>
                            </div>
                            <div class="col-md-2">
                                <span class="fa fa-money fa-lg" aria-hidden="true"></span>
                                <%# Eval("dec_approx_budget")!=DBNull.Value?Eval("dec_approx_budget").ToString().Replace("-"," to ")+" $$":" NA"  %>
                            </div>
                            <div class="col-md-4">
                                <span class="fa fa-map-marker fa-lg" aria-hidden="true"></span>
                                <%# Eval("str_zip_code")!=DBNull.Value?Eval("str_zip_code").ToString():" NA"  %>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <p><%# Eval("str_details") %></p>
                    </ItemTemplate>
                </asp:Repeater>
                <br />
                <div class="col-md-6" style="padding-left: 0">

                    <asp:Button runat="server" ID="btnback" Text="Back to List" PostBackUrl="~/connect/requestlist.aspx" CausesValidation="false" CssClass="btn btn-default" />
                </div>
                <div class="clearfix"></div>
                <br />

            </div>


            <div class="detailsdiv" id="divform">
                <h3>Merchant Request List</h3>
                <br />
                <asp:UpdatePanel runat="server" ID="upMain">
                    <ContentTemplate>
                        <asp:Repeater runat="server" ID="rpview">
                            <HeaderTemplate>
                                <table class="table table-border">
                                    <tr>
                                        <th>Date</th>
                                        <th>Merchant Name</th>
                                        <th>Est Time (Days) </th>
                                        <th>Est Cost ($)</th>
                                        <th></th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("date_reply_date","{0:MM-dd-yyyy}") %></td>
                                    <td><%# Eval("str_retailer_name")%></td>
                                    <td><%# Eval("str_approx_days")%></td>
                                    <td><%# Eval("str_approx_budget")%></td>
                                    <td>
                                        <asp:LinkButton runat="server" ID="lnk_show_details" CommandArgument='<%# Eval("int_reply_id") %>' CausesValidation="false" Text="Details" OnClick="lnk_show_details_Click"></asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>

        </div>
    </div>

    <div class="modal fade" id="model_details" role="dialog">
        <div class="modal-dialog" style="width: 82%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Merchant Request Details</h4>
                </div>
                <div class="modal-body">
                    <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                    <asp:UpdatePanel runat="server" ID="up_social">
                        <ContentTemplate>
                            <!-- general form elements disabled -->
                            <div class="box box-warning">

                                <div class="col-md-4" style="float: left; text-align: left">
                                    <label>Merchant Name</label>
                                </div>

                                <div class="col-md-6">
                                    <label runat="server" id="lbl_name" style="left: 0; color: black; float: left; font-weight: normal"></label>

                                </div>
                                <div class="clearfix"></div>
                                <br />
                                <div class="col-md-4" style="float: left; text-align: left">
                                    <label>Approx budget for this job.</label>
                                </div>

                                <div class="col-md-3">
                                    <label runat="server" id="lbl_budget" style="left: 0; color: black; float: left; font-weight: normal"></label>
                                </div>

                                <div class="clearfix"></div>
                                <br />
                                <div class="col-md-4" style="float: left; text-align: left">
                                    <label>Approx days that need to finish the job.</label>
                                </div>

                                <div class="col-md-3">

                                    <label runat="server" id="lbl_days" style="left: 0; color: black; float: left; font-weight: normal"></label>

                                </div>

                                <div class="clearfix"></div>
                                <br />
                                <div class="col-md-4"  style="float: left; text-align: left">
                                    <label>Comment from merchant</label>
                                </div>

                                <div class="col-md-7">

                                    <label runat="server" id="lbl_details" style="left: 0; color: black; text-align: left; font-weight: normal"></label>
                                </div>
                                <div class="clearfix"></div>
                                <br />
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->

                            <div class="clearfix"></div>

                            <div class="modal-footer">
                                <asp:LinkButton runat="server" ID="btn_accept" CssClass="btn btn-success">Accept</asp:LinkButton>
                                <asp:LinkButton runat="server" ID="btn_reject" CssClass="btn btn-success"> Reject</asp:LinkButton>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </ContentTemplate>

                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>
    <script>

        function openModel(divid) {

            $('#' + divid).modal('show');

        }
    </script>
</asp:Content>
