<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="view_transaction.aspx.cs" Inherits="Coupon.Admin.view_transaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    View Transaction
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">
    <script>

        $(document).ready(function () {

            $('#datetimepicker1').datetimepicker({ format: 'MM/DD/YY' });
            $('#datetimepicker2').datetimepicker({ format: 'MM/DD/YY' });

        });


    </script>

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
                    <asp:LinkButton ID="lnk_del" runat="server" CommandArgument='<%# Eval("int_trans_id") %>' OnClick="lnk_del_Click" OnClientClick="return confirm('Are you sure you want to delete.?')">Delete selected</asp:LinkButton>
                    <br />
                    <asp:Repeater ID="rpview" runat="server">
                        <HeaderTemplate>
                            <div style="overflow: auto">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="tbl_data" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 1%;">
                                                    <asp:CheckBox ID="chkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="chkHeader_CheckedChanged" /></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="lnk_trans_name" CausesValidation="false" CommandArgument="date_trans_date" OnClick="lnk_trans_name_Click">Date</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton1" CausesValidation="false" CommandArgument="time_trans_time" OnClick="lnk_trans_name_Click">Time</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton2" CausesValidation="false" CommandArgument="str_first_name" OnClick="lnk_trans_name_Click">Consumers</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton3" CausesValidation="false" CommandArgument="str_retailer_name" OnClick="lnk_trans_name_Click">Retailer Name</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton5" CausesValidation="false" CommandArgument="str_retailer_name" OnClick="lnk_trans_name_Click">Small Business Name</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton4" CausesValidation="false" CommandArgument="str_name" OnClick="lnk_trans_name_Click">Offer Name</asp:LinkButton></th>
                                                <%--<th style="width: 10%;">Action</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="chkDelete" /></td>
                                <td>
                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "int_trans_id") %>' />
                                    <%# Eval("date_trans_date") %></td>
                                <td><%# Eval("time_trans_time")  %></td>
                                <td><%# Eval("str_first_name") %></td>
                                <td><%# Eval("str_retailer_name") %></td>
                                <td><%# Eval("str_name") %></td>
                                <td><%# Eval("str_offer_name") %></td>
                                <%-- <td></td>--%>
                                <%--<td>
                                                <a href="<%# "country_details.aspx?cid="+Eval("int_country_id") %>" class="btn btn-primary">Edit</a>
                                            </td>--%>
                                <%--                        <td>
                            <%# Eval("bit_isactive").ToString().ToLower()=="true"?"Yes":"No"   %>
                        </td>--%>
                                <%--<td>
                            <asp:Button runat="server" ID="btnStatus" CommandArgument='<%# Eval("bit_isactive") +","+Eval("int_comp_id")  %>' Text='<%# Eval("bit_isactive").ToString().ToLower()=="true"?"Click to Disable":"Click to Enable"   %>' OnClick="btnStatus_Click" CssClass="btn btn-primary" />
                        </td>--%>
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


    <!-- /.box -->

</asp:Content>
