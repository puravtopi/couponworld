<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="offer_list.aspx.cs" Inherits="Coupon.offer_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all" />
    <!-- carousel slider -->
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="js/owl.carousel.js"></script>


    <script src="js/jquery-scrolltofixed-min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {

            // Dock the header to the top of the window when scrolled past the banner. This is the default behaviour.

            $('.header-two').scrollToFixed();
            // previous summary up the page.

            var summaries = $('.summary');
            summaries.each(function (i) {
                var summary = $(summaries[i]);
                var next = summaries[i + 1];

                summary.scrollToFixed({
                    marginTop: $('.header-two').outerHeight(true) + 10,
                    zIndex: 999
                });
            });
        });
    </script>
    <!-- //scroll to fixed-->
    <!-- start-smooth-scrolling -->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>

    <!-- smooth-scrolling-of-move-up -->
    <script type="text/javascript">
        $(document).ready(function () {

            var defaults = {
                containerID: 'toTop', // fading element id
                containerHoverID: 'toTopHover', // fading element hover id
                scrollSpeed: 1200,
                easingType: 'linear'
            };

            $().UItoTop({ easingType: 'easeOutQuart' });

        });
    </script>
    <!-- //smooth-scrolling-of-move-up -->
    <!-- the jScrollPane script -->
    <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
    <script type="text/javascript" id="sourcecode">
        $(function () {
            $('.scroll-pane').jScrollPane();
        });
    </script>
    <!-- //the jScrollPane script -->
    <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
    <!-- the mousewheel plugin -->

    <div class="products">
        <div class="container">
            <div class="col-md-9 product-w3ls-right">
                <!-- breadcrumbs -->
                <ol class="breadcrumb breadcrumb1">
                    <li><a href="index.aspx">Home</a></li>
                    <li class="active">Offer</li>
                </ol>
                <div class="clearfix"></div>
                <!-- //breadcrumbs -->
                <%-- --%>
                <div class="product-top">
                    <h4>Offer</h4>

                    <ul>
                        <li class="dropdown head-dpdn">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Filter By<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#"></a></li>
                                <li><a href="#">High price</a></li>
                                <li><a href="#">Latest</a></li>
                                <li><a href="#">Popular</a></li>
                            </ul>
                        </li>
                        <li class="dropdown head-dpdn">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Brands<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Samsung</a></li>
                                <li><a href="#">LG</a></li>
                                <li><a href="#">Sony</a></li>
                                <li><a href="#">Other</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <%-- --%>
                <asp:UpdatePanel runat="server" ID="upMain">
                    <ContentTemplate>
                        <div class="products-row">
                            <asp:Repeater runat="server" ID="rpview">
                                <ItemTemplate>
                                    <div class="col-md-3 product-grids">
                                        <div class="agile-products">
                                            <div class="new-tag">
                                                <h6>
                                                    <asp:Label runat="server" ID="lbl_dec" Text='<%# Eval("dec_discount_amount")+"%" %>'></asp:Label><br>
                                                    Off</h6>
                                            </div>
                                            <a href="<%# "offer_details.aspx?oid="+Eval("int_offer_id") %>">
                                                <img src='<%# "../Admin/offer_image/" + Eval("str_img") %>' class="img-responsive" alt="" />
                                                <div class="agile-product-text">
                                                    <h5><a href="<%# "offer_details.aspx?oid="+Eval("int_offer_id") %>">
                                                        <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("str_offer_name").ToString().Length>10 ? Eval("str_offer_name").ToString().Substring(0,10): Eval("str_offer_name").ToString()  %>'></asp:Label></a></h5>
                                                    <h6>
                                                        <asp:Label runat="server" ID="lbl_dis" Text='<%# Eval("dec_discount_amount")+"%" %>'></asp:Label></h6>
                                                    <%--     <input type="hidden" name="cmd" value="_cart" />
                                                    <input type="hidden" name="add" value="1" />
                                                    <input type="hidden" name="w3ls_item" value="Audio speaker" />
                                                    <input type="hidden" name="amount" value="100.00" />--%>

                                                    <a href="<%# "offer_details.aspx?oid="+Eval("int_offer_id") %>" class="w3ls-cart pw3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>View Offer</a>
                                                    <%--<button type="submit" class="w3ls-cart pw3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>View Offer</button>--%>
                                                </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="clearfix"></div>
                        <br />
                        <br />
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
                        <!-- add-products -->
                        <%--<div class="w3ls-add-grids w3agile-add-products">
                    <a href="#">
                        <h4>TOP 10 TRENDS FOR YOU FLAT <span>20%</span> OFF</h4>
                        <h6>Shop now <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h6>
                    </a>
                </div>--%>
                        <!-- //add-products -->
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
            <div class="col-md-3 rsidebar">
                <div class="rsidebar-top">
                    <div class="slider-left">
                        <h4>Filter By Category</h4>
                        <div class="row row1 scroll-pane">
                            <asp:Repeater runat="server" ID="rp_category">
                                <ItemTemplate>

                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox"><i></i><asp:Label runat="server" ID="lbl_cat" Text='<%# Eval("str_category_name") %>'></asp:Label>
                                    </label>

                                </ItemTemplate>
                            </asp:Repeater>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox" /><i></i>More</label>
                        </div>
                    </div>
                    <%--<div class="sidebar-row">
                        <h4>Electronics</h4>
                        <ul class="faq">
                            <li class="item1"><a href="#">Mobile phones<span class="glyphicon glyphicon-menu-down"></span></a>
                                <ul>
                                    <li class="subitem1"><a href="#">Smart phones</a></li>
                                    <li class="subitem1"><a href="#">Accessories</a></li>
                                    <li class="subitem1"><a href="#">Tabs</a></li>
                                </ul>
                            </li>
                            <li class="item2"><a href="#">Large appliances<span class="glyphicon glyphicon-menu-down"></span></a>
                                <ul>
                                    <li class="subitem1"><a href="#">Refrigerators </a></li>
                                    <li class="subitem1"><a href="#">Washing Machine </a></li>
                                    <li class="subitem1"><a href="#">Kitchen Appliances </a></li>
                                    <li class="subitem1"><a href="#">Air Conditioner</a></li>
                                </ul>
                            </li>
                            <li class="item3"><a href="#">Entertainment<span class="glyphicon glyphicon-menu-down"></span></a>
                                <ul>
                                    <li class="subitem1"><a href="#">Tv & Accessories</a></li>
                                    <li class="subitem1"><a href="#">Digital Camera </a></li>
                                    <li class="subitem1"><a href="#">Computer</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- script for tabs -->
                        <script type="text/javascript">
                            $(function () {

                                var menu_ul = $('.faq > li > ul'),
									   menu_a = $('.faq > li > a');

                                menu_ul.hide();

                                menu_a.click(function (e) {
                                    e.preventDefault();
                                    if (!$(this).hasClass('active')) {
                                        menu_a.removeClass('active');
                                        menu_ul.filter(':visible').slideUp('normal');
                                        $(this).addClass('active').next().stop(true, true).slideDown('normal');
                                    } else {
                                        $(this).removeClass('active');
                                        $(this).next().stop(true, true).slideUp('normal');
                                    }
                                });

                            });
                        </script>
                        <!-- script for tabs -->
                    </div>--%>
                    <div class="sidebar-row">
                        <h4>DISCOUNTS TYPE</h4>
                        <div class="row row1 scroll-pane">
                            <asp:Repeater runat="server" ID="rp_discount">
                                <ItemTemplate>
                                    <label class="checkbox">
                                        <input type="checkbox" name="checkbox"><i></i><asp:Label runat="server" ID="lbl_dis" Text='<%# Eval("str_discount_type") %>'></asp:Label></label>

                                </ItemTemplate>
                            </asp:Repeater>
                            <%--<label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>70% - 60% (5)</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>50% - 40% (7)</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>30% - 20% (2)</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>10% - 5% (5)</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>30% - 20% (7)</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>10% - 5% (2)</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>Other(50)</label>--%>
                        </div>
                    </div>
                    <%--<div class="sidebar-row">
                        <h4>Color</h4>
                        <div class="row row1 scroll-pane">
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox" checked=""><i></i>White</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>Pink</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>Gold</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>Blue</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>Orange</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i> Brown</label>
                        </div>
                    </div>--%>
                </div>
                <%--<div class="related-row">
                    <h4>Related Searches</h4>
                    <ul>
                        <li><a href="products.html">Air conditioner </a></li>
                        <li><a href="products.html">Gaming</a></li>
                        <li><a href="products.html">Monitors</a></li>
                        <li><a href="products.html">Pc </a></li>
                        <li><a href="products.html">Food Processors</a></li>
                        <li><a href="products.html">Oven</a></li>
                        <li><a href="products.html">Purifiers</a></li>
                        <li><a href="products.html">Oven</a></li>
                        <li><a href="products.html">Cleaners</a></li>
                        <li><a href="products.html">Small devices</a></li>
                    </ul>
                </div>--%>
                <%--<div class="related-row">
                    <h4>YOU MAY ALSO LIKE</h4>
                    <div class="galry-like">
                        <a href="single.html">
                            <img src="images/e1.png" class="img-responsive" alt="img"></a>
                        <h4><a href="products.html">Audio speaker</a></h4>
                        <h5>$100</h5>
                    </div>
                </div>--%>
            </div>
            <div class="clearfix"></div>
            <!-- recommendations -->
            <%--<div class="recommend">
                <h3 class="w3ls-title">Our Recommendations </h3>
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
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <div class="new-tag">
                                <h6>20%
                                    <br>
                                    Off</h6>
                            </div>
                            <a href="products1.html">
                                <img src="images/f2.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products1.html">Women Sandal</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$20</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Women Sandal" />
                                    <input type="hidden" name="amount" value="20.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <a href="products.html">
                                <img src="images/e4.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products.html">Digital Camera</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$80</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Digital Camera" />
                                    <input type="hidden" name="amount" value="100.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <div class="new-tag">
                                <h6>New</h6>
                            </div>
                            <a href="products4.html">
                                <img src="images/s1.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products4.html">Roller Skates</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$180</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Roller Skates" />
                                    <input type="hidden" name="amount" value="180.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <a href="products1.html">
                                <img src="images/f1.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products1.html">T Shirt</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$10</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="T Shirt" />
                                    <input type="hidden" name="amount" value="10.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <div class="new-tag">
                                <h6>New</h6>
                            </div>
                            <a href="products6.html">
                                <img src="images/p1.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products6.html">Coffee Mug</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$14</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Coffee Mug" />
                                    <input type="hidden" name="amount" value="14.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <div class="new-tag">
                                <h6>20%
                                    <br>
                                    Off</h6>
                            </div>
                            <a href="products6.html">
                                <img src="images/p2.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products6.html">Teddy bear</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$20</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Teddy bear" />
                                    <input type="hidden" name="amount" value="20.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <a href="products4.html">
                                <img src="images/s2.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products4.html">Football</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$70</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Football" />
                                    <input type="hidden" name="amount" value="70.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <div class="new-tag">
                                <h6>Sale</h6>
                            </div>
                            <a href="products3.html">
                                <img src="images/h1.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products3.html">Wall Clock</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$80</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Wall Clock" />
                                    <input type="hidden" name="amount" value="80.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
            <!-- //recommendations -->
        </div>
    </div>

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
    <!-- //cart-js -->
    <!-- menu js aim -->
    <script src="js/jquery.menu-aim.js"> </script>
    <script src="js/main.js"></script>
    <!-- Resource jQuery -->
    <!-- //menu js aim -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"></script>
    <script src="js/minicart.js"></script>



</asp:Content>
