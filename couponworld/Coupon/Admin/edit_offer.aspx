<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="edit_offer.aspx.cs" Inherits="Coupon.Admin.offer_details" %>


<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Offer Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">

    <%-- <script type="text/javascript">
        $(function () {
            $('#<%= txt_sdate.ClientID%>').datepicker({
                numberOfMonths: 2,
                onSelect: function (selected) {
                    var dt = new Date(selected);
                    dt.setDate(dt.getDate() + 1);
                    $('#<%= txt_edate.ClientID%>').datepicker("option", "minDate", dt);
                }
            });
            $('#<%= txt_edate.ClientID%>').datepicker({
                numberOfMonths: 2,
                onSelect: function (selected) {
                    var dt = new Date(selected);
                    dt.setDate(dt.getDate() - 1);
                    $('#<%= txt_sdate.ClientID%>').datepicker("option", "maxDate", dt);
                }
            });
        });

        $("[data-mask]").inputmask();
    </script>--%>

    <div class="col-md-12">
        <!-- general form elements disabled -->
        <div class="box box-warning">
            <br />
            <div runat="server" id="lblmess">
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <!-- text input -->

                <div class="form-group">
                    <label>Offer Name</label>
                    <asp:TextBox ID="txt_offer_name" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid Offer Name" ControlToValidate="txt_offer_name" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Offer Details</label>
                    <CKEditor:CKEditorControl ID="txt_details" runat="server" Height="200" BasePath="~/ckeditor">		Offer Details
                    </CKEditor:CKEditorControl>
                    <%-- <asp:TextBox ID="txt_details" runat="server" CssClass="form-control"></asp:TextBox>--%>
                    <asp:RequiredFieldValidator ID="rf3" runat="server" ErrorMessage="Enter Valid Offer" ControlToValidate="txt_details" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Discount Type</label>
                    <asp:DropDownList ID="ddl_ctype" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rf17" runat="server" ErrorMessage="Select Discount Type" ControlToValidate="ddl_ctype" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Deal Type</label>
                    <asp:DropDownList ID="ddl_deal" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Select Deal Type" ControlToValidate="ddl_deal" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                <asp:UpdatePanel runat="server" ID="up_discount">
                    <ContentTemplate>
                        <div class="form-group">
                            <label>Original Amount</label>
                            <asp:TextBox ID="txt_original" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Valid Original Amount" ControlToValidate="txt_original" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Discount Amount</label>
                            <asp:TextBox ID="txt_amount" runat="server" CssClass="form-control" OnTextChanged="txt_amount_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rf15" runat="server" ErrorMessage="Enter Valid Discount Amount" ControlToValidate="txt_amount" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label>Savings</label>
                            <asp:TextBox ID="txt_saving" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Valid Savings Amount" ControlToValidate="txt_saving" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel runat="server" ID="upReailerFee">
                    <ContentTemplate>
                        <div class="form-group">
                            <label>Retailer</label>
                            <asp:DropDownList ID="ddl_retailer" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_retailer_SelectedIndexChanged" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:TextBox runat="server" ID="txt_hid_marketing" Style="display: none"></asp:TextBox>
                            <asp:HiddenField runat="server" ID="hid_maketing_type" Value="0" />  
                            <%--<asp:RequiredFieldValidator ID="rf14" runat="server" ErrorMessage="Select Retailer" ControlToValidate="ddl_retailer" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>--%>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="form-group">
                    <label>Small Business</label>
                    <asp:DropDownList ID="ddl_sb" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select Retailer" ControlToValidate="ddl_sb" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>--%>
                </div>

                <div class="form-group">
                    <label>Category</label>
                    <asp:DropDownList ID="ddl_category" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Category" ControlToValidate="ddl_category" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label>Sub Category</label>
                    <asp:DropDownList ID="ddl_sub_category" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Select Sub Category" ControlToValidate="ddl_sub_category" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Limitation</label>
                    <asp:TextBox ID="txt_limitation" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Valid Limitations" ControlToValidate="txt_limitation" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>
                        Marketing Fee
                    </label>
                    <asp:TextBox ID="txt_org_share" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:CompareValidator runat="server" ID="cmp1" ControlToValidate="txt_org_share" ErrorMessage="Please enter greater or equle value than selected retailer marketing fee." ControlToCompare="txt_hid_marketing" Type="Integer" Operator="GreaterThanEqual" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Valid Discount Amount" ControlToValidate="txt_amount" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Sponsor</label>
                    <asp:DropDownList ID="ddl_sponsor" runat="server" CssClass="form-control">
                        <asp:ListItem Text="-- Select Sponsor --" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Retailer" Value="Retailer"></asp:ListItem>
                        <asp:ListItem Text="Small Business" Value="Small Business"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select Category" ControlToValidate="ddl_category" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label>Start Date</label>
                    <asp:TextBox ID="txt_sdate" runat="server" CssClass="form-control pull-right"></asp:TextBox>
                    <br />
                    <%--<input type="text" class="form-control pull-right" id="reservation" />--%>
                    <asp:RequiredFieldValidator ID="rf6" runat="server" ErrorMessage="Enter Valid Start Date" ControlToValidate="txt_sdate" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <!-- /.input group -->
                </div>
                <div class="form-group">
                    <label>End Date</label>
                    <asp:TextBox ID="txt_edate" runat="server" CssClass="form-control"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid End Date" ControlToValidate="txt_edate" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Image</label>
                    <asp:FileUpload ID="fupimg" runat="server" />
                    <asp:Image ID="Image1" runat="server" Height="100px" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Select '.jpg','.gif','.png'" ControlToValidate="fupimg" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    <%--<asp:RequiredFieldValidator ID="rf10" runat="server" ErrorMessage="Selec Image" ControlToValidate="fupimg" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>
                <div class="form-group">
                    <label></label>
                    <asp:CheckBox runat="server" ID="chk_treading" Text="Mark as Treading Offer" />
                </div>
                <div class="form-group">
                    <label></label>
                    <asp:CheckBox runat="server" ID="chk_featured" Text="Mark as Featured Offer" />
                </div>

                <%--<div class="form-group">
                    <label>Created By :-</label>
                    <asp:TextBox ID="txt_created_by" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf10" runat="server" ErrorMessage="Enter Valid Created By" ControlToValidate="txt_created_by" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>--%>
                <asp:Button ID="btn_add" Text="Save" runat="server" OnClick="btn_add_Click" CssClass="btn btn-success" />
                <asp:Button ID="btn_update" Text="Update" runat="server" OnClick="btn_update_Click" CssClass="btn btn-success" />
                <asp:Button ID="btn_back" Text="Back" runat="server" OnClick="btn_back_Click" CausesValidation="false" CssClass="btn btn-default" />
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>

    <link href="date/CSS/bootstrap.css" rel="stylesheet" />
    <%--<link href="date/CSS/Style.css" rel="stylesheet" />--%>

    <script src="date/JS/jquery-1.10.2.min.js"></script>
    <link href="date/DatePicker/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="date/DatePicker/bootstrap-datepicker.js"></script>

    <script>
        $(document).ready(function () {
            $('#<%= txt_sdate.ClientID%>').datepicker({
                format: 'mm/dd/yyyy', autoclose: true, changeMonth: true,
                changeYear: true
            });
            $('#<%= txt_edate.ClientID%>').datepicker({
                format: 'mm/dd/yyyy', autoclose: true, changeMonth: true,
                changeYear: true
            });
            $("[data-mask]").inputmask();
        });
    </script>
    <%--<script>
        $('#<%= txt_sdate.ClientID%>').datepicker();
        $('#<%= txt_edate.ClientID%>').datepicker();
        $("[data-mask]").inputmask();
    </script>--%>
</asp:Content>
