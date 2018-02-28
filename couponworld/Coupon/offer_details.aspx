<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="offer_details.aspx.cs" Inherits="Coupon.offer_details" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <meta property="og:url" content='ViewState["path"]' />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Seva Connect" />
    <meta property="og:description" content="Your description" />
    <%--<meta property="og:image" content="http://localhost:2628/offer_details.aspx?oid=10022/Admin/offer_image/10.jpg" />--%>


    <script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.8";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>


    <link href='<%= ResolveUrl("~/css/owl.carousel.css")%>' rel="stylesheet" type="text/css" media="all" />
    <!-- carousel slider -->

    <script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
    <script src="http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php" type="text/javascript"></script>


    <script src='<%= ResolveUrl("~/js/owl.carousel.js")%>'></script>
    <script src='<%= ResolveUrl("~/js/jquery.flexslider.js")%>'></script>
    <link rel="stylesheet" href='<%= ResolveUrl("~/css/flexslider.css")%>' type="text/css" media="screen" />
    <script>
        // Can also be used with $(document).ready()
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        });
    </script>

    <script src='<%= ResolveUrl("~/js/imagezoom.js") %>'></script>

    <style>
        a:hover,
        a:focus {
            color: #FF5E00;
            text-decoration: underline;
        }
    </style>

    <div class="container">
        <ol class="breadcrumb breadcrumb1">
            <li><a href='<%= ResolveUrl("~/home") %>'>Home</a></li>
            <li><a href='<%= ResolveUrl("~/market-place") %>'>Offers</a></li>
            <li class="active">Offer Details</li>
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
                                            <img src='<%# ResolveUrl("~/Admin/offer_image/" + Eval("str_img")) %>' style="height: 300px; width: 360px;" class="img-responsive" alt="" />
                                        </div>
                                    </ul>


                                </div>
                            </div>
                            <div class="col-md-7 single-top-right">
                                <div class="single-top-right" style="padding-left: 0em;">
                                    <h3 class="item_name">
                                        <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("str_offer_name") %>'></asp:Label></h3>
                                    <%--<p>Processing Time: Item will be shipped out within 2-3 working days. </p>--%>
                                    <div class="single-price">
                                        <span class="w3off">
                                            <a href="#company_modal" data-target="#company_modal" data-toggle="modal">

                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("str_retailer_name") %>'></asp:Label>
                                                <% if (ViewState["sb_id"] != null)
                                                   { %>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("str_name") %>'></asp:Label></span></a>
                                        <% } %>
                                    </div>
                                    <div class="single-rating">
                                        <ul>
                                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                            <li class="rating">20 reviews</li>
                                            <li><a href="#" data-toggle="modal" data-target="#rating" style="display: inline">Add your review</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="single-price">
                                    <ul style="min-height: 30px">
                                        <li>
                                            <%# Eval("dec_discount_amount")+"%" %></><span> Off</span>
                                        </li>
                                    </ul>
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Snow Blower" />
                                    <input type="hidden" name="amount" value="540.00" />
                                    <%--<asp:Button runat="server" ID="btn_buy" CssClass="w3s-cart" OnClick="btn_buy_Click" Text="BUY" />--%>
                                    <asp:LinkButton runat="server" ID="lnk_buy" OnClick="lnk_buy_Click" CssClass="w3ls-cart">BUY</asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="lnk_gift" CssClass="w3ls-cart w3ls-cart-like"><i class="fa fa-heart-o" aria-hidden="true"></i> GIVE AS GIFT</asp:LinkButton>
                                    <br />
                                </div>
                                <div class="clearfix"></div>
                                <hr />

                                <br />
                                <div class="single-rating">
                                    <h4 style="color: #999; font-size: 22px">
                                        <label>
                                            <i class="fa fa-clock-o"></i>
                                            Offer closes in <span id="timer" style="color: #FF5E00;">05:00<span>
                                        </label>
                                    </h4>
                                </div>
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
                            </div>

                            <div class="col-md-6 single-top-right">
                            </div>
                            <div class="clearfix"></div>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <script>
                //window.onload = function () {
                //}
                function ReversCounter() {
                    var deadline = $('#<%= hidendtime.ClientID%>').val();

                    var t = Date.parse(deadline) - Date.parse(new Date());

                    var seconds = Math.floor((t / 1000) % 60);
                    var minutes = Math.floor((t / 1000 / 60) % 60);
                    var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
                    var days = Math.floor(t / (1000 * 60 * 60 * 24));

                    var day = days;
                    var hr = hours;
                    var min = minutes;
                    var sec = seconds;
                    setInterval(function () {

                        document.getElementById("timer").innerHTML = day + " : " + hr + " : " + min + " : " + sec;
                        sec--;
                        if (sec == -1) {
                            min--;
                            sec = 59;
                            if (min == -1) {
                                hr--;
                                min = 59;
                                if (hr == -1) {
                                    hr = 23;
                                    day--;
                                    if (day == -1) {
                                        alert('time up');
                                    }
                                }
                            }
                        }
                    }, 1000);
                }
            </script>

            <!-- collapse-tabs -->
            <div class="collpse tabs">
                <h3 class="w3ls-title">About this item</h3>
                <div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <i class="fa fa-file-text-o fa-icon" aria-hidden="true"></i>Description <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span><i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                <asp:Label runat="server" ID="lbl_details" Text='<%# Eval("str_offer_details") %>'></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                            <h4 class="panel-title">
                                <a class="collapsed pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <i class="fa fa-check-square-o fa-icon" aria-hidden="true"></i>reviews (5) <span class="fa fa-angle-down fa-arrow" aria-hidden="true"></span><i class="fa fa-angle-up fa-arrow" aria-hidden="true"></i>
                                </a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                            <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- //collapse -->

            <!-- recommendations -->
            <div class="recommend">
                <h3 class="w3ls-title">Other Offers </h3>
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
                                <div class="glry-w3agile-grids agileits" >
                                    <div class="new-tag">
                                        <h6>
                                            <asp:Label runat="server" ID="lbl_dec" Text='<%# Eval("dec_discount_amount")+"%" %>'></asp:Label>
                                            <br>
                                            Off</h6>
                                    </div>
                                    <a href="<%#  ResolveUrl (string.Format("~/offer/{0}/{1}",Eval("str_offer_name").ToString().ToLower().Replace(" ","-").Replace("%","percantage")   ,  Eval("int_offer_id"))) %>">
                                        <%--<img src="images/e2.png" alt="img">--%>
                                        <img src='<%# ResolveUrl("~/Admin/offer_image/" + Eval("str_img")) %>' class="img-responsive" alt="" style="height: 170px;" />
                                    </a>
                                    <div class="view-caption agileits-w3layouts">
                                        <h4><a href="<%#  ResolveUrl(string.Format("~/offer/{0}/{1}",Eval("str_offer_name").ToString().ToLower().Replace(" ","-").Replace("%","percantage")   ,  Eval("int_offer_id"))) %>">
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

                                        <a href="<%#  ResolveUrl(string.Format("~/offer/{0}/{1}",Eval("str_offer_name").ToString().ToLower().Replace(" ","-").Replace("%","percantage")   ,  Eval("int_offer_id"))) %>" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>View Offer</a>
                                        <%--<button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>View Offer</button>--%>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="company_modal" role="dialog">
        <div class="modal-dialog" style="width: 82%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Retailer</h4>
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
                                        <div class=" col-lg-2">
                                            <div class="form-group">

                                                <asp:Image ID="img" runat="server" Height="100px" Width="100px" />
                                            </div>
                                        </div>

                                        <div class=" col-lg-6">
                                            <div class="form-group">
                                                <h2 style="font-size: 35px">
                                                    <asp:Label runat="server" ID="lbl_cname"></asp:Label>

                                                </h2>
                                                <br />
                                                <asp:Label runat="server" ID="lbl_name"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>


                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Address:-</label>
                                                <asp:Label runat="server" ID="lbl_add"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>City :-</label>
                                                <asp:Label runat="server" ID="lbl_city"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>State :-</label>
                                                <asp:Label runat="server" ID="lbl_state"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Zip Code:-</label>
                                                <asp:Label runat="server" ID="lbl_zip"></asp:Label>
                                            </div>
                                        </div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Telephone(P) :-</label>
                                                <asp:Label runat="server" ID="lbl_tele_p"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Retailer Type :-</label>
                                                <asp:Label runat="server" ID="lbl_type"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Contact(P):-</label>
                                                <asp:Label runat="server" ID="lbl_contact_p"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Contact(S):-</label>
                                                <asp:Label runat="server" ID="lbl_contact_s"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Telephone(S) :-</label>
                                                <asp:Label runat="server" ID="lbl_tele_s"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Email :-</label>
                                                <asp:Label runat="server" ID="lbl_email"></asp:Label>
                                            </div>
                                        </div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Email(S):-</label>
                                                <asp:Label runat="server" ID="lbl_email_s"></asp:Label>
                                            </div>
                                        </div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Web Address:-</label>
                                                <asp:Label runat="server" ID="lbl_web"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->

                            </div>

                            <div class="modal-footer">

                                <%--<asp:LinkButton runat="server" ValidationGroup="active" ID="lnk_active_status" CssClass="btn btn-success" OnClick="lnk_active_status_Click"> Active</asp:LinkButton>--%>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
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
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Valid Review" ControlToValidate="txt_review" ValidationGroup="rating" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
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


    <script src='<%= ResolveUrl("~/js/jquery.menu-aim.js")  %>'> </script>
    <script src='<%= ResolveUrl("~/js/main.js")  %>'></script>
    <!-- Resource jQuery -->

</asp:Content>
