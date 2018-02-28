<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_product.ascx.cs" Inherits="Coupon.controls.uc_product" %>
<style type="text/css">
    .checkbox {
        padding-left: 20px;
    }

        .checkbox label {
            display: inline-block;
            vertical-align: middle;
            position: relative;
            padding-left: 5px;
        }

            .checkbox label::before {
                content: "";
                display: inline-block;
                position: absolute;
                width: 17px;
                height: 17px;
                left: 0;
                margin-left: -20px;
                border: 1px solid #cccccc;
                border-radius: 3px;
                background-color: #fff;
                -webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
                -o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
                transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
            }

            .checkbox label::after {
                display: inline-block;
                position: absolute;
                width: 16px;
                height: 16px;
                left: 0;
                top: 0;
                margin-left: -20px;
                padding-left: 3px;
                padding-top: 1px;
                font-size: 11px;
                color: #555555;
            }

        .checkbox input[type="checkbox"] {
            opacity: 0;
            z-index: 1;
        }

            .checkbox input[type="checkbox"]:checked + label::after {
                font-family: "FontAwesome";
                content: "\f00c";
            }

    .checkbox-primary input[type="checkbox"]:checked + label::before {
        background-color: #f44336;
        border-color: #f44336;
    }

    .checkbox-primary input[type="checkbox"]:checked + label::after {
        color: #fff;
    }
</style>

<script>

    function onlyNumbers(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46)
            return false;


        return true;


    }

    function appendDollar(id) {

        var amount = document.getElementById(id).value;
        var decimalval = amount.split(".")[1];



        if (decimalval == null)
            decimalval = ".00"
        else {
            decimalval = "." + decimalval;
            amount = amount.split(".")[0];
        }


        if (trimAll(amount) != "") {
            document.getElementById(id).value = '$' + formatInteger(amount, '###,###,###,###') + decimalval;
        }
    }

    function formatInteger(integer, pattern) {
        var result = '';


        integerIndex = integer.length - 1;
        patternIndex = pattern.length - 1;


        while ((integerIndex >= 0) && (patternIndex >= 0)) {
            var digit = integer.charAt(integerIndex);
            integerIndex--;


            // Skip non-digits from the source integer (eradicate current formatting).
            if ((digit < '0') || (digit > '9')) continue;


            // Got a digit from the integer, now plug it into the pattern.
            while (patternIndex >= 0) {
                var patternChar = pattern.charAt(patternIndex);
                patternIndex--;


                // Substitute digits for '#' chars, treat other chars literally.
                if (digit == '.')
                    break;
                else if (patternChar == '#') {
                    result = digit + result;
                    break;
                }
                else {
                    result = patternChar + result;
                }
            }
        }


        return result;
    }
    function trimAll(sString) {
        while (sString.substring(0, 1) == ' ') {
            sString = sString.substring(1, sString.length);
        }
        while (sString.substring(sString.length - 1, sString.length) == ' ') {
            sString = sString.substring(0, sString.length - 1);
        }
        return sString;
    }

