<%@ Page Title="" Language="C#" MasterPageFile="~/connect_mst.Master" AutoEventWireup="true" CodeBehind="postdetails.aspx.cs" Inherits="Coupon.connect.postdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">

    <style>
        .detailsh3 {
            color: #F99D22;
        }

        .detailsdiv {
            padding-top: 10px;
        }

            .detailsdiv .info {
                padding-top: 10px;
                color: #6E6D6C;
            }

                .detailsdiv .info span {
                    color: #CEC8C1;
                }

            .detailsdiv p {
                padding-top: 20px;
                padding-bottom: 20px;
            }
    </style>
    <script>
        $(function () {

            $('#<%= btn_next.ClientID %>').click(function () {

                $('#divform').show();
                return false;

            })
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">


    <div style="text-align: left">

        <div class="container">

            <div class="alert alert-info" runat="server" id="lblmess" style="display: none">
                You have already applied on this Connect.
            </div>

            <asp:UpdatePanel runat="server" ID="upproposal">
                <ContentTemplate>

                    <div class="detailsdiv">

                        <asp:Repeater runat="server" ID="rep_details">
                            <ItemTemplate>

                                <h3><%# Eval("str_title") %>
                                </h3>

                                <div class="info">
                                    <div class="col-md-2" style="padding-left: 0px">
                                        <span class="fa fa-clock-o fa-lg" aria-hidden="true"></span>
                                        <%# Eval("int_no_of_days")!=DBNull.Value?Eval("int_no_of_days").ToString().Replace("-"," to ")+" days":" NA"  %>
                                    </div>
                                    <div class="col-md-2">
                                        <span class="fa fa-money fa-lg" aria-hidden="true"></span>
                                        <%# Eval("dec_approx_budget")!=DBNull.Value?Eval("dec_approx_budget").ToString().Replace("-"," to ")+" ($)":" NA"  %>
                                    </div>
                                    <div class="col-md-4">
                                        <span class="fa fa-map-marker fa-lg" aria-hidden="true"></span>
                                        <%# Eval("str_zip_code")!=DBNull.Value?Eval("str_zip_code").ToString():" NA"  %>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <p><%# Eval("str_details") %></p>
                            </ItemTemplate>
                        </asp:Repeater>
                        <br />
                        <div class="col-md-6" style="padding-left: 0">
                            <asp:Button CssClass="btn btn-success" Text="Submit A Proposal" runat="server" CausesValidation="false" ID="btn_next" />
                            <asp:Button runat="server" ID="btnback" Text="Back to List" PostBackUrl="~/connect/connectlist.aspx" CausesValidation="false" CssClass="btn btn-default" />
                        </div>
                        <div class="clearfix"></div>
                        <br />

                    </div>

                    <div class="login-page">
                        <div class="detailsdiv" style="display: none" id="divform">

                            <div class="col-md-12 stylelbl">
                                <label>Enter your approx budget for this job.</label>
                            </div>

                            <div class="col-md-3">
                                <asp:TextBox runat="server" ID="txt_cost" CssClass="user" placeholder="cost" onkeypress="return isNumberKey(event)" MaxLength="10"></asp:TextBox>
                            </div>

                            <div class="col-md-6">
                                <asp:RequiredFieldValidator runat="server" ID="com1" ControlToValidate="txt_cost" ErrorMessage="Enter your budget" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="clearfix"></div>

                            <div class="col-md-12 stylelbl">
                                <label>Enter Approx Days that need to finish the job.</label>
                            </div>

                            <div class="col-md-3">

                                <asp:TextBox runat="server" ID="txt_days" CssClass="user" placeholder="days" onkeypress="return isNumberKey(event)" MaxLength="3"></asp:TextBox>

                            </div>

                            <div class="col-md-6">
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txt_days" ErrorMessage="Enter your days" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-md-12 stylelbl">
                                <label>Your Proposal for this Job.</label>
                            </div>

                            <div class="col-md-12">

                                <asp:TextBox runat="server" TextMode="MultiLine" ID="txt_Details" Rows="10" placeholder="Details"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Details" ControlToValidate="txt_Details" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>

                            <div class="clearfix"></div>
                            <br />
                            <div class="col-md-2">
                                <asp:Button runat="server" Text="Submit" ID="btn_submit" OnClick="btn_submit_Click" />
                            </div>
                            <div class="clearfix"></div>
                            <br />


                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>


</asp:Content>
