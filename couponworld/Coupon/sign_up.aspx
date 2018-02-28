<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/other.Master" CodeBehind="sign_up.aspx.cs" Inherits="Coupon.sign_up" %>




<asp:Content runat="server" ID="cmain" ContentPlaceHolderID="ContentPlaceHolder1">

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

    <!-- sign up-page -->
    <div class="login-page">
        <div class="container">
            <h3 class="w3ls-title w3ls-title1">Create your account</h3>
            <div class="login-body">
                <asp:DropDownList runat="server" ID="ddl_user" CssClass="form-control bfh-states" Style="height: 45px;">
                    <asp:ListItem Value="0">-- Select User --</asp:ListItem>
                    <asp:ListItem Value="1">Consumer</asp:ListItem>
                    <asp:ListItem Value="2">Organization</asp:ListItem>
                    <asp:ListItem Value="3">Retailer</asp:ListItem>
                    <asp:ListItem Value="4">Small Business</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rf22" runat="server" ErrorMessage="Select User" ControlToValidate="ddl_user" ForeColor="Red" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                <br />

                <asp:TextBox runat="server" ID="txt_uname" CssClass="user" placeholder="Enter your name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="txt_uname" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:TextBox runat="server" ID="txt_email" CssClass="user" placeholder="Enter your email ID"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txt_email" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="re1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>

                <asp:TextBox runat="server" ID="txt_pass" type="password" CssClass="lock" placeholder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf11" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txt_pass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Regex2" runat="server" ControlToValidate="txt_pass"
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
                    ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ForeColor="Red" Display="Dynamic" />

                <textarea id="txt_address" class="user" runat="server" placeholder="Address" style="width: 100%;"></textarea>
                <asp:RequiredFieldValidator ID="rf4" runat="server" ErrorMessage="Enter Valid Street Address" ControlToValidate="txt_address" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:DropDownList ID="ddl_state" runat="server" CssClass="form-control bfh-states" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" Style="height: 45px;">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rf16" runat="server" ErrorMessage="Select State" ControlToValidate="ddl_state" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="ddl_city" runat="server" CssClass="form-control bfh-states" OnSelectedIndexChanged="ddl_city_SelectedIndexChanged" Style="height: 45px;">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rf17" runat="server" ErrorMessage="Select City" ControlToValidate="ddl_city" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox runat="server" ID="txt_pincode" CssClass="user" placeholder="Enter zip code"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf5" runat="server" ErrorMessage="Enter Valid Zip code" ControlToValidate="txt_pincode" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="re4" runat="server" ErrorMessage="Invalid Zip Coed" ControlToValidate="txt_pincode" ValidationExpression="\d{6}" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                <br />
                <div class="col-md-12 stylelbl">
                    <div id="dvCaptcha">
                    </div>

                    <asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
                    <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="Captcha validation is required." ControlToValidate="txtCaptcha"
                        runat="server" ForeColor="Red" Display="Dynamic" />
                </div>

                <%-- <recaptcha:RecaptchaControl ID="RecaptchaControl1" runat="server" PublicKey="6LeV7fwSAAAAACGlvCvX_cJzhsys5Ju_rW7Oqsn-"
                    PrivateKey="6LeV7fwSAAAAACgQzjfZscePs-7d6kGx9A-RweGY" />--%>

                <%-- <rsv:CaptchaControl ID="captcha1" runat="server" CaptchaLength="5"
                    CaptchaHeight="60" CaptchaWidth="200" CaptchaLineNoise="None"
                    CaptchaMinTimeout="5" CaptchaMaxTimeout="240" ForeColor="#00FFCC"
                    BackColor="White" CaptchaChars="ABCDEFGHIJKLNPQRTUVXYZ12346789"
                    FontColor="Red"></rsv:CaptchaControl>
                <br />
                <asp:TextBox ID="TextBox2" runat="server" CssClass="style4" Width="196px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="TextBox2" ErrorMessage="Enter Captcha" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                <%--<input type="submit" value="Sign Up " />--%>
                <asp:Button runat="server" ID="btn_sing_up" Text="Sign Up" OnClick="btn_sing_up_Click" />
                <%--<div class="forgot-grid">
                        <label class="checkbox">
                            <input type="checkbox" name="checkbox"><i></i>Remember me</label>
                        <div class="forgot">
                            <a href="#">Forgot Password?</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>--%>
                <br />
                <div runat="server" id="divmess"></div>
            </div>
            <h6>Already have an account? <a href="login.aspx">Login Now »</a> </h6>
        </div>
    </div>
    <!-- //sign up-page -->
</asp:Content>
