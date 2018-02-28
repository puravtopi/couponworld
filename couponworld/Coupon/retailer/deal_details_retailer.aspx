<%@ Page Title="" Language="C#" MasterPageFile="~/retailer.Master" AutoEventWireup="true" CodeBehind="deal_details_retailer.aspx.cs" Inherits="Coupon.deal_details_retailer" %>


<%@ Register Src="~/controls/uc_retailer_sidebar.ascx" TagPrefix="uc1" TagName="uc_retailer_sidebar" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<link href="../ckeditor/sample.css" rel="stylesheet" />--%>

    <style>
        .titlelbl {
            float: left;
            color: GrayText;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('#<%= txt_start_date.ClientID%>').datepicker({
                format: "yyyy-mm-dd",
            }).change(checkdate)
              .on('changeDate', checkdate);;
            $('#<%= txt_end_date.ClientID%>').datepicker({
                format: "yyyy-mm-dd",
            }).change(checkdate)
              .on('changeDate', checkdate);
        });

        function checkdate() {

            var startDate = document.getElementById("<%= txt_start_date.ClientID%>").value;
            var endDate = document.getElementById("<%= txt_end_date.ClientID%>").value;

            if (startDate != '' && endDate != '') {

                if ((Date.parse(startDate) >= Date.parse(endDate))) {
                    alert("End date should be greater than Start date");
                    document.getElementById("<%= txt_end_date.ClientID%>").value = "";
                }
            }
        }

        function checkamt() {

            var oamt = document.getElementById("<%= txt_orginal_amount.ClientID%>").value;
            var damt = document.getElementById("<%= txt_discount_amount.ClientID%>").value;

            if (oamt != '' && damt != '') {
                if ((parseInt(damt) >= parseInt(oamt))) {
                    alert("Discount Amout should be less than Orignal Amout.");
                    document.getElementById("<%= txt_discount_amount.ClientID%>").value = "";
                    document.getElementById("<%= txt_discount_amount.ClientID%>").focus();
                    document.getElementById("<%= txt_saving_amount.ClientID%>").value = "0";
                }
                else {
                    var saveamt = parseInt(oamt) - parseInt(damt);
                    document.getElementById("<%= txt_saving_amount.ClientID%>").value = saveamt;
                    document.getElementById("<%= txt_saving_amount.ClientID%>").readOnly = "readOnly";
                }
            }
        }

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
    </script>
    <div class="products">
        <div class="container">
            <div class="col-md-2">
                <uc1:uc_retailer_sidebar runat="server" ID="uc_retailer_sidebar" />
            </div>
            <div class="col-md-9 product-w3ls">

                <div class="single-top-right" style="padding-left: 0em;">
                    <h3 class="item_name">Create Offer</h3>
                </div>
                <hr />
                <div class="clearfix"></div>
                <%--<asp:UpdatePanel runat="server" ID="upOffer">
                    <ContentTemplate>--%>
                <div class="login-page" style="padding: 1em 0">
                    <div class="container" style="width: 100%;">
                        <label class="titlelbl">Title</label>
                        <asp:TextBox runat="server" ID="txt_offer_name" placeholder="Offer Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Offer Name" ControlToValidate="txt_offer_name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <br />
                        <label class="titlelbl">Details</label>
                        <div class="clearfix"></div>
                        <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Height="200" BasePath="~/ckeditor">
                        </CKEditor:CKEditorControl>

                        <asp:RequiredFieldValidator ID="rf4" runat="server" ErrorMessage="Enter Valid Offer Details" ControlToValidate="CKEditor1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                        <br />
                        <asp:UpdatePanel runat="server" ID="updealtype">
                            <ContentTemplate>
                                <%--<textarea id="txt_offer_details" runat="server" rows="5" placeholder="Offer Details" style="width: 100%; margin: 0 0 1em 0"></textarea>--%>
                                <label class="titlelbl">Deal Type</label>
                                <asp:DropDownList ID="ddl_deal_type" runat="server" CausesValidation="false" AutoPostBack="true" OnSelectedIndexChanged="ddl_deal_type_SelectedIndexChanged" CssClass="form-control" Style="height: 45px; margin: 0 0 1em 0">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Deal Type" ControlToValidate="ddl_deal_type" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                                <label class="titlelbl">Discount Type</label>
                                <asp:DropDownList ID="ddl_dec_type" runat="server" CssClass="form-control" Style="height: 45px; margin: 0 0 1em 0">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rf6" runat="server" ErrorMessage="Select Discount Type" ControlToValidate="ddl_dec_type" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                            <ContentTemplate>
                                <label class="titlelbl">Category</label>
                                <asp:DropDownList ID="ddl_category" AutoPostBack="true" OnSelectedIndexChanged="ddl_category_SelectedIndexChanged" runat="server" CssClass="form-control" Style="height: 45px; margin: 0 0 1em 0">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rf17" runat="server" ErrorMessage="Select Category" ControlToValidate="ddl_category" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                                <label class="titlelbl">Sub Category</label>
                                <asp:DropDownList ID="ddl_sub_category" runat="server" CssClass="form-control" Style="height: 45px; margin: 0 0 1em 0">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Sub Category" ControlToValidate="ddl_sub_category" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <label class="titlelbl">Start Date</label>
                        <asp:TextBox runat="server" ID="txt_start_date" placeholder="Start Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rf3" runat="server" ErrorMessage="Enter Valid Start Date" ControlToValidate="txt_start_date" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                        <label class="titlelbl">End Date</label>
                        <asp:TextBox runat="server" ID="txt_end_date" onchange="checkdate()" placeholder="End Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rf16" runat="server" ErrorMessage="Enter Valid End Date" ControlToValidate="txt_end_date" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                        <div runat="server" id="div_discount" style="display: none">
                            <asp:DropDownList ID="ddl_limitation" runat="server" CssClass="form-control" Style="height: 45px; margin: 0 0 1em 0">
                                <asp:ListItem Value="0" Text="-- Select Limitation --"></asp:ListItem>
                                <asp:ListItem Value="1" Text="1 per person"></asp:ListItem>
                                <asp:ListItem Value="2" Text="1 per group"></asp:ListItem>
                                <asp:ListItem Value="3" Text="1 per table"></asp:ListItem>
                                <asp:ListItem Value="4" Text="1 per visit"></asp:ListItem>
                                <asp:ListItem Value="5" Text="1 per day"></asp:ListItem>
                                <asp:ListItem Value="6" Text="1 per year"></asp:ListItem>
                                <asp:ListItem Value="7" Text="Unlimited"></asp:ListItem>
                                <asp:ListItem Value="8" Text="Adults Only"></asp:ListItem>
                                <asp:ListItem Value="9" Text="Kids Only"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select Limitation" ControlToValidate="ddl_limitation" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>

                        <label class="titlelbl">Original Price</label>
                        <asp:TextBox runat="server" ID="txt_orginal_amount" onkeypress="return isNumberKey(event)" onchange="checkamt()" placeholder="Original Price"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rf5" runat="server" ErrorMessage="Enter Orginal Amount" ControlToValidate="txt_orginal_amount" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                        <label class="titlelbl">Offer Price</label>
                        <asp:TextBox runat="server" ID="txt_discount_amount" onchange="checkamt()" placeholder="Discount Price"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Discount Amount" ControlToValidate="txt_discount_amount" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                        <label class="titlelbl">Total Saving</label>
                        <asp:TextBox runat="server" ID="txt_saving_amount" Text="0" placeholder="Saving Price"></asp:TextBox>

                        <label class="titlelbl">Marketing Fee</label>
                        <asp:TextBox runat="server" ID="txt_merketing" onkeypress="return isNumberKey(event)" placeholder="Marketing Fee"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Orginal Amount" ControlToValidate="txt_orginal_amount" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" ID="cmp1" ControlToValidate="txt_merketing" ControlToCompare="txt_hid_maketing" Type="Integer" Operator="GreaterThanEqual" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>

                        <asp:TextBox runat="server" ID="txt_hid_maketing" Style="display: none" />

                        <asp:FileUpload runat="server" ID="fupimg" />
                        <asp:Image ID="Image1" runat="server" Height="150px" Width="125px" />
                        <asp:RequiredFieldValidator ID="rf10" runat="server" ErrorMessage="Select Image" ControlToValidate="fupimg" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ID="reg_img" ControlToValidate="fupimg" ErrorMessage="Please select image file only." Display="Dynamic" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif|.jpeg)$" ForeColor="Red"></asp:RegularExpressionValidator>


                        <asp:Button runat="server" ID="btn_submit" Text="Submit" CausesValidation="false" OnClick="btn_submit_Click" />
                        <asp:Button runat="server" ID="update_btn" Text="Update" OnClick="update_btn_Click" />

                        <asp:Button runat="server" ID="btn_cancle" Text="Cancle" OnClick="btn_cancle_Click" CausesValidation="false" />

                        <div runat="server" id="lblmess"></div>
                    </div>
                </div>
                <%-- </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btn_submit" />
                        <asp:PostBackTrigger ControlID="update_btn" />
                    </Triggers>
                </asp:UpdatePanel>--%>
            </div>
        </div>
    </div>

    <!-- //sign up-page -->
    <script>
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {

                $('#<%= txt_start_date.ClientID%>').datepicker({
                    format: "yyyy-mm-dd",
                }).change(checkdate)
            .on('changeDate', checkdate);;
                $('#<%= txt_end_date.ClientID%>').datepicker({
                    format: "yyyy-mm-dd",
                }).change(checkdate)
                  .on('changeDate', checkdate);
            })
        }
    </script>
</asp:Content>
