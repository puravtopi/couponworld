<%@ Page Title="" Language="C#" MasterPageFile="~/registration.Master" AutoEventWireup="true" CodeBehind="member_sign_up.aspx.cs" Inherits="Coupon.member_sign_up" %>

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

    <style>
        a:hover,
        a:focus {
            color: #FF5E00;
            text-decoration: underline;
        }
    </style>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <%--<link rel="stylesheet" href="/resources/demos/style.css" />--%>
    <%--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
        $(document).ready(function () {
            $('#<%= txt_birth_date.ClientID%>').datepicker(
            {
                format: 'mm/dd/yyyy',
                changeMonth: true,
                changeYear: true,
                yearRange: '1970:2100'
            });
        })
    </script>

    <div class="login-page" style="padding: 0em;">
        <div class="container">
            <%--<ol class="breadcrumb breadcrumb1" style="text-align: left;">
                <li><a href='<%= ResolveUrl("~/home") %>'>Home</a></li>
                <li class="active">Sign Up</li>
            </ol>
            <br />
            <br />--%>
            <h3 class="w3ls-title w3ls-title1">Seva Connect Account Registration</h3>

            <div runat="server" id="lblmess"></div>
            <div>
                <h2 class="w3ls-title w3ls-title1" style="text-align: left">Enter Personal Information
                </h2>
                <hr />
                <br />
                <div class="col-md-6 stylelbl">
                    <label>First Name</label>
                    <asp:TextBox runat="server" ID="txt_fname" CssClass="user" placeholder="First Name" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid First Name" ValidationGroup="sign_up" ControlToValidate="txt_fname" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                </div>

                <div class="col-md-6 stylelbl">
                    <label>Last Name</label>
                    <asp:TextBox runat="server" ID="txt_l_name" CssClass="user" placeholder="Last Name" MaxLength="30"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf" runat="server" ErrorMessage="Enter Valid Last Name" ValidationGroup="sign_up" ControlToValidate="txt_l_name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>




                <div class="col-md-6 stylelbl">
                    <label>Email Id</label>
                    <asp:UpdatePanel runat="server" ID="up_email">
                        <ContentTemplate>
                            <asp:TextBox runat="server" ID="txt_email" CssClass="user" placeholder="Email ID" MaxLength="100" OnTextChanged="txt_email_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txt_email" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="re1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email" ValidationGroup="sign_up" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                            <label runat="server" id="lbl_email" style="color: red; display: none">Sorry ! email already allocated to some one else.</label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="clearfix"></div>
                <div class="col-md-6 stylelbl">
                    <label>Password</label>
                    <asp:TextBox runat="server" ID="txt_pass" type="password" CssClass="lock" placeholder="Password" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf8" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txt_pass" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Regex2" runat="server" ControlToValidate="txt_pass"
                        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$"
                        ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ForeColor="Red" ValidationGroup="sign_up" Display="Dynamic" />
                </div>

                <div class="col-md-6 stylelbl">
                    <label>Confirm Password</label>
                    <asp:TextBox runat="server" ID="txt_confirm_pass" type="password" CssClass="lock" placeholder="Confirm Password" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Confirm Password" ControlToValidate="txt_confirm_pass" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_confirm_pass"
                        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$"
                        ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ForeColor="Red" ValidationGroup="sign_up" Display="Dynamic" />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Your passwords do not match up!" ControlToCompare="txt_pass" ControlToValidate="txt_confirm_pass" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                </div>

                <div class="col-md-6 stylelbl">
                    <label>Gender</label>
                    <asp:DropDownList ID="ddl_gender" runat="server" CssClass="form-control bfh-states" Style="height: 45px;">
                        <asp:ListItem Text="-- Select Gender --" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Gender" ControlToValidate="ddl_gender" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                </div>

                <div class="col-md-6 stylelbl">
                    <label>Birth Date</label>
                    <asp:TextBox runat="server" ID="txt_birth_date" CssClass="user" placeholder="BirthDate" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Valid BirthDate" ValidationGroup="sign_up" ControlToValidate="txt_birth_date" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                </div>



                <div class="col-md-12 stylelbl">
                    <label>Address</label>
                    <textarea id="txt_address" class="user" runat="server" placeholder="Address" style="width: 100%;" maxlength="200"></textarea>
                    <asp:RequiredFieldValidator ID="rf4" runat="server" ErrorMessage="Enter Valid Street Address" ControlToValidate="txt_address" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                </div>





                <asp:UpdatePanel runat="server" ID="upMain">
                    <ContentTemplate>
                        <div class="col-md-6 stylelbl">
                            <label>State</label>
                            <asp:DropDownList ID="ddl_state" runat="server" CssClass="form-control bfh-states" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" Style="height: 45px;" AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rf6" runat="server" ErrorMessage="Select State" ControlToValidate="ddl_state" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-6 stylelbl">
                            <label>City</label>
                            <asp:DropDownList ID="ddl_city" runat="server" CssClass="form-control bfh-states" Style="height: 45px;">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rf7" runat="server" ErrorMessage="Select City" ControlToValidate="ddl_city" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="col-md-6 stylelbl">
                    <label>Zip</label>
                    <asp:TextBox runat="server" ID="txt_pincode" CssClass="user" placeholder="zip code" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf5" runat="server" ErrorMessage="Enter Valid Zip code" ControlToValidate="txt_pincode" ForeColor="Red" ValidationGroup="sign_up" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="re4" runat="server" ErrorMessage="Invalid Zip Coed" ControlToValidate="txt_pincode" ValidationGroup="sign_up" ValidationExpression="\d{5}" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>

                <div class="col-md-6 stylelbl">
                    <label>Telephone</label>
                    <asp:TextBox runat="server" ID="txt_telephone" CssClass="user" placeholder="Telephone" MaxLength="15"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf12" runat="server" ErrorMessage="Enter Valid Telephone" ControlToValidate="txt_telephone" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid Teleohone" ControlToValidate="txt_telephone" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Telephone" ControlToValidate="txt_telephone" ValidationGroup="sign_up" ValidationExpression="\d" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>--%>

                <div class="col-md-12 stylelbl">
                    <label>Upload Logo</label>
                    <asp:FileUpload runat="server" ID="fupimg" />
                    <p style="float: left">Please add your Company logo here!</p>
                    <br />
                   <%-- <asp:RequiredFieldValidator ID="rf10" runat="server" ErrorMessage="Select Image" ControlToValidate="fupimg" ForeColor="Red" ValidationGroup="sign_up" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                    <asp:RegularExpressionValidator runat="server" ID="reg_img" ControlToValidate="fupimg" ErrorMessage="Please select image file only." Display="Dynamic" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif|.jpeg)$" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>

                <%-- <asp:TextBox runat="server" ID="txt_designation" CssClass="user" placeholder="Enter Designation" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf14" runat="server" ErrorMessage="Enter Valid Designation" ControlToValidate="txt_designation" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />--%>

                <%-- <asp:DropDownList ID="ddl_grp" runat="server" CssClass="form-control bfh-states" Style="height: 45px;">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Select Group" ControlToValidate="ddl_grp" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                    <br />
                    <asp:DropDownList ID="ddl_age_grp" runat="server" CssClass="form-control bfh-states" Style="height: 45px;">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select Age Group" ControlToValidate="ddl_age_grp" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                    <br />--%>
                <div class="clearfix"></div>
                <br />

                <h2 class="w3ls-title w3ls-title1" style="text-align: left">Select Your Organization &nbsp;<a href="#register-modal" data-toggle="modal" data-target="#register-modal" style="font-size: 14px">(View Organization)</a>
                </h2>
                <hr />
                <br />
                <asp:UpdatePanel runat="server" ID="up_org">
                    <ContentTemplate>
                        <div class="col-md-6 stylelbl">
                            <label>State</label>
                            <asp:DropDownList ID="ddl_org_state" runat="server" CssClass="form-control bfh-states" OnSelectedIndexChanged="ddl_org_state_SelectedIndexChanged" Style="height: 45px;" AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select State" ControlToValidate="ddl_org_state" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 stylelbl">
                            <label>City</label>
                            <asp:DropDownList ID="ddl_org_city" runat="server" CssClass="form-control bfh-states" AutoPostBack="true" OnSelectedIndexChanged="ddl_org_city_SelectedIndexChanged" Style="height: 45px;">
                            </asp:DropDownList>
                        </div>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select City" ControlToValidate="ddl_org_city" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>--%>

                        <div class="col-md-6 stylelbl">
                            <label>Organizatiion Type</label>
                            <asp:DropDownList ID="ddl_org_type" runat="server" CssClass="form-control bfh-states" OnSelectedIndexChanged="ddl_org_type_SelectedIndexChanged" Style="height: 45px;" AutoPostBack="true">
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Select Organization Type" ControlToValidate="ddl_org_type" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>--%>
                        </div>

                        <div class="col-md-6 stylelbl">
                            <label>Organization</label>
                            <asp:DropDownList ID="ddl_organization" runat="server" CssClass="form-control bfh-states" Style="height: 45px;" AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Select Organization" ControlToValidate="ddl_organization" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                        <div class="clearfix"></div>
                        <br />
                        <h6 style="font-size: 11px;">* This Organization will receive a donation from each of your qualified Sofolio transactions</h6>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />

                <h2 class="w3ls-title w3ls-title1" style="text-align: left">Select Your Company&nbsp   <a href="#company-modal" data-toggle="modal" data-target="#company-modal" style="font-size: 14px">(View Company)</a>
                </h2>
                <hr />
                <br />
                <asp:UpdatePanel runat="server" ID="upcompany">
                    <ContentTemplate>
                        <div class="col-md-6 stylelbl">
                            <label>State</label>
                            <asp:DropDownList ID="ddl_company_state" runat="server" CssClass="form-control bfh-states" OnSelectedIndexChanged="ddl_company_state_SelectedIndexChanged" Style="height: 45px;" AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Select State" ControlToValidate="ddl_company_state" Display="Dynamic" ValidationGroup="sign_up" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-6 stylelbl">
                            <label>City</label>
                            <asp:DropDownList ID="ddl_company_city" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_company_city_SelectedIndexChanged" CssClass="form-control bfh-states" Style="height: 45px;">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6 stylelbl">
                            <label>Company Tye</label>
                            <asp:DropDownList ID="ddl_company_type" runat="server" CssClass="form-control bfh-states" OnSelectedIndexChanged="ddl_company_type_SelectedIndexChanged" Style="height: 45px;" AutoPostBack="true">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6 stylelbl">
                            <label>Company</label>
                            <asp:DropDownList ID="ddl_company" runat="server" CssClass="form-control bfh-states" Style="height: 45px;" AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Select Organization" ControlToValidate="ddl_company" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <div class="clearfix"></div>
                <br />
                <br />
                <div id="dvCaptcha">
                </div>
                <asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
                <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="Captcha validation is required." ControlToValidate="txtCaptcha"
                    runat="server" ForeColor="Red" Display="Dynamic" />
                <div class="clearfix"></div>
                <div class="col-md-2">
                    <asp:Button runat="server" ID="btn_sing_up" Text="Sign Up" OnClick="btn_sing_up_Click" ValidationGroup="sign_up" />
                </div>
                <div class="clearfix"></div>
                <br />
                <br />
            </div>



            <%--<h6>Already have an account? <a href="login.aspx">Login Now »</a> </h6>--%>

            <div class="modal fade" id="register-modal" role="dialog">
                <div class="modal-dialog" style="width: 65%;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" style="text-align: left;">View Organization</h4>
                        </div>
                        <div class="modal-body">
                            <%--<asp:Label runat="server" ID="lbl_org_mess"></asp:Label>--%>
                            <asp:UpdatePanel runat="server" ID="up_frame">
                                <ContentTemplate>
                                    <asp:Repeater ID="rp_view_org" runat="server">
                                        <HeaderTemplate>
                                            <div class="table-responsive">
                                                <table class="table table-bordered table-hover table-striped" style="width: 100%">
                                                    <thead>
                                                        <tr>
                                                            <th>Corporate Name</th>
                                                            <th>Organization</th>
                                                            <th>Address</th>
                                                            <th>City</th>
                                                            <th>State</th>
                                                            <th>Email</th>
                                                            <th>Org Type</th>

                                                            <%--<th style="width: 10%">Action</th>--%>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>

                                                <td><%# Eval("str_corporate_name") %></td>
                                                <td><%# Eval("str_organization_name") %></td>

                                                <td><%# Eval("str_street_address") %></td>
                                                <td><%# Eval("str_city_name") %></td>
                                                <td><%# Eval("str_short_name") %></td>
                                                <td><%# Eval("str_email_id_p") %></td>
                                                <td><%# Eval("str_organization_type") %></td>
                                                <%-- <td>
                                        <a class="btn btn-info btn-xs" href="<%# "edit_frame.aspx?eid=" +Eval("int_frame_id") %>">Edit</a>
                                        <asp:LinkButton ID="lnk_del" class="btn btn-info btn-xs" runat="server" CommandArgument='<%# Eval("int_frame_id") %>' OnClick="lnk_del_Click" OnClientClick="return confirm('Are you sure you want to delete.?')">Delete</asp:LinkButton>
                                    </td>--%>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody>
    </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                    <% if (rp_view_org.Items.Count == 0)
                                       { %>
                                    <p style="text-align: left;">
                                        Sorry ! No Data Fount
                                    </p>
                                    <%} %>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="company-modal" role="dialog">
                <div class="modal-dialog" style="width: 65%;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" style="text-align: left;">View Company</h4>
                        </div>
                        <div class="modal-body">
                            <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                            <asp:UpdatePanel runat="server" ID="up_company">
                                <ContentTemplate>

                                    <asp:Repeater ID="rp_company" runat="server">
                                        <HeaderTemplate>
                                            <div class="table-responsive">
                                                <table class="table table-bordered table-hover table-striped" style="width: 100%">
                                                    <thead>
                                                        <tr>
                                                            <th>Corporate Name</th>
                                                            <th>Company</th>
                                                            <th>Address</th>
                                                            <th>City</th>
                                                            <th>State</th>
                                                            <th>Email</th>
                                                            <th>Company Type</th>

                                                            <%--<th style="width: 10%">Action</th>--%>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>

                                                <td><%# Eval("str_corporate_name") %></td>
                                                <td><%# Eval("str_company_name") %></td>

                                                <td><%# Eval("str_street_address") %></td>
                                                <td><%# Eval("str_city_name") %></td>
                                                <td><%# Eval("str_short_name") %></td>
                                                <td><%# Eval("str_email_id_p") %></td>
                                                <td><%# Eval("str_company_type") %></td>
                                                <%-- <td>
                                        <a class="btn btn-info btn-xs" href="<%# "edit_frame.aspx?eid=" +Eval("int_frame_id") %>">Edit</a>
                                        <asp:LinkButton ID="lnk_del" class="btn btn-info btn-xs" runat="server" CommandArgument='<%# Eval("int_frame_id") %>' OnClick="lnk_del_Click" OnClientClick="return confirm('Are you sure you want to delete.?')">Delete</asp:LinkButton>
                                    </td>--%>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody>
    </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                    <% if (rp_company.Items.Count == 0)
                                       { %>
                                    <p style="text-align: left;">
                                        Sorry ! No Data Fount
                                    </p>
                                    <%} %>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>


                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>




</asp:Content>