</script>
<div class="products" style="padding: 0em 0;">
    <div class="container">

        <!-- breadcrumbs -->
        <ol class="breadcrumb breadcrumb1">
            <li><a href='<%= ResolveUrl("~/home") %>'>Home</a></li>
            <li class="active">Offer</li>
        </ol>
        <div class="clearfix"></div>
        <!-- //breadcrumbs -->
        <div class="col-md-9 product-w3ls-right" style="color:#F6F6F6">
            <%-- --%>
            <div class="product-top">
                <ul>
                    <li class="dropdown head-dpdn" style="float: left; margin-left: 0px">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: White;">Retailer<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a>
                                <asp:LinkButton runat="server" ID="lnk_all" OnClick="lnk_all_Click">All</asp:LinkButton>
                                <asp:Repeater runat="server" ID="rp_retailer">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="lnk_retailer" CausesValidation="false" CommandArgument='<%# Eval("str_retailer_name") %>' OnClick="lnk_retailer_Click">
                                            <asp:Label runat="server" ID="lbl_retailer" Text='<%# Eval("str_retailer_name") %>'></asp:Label>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </a></li>

                            <%-- <li><a href="#">LG</a></li>
                                <li><a href="#">Sony</a></li>
                                <li><a href="#">Other</a></li>--%>
                        </ul>
                    </li>

                    <li class="dropdown head-dpdn" style="float: left; margin-left: 10px;">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: White;">Filter By<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <asp:LinkButton runat="server" ID="lnk_price" OnClick="lnk_price_Click" CommandArgument="dec_discount_amount">High price</asp:LinkButton>
                            </li>
                            <li>
                                <asp:LinkButton runat="server" ID="LinkButton1" OnClick="lnk_price_Click" CommandArgument="dec_discount_amount">Low price</asp:LinkButton></li>
                            <%--<li><a href="#">Latest</a></li>
                                <li><a href="#">Popular</a></li>--%>
                        </ul>
                    </li>

                    <li class="dropdown head-dpdn" style="float: right;">
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">Retailer<span class="caret"></span></a>--%>
                        <asp:Label runat="server" ID="lbl_total" ForeColor="White"></asp:Label>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <%--<asp:UpdateProgress runat="server" ID="upprogress" AssociatedUpdatePanelID="upMain">
                    <ProgressTemplate>
                        <div class="divWaiting">
                            <asp:Label ID="lblWait" runat="server"
                                Text=" Please wait... " />
                            <asp:Image ID="imgWait" runat="server"
                                ImageAlign="Middle" ImageUrl="~/images/loader.gif" />
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>--%>
            <asp:UpdatePanel runat="server" ID="upMain" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="products-row">
                        <asp:Repeater runat="server" ID="rpview">
                            <ItemTemplate>
                                <div class="col-md-4 product-grids">
                                    <div class="agile-products">
                                        <div class="new-tag">
                                            <h6>
                                                <asp:Label runat="server" ID="lbl_dec" Text='<%# Eval("dec_discount_amount")+"%" %>'></asp:Label><br>
                                                Off</h6>
                                        </div>
                                        <a href="<%#  ResolveUrl ( string.Format("~/offer/{0}/{1}",Eval("str_offer_name").ToString().ToLower().Replace(" ","-").Replace("%","percantage")   ,  Eval("int_offer_id"))) %>">
                                            <img src='<%# ResolveUrl( "~/Admin/offer_image/" + Eval("str_img") )%>' class="img-responsive" alt="" style="height: 170px;" />
                                            <div class="agile-product-text">
                                                <h5><a href="<%#  ResolveUrl ( string.Format("~/offer/{0}/{1}",Eval("str_offer_name").ToString().ToLower().Replace(" ","-").Replace("%","percantage")   ,  Eval("int_offer_id"))) %>">
                                                    <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("str_offer_name").ToString().Length>25 ? Eval("str_offer_name").ToString().Substring(0,24)+"...": Eval("str_offer_name").ToString()  %>'></asp:Label></a></h5>
                                                <h6>
                                                    <asp:Label runat="server" ID="lbl_dis" Text='<%# Eval("dec_discount_amount")+"%" %>'></asp:Label></h6>
                                                <input type="hidden" name="cmd" value="_cart" />
                                                <input type="hidden" name="add" value="1" />
                                                <input type="hidden" name="w3ls_item" value="Audio speaker" />
                                                <input type="hidden" name="amount" value="100.00" />
                                                <%# Eval("date_end_date") %>
                                                <a href="<%#  ResolveUrl ( string.Format("~/offer/{0}/{1}",Eval("str_offer_name").ToString().ToLower().Replace(" ","-").Replace("%","percantage")   ,  Eval("int_offer_id"))) %>" class="w3ls-cart pw3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>View Offer</a>
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


                    <h4>Filter By Price</h4>
                    <div class="row row1 scroll-pane" style="height: 100px">
                        <%-- <input type="text" id="amount" runat="server" style="border: 0; color: #f6931f; font-weight: bold;" />
                        <asp:HiddenField runat="server" ID="hidamt" Value="1-10" />
                        <div id="slider-range"></div>
                        <br />--%>
                        <div class=" col-lg-6">
                            <div class="form-group">
                                <asp:TextBox runat="server" ID="txt_min_price" MaxLength="7" onkeypress="return onlyNumbers(event);" onblur="appendDollar(this.id);" CssClass="form-control" placeholder="Min"></asp:TextBox>
                            </div>
                        </div>
                        <div class=" col-lg-6">
                            <div class="form-group">
                                <asp:TextBox runat="server" ID="txt_max_price" MaxLength="7" onkeypress="return onlyNumbers(event);" onblur="appendDollar(this.id);" CssClass="form-control" placeholder="Max"></asp:TextBox>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class=" col-lg-12">
                            <asp:Button runat="server" ID="btnsave" CssClass="btn btn-primary" Text="Filter" OnClick="btnsave_Click" />
                            <asp:Button runat="server" ID="btn_clear" CssClass="btn btn-primary" Text="Clear" OnClick="btn_clear_Click" />
                        </div>
                    </div>

                    <div class="slider-left">
                        <h4>Filter By Category</h4>
                        <div class="row row1 scroll-pane">
                            <div class="checkbox checkbox-primary">
                                <asp:CheckBoxList runat="server" CssClass="styled" ID="chk_category" DataTextField="str_category_name" DataValueField="int_category_id" OnSelectedIndexChanged="chk_category_SelectedIndexChanged" AutoPostBack="true">
                                </asp:CheckBoxList>
                            </div>
                        </div>
                    </div>

                    <div class="sidebar-row">
                        <h4>DISCOUNTS TYPE</h4>
                        <div class="row row1 scroll-pane">
                            <div class="checkbox checkbox-primary">
                                <asp:CheckBoxList runat="server" CssClass="styled" ID="chk_discount_type" DataTextField="str_discount_type" DataValueField="int_discount_type_id" OnSelectedIndexChanged="chk_discount_type_SelectedIndexChanged" AutoPostBack="true">
                                </asp:CheckBoxList>
                            </div>

                        </div>
                    </div>

                </div>


            </div>
            <div class="clearfix"></div>
            <!-- recommendations -->

            <!-- //recommendations -->
        </div>
    </div>
</div>



