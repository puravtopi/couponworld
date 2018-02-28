<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="view_member_report.aspx.cs" Inherits="Coupon.Admin.view_member_report" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Consumer Reports
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">

     <%--<link href="date/CSS/bootstrap.css" rel="stylesheet" />--%>
    <%--<link href="date/CSS/Style.css" rel="stylesheet" />--%>

    <script src="date/JS/jquery-1.10.2.min.js"></script>
    <link href="date/DatePicker/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="date/DatePicker/bootstrap-datepicker.js"></script>
    <script>
        $(document).ready(function () {
            $('#<%= txt_start_date.ClientID%>').datepicker({
                format: 'mm/dd/yyyy', autoclose: true, changeMonth: true,
                changeYear: true
            });
            $('#<%= txt_end_date.ClientID%>').datepicker({
                format: 'mm/dd/yyyy', autoclose: true, changeMonth: true,
                changeYear: true
            });
        });
    </script>

    <%--  <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.1.min.js"></script>--%>
   <%-- <link href="css/datepicker.css" rel="stylesheet" />
    <script src="js/bootstrap-datepicker.js"></script>
    <script>
        $(document).ready(function () {

            $('#datetimepicker1').datetimepicker({ format: 'MM/DD/YY' });
            $('#datetimepicker2').datetimepicker({ format: 'MM/DD/YY' });

        });
    </script>--%>


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
                            <div class='input-group date' id='datetimepicker1'>
                                <input type='text' id="txt_start_date" runat="server" class="form-control" placeholder="DOB From" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class='input-group date' id='datetimepicker2'>
                                <input type='text' id="txt_end_date" runat="server" class="form-control" placeholder="DOB To" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <asp:DropDownList runat="server" ID="ddl_gender" CssClass="form-control" Width="100%" OnSelectedIndexChanged="ddl_gender_SelectedIndexChanged">
                                <asp:ListItem Value="0">-- Search by Gender --</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="clearfix"></div>
                        <br />
                        <div class="col-lg-4">
                            <input type="text" runat="server" id="txt_name_search" class="form-control" style="Width: 100%" placeholder="Search By Consumer Name" />
                        </div>
                        <div class="col-lg-4">
                            <input type="text" runat="server" id="txt_search_no" class="form-control" style="Width: 100%" placeholder="Search By Consumer Numbers" />
                        </div>
                        <div class="col-lg-3">
                            <asp:DropDownList runat="server" ID="ddl_organization" CssClass="form-control" Width="100%">
                            </asp:DropDownList>
                        </div>
                        <div class="clearfix"></div>
                        <br />
                        <div class="col-lg-4">
                            <asp:DropDownList runat="server" ID="ddl_company" CssClass="form-control" Width="100%">
                            </asp:DropDownList>
                        </div>
                        <br />
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
                    <%--<asp:LinkButton ID="lnk_del" runat="server" CommandArgument='<%# Eval("int_user_id") %>' OnClick="lnk_del_Click" OnClientClick="return confirm('Are you sure you want to delete.?')">Delete selected</asp:LinkButton>
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
                                                    <asp:LinkButton runat="server" ID="LinkButton10" CausesValidation="false" CommandArgument="int_user_id" OnClick="lnk_first_name_Click">Consumer No.</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton8" CausesValidation="false" CommandArgument="str_telephone" OnClick="lnk_first_name_Click">Telephone</asp:LinkButton></th>
                                                <th style="width: 1%;">
                                                    <asp:LinkButton runat="server" ID="LinkButton2" CausesValidation="false" CommandArgument="str_gender" OnClick="lnk_first_name_Click">Gender</asp:LinkButton></th>
                                                <th style="width: 8%;">
                                                    <asp:LinkButton runat="server" ID="LinkButton3" CausesValidation="false" CommandArgument="str_date_of_birth" OnClick="lnk_first_name_Click">DOB</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton11" CausesValidation="false" CommandArgument="str_organization_name" OnClick="lnk_first_name_Click">Organization</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton12" CausesValidation="false" CommandArgument="str_company_name" OnClick="lnk_first_name_Click">Company</asp:LinkButton></th>
                                               <%-- <th style="width: 12%;">
                                                <asp:Linkbutton runat="server" ID="LinkButton9" CausesValidation="false" CommandArgument="str_password" OnClick="lnk_first_name_Click">Password</asp:LinkButton></th>--%>
                                                <%--<th style="width: 10%;">Action</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <%--<td>
                                    <asp:CheckBox runat="server" ID="chkDelete" /></td>--%>
                                <td>
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
                                <%--<td><%# Eval("str_date_of_birth") %></td>--%>
                                <td><%#Eval("str_date_of_birth", "{0:MM/dd/yy}")%></td>
                                <td><%# Eval("str_organization_name") %></td>
                                <td><%# Eval("str_company_name") %></td>

                                <%-- <td></td>--%>
                                <%--<a href="<%# "type_details.aspx?typeid="+Eval("int_group_id") %>" class="btn btn-primary">Edit</a> |--%>
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
                            <asp:BoundField HeaderText="Name" DataField="str_first_name" />
                            <asp:BoundField HeaderText="Address" DataField="str_street_address" />
                            <asp:BoundField HeaderText="Apt Suit" DataField="str_apt_suite" />
                            <asp:BoundField HeaderText="City" DataField="str_city_name" />
                            <asp:BoundField HeaderText="State" DataField="str_short_name" />
                            <asp:BoundField HeaderText="Zip" DataField="int_zip_code" />
                            <asp:BoundField HeaderText="Email" DataField="str_email_id" />
                            <asp:BoundField HeaderText="Tel No" DataField="str_telephone" />
                            <asp:BoundField HeaderText="Gender" DataField="str_gender" />
                            <asp:BoundField HeaderText="DOB" DataField="str_date_of_birth" />
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

    <%-- <link href="date/CSS/bootstrap.css" rel="stylesheet" />
    <%--<link href="date/CSS/Style.css" rel="stylesheet" />

    <script src="date/JS/jquery-1.10.2.min.js"></script>
    <link href="date/DatePicker/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="date/DatePicker/bootstrap-datepicker.js"></script>

    <script>
        $(document).ready(function () {
            $('#<%= txt_start_date.ClientID%>').datepicker({ format: 'mm/dd/yyyy', autoclose: true, todayBtn: 'linked' })
            $('#<%= txt_end_date.ClientID%>').datepicker({ format: 'mm/dd/yyyy', autoclose: true, todayBtn: 'linked' })
            $("[data-mask]").inputmask();
        });
    </script>--%>


    <script>
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {


            $('#<%= txt_start_date.ClientID%>').datepicker({
                format: 'mm/dd/yyyy', autoclose: true, changeMonth: true,
                changeYear: true
            });
            $('#<%= txt_end_date.ClientID%>').datepicker({
                format: 'mm/dd/yyyy', autoclose: true, changeMonth: true,
                changeYear: true
            });

        });

    </script>
</asp:Content>
