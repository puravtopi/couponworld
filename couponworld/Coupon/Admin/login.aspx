<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Coupon.Admin.login" %>

<!DOCTYPE html>

<html class="bg-black">
<head>
    <meta charset="UTF-8">
    <title>Coupan Admin | Log in</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- bootstrap 3.0.2 -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>
<body class="bg-black">

    <div class="form-box" id="login-box">
        <div class="header">Sign In</div>
        <form id="f1" runat="server">
            <div class="body bg-gray">
                <div class="form-group">
                    <input type="text" runat="server" id="txt_user_id" name="userid" class="form-control" placeholder="User ID" />
                    <asp:RequiredFieldValidator runat="server" ID="rf1" ControlToValidate="txt_user_id" ForeColor="Red" ErrorMessage="Enter Valid Email ID" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <input type="password" runat="server" id="txt_pwd_id" name="password" class="form-control" placeholder="Password" />
                    <asp:RequiredFieldValidator runat="server" ID="rf2" ControlToValidate="txt_pwd_id" ForeColor="Red" ErrorMessage="Enter valid Password" Display="Dynamic"></asp:RequiredFieldValidator>
                    <%--<asp:RegularExpressionValidator ID="Regex2" runat="server" ControlToValidate="txt_pwd_id"
                        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
                        ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ForeColor="Red" Display="Dynamic" />--%>
                </div>                
            </div>
            <div class="footer">
                <asp:Button runat="server" ID="btn_login" Text="Sign me in" CssClass="btn bg-olive btn-block" OnClick="btn_login_Click" />
                <%--<button type="submit" class="btn bg-olive btn-block">Sign me in</button>--%>
                <div id="divmess" runat="server" class="alert alert-danger" style="display: none">
                </div>
                <%--<p><a href="#">I forgot my password</a></p>--%>

                <%--<a href="register.aspx" class="text-center">Register a new membership</a>--%>
            </div>
        </form>

        <%--<div class="margin text-center">
            <span>Sign in using social networks</span>
            <br />
            <button class="btn bg-light-blue btn-circle"><i class="fa fa-facebook"></i></button>
            <button class="btn bg-aqua btn-circle"><i class="fa fa-twitter"></i></button>
            <button class="btn bg-red btn-circle"><i class="fa fa-google-plus"></i></button>

        </div>--%>
    </div>


    <!-- jQuery 2.0.2 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>
