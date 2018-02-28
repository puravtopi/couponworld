﻿<%@ Page Title="" Language="C#" MasterPageFile="~/member.Master" AutoEventWireup="true" CodeBehind="member_profile.aspx.cs" Inherits="Coupon.member_user.member_profile" %>

<%@ Register Src="~/controls/uc_consumer_sidebar.ascx" TagPrefix="uc1" TagName="uc_consumer_sidebar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
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
            <%-- $('#<%= txt_end_date.ClientID%>').datepicker(
            {
                format: 'mm/dd/yyyy',
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2100'
            });--%>

        })
    </script>

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
                <uc1:uc_consumer_sidebar runat="server" ID="uc_consumer_sidebar" />
            </div>
            <div class="single-page">
                <div class="single-page-row" id="detail-21">

                    <div class="col-md-9 product-w3ls">
                        <asp:Repeater runat="server" ID="rpview">
                            <ItemTemplate>

                                <div class="col-lg-12">
                                    <h3 class="item_name">
                                        <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("str_first_name") %>'></asp:Label>
                                        <asp:Label runat="server" ID="lbl_lname" Text='<%# Eval("str_last_name") %>'> </asp:Label></h3>
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

                                <div class="single-price">
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
                                            <asp:Label runat="server" ID="lbl_rname" Text='<%# Eval("str_first_name") %>'> </asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr />
                                    </div>
                                    <br />
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>Last Name </b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="Label7" Text='<%# Eval("str_last_name") %>'> </asp:Label>
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
                                            <asp:Label runat="server" ID="lbl_email" Text='<%# Eval("str_email_id") %>'> </asp:Label>
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
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>Telephone</b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="Label1" Text='<%# Eval("str_telephone") %>'> </asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr />
                                    </div>
                                    <br />

                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>BirthDate</b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="Label2" Text='<%# Eval("str_date_of_birth","{0:dd-MM-yyyy }") %>'> </asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr />
                                    </div>
                                    <br />
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>Organization</b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="Label5" Text='<%# Eval("str_organization_name") %>'> </asp:Label>
                                        </div>
                                        <div class="clearfix"></div>
                                        <hr />
                                    </div>
                                    <br />
                                    <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <b>Company</b>
                                        </div>
                                        <div class="col-lg-9">
                                            <asp:Label runat="server" ID="Label4" Text='<%# Eval("str_company_name") %>'> </asp:Label>
                                        </div>
                                        <hr />

                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                            </ItemTemplate>
                        </asp:Repeater>

                        <div class="clearfix"></div>
                        <br />
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
                                            <label>First Name </label>
                                            <asp:TextBox runat="server" ID="txt_name" CssClass="form-control" MaxLength="30"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid First Name" ValidationGroup="member" ControlToValidate="txt_name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Last Name </label>
                                            <asp:TextBox runat="server" ID="txt_lname" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rf3" runat="server" ErrorMessage="Enter Valid Last Name" ValidationGroup="member" ControlToValidate="txt_lname" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Email </label>
                                            <asp:TextBox runat="server" ID="txt_email" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txt_email" ValidationGroup="member" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="re1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email" ValidationGroup="member" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>

                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Gender </label>
                                            <asp:DropDownList ID="ddl_gender" runat="server" CssClass="form-control bfh-states" Style="height: 45px;">
                                                <asp:ListItem Text="-- Select Gender --" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Select Gender" ControlToValidate="ddl_gender" Display="Dynamic" ValidationGroup="member" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Birthdate </label>
                                            <asp:TextBox runat="server" ID="txt_birth_date" CssClass="form-control" placeholder="BirthDate" MaxLength="10"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Valid BirthDate" ValidationGroup="member" ControlToValidate="txt_birth_date" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Address </label>
                                            <textarea id="txt_address" class="form-control" runat="server" placeholder="Address" maxlength="200"></textarea>
                                            <asp:RequiredFieldValidator ID="rf4" runat="server" ErrorMessage="Enter Valid Street Address" ControlToValidate="txt_address" ValidationGroup="member" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <asp:UpdatePanel runat="server" ID="up_area">
                                        <ContentTemplate>
                                            <div class=" col-lg-4">

                                                <div class="form-group">

                                                    <label>State </label>
                                                    <asp:DropDownList runat="server" ID="ddl_state" CssClass="form-control bfh-states" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rf6" runat="server" ErrorMessage="Select State" ControlToValidate="ddl_state" Display="Dynamic" ValidationGroup="member" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class=" col-lg-4">


                                                <div class="form-group">

                                                    <label>City </label>
                                                    <asp:DropDownList runat="server" ID="ddl_city" CssClass="form-control bfh-states"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rf7" runat="server" ErrorMessage="Select City" ControlToValidate="ddl_city" Display="Dynamic" ValidationGroup="member" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Zip Code </label>
                                            <asp:TextBox runat="server" ID="txt_zip" CssClass="form-control" MaxLength="5"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rf5" runat="server" ErrorMessage="Enter Valid Zip code" ControlToValidate="txt_zip" ForeColor="Red" ValidationGroup="member" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="re4" runat="server" ErrorMessage="Invalid Zip Coed" ControlToValidate="txt_zip" ValidationGroup="member" ValidationExpression="\d{5}" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">
                                            <label>Telephone(P) </label>
                                            <asp:TextBox runat="server" ID="txt_telephone" CssClass="form-control" MaxLength="15"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rf12" runat="server" ErrorMessage="Enter Valid Telephone" ControlToValidate="txt_telephone" ValidationGroup="member" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Invalid Telephone" ControlToValidate="txt_telephone" ValidationExpression="^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$" Display="Dynamic" ValidationGroup="member" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>

                                    <div class=" col-lg-4">
                                        <div class="form-group">

                                            <label>Organization </label>
                                            <asp:DropDownList runat="server" ID="ddl_org" CssClass="form-control bfh-states"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Organization" ControlToValidate="ddl_org" Display="Dynamic" ValidationGroup="member" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class=" col-lg-4">
                                        <div class="form-group">

                                            <label>Company </label>
                                            <asp:DropDownList runat="server" ID="ddl_company" CssClass="form-control bfh-states"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Company" ControlToValidate="ddl_company" Display="Dynamic" ValidationGroup="member" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>

                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->

                            <div class="clearfix"></div>

                            <div class="modal-footer">

                                <asp:LinkButton runat="server" ID="link_update" ValidationGroup="member" CssClass="btn btn-success" OnClick="link_update_Click">Update</asp:LinkButton>
                                <%--<asp:LinkButton runat="server" ID="lnk_update" ValidationGroup="sign_up" CssClass="btn btn-success" OnClick="lnk_update_Click">Update</asp:LinkButton>--%>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="link_update" />
                        </Triggers>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>

</asp:Content>
