﻿<%@ Page Title="" Language="C#" MasterPageFile="~/subadmin/Subadmin_mst.Master" AutoEventWireup="true" CodeBehind="view_connect_job_request.aspx.cs" Inherits="Coupon.subadmin.view_connect_job_request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
      Connect Request
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <div class="box">
        <div class="box-body">
            <asp:UpdatePanel runat="server" ID="upMain">
                <ContentTemplate>

                    <div class="form-inline">
                        <div class="col-lg-4">
                            <input type="text" runat="server" id="txtsearch" class="form-control" placeholder="Search" style="width: 100%;" />
                        </div>

                        <asp:Button runat="server" ID="btnsearch" Text="Search" Style="display: inline" CssClass="btn btn-info" OnClick="btnsearch_Click" />

                    </div>
                    <br />
                    <div runat="server" id="lblmess">
                    </div>
                    <asp:Repeater ID="rpview" runat="server">
                        <HeaderTemplate>
                            <div style="overflow: auto">
                                <div class="table-responsive">
                                    <table class="table table-bordered" style="width: 100%">
                                        <thead>
                                            <tr>

                                                <th>Date</th>
                                                <th>Consumer Name</th>
                                                <th>Title</th>
                                                <%--  <th>Time</th>
                                                <th>Budget</th>
                                                <th>Location</th>--%>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>

                                <td>
                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "int_post_id") %>' />
                                    <%# Eval("date_post_date","{0:MM-dd-yyyy}")%></td>
                                <td><%# Eval("str_first_name")+" "+Eval("str_last_name") %></td>
                                <td><%# Eval("str_title") %></td>
                                <%--  <td><%# Eval("int_no_of_days") %></td>
                                <td><%# Eval("dec_approx_budget") %></td>

                                <td><%# Eval("str_zip_code") %></td>--%>
                                <td><%# Eval("Status")  %></td>
                                <td>

                                    <asp:LinkButton runat="server" ID="lnk_view" CausesValidation="false" CssClass="btn btn-primary" Text="Details" OnClick="lnk_details_Click" CommandArgument='<%# Eval("int_post_id") %>'></asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
    </table>
                            </div>
                             </div>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div runat="server" id="div_page">
                        Page
            <label runat="server" id="lbl_page_no" style="display: inline"></label>
                        of
            <label runat="server" id="lbl_total_page" style="display: inline"></label>
                    </div>
                    <div>
                        <ul class="pagination">
                            <asp:Repeater ID="rptPager" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                                            CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "active" : "" %>'
                                            OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <!-- /.box -->
    <!-- /.box -->

    <div class="modal fade" id="model_5" role="dialog">
        <div class="modal-dialog" style="width: 82%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Job Details</h4>
                </div>
                <div class="modal-body">
                    <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                    <asp:UpdatePanel runat="server" ID="up_retailer">
                        <ContentTemplate>

                            <div class="col-md-12">
                                <!-- general form elements disabled -->
                                <div class="box box-warning">
                                    <br />
                                    <div runat="server" id="Div1">
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <!-- text input -->
                                        <div class=" col-lg-12">
                                            <div class="form-group">

                                                <h2 runat="server" id="lbl_heading"></h2>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Days:-</label>
                                                <asp:Label runat="server" ID="lbl_days"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Budget($):-</label>
                                                <asp:Label runat="server" ID="lbl_cost"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Location:-</label>
                                                <asp:Label runat="server" ID="lbl_location"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-12">
                                            <div class="form-group">
                                                <label>Details:-</label>
                                                <asp:Label runat="server" ID="lbl_details"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-12" id="div_reason" runat="server" style="display: none">
                                            <div class="form-group">
                                                <asp:DropDownList ID="ddl_reason" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->

                            </div>

                            <div class="modal-footer">

                                <div runat="server" id="div_buttons">

                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="lnk_accept" CssClass="btn btn-success" OnClick="lnk_accept_Click"> Accept</asp:LinkButton>
                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="lnk_reject" CssClass="btn btn-danger" OnClick="lnk_reject_Click"> Reject</asp:LinkButton>
                                </div>
                                <div runat="server" id="div_reject_button" style="display: none">
                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="lnk_reject_final" CssClass="btn btn-danger" OnClick="lnk_reject_final_Click"> Reject</asp:LinkButton>
                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="lnk_back" CssClass="btn btn-default" OnClick="lnk_back_Click"> Back</asp:LinkButton>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="model_2" role="dialog">
        <div class="modal-dialog" style="width: 82%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Job Details</h4>
                </div>
                <div class="modal-body">
                    <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>

                            <div class="col-md-12">
                                <!-- general form elements disabled -->
                                <div class="box box-warning">
                                    <br />
                                    <div runat="server" id="Div3">
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <!-- text input -->
                                        <div class=" col-lg-12">
                                            <div class="form-group">

                                                <h2 runat="server" id="lbl_heading_2"></h2>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Pickup Location:-</label>
                                                <asp:Label runat="server" ID="lbl_pickup_location"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Pickup Date:-</label>
                                                <asp:Label runat="server" ID="lbl_pickup_date"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Return Date:-</label>
                                                <asp:Label runat="server" ID="lbl_return_date"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Age:-</label>
                                                <asp:Label runat="server" ID="lbl_age"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Vehicle Type:-</label>
                                                <asp:Label runat="server" ID="lbl_v_type"></asp:Label>
                                            </div>
                                        </div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Vehicle Class:-</label>
                                                <asp:Label runat="server" ID="lbl_v_class"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Capacity:-</label>
                                                <asp:Label runat="server" ID="lbl_cap"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Price:-</label>
                                                <asp:Label runat="server" ID="lbl_price"></asp:Label>
                                            </div>
                                        </div>


                                        <div class="clearfix"></div>


                                        <div class=" col-lg-12">
                                            <div class="form-group">
                                                <label>Details:-</label>
                                                <asp:Label runat="server" ID="lbl_details_2"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-12" id="div_reason_5" runat="server" style="display: none">
                                            <div class="form-group">
                                                <asp:DropDownList ID="ddl_reason_5" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->

                            </div>

                            <div class="modal-footer">

                                <div runat="server" id="div_buttons_5">

                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="LinkButton1" CssClass="btn btn-success" OnClick="lnk_accept_Click"> Accept</asp:LinkButton>
                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="lnk_reject_5" CssClass="btn btn-danger" OnClick="lnk_reject_5_Click"> Reject</asp:LinkButton>
                                </div>
                                <div runat="server" id="div_reject_button_5" style="display: none">
                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="LinkButton3" CssClass="btn btn-danger" OnClick="lnk_reject_final_Click"> Reject</asp:LinkButton>
                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="LinkButton4" CssClass="btn btn-default" OnClick="lnk_back_Click"> Back</asp:LinkButton>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="model_26" role="dialog">
        <div class="modal-dialog" style="width: 82%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Job Details</h4>
                </div>
                <div class="modal-body">
                    <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                        <ContentTemplate>

                            <div class="col-md-12">
                                <!-- general form elements disabled -->
                                <div class="box box-warning">

                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <!-- text input -->
                                        <div class=" col-lg-12">
                                            <div class="form-group">

                                                <h2 runat="server" id="lbl_heading_26"></h2>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Location:-</label>
                                                <asp:Label runat="server" ID="lbl_26_location"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Rental Type:-</label>
                                                <asp:Label runat="server" ID="lbl_26_rental_type"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Move in Month:-</label>
                                                <asp:Label runat="server" ID="lbl_26_month"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>No of BedRooms:-</label>
                                                <asp:Label runat="server" ID="lbl_26_bed"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>No of Bathrooms:-</label>
                                                <asp:Label runat="server" ID="lbl_26_bath"></asp:Label>
                                            </div>
                                        </div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Monthly Payment Range:-</label>
                                                <asp:Label runat="server" ID="lbl_26_monthly_payment"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Credit Range:-</label>
                                                <asp:Label runat="server" ID="lbl_26_credit"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Have a Security Deposit?:-</label>
                                                <asp:Label runat="server" ID="lbl_26_deposit"></asp:Label>
                                            </div>
                                        </div>


                                        <div class="clearfix"></div>


                                        <div class=" col-lg-12">
                                            <div class="form-group">
                                                <label>Details:-</label>
                                                <asp:Label runat="server" ID="lbl_26_details"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-12" id="div_reason_26" runat="server" style="display: none">
                                            <div class="form-group">
                                                <asp:DropDownList ID="ddl_26_reason" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->

                            </div>

                            <div class="modal-footer">

                                <div runat="server" id="div_buttons_26">

                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="LinkButton2" CssClass="btn btn-success" OnClick="lnk_accept_Click"> Accept</asp:LinkButton>
                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="lnk_reject_26" CssClass="btn btn-danger" OnClick="lnk_reject_26_Click"> Reject</asp:LinkButton>
                                </div>
                                <div runat="server" id="div_reject_button_26" style="display: none">
                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="LinkButton6" CssClass="btn btn-danger" OnClick="lnk_reject_final_Click"> Reject</asp:LinkButton>
                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="LinkButton7" CssClass="btn btn-default" OnClick="lnk_back_Click"> Back</asp:LinkButton>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="model_28" role="dialog">
        <div class="modal-dialog" style="width: 82%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Job Details</h4>
                </div>
                <div class="modal-body">
                    <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                        <ContentTemplate>

                            <div class="col-md-12">
                                <!-- general form elements disabled -->
                                <div class="box box-warning">

                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <!-- text input -->
                                        <div class=" col-lg-12">
                                            <div class="form-group">

                                                <h2 runat="server" id="lbl_heading_28"></h2>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Location:-</label>
                                                <asp:Label runat="server" ID="lbl_28_location"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Home Type:-</label>
                                                <asp:Label runat="server" ID="lbl_28_home_type"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>SqFt Range:-</label>
                                                <asp:Label runat="server" ID="lbl_28_sqft"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>No of BedRooms:-</label>
                                                <asp:Label runat="server" ID="lbl_28_bed"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>No of Bathrooms:-</label>
                                                <asp:Label runat="server" ID="lbl_28_bath"></asp:Label>
                                            </div>
                                        </div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Price Range:-</label>
                                                <asp:Label runat="server" ID="lbl_28_price"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Monthly Payment:-</label>
                                                <asp:Label runat="server" ID="lbl_28_monthly"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Credit Range:-</label>
                                                <asp:Label runat="server" ID="lbl_28_credit"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Have a Security Deposit?:-</label>
                                                <asp:Label runat="server" ID="lbl_28_deposit"></asp:Label>
                                            </div>
                                        </div>


                                        <div class="clearfix"></div>


                                        <div class=" col-lg-12">
                                            <div class="form-group">
                                                <label>Details:-</label>
                                                <asp:Label runat="server" ID="lbl_28_details"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-12" id="div_reason_28" runat="server" style="display: none">
                                            <div class="form-group">
                                                <asp:DropDownList ID="ddl_28_reason" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                                    
                            </div>

                            <div class="modal-footer">

                                <div runat="server" id="div_buttons_28">

                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="LinkButton5" CssClass="btn btn-success" OnClick="lnk_accept_Click"> Accept</asp:LinkButton>
                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="lnk_reject_28" CssClass="btn btn-danger" OnClick="lnk_reject_28_Click"> Reject</asp:LinkButton>
                                </div>
                                <div runat="server" id="div_reject_button_28" style="display: none">
                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="LinkButton9" CssClass="btn btn-danger" OnClick="lnk_reject_final_Click"> Reject</asp:LinkButton>
                                    <asp:LinkButton runat="server" ValidationGroup="Details" ID="LinkButton10" CssClass="btn btn-default" OnClick="lnk_back_Click"> Back</asp:LinkButton>
                                </div>
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

        function closeModel(divid) {

            $('#' + divid).modal('hide');

        }




    </script>

</asp:Content>
