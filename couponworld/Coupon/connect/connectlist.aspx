<%@ Page Title="" Language="C#" MasterPageFile="~/connect_mst.Master" AutoEventWireup="true" CodeBehind="connectlist.aspx.cs" Inherits="Coupon.connect.connectlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    <style>
        .posthr {
            margin-top: 15px;
            margin-bottom: 15px;
            border: 0;
            border-top: 2px solid #eee;
        }

        .divpost {
            margin-top: 10px;
        }

            .divpost a {
                font-size: 18px;
                display: block;
                font-weight: bold;
            }


                .divpost a:hover {
                    color: #F99D22;
                }

            .divpost .est {
                padding: 10px 0 10px 0px;
            }

                .divpost .est span {
                    font-weight: bold;
                    padding: 0px 0px 0px 0px;
                }

            .divpost .info {
                padding: 10px 0 10px 0px;
                color: #808080;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">
    <div class="login-page" style="padding-top: 10px">

        <asp:UpdatePanel runat="server" ID="upMain">
            <ContentTemplate>

                <h1 class="h1titel">Connect List</h1>
                <hr />
                <div class="container" style="text-align: left">


                    <div style="padding-top: 20px; text-align: left">

                        <label runat="server" id="lbl_total" style="padding: 0px"></label>



                        <div class="col-md-12">
                            <asp:Repeater ID="rpview" runat="server">
                                <ItemTemplate>
                                    <div class="divpost">
                                        <div style="color: #F99D22; font: bold; display: <%# isapplied(Eval("int_post_id").ToString())?"block":"none"%>">
                                            <span class="fa fa-flag fa-lg" aria-hidden="true"></span>&nbsp;&nbsp;Applied
                                        </div>

                                        <a href='<%# "postdetails.aspx?pid="+Eval("int_post_id") %>'>
                                            <%# Eval("str_title") %>
                                        </a>
                                        <div class="est">
                                            <p class="col-md-3" style="padding: 0px 0px 0px 0px"><span>Est Time</span> <%# Eval("int_no_of_days").ToString() %> </p>
                                            <p class="col-md-3"><span>Est Budget</span>  <%# Eval("dec_approx_budget").ToString().Replace("-"," to ")+" ($) " %> </p>
                                            <p class="col-md-3"><span>Posted on</span> <%# Eval("date_post_date","{0:MM-dd-yyyy}") %> </p>
                                        </div>
                                        <div class="clearfix"></div>

                                        <p class="info">
                                            <%# Eval("str_details") %>
                                        </p>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr class="posthr" />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>


                    </div>
                    <div class="clearfix"></div>
                    <br />
                    <br />
                    <div runat="server" id="div_page">
                        Page
            <label runat="server" id="lbl_page_no" style="display: inline"></label>
                        of
            <label runat="server" id="lbl_total_page" style="display: inline"></label>
                    </div>
                    <div>
                        <ul class="pagination">
                            <asp:Repeater ID="rptPager" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                                            CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "active" : "" %>'
                                            OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>



                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
