<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="view_company.aspx.cs" Inherits="Coupon.view_company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="products" style="padding: 0em 0;">
        <div class="container">

            <!-- breadcrumbs -->
            <ol class="breadcrumb breadcrumb1">
                <li><a href='<%= ResolveUrl("~/home") %>'>Home</a></li>
                <li class="active">Company</li>
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
                                            <a href="<%#  ResolveUrl ( string.Format("~/company/{0}/{1}",Eval("str_corporate_name").ToString().ToLower().Replace(" ","-").Replace(".","")   ,  Eval("int_company_id"))) %>">
                                                <img src='<%# ResolveUrl("~/Admin/company_logo/" + Eval("str_logo_img")) %>' class="img-responsive" alt="" style="height: 170px;" />
                                                <div class="agile-product-text">
                                                    <h5><a href="<%#  ResolveUrl ( string.Format("~/company/{0}/{1}",Eval("str_corporate_name").ToString().ToLower().Replace(" ","-").Replace(".","")   ,  Eval("int_company_id"))) %>">
                                                        <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("str_corporate_name") %>'></asp:Label></a></h5>
                                                    <h6>
                                                        <asp:Label runat="server" ID="lbl_dis" Text='<%# Eval("str_company_name")%>'></asp:Label></h6>
                                                    <input type="hidden" name="cmd" value="_cart" />
                                                    <input type="hidden" name="add" value="1" />
                                                    <input type="hidden" name="w3ls_item" value="Audio speaker" />
                                                    <input type="hidden" name="amount" value="100.00" />
                                                    <br />
                                                    <i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;<%# Eval("str_city_name") %> , <%# Eval("str_state_name") %>
                                                    <a href="<%#  ResolveUrl ( string.Format("~/company/{0}/{1}",Eval("str_corporate_name").ToString().ToLower().Replace(" ","-").Replace(".",""),Eval("int_company_id"))) %>" class="w3ls-cart pw3ls-cart"><i class="" aria-hidden="true"></i>View Company</a>
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
