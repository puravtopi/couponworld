<%@ Page Title="" Language="C#" MasterPageFile="~/small_business.Master" AutoEventWireup="true" CodeBehind="view_deals_sb.aspx.cs" Inherits="Coupon.view_deals_sb" %>

<%@ Register Src="~/controls/uc_sb_sidebar.ascx" TagPrefix="uc1" TagName="uc_sb_sidebar" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="products">
        <div class="container">
            <div class="col-md-2">
                <uc1:uc_sb_sidebar runat="server" ID="uc_sb_sidebar" />
            </div>
            <div class="col-md-10 product-w3ls">
                <div class="single-top-right col-md-6" style="padding-left: 0em;">
                    <h3 class="item_name">View Offer</h3>
                </div>
                <div class="single-top-right col-md-6">
                    <a href="<%= ResolveUrl("~/deal-details-sb") %>" class="btn btn-active" style="float: right">Add Deals</a>
                </div>
                <div class="clearfix"></div>
                <hr />
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
                                            <a href="<%#  ResolveUrl ( string.Format("~/sb-deal-details/{0}/{1}",Eval("str_offer_name").ToString().ToLower().Replace(" ","-").Replace("%","percantage")   ,  Eval("int_offer_id"))) %>">
                                                <img src='<%# "../Admin/offer_image/" + Eval("str_img") %>' class="img-responsive" alt="" style="height: 170px;" />
                                                <div class="agile-product-text">
                                                    <h5><a href="<%#  ResolveUrl ( string.Format("~/sb-deal-details/{0}/{1}",Eval("str_offer_name").ToString().ToLower().Replace(" ","-").Replace("%","percantage")   ,  Eval("int_offer_id"))) %>">
                                                        <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("str_offer_name") %>'></asp:Label></a></h5>
                                                    <h6>
                                                        <asp:Label runat="server" ID="lbl_dis" Text='<%# Eval("dec_discount_amount")+"%" %>'></asp:Label></h6>
                                                    <input type="hidden" name="cmd" value="_cart" />
                                                    <input type="hidden" name="add" value="1" />
                                                    <input type="hidden" name="w3ls_item" value="Audio speaker" />
                                                    <input type="hidden" name="amount" value="100.00" />
                                                    <a href="<%#  ResolveUrl ( string.Format("~/sb-deal-details/{0}/{1}",Eval("str_offer_name").ToString().ToLower().Replace(" ","-").Replace("%","percantage")   ,  Eval("int_offer_id"))) %>" class="w3ls-cart pw3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Edit</a>
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
                        <% if (rpview.Items.Count == 0)
                           { %>
                        <p><i>Sorry ! no deal found.</i></p>
                        <%} %>
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
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

</asp:Content>
