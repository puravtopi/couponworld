<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="view_donations.aspx.cs" Inherits="Coupon.Admin.view_donations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    View Donation
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">

    <div class="box">
        <div class="box-body">
            <asp:UpdatePanel runat="server" ID="upMain">
                <ContentTemplate>
                    <div class="form-inline">
                        <div class="col-lg-4">
                            <asp:DropDownList runat="server" ID="ddl_state" CssClass="form-control" Width="100%"></asp:DropDownList>
                        </div>
                        <div class="col-lg-4">
                            <asp:DropDownList runat="server" ID="ddl_city" CssClass="form-control" Width="100%"></asp:DropDownList>
                        </div>
                        <div class="col-lg-3">
                            <input type="text" runat="server" id="txtsearch" class="form-control" placeholder="Search By Name" style="width: 100%;" />
                        </div>
                        <div class="clearfix"></div>
                        <br />
                        <div class="col-lg-4">
                            <asp:RadioButtonList runat="server" ID="rbloption" RepeatDirection="Horizontal">
                                <asp:ListItem Text="AND" Value="0" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="OR" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div class="clearfix"></div>
                        <br />
                        <div class="col-lg-3">
                            <asp:Button runat="server" ID="btnsearch" Text="Search" Style="display: inline" CssClass="btn btn-info" OnClick="btnsearch_Click" />
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <br />
                    <asp:LinkButton ID="lnk_del" runat="server" CommandArgument='<%# Eval("int_donation_id") %>' OnClick="lnk_del_Click" OnClientClick="return confirm('Are you sure you want to delete.?')">Delete selected</asp:LinkButton>
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
                                                    <asp:LinkButton runat="server" ID="lnk_org_donation" CausesValidation="false" CommandArgument="str_name" OnClick="lnk_org_donation_Click">Name</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton1" CausesValidation="false" CommandArgument="str_address" OnClick="lnk_org_donation_Click">Address</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton6" CausesValidation="false" CommandArgument="str_city_name" OnClick="lnk_org_donation_Click">City</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton7" CausesValidation="false" CommandArgument="str_short_name" OnClick="lnk_org_donation_Click">State</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton3" CausesValidation="false" CommandArgument="str_message" OnClick="lnk_org_donation_Click">Message</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton2" CausesValidation="false" CommandArgument="str_organization_name" OnClick="lnk_org_donation_Click">Org Name</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton5" CausesValidation="false" CommandArgument="str_amount" OnClick="lnk_org_donation_Click">Amount</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton4" CausesValidation="false" CommandArgument="date_date_time" OnClick="lnk_org_donation_Click">Date</asp:LinkButton></th>
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
                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "int_donation_id") %>' />
                                    <%# Eval("str_name") %></td>
                                <td><%# Eval("str_address") %></td>
                                <td><%# Eval("str_city_name") %></td>
                                <td><%# Eval("str_short_name") %></td>
                                <td><%# Eval("str_message") %></td>
                                <td><%# Eval("str_organization_name") %></td>
                                <td><%# "$"+ Eval("str_amount")  %></td>
                                <td><%# Eval("date_date_time") %></td>
                                <%--<td>
                                    <a href="<%# "audit_details.aspx?auditid="+Eval("int_donation_id") %>" class="btn btn-primary">Edit</a>
                                </td>--%>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
    </table>
                            </div></div>
                        </FooterTemplate>
                    </asp:Repeater>
                    <br />
                    <h4>
                        <asp:Label runat="server" ID="lbl_total"></asp:Label></h4>
                    <% if (rpview.Items.Count > 0)
                       {%>
                    <asp:Button runat="server" ID="btn_export_excel" Text="Export to Excel" OnClick="btn_export_excel_Click" CssClass="btn btn-primary" />
                    <asp:Button runat="server" ID="btn_pdf" Text="Export to Pdf" OnClick="btn_pdf_Click" CssClass="btn btn-primary" />
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
                    <asp:GridView runat="server" ID="gvtemp" AutoGenerateColumns="false" Visible="false">
                        <Columns>
                            <asp:BoundField HeaderText="Name" DataField="str_name" />
                            <asp:BoundField HeaderText="Address" DataField="str_address" />
                            <asp:BoundField HeaderText="City" DataField="str_city_name" />
                            <asp:BoundField HeaderText="State" DataField="str_short_name" />
                            <asp:BoundField HeaderText="Message" DataField="str_message" />
                            <asp:BoundField HeaderText="Org Name" DataField="str_organization_name" />
                            <asp:BoundField HeaderText="Amount" DataField="str_amount" />
                            <asp:BoundField HeaderText="Date" DataField="date_date_time" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btn_export_excel" />
                    <asp:PostBackTrigger ControlID="btn_pdf" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>

</asp:Content>
