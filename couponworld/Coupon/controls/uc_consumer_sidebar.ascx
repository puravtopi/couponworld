<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_consumer_sidebar.ascx.cs" Inherits="Coupon.controls.uc_consumer_sidebar" %>
<style>
    li a:hover,
    li a:focus {
        color: #FF5E00;
        text-decoration: underline;
    }

    .profile-pic {
        position: relative;
        display: inline-block;
    }

        .profile-pic:hover .edit {
            display: block;
        }

    .edit {
        padding-bottom: 7px;
        padding-right: 7px;
        position: absolute;
        right: 0;
        bottom: 0;
        display: none;
    }

        .edit a {
            color: #000;
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

<div class="modal fade" id="profile_pic" role="dialog">
    <div class="modal-dialog" style="width: 50%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="text-align: left;">Select New Profile Picture</h4>
            </div>
            <div class="modal-body">
                <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <!-- general form elements disabled -->
                        <div class="box box-warning">

                            <!-- /.box-header -->
                            <div class="box-body">
                                <!-- text input -->
                                <div class=" col-lg-4">
                                    <div class="form-group">
                                        <label>Select Picture</label>
                                        <asp:FileUpload runat="server" ID="fup_img" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Select Image." ControlToValidate="fup_img" ValidationGroup="profile_gp" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ID="reg" ValidationExpression="^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG)$" ErrorMessage="Please Select Image file only." ControlToValidate="fup_img" ValidationGroup="profile_gp" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>  
                                    </div>
                                </div>

                            </div>

                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->

                        <div class="clearfix"></div>

                        <div class="modal-footer">
                            <asp:LinkButton runat="server" ID="btn_update"  ValidationGroup="profile_gp" OnClick="btn_update_Click" CssClass="btn btn-success">Update</asp:LinkButton>
                            <%--<asp:LinkButton runat="server" ValidationGroup="active" ID="lnk_active_status" CssClass="btn btn-success" OnClick="lnk_active_status_Click"> Active</asp:LinkButton>--%>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btn_update" />
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
                        <div class="profile-pic" style="width: 100%; text-align: -webkit-center; vertical-align: central">
                            <img runat="server" class="img-responsive" alt="" id="img_retailer_pic" />
                            <div class="edit"><a href="#" data-toggle="modal" data-target="#profile_pic"><i class="fa fa-pencil fa-lg"></i></a></div>
                        </div>
                        <%--<div class="agile-product-text">
                            <a href="#" data-toggle="modal" data-target="#bio" class="w3ls-cart pw3ls-cart" style="width: 30%; margin-left: 50px; font-size: 0.8em; background: #337ab7;"><%--<i class="fa fa-cart-plus" aria-hidden="true"></i>Edit</a>
                        </div>--%>
                    </div>
                </div>
            </div>
            <hr />

            <h5 class="item_name"><a href='<%= ResolveUrl("~/consumer-profile") %>'><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Profile</a>
            </h5>

            <hr />

            <h5 class="item_name">
                <a href="<%= ResolveUrl("~/consumer-dashboard") %>"><i class="fa fa-gift" aria-hidden="true"></i>&nbsp;Statics</a>
            </h5>

            <hr />

            <h5 class="item_name">
                <a href="<%= ResolveUrl("~/transactions") %>"><i class="fa fa-money" aria-hidden="true"></i>&nbsp;Transactions</a>
            </h5>

            <%-- <hr />

            <h5 class="item_name">
                <a href=""><i class="fa fa-bar-chart" aria-hidden="true"></i>&nbsp;Reporting</a>
            </h5>--%>

            <hr />

        </li>

    </ul>
</div>

