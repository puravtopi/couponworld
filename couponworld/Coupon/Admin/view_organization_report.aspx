<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="view_organization_report.aspx.cs" Inherits="Coupon.Admin.view_organization_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Organization Report
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">
    <div class="box">
        <div class="box-body">
            <asp:UpdatePanel runat="server" ID="upMain">
                <ContentTemplate>


                    <div class="form-inline">
                        <div class="col-lg-4">
                            <asp:DropDownList runat="server" ID="ddl_state" CssClass="form-control" Width="100%" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-lg-4">
                            <asp:DropDownList runat="server" ID="ddl_city" CssClass="form-control" Width="100%" OnSelectedIndexChanged="ddl_city_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-lg-3">
                            <input type="text" runat="server" id="txt_zipcode" class="form-control" style="Width: 100%" placeholder="Search By Zip Code" />
                        </div>
                        <div class="clearfix"></div>
                        <br />
                        <div class="col-lg-4">
                            <input type="text" runat="server" id="txt_org_name" class="form-control" style="Width: 100%" placeholder="Search By Organization Name" />
                        </div>
                        <div class="col-lg-4">
                            <input type="text" runat="server" id="txt_org_no" class="form-control" style="Width: 100%" placeholder="Search By Organization Number" />
                        </div>
                        <div class="col-lg-3">
                            <asp:DropDownList runat="server" ID="ddl_type" CssClass="form-control" Width="100%" OnSelectedIndexChanged="ddl_type_SelectedIndexChanged"></asp:DropDownList>
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
                    <%--<asp:LinkButton ID="lnk_del" runat="server" CommandArgument='<%# Eval("int_organization_id") %>' OnClick="lnk_del_Click" OnClientClick="return confirm('Are you sure you want to delete.?')">Delete selected</asp:LinkButton></td>
                                <br />--%>
                    <asp:Repeater ID="rpview" runat="server">
                        <HeaderTemplate>
                            <div style="overflow: auto">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="tbl_data">
                                        <thead>
                                            <tr>
                                                <%--<th style="width: 1%;">
                                                    <asp:CheckBox ID="chkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="chkHeader_CheckedChanged" /></th>--%>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton1" CausesValidation="false" CommandArgument="str_corporate_name" OnClick="lnk_org_name_Click">Corporate Name</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="lnk_org_name" CausesValidation="false" CommandArgument="str_organization_name" OnClick="lnk_org_name_Click">DBA Name</asp:LinkButton></th>
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
                                                    <asp:LinkButton runat="server" ID="LinkButton12" CausesValidation="false" CommandArgument="int_organization_id" OnClick="lnk_org_name_Click">Org No.</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton13" CausesValidation="false" CommandArgument="str_organization_type" OnClick="lnk_org_name_Click">Org Type</asp:LinkButton></th>
                                             <%--   <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton14" CausesValidation="false" CommandArgument="str_share_type" OnClick="lnk_org_name_Click">Fee Type</asp:LinkButton></th>
                                                 <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton15" CausesValidation="false" CommandArgument="int_organization_share" OnClick="lnk_org_name_Click">Org Share</asp:LinkButton></th>
                                               <th>
                                                <asp:LinkButton runat="server" ID="LinkButton16" CausesValidation="false" CommandArgument="str_password" OnClick="lnk_org_name_Click">Password</asp:LinkButton></th>--%>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton17" CausesValidation="false" CommandArgument="str_web_address" OnClick="lnk_org_name_Click">Web Address</asp:LinkButton></th>
                                                <%--<th style="width: 5%;">Action</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <%--  <td>
                                    <asp:CheckBox runat="server" ID="chkDelete" /></td>--%>
                                <td><%# Eval("str_corporate_name") %></td>
                                <td>
                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "int_organization_id") %>' />
                                    <%# Eval("str_organization_name") %></td>
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
                                <td><%# Eval("int_organization_id") %></td>
                                <td><%# Eval("str_organization_type") %></td>
                                <%-- <td><%# Eval("str_share_type") %></td>
                                <td><%# Eval("int_organization_share") %></td>
                               <td><%# Eval("str_password") %></td>--%>
                                <td><%# Eval("str_web_address") %></td>
                                <%-- <td></td>--%>
                                <%--<td>
                                    <a href="<%# "organization_details.aspx?oid="+Eval("int_organization_id") %>" class="btn btn-primary">Edit</a></td>--%>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
    </table>
                            </div>
                            </div>
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

                            <asp:BoundField HeaderText="Corporate Name" DataField="str_corporate_name" />
                            <asp:BoundField HeaderText="Name" DataField="str_organization_name" />
                            <asp:BoundField HeaderText="Address" DataField="str_street_address" />
                            <asp:BoundField HeaderText="Apt Suit" DataField="str_apt_suite" />
                            <asp:BoundField HeaderText="City" DataField="str_city_name" />
                            <asp:BoundField HeaderText="State" DataField="str_short_name" />
                            <asp:BoundField HeaderText="Zip" DataField="int_zip_code" />
                            <asp:BoundField HeaderText="Contact(P)" DataField="str_contact_1_p" />
                            <asp:BoundField HeaderText="Telephone(P)" DataField="str_telephone_p" />
                            <asp:BoundField HeaderText="Email(P)" DataField="str_email_id_p" />
                            <asp:BoundField HeaderText="Contact(S)" DataField="str_contact_2_s" />
                            <asp:BoundField HeaderText="Telephone(S)" DataField="str_telephone_s" />
                            <asp:BoundField HeaderText="Email(S)" DataField="str_email_id_s" />
                            <asp:BoundField HeaderText="Org ID" DataField="int_organization_id" />
                            <asp:BoundField HeaderText="Org Type" DataField="str_organization_type" />
                            <asp:BoundField HeaderText="Share Type" DataField="str_share_type" />
                            <asp:BoundField HeaderText="Org Share" DataField="int_organization_share" />
                            <asp:BoundField HeaderText="Web Address" DataField="str_web_address" />
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
    <div class='container'>
        <div class="form-group">
        </div>
    </div>
</asp:Content>
