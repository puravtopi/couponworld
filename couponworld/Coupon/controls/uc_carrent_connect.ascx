<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_carrent_connect.ascx.cs" Inherits="Coupon.controls.uc_carrent_connect" %>


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

