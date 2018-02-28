<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="edit_audit.aspx.cs" Inherits="Coupon.Admin.audit_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    Report Details
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
                    <label>Date(yyyy/mm/dd)</label>
                    <%--<asp:TextBox ID="txt_city" runat="server" CssClass="form-control"></asp:TextBox>--%>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <div id="reservation">
                            <asp:TextBox CssClass="form-control" runat="server" ID="txt_date"></asp:TextBox>
                            <%--<input type="text" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask />--%>
                        </div>
                    </div>
                    <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid Date" ControlToValidate="txt_date" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label>Time (AM/PM)</label>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-clock-o"></i>
                        </div>
                        <div class="bootstrap-timepicker timepicker">
                            <asp:TextBox ID="txt_time" runat="server" CssClass="form-control timepicker"></asp:TextBox>
                        </div>
                    </div>
                    <asp:RequiredFieldValidator ID="rf3" runat="server" ErrorMessage="Enter Valid Time" ControlToValidate="txt_time" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Member</label>
                    <asp:DropDownList ID="ddl_member" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Select Member" ControlToValidate="ddl_member" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Activity Details</label>
                    <textarea id="txt_details" runat="server" class="form-control"></textarea>
                    <asp:RequiredFieldValidator ID="rf4" runat="server" ErrorMessage="Enter Valid Activity Details" ControlToValidate="txt_details" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Os</label>
                    <asp:TextBox ID="txt_os" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf5" runat="server" ErrorMessage="Enter Valid OS" ControlToValidate="txt_os" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Ip</label>
                    <asp:TextBox ID="txt_ip" runat="server" CssClass="form-control" data-inputmask="'alias': 'ip'" data-mask></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf6" runat="server" ErrorMessage="Enter Valid IP" ControlToValidate="txt_ip" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Device</label>
                    <asp:TextBox ID="txt_device" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf7" runat="server" ErrorMessage="Enter Valid Device" ControlToValidate="txt_device" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <asp:Button ID="btn_add" Text="Save" runat="server" OnClick="btn_add_Click" CssClass="btn btn-success" />
                <asp:Button ID="btn_update" Text="Update" runat="server" OnClick="btn_update_Click" CssClass="btn btn-success" />
                <asp:Button ID="btn_back" Text="Back" runat="server" OnClick="btn_back_Click" CausesValidation="false" CssClass="btn btn-default" />

            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>

    <!-- jQuery 2.0.2 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <!-- Bootstrap -->
    <!-- InputMask -->
    <script src="js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
    <script src="js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
    <script src="js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
    <!-- date-range-picker -->
    <script src="js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <!-- bootstrap color picker -->
    <!-- bootstrap time picker -->
    <script src="js/plugins/timepicker/bootstrap-timepicker.js"></script>
    <script src="js/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <!-- AdminLTE App -->
    <link href="css/datepicker.css" rel="stylesheet" />
    <script src="js/bootstrap-datepicker.js"></script>


    <script>
        $('#<%= txt_date.ClientID%>').datepicker();
        $("[data-mask]").inputmask();
        $('#<%= txt_time.ClientID%>').timepicker();
    </script>


    <!-- Page script -->
    <%--<script type="text/javascript">
        $(function () {


            //Date range picker
            $('#reservation').daterangepicker();
            //Date range picker with time picker
            //$('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' });
            //Date range as a button
            $('#daterange-btn').daterangepicker(
                    {
                        ranges: {
                            'Today': [moment(), moment()],
                            'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                            'Last 7 Days': [moment().subtract('days', 6), moment()],
                            'Last 30 Days': [moment().subtract('days', 29), moment()],
                            'This Month': [moment().startOf('month'), moment().endOf('month')],
                            'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                        },
                        startDate: moment().subtract('days', 29),
                        endDate: moment()
                    },
            function (start, end) {
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
            }
            );

            //iCheck for checkbox and radio inputs
            $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                checkboxClass: 'icheckbox_minimal',
                radioClass: 'iradio_minimal'
            });
            //Red color scheme for iCheck
            $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                checkboxClass: 'icheckbox_minimal-red',
                radioClass: 'iradio_minimal-red'
            });
            //Flat red color scheme for iCheck
            $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                checkboxClass: 'icheckbox_flat-red',
                radioClass: 'iradio_flat-red'
            });

            //Colorpicker
            $(".my-colorpicker1").colorpicker();
            //color picker with addon
            $(".my-colorpicker2").colorpicker();

            //Timepicker
            $(".timepicker").timepicker({
                showInputs: false
            });
        });
        </script>--%>
</asp:Content>
