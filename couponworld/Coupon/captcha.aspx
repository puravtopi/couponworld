﻿<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="captcha.aspx.cs" Inherits="Coupon.captcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
        async defer></script>
    <script type="text/javascript">
        var onloadCallback = function () {
            grecaptcha.render('dvCaptcha', {
                'sitekey': '<%=ReCaptcha_Key %>',
            'callback': function (response) {
                $.ajax({
                    type: "POST",
                    url: "CS.aspx/VerifyCaptcha",
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
    <div id="dvCaptcha">
    </div>
    <asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
    <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="Captcha validation is required." ControlToValidate="txtCaptcha"
        runat="server" ForeColor="Red" Display="Dynamic" />
    <br />
    <br />
    <asp:Button ID="btnSubmit" Text="Submit" runat="server" />

</asp:Content>
