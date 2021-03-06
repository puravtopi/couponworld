﻿<%@ Page Title="" Language="C#" MasterPageFile="~/registration.Master" AutoEventWireup="true" CodeBehind="retailer_sign_up.aspx.cs" Inherits="Coupon.retailer_sign_up" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
    <script type="text/javascript" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
        async defer></script>

    <script type="text/javascript">
        var onloadCallback = function () {
            grecaptcha.render('dvCaptcha', {
                'sitekey': '<%=ReCaptcha_Key %>',
                'callback': function (response) {
                    $.ajax({
                        type: "POST",
                        url: "https://www.google.com/recaptcha/api/siteverify",
                        data: "{response: '" + response + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var captchaResponse = jQuery.parseJSON(r.d);
                            if (captchaResponse.success) {
                                $("[id*=txtCaptcha]").val(captchaResponse.success);
                                $("[id*=rfvCaptcha]").hide();
                            } else {
                                $("[id*=txtCaptcha]").val("");
                                $("[id*=rfvCaptcha]").show();
                                var error = captchaResponse["error-codes"][0];
                                $("[id*=rfvCaptcha]").html("RECaptcha error. " + error);
                            }
                        }
                    });
                }
            });
        };
    </script>



    <div class="login-page" style="padding: 0em;">
        <div class="container">
            <ol class="breadcrumb breadcrumb1" style="text-align: left;">
                <li><a href='<%= ResolveUrl("~/home") %>'>Home</a></li>
                <li class="active">Sign Up</li>
            </ol>
            <br />
            <br />
            <h3 class="w3ls-title w3ls-title1">Retailer Account Create</h3>

            <div runat="server" id="lblmess"></div>
            <div class="col-md-6 stylelbl">
                <asp:TextBox runat="server" ID="txt_uname" CssClass="user" placeholder="DBA Name" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid Name" ValidationGroup="sign_up" ControlToValidate="txt_uname" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6 stylelbl">
                <asp:TextBox runat="server" ID="txt_corporate_name" CssClass="user" placeholder="Corporate Name" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf3" runat="server" ErrorMessage="Enter Valid corporate Name" ValidationGroup="sign_up" ControlToValidate="txt_corporate_name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6 stylelbl">
                <asp:UpdatePanel runat="server" ID="up_email">
                    <ContentTemplate>
                        <asp:TextBox runat="server" ID="txt_email" CssClass="user" placeholder="Email ID" MaxLength="100" OnTextChanged="txt_email_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txt_email" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="re1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email" ValidationGroup="sign_up" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>

                        <label runat="server" id="lbl_email" style="display: none">Sorry ! email already allocated to some one else.</label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-md-6 stylelbl">
                <asp:TextBox runat="server" ID="txt_email_s" CssClass="user" placeholder="Secondary Email ID" MaxLength="100"></asp:TextBox>
                <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txt_email_s" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email_s" ValidationGroup="sign_up" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div class="col-md-6 stylelbl">
                <asp:TextBox runat="server" ID="txt_pass" type="password" CssClass="lock" placeholder="Password" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf8" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txt_pass" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Regex2" runat="server" ControlToValidate="txt_pass"
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&.]{8,20}$"
                    ErrorMessage="Must be 8 to 20 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ForeColor="Red" ValidationGroup="sign_up" Display="Dynamic" />
            </div>

            <div class="col-md-6 stylelbl">
                <textarea id="txt_address" class="user" runat="server" placeholder="Address" style="width: 100%;" maxlength="200"></textarea>
                <%--  <asp:RequiredFieldValidator ID="rf4" runat="server" ErrorMessage="Enter Valid Street Address" ControlToValidate="txt_address" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-6 stylelbl">
                <asp:TextBox runat="server" ID="txt_api_suit" CssClass="user" placeholder="Apt Suite" MaxLength="15" Visible="false"></asp:TextBox>
                <%-- <asp:RequiredFieldValidator ID="rf9" runat="server" ErrorMessage="Enter Valid Apt Suite" ControlToValidate="txt_api_suit" ValidationGroup="sign_up" Display="Dynamic" Visible="false" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            </div>
            <div class="clearfix"></div>
            <div class="col-md-6 stylelbl">
                <asp:UpdatePanel runat="server" ID="upMain">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddl_state" runat="server" CssClass="form-control bfh-states" CausesValidation="false" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" Style="height: 45px;" AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rf6" runat="server" ErrorMessage="Select State" ControlToValidate="ddl_state" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="ddl_city" runat="server" CssClass="form-control bfh-states" Style="height: 45px;">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rf7" runat="server" ErrorMessage="Select City" ControlToValidate="ddl_city" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-md-6 stylelbl">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddl_cat" runat="server" CssClass="form-control bfh-states" CausesValidation="false" OnSelectedIndexChanged="ddl_cat_SelectedIndexChanged" Style="height: 45px;" AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Category" ControlToValidate="ddl_cat" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="ddl_service_type" runat="server" CssClass="form-control bfh-states" Style="height: 45px;">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Service Type" ControlToValidate="ddl_service_type" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="clearfix"></div>
            <br />
            <div class="col-md-6 stylelbl">
                <asp:TextBox runat="server" ID="txt_pincode" CssClass="user" placeholder="Zip Code" MaxLength="5"></asp:TextBox>
                <%--   <asp:RequiredFieldValidator ID="rf5" runat="server" ErrorMessage="Enter Valid Zip code" ControlToValidate="txt_pincode" ForeColor="Red" ValidationGroup="sign_up" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                <asp:RegularExpressionValidator ID="re4" runat="server" ErrorMessage="Invalid Zip Code" ControlToValidate="txt_pincode" ValidationGroup="sign_up" ValidationExpression="\d{5}" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>

            <div class="col-md-6 stylelbl">
                <asp:TextBox runat="server" ID="txt_contact_1_p" CssClass="user" placeholder="Primary Contact" MaxLength="40"></asp:TextBox>
                <%-- <asp:RequiredFieldValidator ID="rf13" runat="server" ErrorMessage="Enter Valid Contact" ValidationGroup="sign_up" ControlToValidate="txt_contact_1_p" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
            </div>

            <div class="col-md-6 stylelbl">
                <asp:TextBox runat="server" ID="txt_telephone_p" CssClass="user" placeholder="Primary Telephone" MaxLength="15"></asp:TextBox>
                <%--    <asp:RequiredFieldValidator ID="rf12" runat="server" ErrorMessage="Enter Valid Telephone" ControlToValidate="txt_telephone_p" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                <%--   <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid Teleohone" ControlToValidate="txt_telephone_p" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red"></asp:RegularExpressionValidator>--%>
            </div>

            <div class="col-md-6 stylelbl">
                <asp:TextBox runat="server" ID="txt_contact_2_s" CssClass="user" placeholder="Secondary Contact" MaxLength="40"></asp:TextBox>
                <%--  <asp:RequiredFieldValidator ID="rf14" runat="server" ErrorMessage="Enter Valid Contact 2" ControlToValidate="txt_contact_2_s" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Contact" ControlToValidate="txt_contact_2_s" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>--%>
            </div>

            <div class="col-md-6 stylelbl">
                <asp:TextBox runat="server" ID="txt_telephone_s" CssClass="user" placeholder="Secondary Telephone" MaxLength="15"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Telephone" ControlToValidate="txt_telephone_s" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                <%--    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Teleohone" ControlToValidate="txt_telephone_s" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>--%>
            </div>

            <div class="col-md-6 stylelbl">
                <textarea id="txt_bio" class="user" runat="server" placeholder="Bio" style="width: 100%;" maxlength="200"></textarea>
            </div>

            <div class="col-md-6 stylelbl">
                <asp:TextBox runat="server" ID="txt_web_address" CssClass="user" placeholder="Web Address" MaxLength="15"></asp:TextBox>
            </div>
            <br />

            <div class="col-md-6 stylelbl">
                <asp:FileUpload runat="server" ID="fupimg" />
                <p style="float: left">Please add your Company logo here!</p>
                <br />
                <%--  <asp:RequiredFieldValidator ID="rf10" runat="server" ErrorMessage="Select Image" ControlToValidate="fupimg" ForeColor="Red" ValidationGroup="sign_up" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                <asp:RegularExpressionValidator runat="server" ID="reg_img" ControlToValidate="fupimg" ErrorMessage="Please select image file only." Display="Dynamic" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif|.jpeg)$" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div class="clearfix"></div>

            <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                <ContentTemplate>
                    <div class="col-md-6 stylelbl">

                        <asp:DropDownList ID="ddl_connect_cat" runat="server" CssClass="form-control bfh-states" CausesValidation="false" OnSelectedIndexChanged="ddl_connect_sub_SelectedIndexChanged" Style="height: 45px;" AutoPostBack="true">
                        </asp:DropDownList>

                    </div>
                    <div class="clearfix"></div>
                    <br />
                    <div class="col-md-12 stylelbl">
                        <asp:CheckBoxList ID="chk_connect_sub" runat="server" >
                        </asp:CheckBoxList>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="clearfix"></div>
            <br />

            <div class="col-md-6 stylelbl">
                <div id="dvCaptcha">
                </div>
                <asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
                <%--  <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="Captcha validation is required." ControlToValidate="txtCaptcha"
                    runat="server" ForeColor="Red" Display="Dynamic" />--%>
            </div>
            <div class="clearfix"></div>

            <%--<input type="submit" value="Sign Up " />--%>
            <div class="col-md-2">
                <asp:Button runat="server" ID="btn_sing_up" Text="Sign Up" OnClick="btn_sing_up_Click" ValidationGroup="sign_up" />
            </div>
            <%--<div class="forgot-grid">
                        <label class="checkbox">
                            <input type="checkbox" name="checkbox"><i></i>Remember me</label>
                        <div class="forgot">
                            <a href="#">Forgot Password?</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>--%>
            <br />
            <br />

        </div>
        <br />
        <br />
        <div class="clearfix"></div>
        <%--<h6>Already have an account? <a href="login.aspx">Login Now »</a> </h6>--%>
    </div>
    <!-- //sign up-page -->

</asp:Content>
