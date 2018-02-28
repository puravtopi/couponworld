<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="view_offer.aspx.cs" Inherits="Coupon.Admin.view_offer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Offer Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    <div class="box">
        <div class="box-body">
            <asp:UpdatePanel runat="server" ID="upMain">
                <ContentTemplate>
                    <div class="form-inline">
                        <asp:Button runat="server" ID="btnNew" Text="Add New" CssClass="btn btn-success" OnClick="btnNew_Click" />
                        <br />
                        <br />
                        <div class="col-lg-4">
                            <input type="text" runat="server" id="txtsearch" class="form-control" placeholder="Search" style="width: 100%;" />
                        </div>
                        <asp:Button runat="server" ID="btnsearch" Text="Search" Style="display: inline" CssClass="btn btn-info" OnClick="btnsearch_Click" />
                    </div>
                    <br />
                    <asp:LinkButton ID="lnk_del" runat="server" CommandArgument='<%# Eval("int_offer_id") %>' OnClick="lnk_del_Click" OnClientClick="return confirm('Are you sure you want to delete.?')">Delete selected</asp:LinkButton></td>
                                <br />
                    <asp:Repeater ID="rpview" runat="server">
                        <HeaderTemplate>
                            <div style="overflow: auto">
                                <div class="table-responsive">
                                    <table class="table table-bordered" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 1%;">
                                                    <asp:CheckBox ID="chkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="chkHeader_CheckedChanged" /></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="lnk_offer_name" CausesValidation="false" CommandArgument="str_offer_name" OnClick="lnk_offer_name_Click">Offer Name</asp:LinkButton></th>
                                                <%--<th>Offer Details</th>--%><th>
                                                    <asp:LinkButton runat="server" ID="LinkButton5" CausesValidation="false" CommandArgument="str_category_name" OnClick="lnk_offer_name_Click">Category</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton11" CausesValidation="false" CommandArgument="str_deal_name" OnClick="lnk_offer_name_Click">Deal Type</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton6" CausesValidation="false" CommandArgument="str_discount_type" OnClick="lnk_offer_name_Click">Discount Type</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton12" CausesValidation="false" CommandArgument="dec_original_price" OnClick="lnk_offer_name_Click">Original Amount</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton1" CausesValidation="false" CommandArgument="dec_discount_amount" OnClick="lnk_offer_name_Click">Amount</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton13" CausesValidation="false" CommandArgument="dec_savings" OnClick="lnk_offer_name_Click">Savings</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton3" CausesValidation="false" CommandArgument="date_start_date" OnClick="lnk_offer_name_Click">Start Date</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton4" CausesValidation="false" CommandArgument="date_end_date" OnClick="lnk_offer_name_Click">End Date</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton8" CausesValidation="false" CommandArgument="str_sponsor" OnClick="lnk_offer_name_Click">Sponsor</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton2" CausesValidation="false" CommandArgument="str_retailer_name" OnClick="lnk_offer_name_Click">Retailer</asp:LinkButton></th>
                                                <%--<th>
                                                    <asp:LinkButton runat="server" ID="LinkButton7" CausesValidation="false" CommandArgument="int_retailer_id" OnClick="lnk_offer_name_Click">Retailer ID</asp:LinkButton></th>--%>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton9" CausesValidation="false" CommandArgument="str_name" OnClick="lnk_offer_name_Click">SB Name</asp:LinkButton></th>
                                                <%--<th>
                                                    <asp:LinkButton runat="server" ID="LinkButton10" CausesValidation="false" CommandArgument="int_small_business_id" OnClick="lnk_offer_name_Click">SB ID</asp:LinkButton></th>--%>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton14" CausesValidation="false" CommandArgument="str_limitation" OnClick="lnk_offer_name_Click">Limitation</asp:LinkButton></th>
                                                <th style="width: 15%;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="chkDelete" /></td>
                                <td>
                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "int_offer_id") %>' />
                                    <%# Eval("str_offer_name") %> </td>
                                <%--<td><%# Eval("str_offer_details")  %> </td>--%>
                                <td><%# Eval("str_category_name") %></td>
                                <td><%# Eval("str_deal_name") %></td>
                                <td><%# Eval("str_discount_type") %></td>
                                <td><%# Eval("dec_original_price") %></td>
                                <td><%# Eval("dec_discount_amount") %></td>
                                <td><%# Eval("dec_savings") %></td>
                                <td><%# Eval("date_start_date") %></td>
                                <td><%# Eval("date_end_date") %></td>
                                <td><%# Eval("str_sponsor") %></td>
                                <td><%# Eval("str_retailer_name") %></td>
                                <%--<td><%# Eval("int_retailer_id") %></td>--%>
                                <td><%# Eval("str_name") %></td>
                                <%--<td><%# Eval("int_small_business_id") %></td>--%>
                                <td><%# Eval("str_limitation") %></td>
                                <td>
                                    <a href="<%# "edit_offer.aspx?oid="+Eval("int_offer_id") %>" class="btn btn-primary">Edit</a>
                                    <asp:LinkButton runat="server" ID="lbl_active" CommandArgument='<%# Eval("int_offer_id") %>' OnClick="lbl_active_Click" CssClass="btn btn-success" Visible='<%# Eval("bit_accept").ToString() =="True"?false:true %>'>Active</asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="lbl_deactive" CommandArgument='<%# Eval("int_offer_id") %>' OnClick="lbl_deactive_Click" CssClass="btn btn-danger" Visible='<%# Eval("bit_accept").ToString() =="False"?false:true %>'>Deactive</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
    </table>
                            </div>
                             </div>
                        </FooterTemplate>
                    </asp:Repeater>
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
    <!-- /.box -->
</asp:Content>
