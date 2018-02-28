<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="edit_age_group.aspx.cs" Inherits="Coupon.Admin.age_group_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Age Group Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">

    <!-- general form elements disabled -->
    <div class="box box-warning">
        <br />
        <div runat="server" id="lblmess">
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <!-- text input -->
            <div class="form-group">
                <label>Age Group Name</label>
                <asp:TextBox ID="txt_age_grp" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid Age Group Name" ControlToValidate="txt_age_grp" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label>Age Group Details</label>
                <asp:TextBox ID="txt_details" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Enter Valid Details" ControlToValidate="txt_details" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <asp:Button ID="btn_add" Text="Save" runat="server" OnClick="btn_add_Click" CssClass="btn btn-success" />
            <asp:Button ID="btn_update" Text="Update" runat="server" OnClick="btn_update_Click" CssClass="btn btn-success" />
            <asp:Button ID="btn_back" Text="Back" runat="server" OnClick="btn_back_Click" CausesValidation="false" CssClass="btn btn-default" />

        </div>
        <!-- /.box-body -->
    </div>
    <!-- /.box -->

</asp:Content>
