<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="offer_report.aspx.cs" Inherits="Coupon.Admin.Report.offer_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Offer Report
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



   <%-- <link href="css/datepicker.css" rel="stylesheet" />
    <script src="js/bootstrap-datepicker.js"></script>

    <script>
        $(document).ready(function () {

            $('#datetimepicker1').datetimepicker({
                format: 'MM/DD/YY'
            });
            $('#datetimepicker2').datetimepicker({
                format: 'MM/DD/YY'
            });

        });
    </script>--%>

    <%-- <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
        $(document).ready(function () {
            $('#<%= txt_start_date.ClientID%>').datepicker(
            {
                format: 'mm/dd/yyyy',
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2100'
            });
            $('#<%= txt_end_date.ClientID%>').datepicker(
            {
                format: 'mm/dd/yyyy',
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2100'
            });

        })
    </script>--%>
    <div class="box">
        <div class="box-body">
            <asp:UpdatePanel runat="server" ID="upMain">
                <ContentTemplate>
                    <div class="form-inline">
                        <div class="form-inline">
                            <%-- <div class="col-lg-4">
                                <input type="text" runat="server" id="txtsearch" class="form-control" placeholder="Search" style="width: 100%;" />
                            </div>--%>
                            <div class="col-lg-4">
                                <asp:DropDownList runat="server" ID="ddl_retailer" CssClass="form-control" Width="100%" OnSelectedIndexChanged="ddl_retailer_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="col-lg-4">
                                <div class='input-group date' id='datetimepicker1'>
                                    <input type='text' id="txt_start_date" runat="server" class="form-control" placeholder="Search Start Date" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class='input-group date' id='datetimepicker2'>
                                    <input type='text' id="txt_end_date" runat="server" class="form-control" placeholder="Search End Date" />

                                    <span class="input-group-addon">

                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                            <br />
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
                            <br />
                            <br />
                            <div class="clearfix"></div>

                        </div>

                    </div>

                    <%-- <asp:LinkButton ID="lnk_del" runat="server" CommandArgument='<%# Eval("int_offer_id") %>' OnClick="lnk_del_Click" OnClientClick="return confirm('Are you sure you want to delete.?')">Delete selected</asp:LinkButton></td>
                                <br />--%>
                    <asp:Repeater ID="rpview" runat="server">
                        <HeaderTemplate>
                            <div class="table-responsive">
                                <table class="table table-bordered" style="width: 100%">
                                    <thead>
                                        <tr>
                                            <%--<th style="width: 1%;">
                                                <asp:CheckBox ID="chkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="chkHeader_CheckedChanged" /></th>--%>
                                            <th>
                                                <asp:LinkButton runat="server" ID="lnk_offer_name" CausesValidation="false" CommandArgument="str_offer_name" OnClick="lnk_offer_name_Click">Offer Name</asp:LinkButton></th>
                                            <%--<th>Offer Details</th>--%>
                                            <th>
                                                <asp:LinkButton runat="server" ID="LinkButton1" CausesValidation="false" CommandArgument="dec_discount_amount" OnClick="lnk_offer_name_Click">Amount</asp:LinkButton></th>
                                            <th>
                                                <asp:LinkButton runat="server" ID="LinkButton2" CausesValidation="false" CommandArgument="str_retailer_name" OnClick="lnk_offer_name_Click">Retailer</asp:LinkButton></th>
                                            <th>
                                                <asp:LinkButton runat="server" ID="LinkButton3" CausesValidation="false" CommandArgument="date_start_date" OnClick="lnk_offer_name_Click">Start Date</asp:LinkButton></th>
                                            <th>
                                                <asp:LinkButton runat="server" ID="LinkButton4" CausesValidation="false" CommandArgument="date_end_date" OnClick="lnk_offer_name_Click">End Date</asp:LinkButton></th>
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
                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "int_offer_id") %>' />
                                    <%# Eval("str_offer_name") %> </td>
                                <%--<td><%# Eval("str_offer_details")  %> </td>--%>
                                <td><%# Eval("dec_discount_amount") %> %</td>
                                <td><%# Eval("str_retailer_name") %></td>
                                <td><%# Eval("date_start_date") %></td>
                                <td><%# Eval("date_end_date") %></td>
                                <%-- <td></td>--%>
                                <%--<td>
                                    <a href="<%# "offer_details.aspx?oid="+Eval("int_offer_id") %>" class="btn btn-primary">Edit</a>
                                </td>--%>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
    </table>
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
