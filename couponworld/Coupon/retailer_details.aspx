<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="retailer_details.aspx.cs" Inherits="Coupon.retailer_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<link href="rate/bootstrap.min.css" rel="stylesheet" />
    <link href="rate/star-rating.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="rate/star-rating.js"></script>--%>
    <%--<script>
        $(document).ready(function () {
            $("#input-21e").on("rating.change", function (event, value, caption) {

                var ratingValue = $('#<%=hdfRatingValue.ClientID%>').val();
                ratingValue = value;
                alert(ratingValue);
            });
        });
    </script>--%>

    <link href="<%= ResolveUrl("~/css/owl.carousel.css")%>'" rel="stylesheet" type="text/css" media="all" />
    <!-- carousel slider -->

    <%--<script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>--%>
    <%--<script src="http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php" type="text/javascript"></script>--%>

    <script src='<%= ResolveUrl("js/owl.carousel.js")%>'></script>
    <div class="container">
        <ol class="breadcrumb breadcrumb1">
            <li><a href='<%= ResolveUrl("~/home") %>'>Home</a></li>
            <li><a href="<%= ResolveUrl("~/merchants") %>">Merchants</a></li>
            <li class="active">Merchants Details</li>
        </ol>
        <div class="clearfix"></div>
    </div>
    <!-- //breadcrumbs -->
    <div class="products" style="padding: 2em;">
        <div class="container">

            <asp:HiddenField runat="server" ID="hidendtime" />

            <%-- <asp:Repeater runat="server" ID="rpview">
                <ItemTemplate>--%>
            <div class="single-page">
                <div class="single-page-row" id="detail-21">

                    <div class="col-md-4 single-top-left">
                        <div class="flexslider">
                            <ul class="slides">
                                <div class="thumb-image">
                                    <asp:Image runat="server" ID="img" Height="300px" Width="360px" CssClass="img-responsive" />
                                    <%--<img src='<%# ResolveUrl("~/Admin/retailer_logo/" + Eval("str_logo_img")) %>' style="height: 300px; width: 360px;" class="img-responsive" alt="" runat="server" id="img_data" />--%>
                                </div>
                            </ul>
                        </div>
                        <hr />
                        <div class="clearfix"></div>
                        <div class="single-page-icons social-icons" style="margin: 2em 0em;">
                            <ul>
                                <li>
                                    <h4>Share on</h4>
                                </li>
                                <li><a href="http://www.facebook.com/sharer.php" class="fa fa-facebook icon facebook" id="lnkFacebook0"></a></li>
                                <li><a href="#" class="fa fa-twitter icon twitter"></a></li>
                                <li><a href="#" class="fa fa-google-plus icon googleplus"></a></li>
                                <li><a href="#" class="fa fa-dribbble icon dribbble"></a></li>
                                <li><a href="#" class="fa fa-rss icon rss"></a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                        <hr />

                    </div>
                </div>
                <div class="col-md-7 single-top-right">
                    <div class="single-top-right" style="padding-left: 0em;">
                        <h3 class="item_name">
                            <asp:Label ID="lbl_cname" runat="server" Text='<%# Eval("str_corporate_name") %>'></asp:Label></h3>
                        <i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;<asp:Label ID="lbl_top_city" runat="server" Text='<%# Eval("str_city_name") %>'></asp:Label>
                        ,<asp:Label ID="lbl_top_state" runat="server" Text='<%# Eval("str_state_name") %>'></asp:Label>
                        <div class="single-rating">
                            <ul>
                                <%--<input id="txt_cnt_rate" type="text" class="rating" runat="server" readonly />--%>
                                <%--<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star-o" aria-hidden="true"></i></li>--%>
                                <%--<li class="rating">20 reviews</li>--%>
                                <li class="rating">
                                    <asp:Label runat="server" ID="lbl_cnt"></asp:Label></li>
                                <li class="rating">
                                    <asp:Label runat="server" ID="lblreview"></asp:Label>
                                </li>
                                <li><a href="#" data-toggle="modal" data-target="#rating" style="display: inline">Add your review</a></li>
                            </ul>
                        </div>
                        <hr />
                        <div class="clearfix"></div>
                        <br />
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
                                    <asp:Label ID="lbl_rname" runat="server" Text='<%# Eval("str_retailer_name") %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                                <hr />
                            </div>
                            <div class="col-lg-12">
                                <div class="col-lg-3">
                                    <b>Email :- </b>
                                </div>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lbl_email_p" Text='<%# Eval("str_email_id_p") %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                                <hr />
                            </div>
                            <div class="col-lg-12">
                                <div class="col-lg-3">
                                    <b>Address :- </b>
                                </div>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lbl_address" Text='<%# Eval("str_street_address") %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                                <hr />
                            </div>
                            <div class="col-lg-12">
                                <div class="col-lg-3">
                                    <b>City :- </b>
                                </div>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lbl_city" Text='<%# Eval("str_city_name") %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                                <hr />
                            </div>
                            <div class="col-lg-12">
                                <div class="col-lg-3">
                                    <b>State :- </b>
                                </div>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lbl_state" Text='<%# Eval("str_state_name") %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                                <hr />
                            </div>
                            <div class="col-lg-12">
                                <div class="col-lg-3">
                                    <b>Zip Code :- </b>
                                </div>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lbl_zip" Text='<%# Eval("int_zip_code") %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                                <hr />
                            </div>
                            <div class="col-lg-12">
                                <div class="col-lg-3">
                                    <b>Telephone(P) :- </b>
                                </div>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lbl_telephone" Text='<%# Eval("str_telephone_p") %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                                <hr />
                            </div>
                            <div class="col-lg-12">
                                <div class="col-lg-3">
                                    <b>Contact(P) :- </b>
                                </div>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lbl_contact_p" Text='<%# Eval("str_contact_1_p") %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                                <hr />
                            </div>
                            <div class="col-lg-12">
                                <div class="col-lg-3">
                                    <b>Telephone(S) :- </b>
                                </div>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lbl_tele_s" Text='<%# Eval("str_telephone_s") %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                                <hr />
                            </div>
                            <div class="col-lg-12">
                                <div class="col-lg-3">
                                    <b>Contact(S) :- </b>
                                </div>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lbl_contect_2" Text='<%# Eval("str_contact_2_s") %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                                <hr />
                            </div>
                            <div class="col-lg-12">
                                <div class="col-lg-3">
                                    <b>Email(S) :- </b>
                                </div>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lbl_email_s" Text='<%# Eval("str_email_id_s") %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                                <hr />
                            </div>
                            <div class="col-lg-12">
                                <div class="col-lg-3">
                                    <b>Web Address :- </b>
                                </div>
                                <div class="col-lg-9">
                                    <asp:Label runat="server" ID="lbl_web_address" Text='<%# Eval("str_web_address") %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                                <hr />
                            </div>
                        </ul>
                        <input type="hidden" name="cmd" value="_cart" />
                        <input type="hidden" name="add" value="1" />
                        <input type="hidden" name="w3ls_item" value="Snow Blower" />
                        <input type="hidden" name="amount" value="540.00" />
                        <br />
                    </div>
                    <div class="clearfix"></div>
                    <hr />

                    <br />

                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <%-- </ItemTemplate>
            </asp:Repeater>--%>
        <div class="clearfix">
        </div>

        <div class="recommend" style="margin-top: 2em;">
            <h3 class="w3ls-title">Retailer Offers </h3>
            <script>
                $(document).ready(function () {
                    $("#owl-demo5").owlCarousel({

                        autoPlay: 3000, //Set AutoPlay to 3 seconds

                        items: 4,
                        itemsDesktop: [640, 5],
                        itemsDesktopSmall: [414, 4],
                        navigation: true

                    });

                });
            </script>
            <div id="owl-demo5" class="owl-carousel">
                <asp:Repeater runat="server" ID="rep_other">
                    <ItemTemplate>
                        <div class="item">
                            <div class="glry-w3agile-grids agileits">
                                <div class="new-tag">
                                    <h6>
                                        <asp:Label runat="server" ID="lbl_dec" Text='<%# Eval("dec_discount_amount")+"%" %>'></asp:Label>
                                        <br>
                                        Off</h6>
                                </div>
                                <a href="<%#  ResolveUrl ( string.Format("~/offer/{0}/{1}",Eval("str_offer_name").ToString().ToLower().Replace(" ","-").Replace("%","percantage")   ,  Eval("int_offer_id"))) %>">
                                    <%--<img src="images/e2.png" alt="img">--%>
                                    <img src='<%# ResolveUrl( "~/Admin/offer_image/" + Eval("str_img")) %>' class="img-responsive" alt="" />
                                </a>
                                <div class="view-caption agileits-w3layouts">
                                    <h4><a href="<%#  ResolveUrl ( string.Format("~/offer/{0}/{1}",Eval("str_offer_name").ToString().ToLower().Replace(" ","-").Replace("%","percantage")   ,  Eval("int_offer_id"))) %>">
                                        <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("str_offer_name") %>'></asp:Label></a></h4>
                                    <%--<p>
                                            <asp:Label runat="server" ID="lbl_details" Text='<%# Eval("str_offer_details") %>'></asp:Label>
                                        </p>--%>
                                    <%--  <h5>
                                            <asp:Label runat="server" ID="lbl_discount" Text='<%# Eval("dec_discount_amount") +"%"%>'></asp:Label></h5>--%>
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Audio speaker" />
                                    <input type="hidden" name="amount" value="100.00" />
                                    <a href="<%#  ResolveUrl ( string.Format("~/offer/{0}/{1}",Eval("str_offer_name").ToString().ToLower().Replace(" ","-").Replace("%","percantage")   ,  Eval("int_offer_id"))) %>" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>View Offer</a>
                                    <%--<button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>View Offer</button>--%>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <% if (rep_other.Items.Count == 0)
                   { %>
                <p>Sorry ! no offer found.</p>
                <%} %>
            </div>
        </div>
    </div>

    <div class="modal fade" id="rating" role="dialog">
        <div class="modal-dialog" style="width: 82%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Rating Review</h4>
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
                                        <label>Rating</label>
                                        <asp:DropDownList runat="server" ID="ddl_rate" CssClass="form-control bfh-states">
                                            <asp:ListItem Text="-- Rating --" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2" Value="2"> </asp:ListItem>
                                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="4" Value="4"> </asp:ListItem>
                                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Rating" ControlToValidate="ddl_rate" ValidationGroup="rating" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                                        <%--<div class="row">
                                                <div class="rating">
                                                <input id="txt_rate" type="text" class="rating rating5" value="1" runat="server" />
                                                    <input id="input-21e" value="0" type="number" class="rating" min="0" max="5" step="0.5" data-size="xs">
                                                    <asp:HiddenField ID="hdfRatingValue" runat="server" />
                                                </div>
                                            </div>--%>
                                    </div>
                                    <div class="clearfix">
                                    </div>

                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Review </label>
                                            <textarea id="txt_review" class="form-control" runat="server" placeholder="Review" maxlength="500"></textarea>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Valid Review" ControlToValidate="txt_review" ValidationGroup="rating" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                </div>

                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->

                            <div class="clearfix"></div>

                            <div class="modal-footer">
                                <asp:LinkButton runat="server" ID="lnk_rating" ValidationGroup="rating" CssClass="btn btn-success" CausesValidation="true" OnClick="lnk_rating_Click">Rating</asp:LinkButton>
                                <%--<asp:LinkButton runat="server" ValidationGroup="active" ID="lnk_active_status" CssClass="btn btn-success" OnClick="lnk_active_status_Click"> Active</asp:LinkButton>--%>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                            <div runat="server" id="lblmess"></div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="lnk_rating" />
                        </Triggers>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>
</asp:Content>
