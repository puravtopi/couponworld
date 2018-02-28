<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="edit_small_business.aspx.cs" Inherits="Coupon.Admin.small_business_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Small Business Details
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
                    <label>Name</label>
                    <asp:TextBox ID="txt_name" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="txt_name" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Corporate Name</label>
                    <asp:TextBox ID="txt_cname" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf3" runat="server" ErrorMessage="Enter Valid Corporate Name" ControlToValidate="txt_cname" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Street Address</label>
                    <textarea id="txt_address" runat="server" class="form-control"></textarea>
                    <asp:RequiredFieldValidator ID="rf4" runat="server" ErrorMessage="Enter Valid Street Address" ControlToValidate="txt_address" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label>Apt</label>
                    <asp:TextBox ID="txt_api" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf5" runat="server" ErrorMessage="Enter Valid Api Suite" ControlToValidate="txt_api" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <asp:UpdatePanel runat="server" ID="upMain" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="form-group">
                            <label>State</label>
                            <asp:DropDownList ID="ddl_state" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rf16" runat="server" ErrorMessage="Select State" ControlToValidate="ddl_state" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label>City</label>
                            <asp:DropDownList ID="ddl_city" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_city_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rf17" runat="server" ErrorMessage="Select City" ControlToValidate="ddl_city" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="form-group">
                    <label>Zip Code</label>
                    <asp:TextBox ID="txt_pincode" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf15" runat="server" ErrorMessage="Enter Valid Type" ControlToValidate="txt_pincode" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="re4" runat="server" ErrorMessage="Invalid Zip Coed" ControlToValidate="txt_pincode" ValidationExpression="\d{6}" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <label>Contact (P)</label>
                    <asp:TextBox ID="txt_contact_primary" runat="server" CssClass="form-control" MaxLength="15"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Primary Contact" ControlToValidate="txt_contact_primary" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalid Contact" ControlToValidate="txt_contact_primary" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <label>Telephone (P)</label>
                    <asp:TextBox ID="txt_tele_primary" runat="server" CssClass="form-control" MaxLength="15"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid Primary Teleohone" ControlToValidate="txt_tele_primary" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid Teleohone" ControlToValidate="txt_tele_primary" ValidationExpression="\d+" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <asp:UpdatePanel runat="server" ID="upEmail">
                    <ContentTemplate>
                        <div class="form-group">
                            <label>Email ID (P)</label>
                            <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" OnTextChanged="txt_email_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rf10" runat="server" ErrorMessage="Enter Valid Primary Email Id" ControlToValidate="txt_email" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="re1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                            <label runat="server" id="lblemail" style="display: none">Sorry ! Email id already allocated. </label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="form-group">
                    <label>Contact (S)</label>
                    <asp:TextBox ID="txt_contact_s" runat="server" CssClass="form-control" MaxLength="15"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Valid Secondary Contact" ControlToValidate="txt_contact_s" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Contact" ControlToValidate="txt_contact_s" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <label>Telephone (S)</label>
                    <asp:TextBox ID="txt_telephone_s" runat="server" CssClass="form-control"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Valid Secondary Teleohone" ControlToValidate="txt_telephone_s" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Invalid Teleohone" ControlToValidate="txt_telephone_s" ValidationExpression="\d+" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <label>Email ID (S)</label>
                    <asp:TextBox ID="txt_email_s" runat="server" CssClass="form-control"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Valid Secondary Email Id" ControlToValidate="txt_email_s" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email_s" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label>Small Business Type</label>
                    <asp:DropDownList ID="ddl_type" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator ID="rf14" runat="server" ErrorMessage="Select Type" ControlToValidate="ddl_type" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>--%>
                </div>
                <div class="form-group">
                    <label>Bio</label>
                    <asp:TextBox ID="txt_bio" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Bio" ControlToValidate="txt_bio" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Web Address</label>
                    <asp:TextBox ID="txt_web_address" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Valid Web Address" ControlToValidate="txt_web_address" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Share Type</label>
                    <asp:DropDownList ID="ddl_share_type" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Select Type" ControlToValidate="ddl_type" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label>Marketing Fee</label>
                    <asp:TextBox ID="txt_org_share" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf6" runat="server" ErrorMessage="Enter Valid Organization Share" ControlToValidate="txt_org_share" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <asp:TextBox ID="txt_password" type="password" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf11" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="txt_password" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Regex2" runat="server" ControlToValidate="txt_password"
                        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
                        ErrorMessage="Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ForeColor="Red" Display="Dynamic" />
                </div>
                <div class="form-group">
                    <label>Logo</label>
                    <asp:FileUpload ID="fupimg" runat="server" />
                    <asp:Image ID="Image1" runat="server" Height="100px" />
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
