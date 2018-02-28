<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="view_retailer.aspx.cs" Inherits="Coupon.view_retailer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all" />
    <!-- carousel slider -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

    <div class="products" style="padding: 0em 0;">
        <div class="container">

            <!-- breadcrumbs -->
            <ol class="breadcrumb breadcrumb1">
                <li><a href='<%= ResolveUrl("~/home") %>'>Home</a></li>
                <li class="active">Merchants</li>
            </ol>
            <div class="clearfix"></div>
            <!-- //breadcrumbs -->
            <div class="col-md-9 product-w3ls-right">


                <asp:UpdatePanel runat="server" ID="upMain" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="products-row">
                            <asp:Repeater runat="server" ID="rpview">
                                <ItemTemplate>
                                    <div class="col-md-4 product-grids" style="margin-top: 1em;">
                                        <div class="agile-products" style="height: 300px; width: 260px;">

                                            <a href="<%#  ResolveUrl(string.Format("~/retailer/{0}/{1}",Eval("str_corporate_name").ToString().ToLower().Replace(" ","-").Replace("&","and").Replace(".",""),  Eval("int_retailer_id"))) %>">
                                                <%--  <a href="<%# "retailer_details.aspx?rid="+Eval("int_retailer_id") %>">--%>
                                                <img src='<%# "../Admin/retailer_logo/" + Eval("str_logo_img") %>' class="img-responsive" alt="" style="height: 170px;" />
                                                <div class="agile-product-text">
                                                    <h5><a href="<%#  ResolveUrl(string.Format("~/retailer/{0}/{1}",Eval("str_corporate_name").ToString().ToLower().Replace(" ","-").Replace("&","and").Replace(".",""),  Eval("int_retailer_id"))) %>">
                                                        <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("str_corporate_name") %>'></asp:Label></a></h5>
                                                    <h6>
                                                        <asp:Label runat="server" ID="lbl_dis" Text='<%# Eval("str_retailer_name")%>'></asp:Label></h6>
                                                    <input type="hidden" name="cmd" value="_cart" />
                                                    <input type="hidden" name="add" value="1" />
                                                    <input type="hidden" name="w3ls_item" value="Audio speaker" />
                                                    <input type="hidden" name="amount" value="100.00" />
                                                    <br />
                                                    <i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;<%# Eval("str_city_name") %> , <%# Eval("str_state_name") %>
                                                    <a href='<%#  ResolveUrl(string.Format("~/retailer/{0}/{1}",Eval("str_corporate_name").ToString().ToLower().Replace(" ","-").Replace("&","and").Replace(".",""),  Eval("int_retailer_id"))) %>' class="w3ls-cart pw3ls-cart"><i class="" aria-hidden="true"></i>View Merchants</a>
                                                    <%--<button type="submit" class="w3ls-cart pw3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>View Offer</button>--%>
                                                </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <% if (rpview.Items.Count == 0)
                               { %>
                            <p>Sorry ! No Data Found</p>
                            <%} %>
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

                        <!-- //add-products -->
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
            <div class="col-md-3 rsidebar">
                <div class="rsidebar-top" style="padding: 3em;">
                    <div class="slider-left">
                        <h4>Filter By</h4>
                        <div class="row row1 scroll-pane">
                            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                <ContentTemplate>
                                    <asp:DropDownList runat="server" ID="ddl_state" CssClass="form-control bfh-states" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    <br />

                                    <asp:DropDownList runat="server" ID="ddl_city" CssClass="form-control bfh-states"></asp:DropDownList>
                                    <br />
                                    <asp:DropDownList runat="server" ID="ddl_type" CssClass="form-control bfh-states"></asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
                            <asp:Button runat="server" ID="btn_filter" CssClass="btn btn-primary" Text="Filter" OnClick="btn_filter_Click" />
                        </div>


                    </div>


                </div>
                <div class="clearfix"></div>
                <!-- recommendations -->

                <!-- //recommendations -->
            </div>
        </div>
    </div>

</asp:Content>
