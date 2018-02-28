<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="edit_member.aspx.cs" Inherits="Coupon.Admin.member_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Consumer Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">

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
                    <label>First Name</label>
                    <asp:TextBox ID="txt_fname" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf3" runat="server" ErrorMessage="Enter Valid First Name" ControlToValidate="txt_fname" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <asp:TextBox ID="txt_lame" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid Last Name" ControlToValidate="txt_lame" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <asp:UpdatePanel runat="server" ID="upEmail">
                    <ContentTemplate>
                        <div class="form-group">
                            <label>Email ID</label>
                            <asp:TextBox ID="txt_email_p" runat="server" AutoPostBack="true" OnTextChanged="txt_email_p_TextChanged" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rf10" runat="server" ErrorMessage="Enter Valid Email Id" ControlToValidate="txt_email_p" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="re1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email_p" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                            <label runat="server" id="lblemail" style="display: none">Sorry ! Email id already allocated. </label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="form-group">
                    <label>Password</label>
                    <asp:TextBox ID="txt_password" type="password" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf11" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txt_password" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Regex2" runat="server" ControlToValidate="txt_password"
                        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
                        ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="ddl_gender" runat="server" CssClass="form-control" Style="height: 45px;">
                        <asp:ListItem Text="-- Select Gender --" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Gender" ControlToValidate="ddl_gender" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label>BirthDate</label>
                    <asp:TextBox ID="txt_birth_date" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid BirthDate" ControlToValidate="txt_birth_date" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Street Address</label>
                    <textarea id="txt_address" runat="server" class="form-control"></textarea>
                    <asp:RequiredFieldValidator ID="rf4" runat="server" ErrorMessage="Enter Valid Street Address" ControlToValidate="txt_address" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <asp:UpdatePanel runat="server" ID="up_main">
                    <ContentTemplate>

                        <div class="form-group">
                            <label>State</label>
                            <asp:DropDownList ID="ddl_state" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rf16" runat="server" ErrorMessage="Select State" ControlToValidate="ddl_state" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>City</label>
                            <asp:DropDownList ID="ddl_city" runat="server" CssClass="form-control" AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rf17" runat="server" ErrorMessage="Select City" ControlToValidate="ddl_city" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="form-group">
                    <label>Zip Code</label>
                    <asp:TextBox ID="txt_pincode" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf15" runat="server" ErrorMessage="Enter Valid Zip Coed" ControlToValidate="txt_pincode" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="re4" runat="server" ErrorMessage="Invalid Zip Coed" ControlToValidate="txt_pincode" ValidationExpression="\d{5}" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>


                <div class="form-group">
                    <label>Telephone</label>
                    <asp:TextBox ID="txt_telephone_p" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf26" runat="server" ErrorMessage="Enter Valid Telephone" ControlToValidate="txt_telephone_p" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Organization</label>
                    <asp:DropDownList ID="ddl_org" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rf22" runat="server" ErrorMessage="Select Organization" ControlToValidate="ddl_org" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Company</label>
                    <asp:DropDownList ID="ddl_company" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Company" ControlToValidate="ddl_company" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label>Logo</label>
                    <asp:FileUpload ID="fupimg" runat="server" />
                    <asp:Image ID="img" runat="server" Height="100px" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Select '.jpg','.gif','.png'" ControlToValidate="fupimg" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Selec Image" ControlToValidate="fupimg" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>


                <asp:Button ID="btn_add" Text="Save" runat="server" OnClick="btn_add_Click" CssClass="btn btn-success" />
                <asp:Button ID="btn_update" Text="Update" runat="server" OnClick="btn_update_Click" CssClass="btn btn-success" />
                <asp:Button ID="btn_back" Text="Back" runat="server" PostBackUrl="~/Admin/view_member.aspx" CausesValidation="false" CssClass="btn btn-default" />

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
            $('#<%= txt_birth_date.ClientID%>').datepicker({
                format: 'mm/dd/yyyy', autoclose: true, changeMonth: true,
                changeYear: true
            });
        });
    </script>


</asp:Content>
