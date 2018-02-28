<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="org_details.aspx.cs" Inherits="Coupon.org_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all" />
    <script src="js/owl.carousel.js"></script>
    <div class="container">
        <ol class="breadcrumb breadcrumb1">
            <li><a href='<%= ResolveUrl("~/home") %>'>Home</a></li>
            <li><a href='<%= ResolveUrl("~/organization-list") %>'>Organizations</a></li>
            <li class="active">Organizations Details</li>
        </ol>
        <div class="clearfix"></div>
    </div>
    <!-- //breadcrumbs -->
    <!-- products -->
    <div class="products" style="padding: 2em;">
        <div class="container">

            <asp:HiddenField runat="server" ID="hidendtime" />

            <asp:Repeater runat="server" ID="rpview">
                <ItemTemplate>
                    <div class="single-page">
                        <div class="single-page-row" id="detail-21">

                            <div class="col-md-4 single-top-left">
                                <div class="flexslider">
                                    <ul class="slides">
                                        <div class="thumb-image">
                                            <img src='<%# ResolveUrl("~/Admin/org_logo/" + Eval("str_logo_img")) %>' style="height: 300px; width: 360px;" class="img-responsive" alt="" />

                                        </div>

                                    </ul>
                                </div>
                                <br />
                                <div class="clearfix"></div>
                                <hr />
                                <div class="single-price">
                                    <%--<button class="w3ls-cart w3ls-cart-like"><i class="fa fa-heart-o" aria-hidden="true"></i>Add to Wishlist</button>--%>

                                    <a href="#" data-toggle="modal" data-target="#company_modal" class="w3ls-cart w3ls-cart-like"><i class="fa fa-gift" aria-hidden="true"></i>Donate</a>

                                </div>
                            </div>
                            <div class="col-md-7 single-top-right">
                                <div class="single-top-right" style="padding-left: 0em;">
                                    <h3 class="item_name">
                                        <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("str_corporate_name") %>'></asp:Label></h3>
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;<%# Eval("str_city_name") %> , <%# Eval("str_state_name") %>

                                    <%--<p>Processing Time: Item will be shipped out within 2-3 working days. </p>--%>
                                    <hr />
                                    <div class="clearfix"></div>
                                    <br />
                                    <%--<div class="single-rating">
                                        <ul>
                                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                            <li class="rating">20 reviews</li>
                                            <li><a href="#">Add your review</a></li>
                                        </ul>
                                    </div>--%>
                                </div>
                                <div class="single-price">
                                    <ul style="min-height: 30px">
                                        <li></li>
                                        <br />
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <b>Name :-</b>
                                            </div>
                                            <div class="col-lg-9">
                                                <asp:Label ID="lbl_org" runat="server" Text='<%# Eval("str_organization_name") %>'></asp:Label>
                                            </div>
                                            <div class="clearfix"></div>
                                            <hr />
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <b>Email :- </b>
                                            </div>
                                            <div class="col-lg-9">
                                                <asp:Label runat="server" ID="lbl_sdate" Text='<%# Eval("str_email_id_p") %>'></asp:Label>
                                            </div>
                                            <div class="clearfix"></div>
                                            <hr />
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <b>Address :- </b>
                                            </div>
                                            <div class="col-lg-9">
                                                <asp:Label runat="server" ID="lbl_ldate" Text='<%# Eval("str_street_address") %>'></asp:Label>
                                            </div>
                                            <div class="clearfix"></div>
                                            <hr />
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <b>City :- </b>
                                            </div>
                                            <div class="col-lg-9">
                                                <asp:Label runat="server" ID="Label1" Text='<%# Eval("str_city_name") %>'></asp:Label>
                                            </div>
                                            <div class="clearfix"></div>
                                            <hr />
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <b>State :- </b>
                                            </div>
                                            <div class="col-lg-9">
                                                <asp:Label runat="server" ID="Label3" Text='<%# Eval("str_state_name") %>'></asp:Label>
                                            </div>
                                            <div class="clearfix"></div>
                                            <hr />
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <b>Zip Code :- </b>
                                            </div>
                                            <div class="col-lg-9">
                                                <asp:Label runat="server" ID="Label4" Text='<%# Eval("int_zip_code") %>'></asp:Label>
                                            </div>
                                            <div class="clearfix"></div>
                                            <hr />
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <b>Telephone(P) :- </b>
                                            </div>
                                            <div class="col-lg-9">
                                                <asp:Label runat="server" ID="Label5" Text='<%# Eval("str_telephone_p") %>'></asp:Label>
                                            </div>
                                            <div class="clearfix"></div>
                                            <hr />
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <b>Contact(P) :- </b>
                                            </div>
                                            <div class="col-lg-9">
                                                <asp:Label runat="server" ID="Label6" Text='<%# Eval("str_contact_1_p") %>'></asp:Label>
                                            </div>
                                            <div class="clearfix"></div>
                                            <hr />
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <b>Telephone(S) :- </b>
                                            </div>
                                            <div class="col-lg-9">
                                                <asp:Label runat="server" ID="Label7" Text='<%# Eval("str_telephone_s") %>'></asp:Label>
                                            </div>
                                            <div class="clearfix"></div>
                                            <hr />
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <b>Contact(S) :- </b>
                                            </div>
                                            <div class="col-lg-9">
                                                <asp:Label runat="server" ID="Label8" Text='<%# Eval("str_contact_2_s") %>'></asp:Label>
                                            </div>
                                            <div class="clearfix"></div>
                                            <hr />
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <b>Email(S) :- </b>
                                            </div>
                                            <div class="col-lg-9">
                                                <asp:Label runat="server" ID="Label10" Text='<%# Eval("str_email_id_s") %>'></asp:Label>
                                            </div>
                                            <div class="clearfix"></div>
                                            <hr />
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="col-lg-3">
                                                <b>Web Address :- </b>
                                            </div>
                                            <div class="col-lg-9">
                                                <asp:Label runat="server" ID="Label9" Text='<%# Eval("str_web_address") %>'></asp:Label>
                                            </div>
                                            <div class="clearfix"></div>
                                            <hr />
                                        </div>
                                    </ul>


                                    <%--<p class="single-price-text">
                                        <asp:Label runat="server" ID="lbl_details" Text='<%# Eval("str_offer_details") %>'></asp:Label>
                                    </p>--%>
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Snow Blower" />
                                    <input type="hidden" name="amount" value="540.00" />
                                    <%--<asp:Button runat="server" ID="btn_buy" CssClass="w3s-cart" OnClick="btn_buy_Click" Text="BUY" />--%>
                                    <%--<asp:LinkButton runat="server" ID="lnk_buy" OnClick="lnk_buy_Click" CssClass="w3ls-cart">BUY</asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="lnk_gift" CssClass="w3ls-cart w3ls-cart-like"><i class="fa fa-heart-o" aria-hidden="true"></i> GIVE AS GIFT</asp:LinkButton>--%>
                                    <br />
                                </div>
                                <div class="clearfix"></div>
                                <hr />

                                <br />

                                <div class="single-page-icons social-icons" style="margin: 2em 0em;">
                                    <ul>
                                        <li>
                                            <h4>Share on</h4>
                                        </li>
                                        <%-- <div id="fb-root"></div>                                          
                                        <li>
                                            <div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-layout="standard" data-action="like" data-size="large" data-show-faces="true" data-share="true"></div>
                                        </li>--%>
                                        <%--<div class="fb-share-button"
                                            data-href="http://www.your-domain.com/your-page.html"
                                            data-layout="button_count">
                                        </div>--%>
                                        <li><a href="http://www.facebook.com/sharer.php" class="fa fa-facebook icon facebook" id="lnkFacebook0"></a></li>
                                        <li><a href="#" class="fa fa-twitter icon twitter"></a></li>
                                        <li><a href="#" class="fa fa-google-plus icon googleplus"></a></li>
                                        <li><a href="#" class="fa fa-dribbble icon dribbble"></a></li>
                                        <li><a href="#" class="fa fa-rss icon rss"></a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="col-md-6 single-top-right">
                            </div>
                            <div class="clearfix"></div>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
    <div class="modal fade" id="company_modal" role="dialog">
        <div class="modal-dialog" style="width: 82%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Donation Information</h4>
                </div>
                <div class="modal-body">
                    <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                    <asp:UpdatePanel runat="server" ID="up_retailer">
                        <ContentTemplate>
                            <!-- general form elements disabled -->
                            <div class="box box-warning">

                                <!-- /.box-header -->
                                <div class="box-body">
                                    <!-- text input -->
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Name </label>
                                            <asp:TextBox runat="server" ID="txt_name" CssClass="form-control" MaxLength="30"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid Name" ValidationGroup="sign_up" ControlToValidate="txt_name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Address </label>
                                            <textarea id="txt_address" class="form-control" runat="server" maxlength="200"></textarea>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid Message" ControlToValidate="txt_address" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Email </label>
                                            <asp:TextBox runat="server" ID="txt_email" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txt_email" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="re1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email" ValidationGroup="sign_up" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>

                                    <div class="clearfix"></div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Message </label>
                                            <textarea id="txt_msg" class="form-control" runat="server" maxlength="200"></textarea>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Message" ControlToValidate="txt_msg" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Amount ($) </label>
                                            <asp:TextBox runat="server" ID="txt_amt" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Amount" ValidationGroup="sign_up" ControlToValidate="txt_amt" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->

                            <div class="clearfix"></div>

                            <div class="modal-footer">
                                <asp:LinkButton runat="server" ID="lnk_gift" CssClass="btn btn-success" OnClick="lnk_gift_Click" ValidationGroup="sign_up"><i class="fa fa-gift" aria-hidden="true"></i> Donate</asp:LinkButton>
                                <%--<asp:LinkButton runat="server" ValidationGroup="active" ID="lnk_active_status" CssClass="btn btn-success" OnClick="lnk_active_status_Click"> Active</asp:LinkButton>--%>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="lnk_gift" />
                        </Triggers>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>

    <script src="js/minicart.js"></script>
    <script>
        w3ls.render();

        w3ls.cart.on('w3sb_checkout', function (evt) {
            var items, len, i;

            if (this.subtotal() > 0) {
                items = this.items();

                for (i = 0, len = items.length; i < len; i++) {
                    items[i].set('shipping', 0);
                    items[i].set('shipping2', 0);
                }
            }
        });
    </script>

    <script src="js/jquery.menu-aim.js"> </script>
    <script src="js/main.js"></script>
    <!-- Resource jQuery -->


</asp:Content>
