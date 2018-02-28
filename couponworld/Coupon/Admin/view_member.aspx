<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="view_member.aspx.cs" Inherits="Coupon.Admin.view_member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Consumer Management
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
                    <asp:LinkButton ID="lnk_del" runat="server" CommandArgument='<%# Eval("int_user_id") %>' OnClick="lnk_del_Click" OnClientClick="return confirm('Are you sure you want to delete.?')">Delete selected</asp:LinkButton>
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
                                                    <asp:LinkButton runat="server" ID="lnk_first_name" CausesValidation="false" CommandArgument="str_first_name" OnClick="lnk_first_name_Click">DBA Name</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton4" CausesValidation="false" CommandArgument="str_street_address" OnClick="lnk_first_name_Click">Address</asp:LinkButton></th>
                                                <%--<th>
                                                    <asp:LinkButton runat="server" ID="LinkButton9" CausesValidation="false" CommandArgument="str_apt_suite" OnClick="lnk_first_name_Click">Apt Suite</asp:LinkButton></th>--%>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton5" CausesValidation="false" CommandArgument="str_city_name" OnClick="lnk_first_name_Click">City</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton6" CausesValidation="false" CommandArgument="str_short_name" OnClick="lnk_first_name_Click">State</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton7" CausesValidation="false" CommandArgument="int_zip_code" OnClick="lnk_first_name_Click">Zip Code</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton1" CausesValidation="false" CommandArgument="str_email_id" OnClick="lnk_first_name_Click">Email ID</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton10" CausesValidation="false" CommandArgument="int_user_id" OnClick="lnk_first_name_Click">Consumer ID</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton8" CausesValidation="false" CommandArgument="str_telephone" OnClick="lnk_first_name_Click">Telephone</asp:LinkButton></th>
                                                <th style="width: 1%;">
                                                    <asp:LinkButton runat="server" ID="LinkButton2" CausesValidation="false" CommandArgument="str_gender" OnClick="lnk_first_name_Click">Gender</asp:LinkButton></th>
                                                <th style="width: 8%;">
                                                    <asp:LinkButton runat="server" ID="LinkButton3" CausesValidation="false" CommandArgument="str_date_of_birth" OnClick="lnk_first_name_Click">DOB</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton11" CausesValidation="false" CommandArgument="str_organization_name" OnClick="lnk_first_name_Click">Organization</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton9" CausesValidation="false" CommandArgument="str_company_name" OnClick="lnk_first_name_Click">Company</asp:LinkButton></th>
                                                <%--<th style="width: 12%;">
                                                <asp:Linkbutton runat="server" ID="LinkButton9" CausesValidation="false" CommandArgument="str_password" OnClick="lnk_first_name_Click">Password</asp:LinkButton></th>--%>


                                                <th style="width: 5%;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="chkDelete" /></td>
                                <td>

                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "int_user_id") %>' />
                                    <%# Eval("str_first_name") %>  <%# Eval("str_last_name") %></td>
                                <td><%# Eval("str_street_address") %></td>
                                <%--<td><%# Eval("str_apt_suite") %></td>--%>
                                <td><%# Eval("str_city_name") %></td>
                                <td><%# Eval("str_short_name") %></td>
                                <td><%# Eval("int_zip_code") %></td>
                                <td><%# Eval("str_email_id")  %></td>
                                <td><%# Eval("int_user_id") %></td>
                                <td><%# Eval("str_telephone") %></td>
                                <td><%# Eval("str_gender") %></td>
                                <td><%#Eval("str_date_of_birth", "{0:MM/dd/yy}")%></td>
                                <td><%# Eval("str_organization_name") %></td>
                                <td><%# Eval("str_company_name") %></td>

                                <%-- <td></td>--%>
                                <td>
                                    <a href="<%# "edit_member.aspx?mid="+Eval("int_user_id") %>" class="btn btn-primary">Edit</a>
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
    <%-- <div class="col-md-3">
        <section class="col-lg-12 connectedSortable">
            <!-- Map box -->
            <div class="box box-primary">
                <div class="box-header">

                    <i class="fa fa-map-marker"></i>
                    <h3 class="box-title">Consumer birthdays
                                    </h3>
                </div>
                <div class="box-body">
                    <ul class="todo-list">
                        <li>
                            <!-- drag handle -->
                            <span class="handle">
                                <i class="fa fa-ellipsis-v"></i>
                                <i class="fa fa-ellipsis-v"></i>
                            </span>

                            <span class="text">Kevin's birthday</span>
                            <!-- Emphasis label -->
                            <small class="label-info"><i class="fa fa-clock-o"></i>15/12/2016</small>
                            <!-- General tools such as edit or delete-->
                            <div class="tools">
                                <i class="fa fa-edit"></i>

                            </div>
                        </li>
                        <li>
                            <span class="handle">
                                <i class="fa fa-ellipsis-v"></i>
                                <i class="fa fa-ellipsis-v"></i>
                            </span>

                            <span class="text">Purav's birthday</span>
                            <small class="label-info"><i class="fa fa-clock-o"></i>16/12/2016</small>
                            <div class="tools">
                                <i class="fa fa-edit"></i>

                            </div>
                        </li>
                    </ul>
                </div>
                <!-- /.box-body-->

            </div>


        </section>
    </div>--%>
</asp:Content>

