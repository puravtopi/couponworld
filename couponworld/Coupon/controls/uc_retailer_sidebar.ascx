<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_retailer_sidebar.ascx.cs" Inherits="Coupon.controls.uc_retailer_sidebar" %>

<style>
    li a:hover,
    li a:focus {
        color: #FF5E00;
        text-decoration: underline;
    }
</style>

<div class="modal fade" id="img_model" role="dialog">
    <div class="modal-dialog" style="width: 82%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="text-align: left;">Retailer Bio</h4>
            </div>
            <div class="modal-body">
                <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                <asp:UpdatePanel runat="server" ID="up_bio">
                    <ContentTemplate>
                        <!-- general form elements disabled -->
                        <div class="box box-warning">

                            <!-- /.box-header -->
                            <div class="box-body">
                                <!-- text input -->
                                <div class=" col-lg-4">
                                    <div class="form-group">
                                        <label>Address:-</label>
                                        <textarea id="txt_bio" class="form-control" runat="server" placeholder="Address" maxlength="200"></textarea>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Valid Street Address" ControlToValidate="txt_bio" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                            </div>

                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->

                        <div class="clearfix"></div>

                        <div class="modal-footer">
                            <asp:LinkButton runat="server" ID="lnk_bio_update" CausesValidation="false" ValidationGroup="sign_up" CssClass="btn btn-success">Update</asp:LinkButton>
                            <%--<asp:LinkButton runat="server" ValidationGroup="active" ID="lnk_active_status" CssClass="btn btn-success" OnClick="lnk_active_status_Click"> Active</asp:LinkButton>--%>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="lnk_bio_update" />
                    </Triggers>
                </asp:UpdatePanel>


            </div>
        </div>
    </div>
</div>



<div>
    <ul style="list-style-type: none">
        <li>
            <div class="product-grids" style="margin-top: 0em;">
                <div class="agile-products" style="padding: 0.1em;">

                    <div class="thumb-image detail_images">
                        <img runat="server" class="img-responsive" alt="" id="img_retailer_pic" />
                        <%--<div class="agile-product-text">
                            <a href="#" data-toggle="modal" data-target="#bio" class="w3ls-cart pw3ls-cart" style="width: 30%; margin-left: 50px; font-size: 0.8em; background: #337ab7;"><%--<i class="fa fa-cart-plus" aria-hidden="true"></i>Edit</a>
                        </div>--%>
                    </div>
                </div>
            </div>
            <hr />

            <h5 class="item_name"><a href='<%= ResolveUrl("~/retailer-profile") %>'><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Profile</a>
            </h5>

            <hr />

            <h5 class="item_name">
                <a href='<%= ResolveUrl("~/retailer-deals") %>'><i class="fa fa-gift" aria-hidden="true"></i>&nbsp;Deals</a>
            </h5>

            <hr />

            <h5 class="item_name">
                <a href='<%= ResolveUrl("~/retailer-transactions") %>'><i class="fa fa-money" aria-hidden="true"></i>&nbsp;Transactions</a>
            </h5>

            <hr />

            <h5 class="item_name">
                <a href=""><i class="fa fa-bar-chart" aria-hidden="true"></i>&nbsp;Reporting</a>
            </h5>

            <hr />

        </li>

    </ul>
</div>

