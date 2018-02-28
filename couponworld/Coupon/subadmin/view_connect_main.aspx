<%@ Page Title="" Language="C#" MasterPageFile="~/subadmin/Subadmin_mst.Master" AutoEventWireup="true" CodeBehind="view_connect_main.aspx.cs" Inherits="Coupon.subadmin.view_connect_main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Connect Request
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">


    <div class="box">
        <div class="box-body">
            <asp:UpdatePanel runat="server" ID="upMain">
                <ContentTemplate>
                    <asp:Repeater runat="server" ID="rep_category" OnItemDataBound="rep_category_ItemDataBound" >
                        <HeaderTemplate>

                            <div class="table-responsive">
                                <table class="table table-bordered" style="width: 100%">
                                    <thead>
                                        <tr>
                                            <th>Category
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%# Eval("str_cat") %>
                                    <asp:HiddenField runat="server" ID="hid_catid" Value='<%# Eval("int_connect_cat_id") %>' />
                                    <ul>
                                        <asp:Repeater runat="server" ID="rep_sub_category">
                                            <ItemTemplate>
                                                <li>
                                                    <a href='<%# "view_connect_job_request.aspx?sid="+Eval("int_connect_sub_cat_id").ToString()  %>'><%# Eval("str_sub_cat") %>&nbsp;(<%# getCount(Eval("int_connect_sub_cat_id").ToString()) %>)</a>

                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </td>
                            </tr>
                            <%--<tr>
                                <td><%# Eval("str_cat") %>
                                    <asp:HiddenField runat="server" ID="hid_catid" Value='<%# Eval("int_connect_cat_id") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Repeater runat="server" ID="rep_sub_category">
                                        <HeaderTemplate>

                                            <div class="table-responsive">
                                                <table class="table table-bordered" style="width: 100%">

                                                    <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("str_sub_cat") %></td>

                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody>
    </table>
                            </div>
                                        </FooterTemplate>
                                    </asp:Repeater>

                                </td>
                            </tr>--%>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
    </table>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>


</asp:Content>
