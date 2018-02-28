<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="view_transaction_report.aspx.cs" Inherits="Coupon.Admin.view_transaction_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Transaction Reports
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">

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


  <%--  <link href="css/datepicker.css" rel="stylesheet" />
    <script src="js/bootstrap-datepicker.js"></script>
    <script>
        $(document).ready(function () {

            $('#datetimepicker1').datetimepicker({ format: 'MM/DD/YY' });
            $('#datetimepicker2').datetimepicker({ format: 'MM/DD/YY' });

        });
    </script>
    --%>
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
                            <input type="text" runat="server" id="txt_zipcode" class="form-control" style="width: 100%" placeholder="Search By Zip Code" />
                        </div>
                        <div class="clearfix"></div>
                        <br />
                        <div class="col-lg-4">
                            <div class='input-group date' id='datetimepicker1'>
                                <input type='text' id="txt_start_date" runat="server" class="form-control" placeholder="Search Transaction From" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class='input-group date' id='datetimepicker2'>
                                <input type='text' id="txt_end_date" runat="server" class="form-control" placeholder="Search Transaction To" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <asp:DropDownList runat="server" ID="ddl_share_type" CssClass="form-control" Width="100%"></asp:DropDownList>
                        </div>
                        <div class="clearfix"></div>

                        <br />
                        <div class="col-lg-4">
                            <asp:DropDownList runat="server" ID="ddl_retailer_name" CssClass="form-control" Width="100%"></asp:DropDownList>
                        </div>
                        <div class="col-lg-4">
                            <asp:DropDownList runat="server" ID="ddl_retailer_no" CssClass="form-control" Width="100%"></asp:DropDownList>
                        </div>
                        <div class="col-lg-3">
                            <asp:DropDownList runat="server" ID="ddl_type" CssClass="form-control" Width="100%"></asp:DropDownList>
                        </div>
                        <div class="clearfix"></div>
                        <br />
                        <div class="col-lg-4">
                            <asp:DropDownList runat="server" ID="ddl_small_business_name" CssClass="form-control" Width="100%"></asp:DropDownList>
                        </div>
                        <div class="col-lg-4">
                            <asp:DropDownList runat="server" ID="ddl_sb_no" CssClass="form-control" Width="100%"></asp:DropDownList>
                        </div>
                        <div class="col-lg-3">
                            <asp:DropDownList runat="server" ID="ddl_sb_type" CssClass="form-control" Width="100%"></asp:DropDownList>
                        </div>
                        <div class="clearfix"></div>
                        <br />
                        <div class="col-lg-4">
                            <asp:DropDownList runat="server" ID="ddl_member_name" CssClass="form-control" Width="100%"></asp:DropDownList>
                        </div>
                        <div class="col-lg-4">
                            <asp:DropDownList runat="server" ID="ddl_member_no" CssClass="form-control" Width="100%"></asp:DropDownList>
                        </div>
                        <div class="col-lg-4">
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
                    <%-- <asp:LinkButton ID="lnk_del" runat="server" CommandArgument='<%# Eval("int_trans_id") %>' OnClick="lnk_del_Click" OnClientClick="return confirm('Are you sure you want to delete.?')">Delete selected</asp:LinkButton>
                    <br />--%>
                    <asp:Repeater ID="rpview" runat="server">
                        <HeaderTemplate>
                            <div style="overflow: auto">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="tbl_data" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <%--<th style="width: 1%;">
                                                    <asp:CheckBox ID="chkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="chkHeader_CheckedChanged" /></th>--%>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="lnk_trans_name" CausesValidation="false" CommandArgument="date_trans_date" OnClick="lnk_trans_name_Click">Date</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton1" CausesValidation="false" CommandArgument="time_trans_time" OnClick="lnk_trans_name_Click">Time</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton13" CausesValidation="false" CommandArgument="int_user_id" OnClick="lnk_trans_name_Click">Consumer No</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton2" CausesValidation="false" CommandArgument="str_first_name" OnClick="lnk_trans_name_Click">Consumers</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton12" CausesValidation="false" CommandArgument="int_retailer_id" OnClick="lnk_trans_name_Click">Retailer No</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton3" CausesValidation="false" CommandArgument="str_retailer_name" OnClick="lnk_trans_name_Click">Retailer Name</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton14" CausesValidation="false" CommandArgument="int_small_business_id" OnClick="lnk_trans_name_Click">SB No</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton5" CausesValidation="false" CommandArgument="str_retailer_name" OnClick="lnk_trans_name_Click">SB Name</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton4" CausesValidation="false" CommandArgument="str_name" OnClick="lnk_trans_name_Click">Offer Name</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton6" CausesValidation="false" CommandArgument="str_city_name" OnClick="lnk_trans_name_Click">City</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton7" CausesValidation="false" CommandArgument="str_short_name" OnClick="lnk_trans_name_Click">State</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton8" CausesValidation="false" CommandArgument="int_zip_code" OnClick="lnk_trans_name_Click">Zip</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton9" CausesValidation="false" CommandArgument="str_share_type" OnClick="lnk_trans_name_Click">Fee Type</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton10" CausesValidation="false" CommandArgument="str_type_name" OnClick="lnk_trans_name_Click">Retailer Type</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton11" CausesValidation="false" CommandArgument="str_small_business_type_name" OnClick="lnk_trans_name_Click">SB Type</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton16" CausesValidation="false" CommandArgument="dec_share_amount" OnClick="lnk_trans_name_Click">Share Amount</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton15" CausesValidation="false" CommandArgument="dec_puchase_amt" OnClick="lnk_trans_name_Click">Purchase Amt</asp:LinkButton></th>

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
                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "int_trans_id") %>' />
                                    <%#Eval("date_trans_date", "{0:MM/dd/yy}")%>
                                    <td><%# Eval("time_trans_time")  %></td>
                                    <td><%# Eval("int_user_id") %></td>
                                    <td><%# Eval("str_first_name") %></td>
                                    <td><%# Eval("int_retailer_id") %></td>
                                    <td><%# Eval("str_retailer_name") %></td>
                                    <td><%# Eval("int_small_business_id") %></td>
                                    <td><%# Eval("str_name") %></td>
                                    <td><%# Eval("str_offer_name") %></td>
                                    <td><%# Eval("str_city_name") %></td>
                                    <td><%# Eval("str_short_name") %></td>
                                    <td><%# Eval("int_zip_code") %></td>
                                    <td><%# Eval("str_share_type") %></td>
                                    <td><%# Eval("str_type_name") %></td>
                                    <td><%# Eval("str_small_business_type_name") %></td>
                                    <td><%# Eval("dec_share_amount") %></td>
                                    <td>$ <%# Eval("dec_puchase_amt") %></td>

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
                            <asp:BoundField HeaderText="Date" DataField="date_trans_date" />
                            <asp:BoundField HeaderText="Time" DataField="time_trans_time" />
                            <asp:BoundField HeaderText="Consumer No" DataField="int_user_id" />
                            <asp:BoundField HeaderText="Consumer" DataField="str_first_name" />
                            <asp:BoundField HeaderText="Retailer No" DataField="int_retailer_id" />
                            <asp:BoundField HeaderText="Retailer Name" DataField="str_retailer_name" />
                            <asp:BoundField HeaderText="SB No" DataField="int_small_business_id" />
                            <asp:BoundField HeaderText="SB Name" DataField="str_name" />
                            <asp:BoundField HeaderText="Offer Name" DataField="str_offer_name" />
                            <asp:BoundField HeaderText="city" DataField="str_city_name" />
                            <asp:BoundField HeaderText="State" DataField="str_short_name" />
                            <asp:BoundField HeaderText="Zip" DataField="int_zip_code" />
                            <asp:BoundField HeaderText="Fee Type" DataField="str_share_type" />
                            <asp:BoundField HeaderText="Retailer Type" DataField="str_type_name" />
                            <asp:BoundField HeaderText="SB Type" DataField="str_small_business_type_name" />
                            <asp:BoundField HeaderText="Purchase Amount" DataField="dec_puchase_amt" />
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
