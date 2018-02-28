<%@ Page Title="" Language="C#" MasterPageFile="~/registration.Master" AutoEventWireup="true" CodeBehind="sb_sign_up.aspx.cs" Inherits="Coupon.sb_sign_up" %>

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
            <h3 class="w3ls-title w3ls-title1">Small Business Account Create</h3>
            <hr />
            <div class="clearfix"></div>
            <%--<div class="col-lg-12">
                <div class="col-lg-6">--%>
            <div class="login-body">
                <div runat="server" id="lblmess"></div>

                <asp:TextBox runat="server" ID="txt_uname" CssClass="user" placeholder="DBA Name" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid Name" ValidationGroup="sign_up" ControlToValidate="txt_uname" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:TextBox runat="server" ID="txt_corporate_name" CssClass="user" placeholder="Corporate Name" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf3" runat="server" ErrorMessage="Enter Valid corporate Name" ValidationGroup="sign_up" ControlToValidate="txt_corporate_name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:UpdatePanel runat="server" ID="up_email">
                    <ContentTemplate>
                        <asp:TextBox runat="server" ID="txt_email" CssClass="user" placeholder="Email ID" MaxLength="100" OnTextChanged="txt_email_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txt_email" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="re1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email" ValidationGroup="sign_up" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>

                        <label runat="server" id="lbl_email" style="display: none">Sorry ! email already allocated to some one else.</label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:TextBox runat="server" ID="txt_email_s" CssClass="user" placeholder="Secondary Email ID" MaxLength="100"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txt_email_s" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email_s" ValidationGroup="sign_up" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox runat="server" ID="txt_pass" type="password" CssClass="lock" placeholder="Password" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf8" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txt_pass" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Regex2" runat="server" ControlToValidate="txt_pass"
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$"
                    ErrorMessage="Must be 8 to 20 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ForeColor="Red" ValidationGroup="sign_up" Display="Dynamic" />

                <textarea id="txt_address" class="user" runat="server" placeholder="Address" style="width: 100%;" maxlength="200"></textarea>
                <asp:RequiredFieldValidator ID="rf4" runat="server" ErrorMessage="Enter Valid Street Address" ControlToValidate="txt_address" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="txt_api_suit" CssClass="user" placeholder="Apt Suite" MaxLength="15" Visible="false"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf9" runat="server" ErrorMessage="Enter Valid Apt Suite" ControlToValidate="txt_api_suit" ValidationGroup="sign_up" Display="Dynamic" Visible="false" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:UpdatePanel runat="server" ID="upMain">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddl_state" runat="server" CssClass="form-control bfh-states" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" Style="height: 45px;" AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rf6" runat="server" ErrorMessage="Select State" ControlToValidate="ddl_state" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="ddl_city" runat="server" CssClass="form-control bfh-states" OnSelectedIndexChanged="ddl_city_SelectedIndexChanged" Style="height: 45px;" AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rf7" runat="server" ErrorMessage="Select City" ControlToValidate="ddl_city" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <asp:TextBox runat="server" ID="txt_pincode" CssClass="user" placeholder="Zip Code" MaxLength="5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf5" runat="server" ErrorMessage="Enter Valid Zip code" ControlToValidate="txt_pincode" ForeColor="Red" ValidationGroup="sign_up" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="re4" runat="server" ErrorMessage="Invalid Zip Coed" ControlToValidate="txt_pincode" ValidationGroup="sign_up" ValidationExpression="\d{5}" Display="Dynamic"  ForeColor="Red"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox runat="server" ID="txt_contact_1_p" CssClass="user" placeholder="Primary Contact" MaxLength="15"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf13" runat="server" ErrorMessage="Enter Valid Contact" ValidationGroup="sign_up" ControlToValidate="txt_contact_1_p" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalid Contact" ControlToValidate="txt_contact_1_p" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox runat="server" ID="txt_telephone_p" CssClass="user" placeholder="Primary Telephone" MaxLength="15"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf12" runat="server" ErrorMessage="Enter Valid Telephone" ControlToValidate="txt_telephone_p" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid Teleohone" ControlToValidate="txt_telephone_p" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red"></asp:RegularExpressionValidator>
                <br />

                <asp:TextBox runat="server" ID="txt_contact_2_s" CssClass="user" placeholder="Secondary Contact" MaxLength="15"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="rf14" runat="server" ErrorMessage="Enter Valid Contact 2" ControlToValidate="txt_contact_2_s" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Contact" ControlToValidate="txt_contact_2_s" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                <br />
                <asp:TextBox runat="server" ID="txt_telephone_s" CssClass="user" placeholder="Primary Telephone" MaxLength="15"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Telephone" ControlToValidate="txt_telephone_s" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Teleohone" ControlToValidate="txt_telephone_s" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                <br />
                <textarea id="txt_bio" class="user" runat="server" placeholder="Bio" style="width: 100%;" maxlength="200"></textarea>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Valid Street Address" ControlToValidate="txt_address" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox runat="server" ID="txt_web_address" CssClass="user" placeholder="Web Address" MaxLength="15"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid Bio Details" ControlToValidate="txt_bio" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <br />
                <%--<asp:DropDownList ID="ddl_share_type" runat="server" CssClass="form-control bfh-states" Style="height: 45px;">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Select Share Type" ControlToValidate="ddl_share_type" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox runat="server" ID="txt_share_amt" CssClass="user" placeholder="Enter Share Amount" MaxLength="15"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Valid Share Amount" ControlToValidate="txt_share_amt" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Share Amount" ControlToValidate="txt_share_amt" ValidationGroup="sign_up" ValidationExpression="\d" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                <br />--%>

                <asp:FileUpload runat="server" ID="fupimg" />
                <p style="float: left">Please add your Company logo here!</p>
                <br />
                <asp:RequiredFieldValidator ID="rf10" runat="server" ErrorMessage="Select Image" ControlToValidate="fupimg" ForeColor="Red" ValidationGroup="sign_up" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ID="reg_img" ControlToValidate="fupimg" ErrorMessage="Please select image file only." Display="Dynamic" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif|.jpeg)$" ForeColor="Red"></asp:RegularExpressionValidator>
                <br />
                <br />
                <div id="dvCaptcha">
                </div>
                <asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
                <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="Captcha validation is required." ControlToValidate="txtCaptcha"
                    runat="server" ForeColor="Red" Display="Dynamic" />
                <%--<input type="submit" value="Sign Up " />--%>
                <asp:Button runat="server" ID="btn_sing_up" Text="Sign Up" OnClick="btn_sing_up_Click" ValidationGroup="sign_up" />
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

                <%--</div>
                </div>--%>
                <%--<div class="col-lg-6">
                    <div class="single-page-icons social-icons" style="margin: 2em 0em;">
                        <ul>
                            <li>
                                <h4>Share on</h4>
                            </li>
                            <li><a href="http://www.facebook.com/sharer.php" class="fa fa-facebook icon facebook" id="lnkFacebook0"></a></li>
                            <li><a href="#" class="btn btn-primary"><span class="icon-facebook">Sign Up with Facebook</span></a></li>
                            <br />

                            <li><a href="#" class="btn btn-danger"><span class="icon-google-plus">Sign Up with Google Plus</span></a></li>
                            <li><a href="#" class="fa fa-dribbble icon dribbble"></a></li>
                            <li><a href="#" class="fa fa-rss icon rss"></a></li>
                        </ul>
                    </div>
                </div>--%>
            </div>
            <br />
            <br />
            <div class="clearfix"></div>
            <%--<h6>Already have an account? <a href="login.aspx">Login Now »</a> </h6>--%>
        </div>
    </div>
    <!-- //sign up-page -->
</asp:Content>
