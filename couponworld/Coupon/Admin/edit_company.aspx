<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="edit_company.aspx.cs" Inherits="Coupon.Admin.company_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Company Details
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
                    <label>Corporate Name</label>
                    <asp:TextBox ID="txt_cname" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf3" runat="server" ErrorMessage="Enter Valid Corporate Name" ControlToValidate="txt_cname" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Company Name</label>
                    <asp:TextBox ID="txt_org_name" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid Organization Name" ControlToValidate="txt_org_name" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label>Street Address</label>
                    <textarea id="txt_address" runat="server" class="form-control"></textarea>
                   <%-- <asp:RequiredFieldValidator ID="rf4" runat="server" ErrorMessage="Enter Valid Street Address" ControlToValidate="txt_address" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>
                <div class="form-group">
                    <label>Apt Suite</label>
                    <asp:TextBox ID="txt_api" runat="server" CssClass="form-control"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="rf5" runat="server" ErrorMessage="Enter Valid Api Suite" ControlToValidate="txt_api" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
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
                            <asp:DropDownList ID="ddl_city" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_city_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rf17" runat="server" ErrorMessage="Select City" ControlToValidate="ddl_city" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="form-group">
                    <label>Zip Code</label>
                    <asp:TextBox ID="txt_pincode" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>
                </div>
                <asp:UpdatePanel runat="server" ID="up_email">
                    <ContentTemplate>
                        <div class="form-group">
                            <label>Email ID(P)</label>
                            <asp:TextBox ID="txt_email_p" runat="server" CssClass="form-control" OnTextChanged="txt_email_p_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="re1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email_p" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                        <label runat="server" id="lbl_email" style="color: red; display: none">Sorry ! email already allocated to some one else.</label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="form-group">
                    <label>Telephone(P)</label>
                    <asp:TextBox ID="txt_telephone_p" runat="server" CssClass="form-control"></asp:TextBox>
                   <%-- <asp:RequiredFieldValidator ID="rf26" runat="server" ErrorMessage="Enter Valid Telephone" ControlToValidate="txt_telephone_p" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalid Contact" ControlToValidate="txt_telephone_p" ValidationExpression="\d+" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>--%>
                </div>
                <div class="form-group">
                    <label>Contact(P)</label>
                    <asp:TextBox ID="txt_contact_1_p" runat="server" CssClass="form-control" MaxLength="15"></asp:TextBox>
                   <%-- <asp:RequiredFieldValidator ID="rf25" runat="server" ErrorMessage="Enter Valid Contact 1" ControlToValidate="txt_contact_1_p" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid Contact" ControlToValidate="txt_contact_1_p" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>--%>
                </div>

                <div class="form-group">
                    <label>Email ID(S)</label>
                    <asp:TextBox ID="txt_email_s" runat="server" CssClass="form-control"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Email Id" ControlToValidate="txt_email_s" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email_s" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label>Telephone(S)</label>
                    <asp:TextBox ID="txt_tele_s" runat="server" CssClass="form-control"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid Telephone" ControlToValidate="txt_tele_s" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Contact" ControlToValidate="txt_tele_s" ValidationExpression="\d+" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <label>Contact(s)</label>
                    <asp:TextBox ID="txt_contact_2_s" runat="server" CssClass="form-control" MaxLength="15"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="rf27" runat="server" ErrorMessage="Enter Valid Contact 2" ControlToValidate="txt_contact_2_s" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Invalid Contact" ControlToValidate="txt_contact_2_s" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label>Company Type</label>
                    <asp:DropDownList ID="ddl_org_type" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator ID="rf22" runat="server" ErrorMessage="Select Company Type" ControlToValidate="ddl_org_type" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>--%>
                </div>

                <div class="form-group">
                    <label>Share Type</label>
                    <asp:DropDownList ID="ddl_share_type" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                 <%--   <asp:RequiredFieldValidator ID="rf23" runat="server" ErrorMessage="Select Share Type" ControlToValidate="ddl_share_type" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>--%>
                </div>
                <div class="form-group">
                    <label>Organization Share</label>
                    <asp:TextBox ID="txt_org_share" runat="server" CssClass="form-control"></asp:TextBox>
                   <%-- <asp:RequiredFieldValidator ID="rf6" runat="server" ErrorMessage="Enter Valid Organization Share" ControlToValidate="txt_org_share" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <asp:TextBox ID="txt_password" type="password" runat="server" CssClass="form-control"></asp:TextBox>
                   <%-- <asp:RequiredFieldValidator ID="rf11" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txt_password" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Regex2" runat="server" ControlToValidate="txt_password"
                        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
                        ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ForeColor="Red" />--%>
                </div>
                <div class="form-group">
                    <label>Web Address</label>
                    <asp:TextBox ID="txt_web_address" runat="server" CssClass="form-control"></asp:TextBox>
                   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Web Address" ControlToValidate="txt_web_address" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>
                <div class="form-group">
                    <label>Logo</label>
                    <asp:FileUpload ID="fupimg" runat="server" />
                    <asp:Image ID="img" runat="server" Height="100px" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Select '.jpg','.gif','.png'" ControlToValidate="fupimg" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Selec Image" ControlToValidate="fupimg" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>
                <asp:Button ID="btn_add" Text="Save" runat="server" OnClick="btn_add_Click" CssClass="btn btn-success" />
                <asp:Button ID="btn_update" Text="Update" runat="server" OnClick="btn_update_Click" CssClass="btn btn-success" />
                <asp:Button ID="btn_back" Text="Back" runat="server" OnClick="btn_back_Click" CausesValidation="false" CssClass="btn btn-default" />

            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>

</asp:Content>
