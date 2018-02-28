<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="edit_company_type.aspx.cs" Inherits="Coupon.Admin.company_type_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Company Type Details
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
                    <label>Company Type</label>
                    <asp:TextBox ID="txt_type" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid Company Type" ControlToValidate="txt_type" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
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
