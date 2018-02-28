﻿<%@ Page Title="" Language="C#" MasterPageFile="~/member.Master" AutoEventWireup="true" CodeBehind="view_transaction.aspx.cs" Inherits="Coupon.member_user.view_transaction" %>

<%@ Register Src="~/controls/uc_consumer_sidebar.ascx" TagPrefix="uc1" TagName="uc_consumer_sidebar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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


    <style>
        a:hover,
        a:focus {
            color: #FF5E00;
            text-decoration: underline;
        }
    </style>

    <div class="products">
        <div class="container">

            <div class="col-md-2">
                <uc1:uc_consumer_sidebar runat="server" ID="uc_consumer_sidebar" />
            </div>

            <div class="col-md-9 product-w3ls">
                <div class="box">
                    <div class="box-body">
                        <div class="single-top-right" style="padding-left: 0em;">
                            <h3 class="item_name">Transaction History</h3>
                        </div>
                        <hr />
                        <div class="clearfix"></div>
                        <br />
                        <asp:UpdatePanel runat="server" ID="upMain">
                            <ContentTemplate>
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
                                <div class="col-lg-4">
                                    <asp:TextBox runat="server" ID="txt_receipt" CssClass="form-control" placeholder="Search By Receipt"></asp:TextBox>
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
                                <br />
                                <div class="col-lg-12">
                                    <asp:Repeater ID="rpview" runat="server">
                                        <HeaderTemplate>

                                            <div class="table-responsive">
                                                <table class="table table-bordered" id="tbl_data" style="width: 100%">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <asp:LinkButton runat="server" ID="LinkButton3" CausesValidation="false" CommandArgument="str_retailer_name" OnClick="lnk_trans_name_Click">Retailer Name</asp:LinkButton></th>
                                                            <%--<th style="width: 1%;">
                                                    <asp:CheckBox ID="chkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="chkHeader_CheckedChanged" /></th>--%>
                                                            <th>
                                                                <asp:LinkButton runat="server" ID="LinkButton2" CausesValidation="false" CommandArgument="str_offer_name" OnClick="lnk_trans_name_Click">Offer Name</asp:LinkButton></th>
                                                            <th>
                                                                <asp:LinkButton runat="server" ID="lnk_trans_name" CausesValidation="false" CommandArgument="date_trans_date" OnClick="lnk_trans_name_Click">Date</asp:LinkButton></th>



                                                            <th>
                                                                <asp:LinkButton runat="server" ID="LinkButton15" CausesValidation="false" CommandArgument="dec_puchase_amt" OnClick="lnk_trans_name_Click">Purchase Amt</asp:LinkButton></th>
                                                            <th>
                                                                <asp:LinkButton runat="server" ID="LinkButton4" CausesValidation="false" CommandArgument="dec_total_saving" OnClick="lnk_trans_name_Click">Total Saving Amt</asp:LinkButton></th>
                                                            <%--<th style="width: 10%;">Action</th>--%>
                                                        </tr>
                                                    </thead>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("str_retailer_name") %></td>
                                                <%--<td>
                                    <asp:CheckBox runat="server" ID="chkDelete" /></td>--%>
                                                <td><%# Eval("str_offer_name") %></td>
                                                <td>
                                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "int_trans_id") %>' />

                                                    <%#Eval("date_trans_date", "{0:MM/dd/yy}")%></td>



                                                <td>$ <%# Eval("dec_puchase_amt") %></td>
                                                <td>$ <%# Eval("dec_total_saving")  %></td>

                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
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
                                    <%}
                                       else
                                       { %>
                                    Sorry, No Data Found.!!!
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
                                </div>
                                <div class="clearfix"></div>
                                <asp:GridView runat="server" ID="gvtemp" AutoGenerateColumns="false" Visible="false">
                                    <Columns>
                                        <asp:BoundField HeaderText="Consumer" DataField="str_first_name" />
                                        <asp:BoundField HeaderText="Date" DataField="date_trans_date" />
                                        <asp:BoundField HeaderText="Time" DataField="time_trans_time" />
                                        <asp:BoundField HeaderText="Receipt" DataField="str_receipt" />
                                        <asp:BoundField HeaderText="Retailer Name" DataField="str_retailer_name" />
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

            </div>
        </div>
    </div>
</asp:Content>
