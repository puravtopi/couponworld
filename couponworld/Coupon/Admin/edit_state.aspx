﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="edit_state.aspx.cs" Inherits="Coupon.Admin.State_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    State Details
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
                    <label>State</label>
                    <asp:TextBox ID="txt_state" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid State" ControlToValidate="txt_state" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>State Short Name</label>
                    <asp:TextBox ID="txt_short" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf3" runat="server" ErrorMessage="Enter Valid State Short Name" ControlToValidate="txt_short" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Country</label>
                    <asp:DropDownList ID="ddl_country" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Select Country" ControlToValidate="ddl_country" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
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
