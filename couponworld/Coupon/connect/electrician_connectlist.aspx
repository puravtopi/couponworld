<%@ Page Title="" Language="C#" MasterPageFile="~/connect_mst.Master" AutoEventWireup="true" CodeBehind="electrician_connectlist.aspx.cs" Inherits="Coupon.connect.electrician_connectlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">


    <div class="login-page" style="padding-top: 10px">

        <asp:UpdatePanel runat="server" ID="upMain">
            <ContentTemplate>

                <h1 class="h1titel">My Request</h1>
                <hr />
                <br />


                <div class="container">
                    <div class="row">
                        <asp:Repeater runat="server" ID="rpview">
                            <HeaderTemplate>
                                <table class="table table-border" style="text-align: left">
                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Offer Name</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("date_post_date","{0:MM-dd-yyy}") %></td>
                                    <td>
                                        <asp:LinkButton runat="server" ID="lnk_details" Text='<%# Eval("str_title") %>' CausesValidation="false" OnClick="lnk_details_Click" CommandArgument='<%# Eval("int_service_id").ToString() +","+ Eval("int_post_id") %>'></asp:LinkButton></td>
                                    <td><%# Eval("status") %></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>


                    <div class="clear-fix"></div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
