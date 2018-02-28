<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="view_retailer_request.aspx.cs" Inherits="Coupon.Admin.view_retailer_request" %>



<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    View Retailer Request
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <div class="box">
        <div class="box-body">
            <asp:UpdatePanel runat="server" ID="upMain">
                <ContentTemplate>

                    <div class="form-inline">
                        <div class="col-lg-4">
                            <input type="text" runat="server" id="txtsearch" class="form-control" placeholder="Search" style="width: 100%;" />
                        </div>

                        <asp:Button runat="server" ID="btnsearch" Text="Search" Style="display: inline" CssClass="btn btn-info" OnClick="btnsearch_Click" />

                    </div>
                    <br />
                    <div runat="server" id="lblmess">
                    </div>
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
                                                    <asp:LinkButton runat="server" ID="lnk_retailer_name" CausesValidation="false" CommandArgument="str_retailer_name" OnClick="lnk_retailer_name_Click">Retailer Name</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton1" CausesValidation="false" CommandArgument="str_corporate_name" OnClick="lnk_retailer_name_Click">Corporate Name</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton2" CausesValidation="false" CommandArgument="str_email_id_p" OnClick="lnk_retailer_name_Click">Email ID</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton3" CausesValidation="false" CommandArgument="str_street_address" OnClick="lnk_retailer_name_Click">Address</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton4" CausesValidation="false" CommandArgument="str_city_name" OnClick="lnk_retailer_name_Click">City</asp:LinkButton></th>
                                                <th>
                                                    <asp:LinkButton runat="server" ID="LinkButton5" CausesValidation="false" CommandArgument="str_short_name" OnClick="lnk_retailer_name_Click">State</asp:LinkButton></th>
                                                <th style="width: 20%;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="chkDelete" /></td>
                                </td>
                                <td>
                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "int_retailer_id") %>' />
                                    <%# Eval("str_retailer_name") %></td>
                                <td><%# Eval("str_corporate_name") %></td>
                                <td><%# Eval("str_email_id_p") %></td>
                                <td><%# Eval("str_street_address") %></td>
                                <td><%# Eval("str_city_name") %></td>
                                <td><%# Eval("str_short_name") %></td>
                                <%-- <td></td>--%>
                                <td>

                                    <asp:LinkButton runat="server" ID="lnk_view" CausesValidation="false" CssClass="btn btn-primary" Text="Activate" OnClick="lnk_view_Click" CommandArgument='<%# Eval("int_retailer_id") %>'></asp:LinkButton>
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
    <!-- /.box -->

    <div class="modal fade" id="company-modal" role="dialog">
        <div class="modal-dialog" style="width: 82%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Retailer</h4>
                </div>
                <div class="modal-body">
                    <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                    <asp:UpdatePanel runat="server" ID="up_retailer">
                        <ContentTemplate>

                            <div class="col-md-12">
                                <!-- general form elements disabled -->
                                <div class="box box-warning">
                                    <br />
                                    <div runat="server" id="Div1">
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <!-- text input -->
                                        <div class=" col-lg-6">
                                            <div class="form-group">

                                                <asp:Image ID="img" runat="server" Height="100px" Width="100px" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Name:-</label>
                                                <asp:Label runat="server" ID="lbl_name"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Corporate Name :-</label>
                                                <asp:Label runat="server" ID="lbl_cname"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Email :-</label>
                                                <asp:Label runat="server" ID="lbl_email"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Address:-</label>
                                                <asp:Label runat="server" ID="lbl_add"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>City :-</label>
                                                <asp:Label runat="server" ID="lbl_city"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>State :-</label>
                                                <asp:Label runat="server" ID="lbl_state"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Zip Code:-</label>
                                                <asp:Label runat="server" ID="lbl_zip"></asp:Label>
                                            </div>
                                        </div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Telephone(P) :-</label>
                                                <asp:Label runat="server" ID="lbl_tele_p"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Retailer Type :-</label>
                                                <asp:Label runat="server" ID="lbl_type"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Contact(P):-</label>
                                                <asp:Label runat="server" ID="lbl_contact_p"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Contact(S):-</label>
                                                <asp:Label runat="server" ID="lbl_contact_s"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Telephone(S) :-</label>
                                                <asp:Label runat="server" ID="lbl_tele_s"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Email(S):-</label>
                                                <asp:Label runat="server" ID="lbl_email_s"></asp:Label>
                                            </div>
                                        </div>



                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Retailer No :-</label>
                                                <asp:Label runat="server" ID="lbl_rno"></asp:Label>
                                            </div>
                                        </div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <label>Web Address:-</label>
                                                <asp:Label runat="server" ID="lbl_web"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>


                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <%--<label>Share Type :-</label>--%>
                                                <asp:DropDownList ID="ddl_share_type" runat="server" CssClass="form-control"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Select Share Type" ValidationGroup="active" ControlToValidate="ddl_share_type" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <%--<div class="clearfix"></div>--%>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <%--<label>Share Amount :-</label>--%>
                                                <asp:TextBox runat="server" ID="txt_share_amount" placeholder="Share Amount" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rf5" runat="server" ErrorMessage="Enter Valid Share Amount" ControlToValidate="txt_share_amount" ValidationGroup="active" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="re4" runat="server" ErrorMessage="Invalid Share Amount" ControlToValidate="txt_share_amount" ValidationGroup="active" ValidationExpression="^(100(\.00?)?|[1-9]?\d(\.\d\d?)?)$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <%--<label>Share Type :-</label>--%>
                                                <asp:DropDownList ID="ddl_marketing_type" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0" Text="Select Marketing Fee Type"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="Flat"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Percentage"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Marketing Fee Type" ValidationGroup="active" ControlToValidate="ddl_marketing_type" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>

                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <%--<label>Share Amount :-</label>--%>
                                                <asp:TextBox runat="server" ID="txt_mar" placeholder="Marketing Fee" CssClass="form-control" MaxLength="5"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Marketing Fee" ControlToValidate="txt_mar" ValidationGroup="active" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Marketing Fee" ControlToValidate="txt_mar" ValidationGroup="active" ValidationExpression="^(100(\.00?)?|[1-9]?\d(\.\d\d?)?)$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>


                                        <div class="clearfix"></div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">

                                                <asp:DropDownList runat="server" ID="ddl_connect_fee" CssClass="form-control">
                                                    <asp:ListItem Value="0">-- Select Connect Fee Type --</asp:ListItem>
                                                    <asp:ListItem Value="1">Flat</asp:ListItem>
                                                    <asp:ListItem Value="2">Percantage</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select Connect Fee Type" ControlToValidate="ddl_connect_fee" ValidationGroup="active" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                        <div class=" col-lg-4">
                                            <div class="form-group">
                                                <%--<label>Share Amount :-</label>--%>
                                                <asp:TextBox runat="server" ID="txt_connect_fee" placeholder="Connect Fee" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Valid Connect Fee" ControlToValidate="txt_connect_fee" ValidationGroup="active" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Connect Fee" ControlToValidate="txt_connect_fee" ValidationGroup="active" ValidationExpression="^(100(\.00?)?|[1-9]?\d(\.\d\d?)?)$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                         <div class="clearfix"></div>
                                    </div>

                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->

                            </div>

                            <div class="modal-footer">

                                <asp:LinkButton runat="server" ValidationGroup="active" ID="lnk_active_status" CssClass="btn btn-success" OnClick="lnk_active_status_Click"> Active</asp:LinkButton>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>
    <script>

        function openModel(divid) {

            $('#' + divid).modal('show');

        }

        function closeModel(divid) {

            $('#' + divid).modal('hide');

        }

    </script>

</asp:Content>
