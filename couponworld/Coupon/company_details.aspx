<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="company_details.aspx.cs" Inherits="Coupon.company_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <ol class="breadcrumb breadcrumb1">
            <li><a href='<%= ResolveUrl("~/home") %>'>Home</a></li>
            <li><a href='<%= ResolveUrl("~/companys") %>'>Company</a></li>
            <li class="active">Company Details</li>
        </ol>
        <div class="clearfix"></div>
    </div>
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
                                            <img src='<%# ResolveUrl( "~/Admin/company_logo/" + Eval("str_logo_img")) %>' style="height: 300px; width: 360px;" class="img-responsive" alt="" />
                                        </div>
                                    </ul>
                                </div>
                                <br />
                                <div class="clearfix"></div>
                                <hr />
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
                                <div class="clearfix"></div>
                                <hr />
                                <div class="single-price">
                                    <%--<button class="w3ls-cart w3ls-cart-like"><i class="fa fa-heart-o" aria-hidden="true"></i>Add to Wishlist</button>--%>

                                    <%--<a href="#" data-toggle="modal" data-target="#company_modal" class="w3ls-cart w3ls-cart-like"><i class="fa fa-gift" aria-hidden="true"></i>Donation</a>--%>
                                </div>
                            </div>
                            <div class="col-md-7 single-top-right">
                                <div class="single-top-right" style="padding-left: 0em;">
                                    <h3 class="item_name">
                                        <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("str_corporate_name") %>'></asp:Label></h3>
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;<%# Eval("str_city_name") %> , <%# Eval("str_state_name") %>


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
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("str_company_name") %>'></asp:Label>
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

</asp:Content>
