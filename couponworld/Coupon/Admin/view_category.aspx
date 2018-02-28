<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="view_category.aspx.cs" Inherits="Coupon.Admin.view_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    View Category
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

                    <asp:LinkButton ID="lnk_del" runat="server" CommandArgument='<%# Eval("int_category_id") %>' OnClick="lnk_del_Click" OnClientClick="return confirm('Are you sure you want to delete.?')">Delete selected</asp:LinkButton>
                    <br />
                    <asp:Repeater ID="rpview" runat="server">
                        <HeaderTemplate>
                            <div style="overflow: auto">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="tblCustomers" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 1%;">
                                                    <%--<input type="checkbox" class="header" id="chkHeader" />--%>
                                                    <asp:CheckBox ID="chkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="chkHeader_CheckedChanged" /></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="lnk_org_name" CausesValidation="false" CommandArgument="str_category_name" OnClick="lnk_org_name_Click">Category Name</asp:LinkButton>
                                                </th>

                                                <%--  <th>
                                                <asp:LinkButton runat="server" ID="LinkButton1" CausesValidation="false" CommandArgument="str_region" OnClick="lnk_org_name_Click">Region</asp:LinkButton></th>--%>
                                                <th style="width: 10%;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="chkDelete" /></td>
                                <td>
                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "int_category_id") %>' />

                                    <%# Eval("str_category_name") %></td>
                                <%--<td><%# Eval("str_icon")  %></td>--%>
                                <%-- <td></td>--%>
                                <td>
                                    <a href="<%# "edit_category.aspx?cat_id="+Eval("int_category_id") %>" class="btn btn-primary">Edit</a>
                                </td>
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
</asp:Content>
