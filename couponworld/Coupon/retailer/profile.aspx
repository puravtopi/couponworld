<%@ Page Title="" Language="C#" MasterPageFile="~/retailer.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Coupon.profile" %>

<%@ Register Src="~/controls/uc_retailer_sidebar.ascx" TagPrefix="uc1" TagName="uc_retailer_sidebar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <%--<script src="js/imagezoom.js"></script>--%>
    <style>
        a:hover,
        a:focus {
            color: #FF5E00;
            text-decoration: underline;
        }

        .item_name {
            color: #FF5E00;
        }
    </style>

    <div class="products">
        <div class="container">
            <div class="col-md-2">
                <uc1:uc_retailer_sidebar runat="server" ID="uc_retailer_sidebar" />
            </div>
            <div class="single-page">
                <div class="single-page-row" id="detail-21">

                    <div class="col-md-9 product-w3ls">
                        <asp:Repeater runat="server" ID="rpview">
                            <ItemTemplate>

                                <div class="col-lg-12">
                                    <h3 class="item_name">
                                        <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("str_corporate_name") %>'></asp:Label></h3>
                                    <p>
                                        <i class="fa fa-location-arrow" aria-hidden="true"></i>
                                        &nbsp;
                                        <%# Eval("str_city_name") %>

                                        &nbsp;&nbsp;
                                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                                        &nbsp;
                                         <%# Eval("str_city_name") %>,
                                        <%# Eval("str_state_name") %>
                                    </p>
                                    <hr />
                                </div>
                                <div class="clearfix"></div>
                                <br />
                                <div class="single-price">

                                    <div class="col-lg-12">
                                        <h3 class="item_name" style="display: inline">Bio
                                        </h3>
                                        <a href="#" data-toggle="modal" data-target="#bio" style="display: inline">(Edit)</a>

                                        <hr />
                                        <p>
                                            <%# Eval("str_bio") %>
                                        </p>

                                    </div>



                                    <div class="clearfix"></div>
                                    <br />
                                    <div class="col-lg-12">
                                        <h3 class="item_name" style="display: inline">Account Information
                                        </h3>
                                        <a href="#" data-toggle="modal" style="display: inline" data-target="#company_modal">(Edit)</a>
                                        <hr />
                                    </div>

                                    <div class="clearfix"></div>
                                    <br />
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>Name </b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="lbl_rname" Text='<%# Eval("str_retailer_name") %>'> </asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr />
                                    </div>
                                    <br />

                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>Email Id</b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="lbl_email" Text='<%# Eval("str_email_id_p") %>'> </asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr />
                                    </div>
                                    <br />

                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>Address</b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="lbl_address" Text='<%# Eval("str_street_address") %>'> </asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr />
                                    </div>
                                    <br />

                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>State</b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="lbl_states" Text='<%# Eval("str_state_name") %>'> </asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr />
                                    </div>
                                    <br />

                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>City</b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="lbl_citys" Text='<%# Eval("str_city_name") %>'> </asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr />
                                    </div>
                                    <br />

                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>Zip Code</b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="Label3" Text='<%# Eval("int_zip_code") %>'> </asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr />
                                    </div>
                                    <br />


                                    <br />

                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>Telephone</b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="Label1" Text='<%# Eval("str_telephone_p") %>'> </asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr />
                                    </div>
                                    <br />

                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>Contact Number</b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="Label2" Text='<%# Eval("str_contact_1_p") %>'> </asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr />
                                    </div>
                                    <br />
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>Contact Number(S)</b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="Label5" Text='<%# Eval("str_contact_2_s") %>'> </asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr />
                                    </div>
                                    <br />
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>Web Site Address</b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="Label4" Text='<%# Eval("str_web_address") %>'> </asp:Label>
                                        </div>
                                        <hr />

                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </ItemTemplate>
                        </asp:Repeater>

                        <div class="clearfix"></div>
                        <br />
                        <h3 class="item_name" style="display: inline">Social Information
                        </h3>

                        <a href="#" data-toggle="modal" data-target="#model_social" style="display: inline">(Edit)</a>

                        <hr />
                        <br />
                        <asp:Repeater runat="server" ID="rp_social">
                            <ItemTemplate>

                                <div class="clearfix"></div>

                                <div class="col-lg-12">
                                    <div class="col-lg-3">
                                        <div class="social-icons w3-agile-icons">
                                            <a href="#" id="A1" class="fa fa-facebook-square fa-2x"></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-9">
                                        <a href='<%# Eval("str_fb_link") %>' target="_new">
                                            <asp:Label runat="server" ID="Label6" Text='<%# Eval("str_fb_link") %>'> </asp:Label></a>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr />
                                </div>
                                <div class="col-lg-12">
                                    <div class="col-lg-3">
                                        <div class="social-icons w3-agile-icons">
                                            <a href="#" class="fa fa-twitter-square fa-2x"></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-9">
                                        <a href='<%# Eval("str_twitter_link") %>' target="_new">
                                            <asp:Label runat="server" ID="Label7" Text='<%# Eval("str_twitter_link") %>'> </asp:Label>
                                        </a>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr />
                                </div>
                                <div class="col-lg-12">
                                    <div class="col-lg-3">
                                        <div class="social-icons w3-agile-icons">
                                            <a href="#" class="fa fa-linkedin-square fa-2x"></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-9">
                                        <a href='<%# Eval("str_linkin_link") %>' target="_new">
                                            <asp:Label runat="server" ID="Label8" Text='<%# Eval("str_linkin_link") %>'> </asp:Label>
                                        </a>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr />
                                </div>
                                <div class="col-lg-12">
                                    <div class="col-lg-3">
                                        <div class="social-icons w3-agile-icons">
                                            <a href="#" class="fa fa-google-plus-square fa-2x"></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-9">
                                        <a href='<%# Eval("str_google_plus_link") %>' target="_new">
                                            <asp:Label runat="server" ID="Label9" Text='<%# Eval("str_google_plus_link") %>'> </asp:Label>
                                        </a>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr />
                                </div>
                                <div class="col-lg-12">
                                    <div class="col-lg-3">
                                        <div class="social-icons w3-agile-icons">
                                            <a href="#" id="A5" class=" fa fa-chrome fa-2x"></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-9">
                                        <a href='<%# Eval("str_other_link") %>' target="_new">
                                            <asp:Label runat="server" ID="Label10" Text='<%# Eval("str_other_link") %>'> </asp:Label>
                                        </a>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr />
                                </div>

                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                        <% if (rp_social.Items.Count == 0)
                           { %>
                        <p>Sorry ! No link set yet.</p>
                        <%} %>

                        <div class="clearfix"></div>
                        <br />
                        <h3 class="item_name" style="display: inline">Connect Details
                        </h3>

                        <a href="#" data-toggle="modal" data-target="#model_connect_sub" style="display: inline">(Edit)</a>

                        <hr />
                        <br />
                        <ul>
                            <asp:Repeater runat="server" ID="rep_connect_sub">
                                <ItemTemplate>
                                    <li><b><%# Eval("str_sub_cat") %></b></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <br />
            <div class="col-md-2">
            </div>
        </div>

        <div class="clearfix"></div>
    </div>

    <div class="modal fade" id="company_modal" role="dialog">
        <div class="modal-dialog" style="width: 82%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Account Information</h4>
                </div>
                <div class="modal-body">
                    <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                    <asp:UpdatePanel runat="server" ID="up_retailer">
                        <ContentTemplate>


                            <!-- general form elements disabled -->
                            <div class="box box-warning">

                                <!-- /.box-header -->
                                <div class="box-body">
                                    <!-- text input -->
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Name </label>
                                            <asp:TextBox runat="server" ID="txt_name" CssClass="form-control" MaxLength="30"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid Name" ValidationGroup="retailer" ControlToValidate="txt_name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Corporate Name </label>
                                            <asp:TextBox runat="server" ID="txt_cname" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rf3" runat="server" ErrorMessage="Enter Valid corporate Name" ValidationGroup="retailer" ControlToValidate="txt_cname" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Email </label>
                                            <asp:TextBox runat="server" ID="txt_email" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txt_email" ValidationGroup="retailer" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="re1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email" ValidationGroup="retailer" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Address </label>
                                            <textarea id="txt_address" class="form-control" runat="server" placeholder="Address" maxlength="200"></textarea>
                                            <asp:RequiredFieldValidator ID="rf4" runat="server" ErrorMessage="Enter Valid Street Address" ControlToValidate="txt_address" ValidationGroup="retailer" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <asp:UpdatePanel runat="server" ID="up_area">
                                        <ContentTemplate>
                                            <div class=" col-lg-4">

                                                <div class="form-group">

                                                    <label>State </label>
                                                    <asp:DropDownList runat="server" ID="ddl_state" CssClass="form-control bfh-states" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rf6" runat="server" ErrorMessage="Select State" ControlToValidate="ddl_state" Display="Dynamic" ValidationGroup="retailer" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class=" col-lg-4">


                                                <div class="form-group">

                                                    <label>City </label>
                                                    <asp:DropDownList runat="server" ID="ddl_city" CssClass="form-control bfh-states"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rf7" runat="server" ErrorMessage="Select City" ControlToValidate="ddl_city" Display="Dynamic" ValidationGroup="retailer" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div class="clearfix"></div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Zip Code </label>
                                            <asp:TextBox runat="server" ID="txt_zip" CssClass="form-control" MaxLength="5"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rf5" runat="server" ErrorMessage="Enter Valid Zip code" ControlToValidate="txt_zip" ForeColor="Red" ValidationGroup="sign_up" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="re4" runat="server" ErrorMessage="Invalid Zip Coed" ControlToValidate="txt_zip" ValidationGroup="retailer" ValidationExpression="\d{5}" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>

                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Telephone(P) </label>
                                            <asp:TextBox runat="server" ID="txt_telephone" CssClass="form-control" MaxLength="15"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rf12" runat="server" ErrorMessage="Enter Valid Telephone" ControlToValidate="txt_telephone" ValidationGroup="retailer" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Invalid Telephone" ControlToValidate="txt_telephone" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ValidationGroup="retailer" ForeColor="Red"></asp:RegularExpressionValidator>

                                        </div>
                                    </div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Retailer Type </label>
                                            <asp:DropDownList runat="server" ID="ddl_type" CssClass="form-control bfh-states"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Retailer Type" ControlToValidate="ddl_type" Display="Dynamic" ValidationGroup="retailer" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Contact(P) </label>
                                            <asp:TextBox runat="server" ID="txt_contact" CssClass="form-control" MaxLength="15"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rf13" runat="server" ErrorMessage="Enter Valid Contact" ValidationGroup="retailer" ControlToValidate="txt_contact" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Invalid Contact" ControlToValidate="txt_contact" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ValidationGroup="retailer" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Contact(S) </label>
                                            <asp:TextBox runat="server" ID="txt_contact_s" CssClass="form-control" MaxLength="15"></asp:TextBox>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid Secondary Contact" ValidationGroup="retailer" ControlToValidate="txt_contact_s" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Invalid Contact" ControlToValidate="txt_contact_s" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ValidationGroup="retailer" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Web Address </label>
                                            <asp:TextBox runat="server" ID="txt_web" CssClass="form-control" MaxLength="30"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Web Address" ValidationGroup="retailer" ControlToValidate="txt_web" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->

                            <div class="clearfix"></div>

                            <div class="modal-footer">
                                <asp:LinkButton runat="server" ID="lnk_update" ValidationGroup="retailer" CssClass="btn btn-success" OnClick="lnk_update_Click">Update</asp:LinkButton>
                                <%--<asp:LinkButton runat="server" ValidationGroup="active" ID="lnk_active_status" CssClass="btn btn-success" OnClick="lnk_active_status_Click"> Active</asp:LinkButton>--%>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="lnk_update" />
                        </Triggers>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="bio" role="dialog">
        <div class="modal-dialog" style="width: 82%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Bio</h4>
                </div>
                <div class="modal-body">
                    <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                    <asp:UpdatePanel runat="server" ID="up_bio">
                        <ContentTemplate>
                            <!-- general form elements disabled -->
                            <div class="box box-warning">

                                <!-- /.box-header -->
                                <div class="box-body">
                                    <!-- text input -->
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Bio </label>
                                            <textarea id="txt_bio" class="form-control" runat="server" placeholder="Bio" maxlength="500"></textarea>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Valid Bio" ControlToValidate="txt_bio" ValidationGroup="bio" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                </div>

                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->

                            <div class="clearfix"></div>

                            <div class="modal-footer">
                                <asp:LinkButton runat="server" ID="lnk_bio_update" ValidationGroup="bio" CssClass="btn btn-success" OnClick="lnk_bio_update_Click">Update</asp:LinkButton>
                                <%--<asp:LinkButton runat="server" ValidationGroup="active" ID="lnk_active_status" CssClass="btn btn-success" OnClick="lnk_active_status_Click"> Active</asp:LinkButton>--%>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="lnk_bio_update" />
                        </Triggers>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="model_social" role="dialog">
        <div class="modal-dialog" style="width: 82%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Social Information</h4>
                </div>
                <div class="modal-body">
                    <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                    <asp:UpdatePanel runat="server" ID="up_social">
                        <ContentTemplate>
                            <!-- general form elements disabled -->
                            <div class="box box-warning">

                                <!-- /.box-header -->
                                <div class="box-body">
                                    <!-- text input -->

                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Facebook </label>
                                            <asp:TextBox runat="server" ID="txt_fb_link" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Valid Facebook Link" ControlToValidate="txt_fb_link" ValidationGroup="social" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Facebook Link" ControlToValidate="txt_fb_link" ValidationGroup="social" ValidationExpression="^http(s)?://([\w-]+.)+[\w-]+(/[\w- ./?%&=])?$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>

                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Twitter </label>
                                            <asp:TextBox runat="server" ID="txt_twitter" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Valid Twitter Link" ControlToValidate="txt_twitter" ValidationGroup="social" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Twitter Link" ControlToValidate="txt_twitter" ValidationGroup="social" ValidationExpression="^http(s)?://([\w-]+.)+[\w-]+(/[\w- ./?%&=])?$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Linkdin </label>
                                            <asp:TextBox runat="server" ID="txt_linkin" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Valid Linkdin Link" ControlToValidate="txt_linkin" ValidationGroup="social" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Linkdin Link" ControlToValidate="txt_linkin" ValidationGroup="social" ValidationExpression="^http(s)?://([\w-]+.)+[\w-]+(/[\w- ./?%&=])?$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Google Plus </label>
                                            <asp:TextBox runat="server" ID="txt_google_plus" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Valid Google Plus Link" ControlToValidate="txt_google_plus" ValidationGroup="social" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalid Google Plus Link" ControlToValidate="txt_google_plus" ValidationGroup="social" ValidationExpression="^http(s)?://([\w-]+.)+[\w-]+(/[\w- ./?%&=])?$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Other </label>
                                            <asp:TextBox runat="server" ID="txt_other" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Valid Other Link" ControlToValidate="txt_other" ValidationGroup="social" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid Other Link" ControlToValidate="txt_other" ValidationGroup="social" ValidationExpression="^http(s)?://([\w-]+.)+[\w-]+(/[\w- ./?%&=])?$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>

                                </div>

                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->

                            <div class="clearfix"></div>

                            <div class="modal-footer">
                                <asp:LinkButton runat="server" ID="lnk_social_update" ValidationGroup="social" CssClass="btn btn-success" OnClick="lnk_social_update_Click">Update</asp:LinkButton>
                                <%--<asp:LinkButton runat="server" ValidationGroup="active" ID="lnk_active_status" CssClass="btn btn-success" OnClick="lnk_active_status_Click"> Active</asp:LinkButton>--%>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="lnk_social_update" />
                        </Triggers>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="model_connect_sub" role="dialog">
        <div class="modal-dialog" style="width: 82%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Connect Details</h4>
                </div>
                <div class="modal-body">
                    <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>
                            <!-- general form elements disabled -->
                            <div class="box box-warning">

                                <!-- /.box-header -->
                                <div class="box-body">
                                    <!-- text input -->

                                    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                        <ContentTemplate>
                                            <div class="col-md-6 stylelbl">

                                                <asp:DropDownList ID="ddl_connect_cat" runat="server" CssClass="form-control bfh-states" CausesValidation="false" OnSelectedIndexChanged="ddl_connect_cat_SelectedIndexChanged" Style="height: 45px;" AutoPostBack="true">
                                                </asp:DropDownList>

                                            </div>
                                            <div class="clearfix"></div>
                                            <br />
                                            <div class="col-md-12 stylelbl">
                                                <asp:CheckBoxList ID="chk_connect_sub" runat="server" RepeatDirection="Horizontal">
                                                </asp:CheckBoxList>
                                            </div>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <div class="clearfix"></div>


                                </div>

                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->

                            <div class="clearfix"></div>

                            <div class="modal-footer">
                                <asp:LinkButton runat="server" ID="lnk_connect"  CssClass="btn btn-success" OnClick="lnk_connect_Click">Update</asp:LinkButton>
                                <%--<asp:LinkButton runat="server" ValidationGroup="active" ID="lnk_active_status" CssClass="btn btn-success" OnClick="lnk_active_status_Click"> Active</asp:LinkButton>--%>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="lnk_social_update" />
                        </Triggers>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>

</asp:Content>
