<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="view_company.aspx.cs" Inherits="Coupon.Admin.view_company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Company Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">

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

                    <asp:LinkButton ID="lnk_del" runat="server" CommandArgument='<%# Eval("int_company_id") %>' OnClick="lnk_del_Click" OnClientClick="return confirm('Are you sure you want to delete.?')">Delete selected</asp:LinkButton></td>
                                <br />
                    <asp:Repeater ID="rpview" runat="server">
                        <HeaderTemplate>
                            <div style="overflow: auto">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="tbl_data">
                                        <thead>
                                            <tr>
                                                <th style="width: 1%;">
                                                    <asp:CheckBox ID="chkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="chkHeader_CheckedChanged" /></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton1" CausesValidation="false" CommandArgument="str_corporate_name" OnClick="lnk_org_name_Click">Corporate Name</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="lnk_org_name" CausesValidation="false" CommandArgument="str_company_name" OnClick="lnk_org_name_Click">DBA Name</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton5" CausesValidation="false" CommandArgument="str_street_address" OnClick="lnk_org_name_Click">Address</asp:LinkButton></th>
                                                <%--<th>
                                                    <asp:LinkButton runat="server" ID="LinkButton16" CausesValidation="false" CommandArgument="str_apt_suite" OnClick="lnk_org_name_Click">Apt</asp:LinkButton></th>--%>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton3" CausesValidation="false" CommandArgument="str_city_name" OnClick="lnk_org_name_Click">City</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton4" CausesValidation="false" CommandArgument="str_short_name" OnClick="lnk_org_name_Click">State</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton9" CausesValidation="false" CommandArgument="int_zip_code" OnClick="lnk_org_name_Click">Zip</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton7" CausesValidation="false" CommandArgument="str_contact_1_p" OnClick="lnk_org_name_Click">Contact(P)</asp:LinkButton>
                                                </th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton6" CausesValidation="false" CommandArgument="str_telephone_p" OnClick="lnk_org_name_Click">Telephone(P)</asp:LinkButton>
                                                </th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton2" CausesValidation="false" CommandArgument="str_email_id_p" OnClick="lnk_org_name_Click">Email(P)</asp:LinkButton></th>

                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton8" CausesValidation="false" CommandArgument="str_contact_2_s" OnClick="lnk_org_name_Click">Contact(s)</asp:LinkButton>
                                                </th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton10" CausesValidation="false" CommandArgument="str_telephone_s" OnClick="lnk_org_name_Click">Telephone(S)</asp:LinkButton>
                                                </th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton11" CausesValidation="false" CommandArgument="str_email_id_s" OnClick="lnk_org_name_Click">Email(S)</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton12" CausesValidation="false" CommandArgument="int_company_id" OnClick="lnk_org_name_Click">Company No.</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton13" CausesValidation="false" CommandArgument="str_company_type" OnClick="lnk_org_name_Click">Company Type</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton14" CausesValidation="false" CommandArgument="str_share_type" OnClick="lnk_org_name_Click">Share Type</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton15" CausesValidation="false" CommandArgument="int_organization_share" OnClick="lnk_org_name_Click">Mrkt Fee</asp:LinkButton></th>
                                                <%--<th>
                                                <asp:LinkButton runat="server" ID="LinkButton16" CausesValidation="false" CommandArgument="str_password" OnClick="lnk_org_name_Click">Password</asp:LinkButton></th>--%>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton17" CausesValidation="false" CommandArgument="str_web_address" OnClick="lnk_org_name_Click">Web Address</asp:LinkButton></th>
                                                <th style="width: 5%;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="chkDelete" /></td>
                                <td><%# Eval("str_corporate_name") %></td>
                                <td>
                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "int_company_id") %>' />
                                    <%# Eval("str_company_name") %></td>
                                <td><%# Eval("str_street_address") %></td>
                                <%--<td><%# Eval("str_apt_suite") %></td>--%>
                                <td><%# Eval("str_city_name") %></td>
                                <td><%# Eval("str_short_name") %></td>
                                <td><%# Eval("int_zip_code") %></td>
                                <td><%# Eval("str_contact_1_p") %></td>
                                <td><%# Eval("str_telephone_p") %></td>
                                <td><%# Eval("str_email_id_p") %></td>
                                <td><%# Eval("str_contact_2_s") %></td>
                                <td><%# Eval("str_telephone_s") %></td>
                                <td><%# Eval("str_email_id_s") %></td>
                                <td><%# Eval("int_company_id") %></td>
                                <td><%# Eval("str_company_type") %></td>
                                <td><%# Eval("str_share_type") %></td>
                                <td><%# Eval("int_organization_share") %></td>
                                <%--<td><%# Eval("str_password") %></td>--%>
                                <td><%# Eval("str_web_address") %></td>
                                <%-- <td></td>--%>
                                <td>
                                    <a href="<%# "edit_company.aspx?cid="+Eval("int_company_id") %>" class="btn btn-primary">Edit</a>
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

</asp:Content>
