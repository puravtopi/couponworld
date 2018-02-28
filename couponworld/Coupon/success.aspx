<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/other.Master" CodeBehind="success.aspx.cs" Inherits="Coupon.success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="<%= ResolveUrl("~/css/owl.carousel.css")%>'" rel="stylesheet" type="text/css" media="all" />
    <!-- carousel slider -->

    <script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
    <script src="http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php" type="text/javascript"></script>


    <script src='<%= ResolveUrl("js/owl.carousel.js")%>'></script>
    <div class="container">
        <h2 style="color: red; text-align: center">
            <p>Thanks for Donation!!!</p>
        </h2>
        <br />

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
                            <div class="glry-w3agile-grids agileits">
                                <div class="new-tag">
                                    <h6>
                                        <asp:Label runat="server" ID="lbl_dec" Text='<%# Eval("dec_discount_amount")+"%" %>'></asp:Label>
                                        <br>
                                        Off</h6>
                                </div>
                                <a href="<%#  ResolveUrl (string.Format("~/offer/{0}/{1}",Eval("str_offer_name").ToString().ToLower().Replace(" ","-").Replace("%","percantage")   ,  Eval("int_offer_id"))) %>">
                                    <%--<img src="images/e2.png" alt="img">--%>
                                    <img src='<%# ResolveUrl("~/Admin/offer_image/" + Eval("str_img")) %>' class="img-responsive" alt="" />
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
                                    <a href="<%# "offer_details.aspx?oid="+Eval("int_offer_id") %>" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>View Offer</a>
                                    <%--<button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>View Offer</button>--%>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

    </div>

    <script src='<%= ResolveUrl("~/js/jquery.menu-aim.js")  %>'> </script>
    <script src='<%= ResolveUrl("~/js/main.js")  %>'></script>
    <!-- Resource jQuery -->
</asp:Content>
