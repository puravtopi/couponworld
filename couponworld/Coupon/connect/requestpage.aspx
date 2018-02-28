<%@ Page Title="" Language="C#" MasterPageFile="~/connect_mst.Master" AutoEventWireup="true" CodeBehind="requestpage.aspx.cs" Inherits="Coupon.connect.requestpage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <script>
        function openModel(divid) {


            $('#' + divid).modal('show');

        }

        function closeModel(divid) {

            $('#' + divid).modal('hide');

        }

    </script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">
    <script>
        $(document).ready(function () {



            $("#<%= chk_cost.ClientID %>").change(function () {

                var valName = document.getElementById("<%=com1.ClientID%>");

                if (this.checked) {
                    $("#<%= txt_min_cost.ClientID%>").val("$0.0");
                    $("#<%= txt_max_cost.ClientID%>").val("$0.0");

                    $("#<%= txt_min_cost.ClientID%>").attr("disabled", "disabled");
                    $("#<%= txt_max_cost.ClientID%>").attr("disabled", "disabled");
                    ValidatorEnable(valName, false);
                }
                else {
                    $("#<%= txt_min_cost.ClientID%>").removeAttr("disabled");
                    $("#<%= txt_max_cost.ClientID%>").removeAttr("disabled");

                    ValidatorEnable(valName, true);

                }

            });
        });








    </script>

    <asp:UpdatePanel runat="server" ID="upMain">
        <ContentTemplate>

            <div class="login-page">
                <div class="container">


                    <h1 class="h1titel">Connect Request form</h1>
                    <%--<div class="login-body">--%>
                    <div id="lblmessage" runat="server"></div>

                    <div class="col-md-12 stylelbl">
                        <label>Request Title</label>
                    </div>

                    <div class="col-md-12">

                        <asp:TextBox runat="server" ID="txt_title" placeholder="Please create a title for your Connect Request"></asp:TextBox>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-12 stylelbl">
                        <label>What is your approx budget for this job ?</label>
                    </div>

                    <div class="col-md-3" style="margin-left: 0">
                        <asp:CheckBox runat="server" ID="chk_cost" Text="I am not sure about price." Style="float: left" />
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-3">
                        <asp:TextBox runat="server" ID="txt_min_cost" CssClass="user" placeholder="Min" onblur="appendDollar(this.id);" onkeypress="return onlyNumbersWithDecimal(event)" MaxLength="10"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox runat="server" ID="txt_max_cost" CssClass="user" placeholder="Max" onblur="appendDollar(this.id);" onkeypress="return onlyNumbersWithDecimal(event)" MaxLength="10"></asp:TextBox>

                    </div>
                    <div class="col-md-6">
                        <asp:CompareValidator runat="server" ID="com1" ControlToValidate="txt_max_cost" Operator="GreaterThan" ControlToCompare="txt_min_cost" Type="Integer" ErrorMessage="Max value must be greaterthan min value" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                    </div>
                    <div class="clearfix"></div>

                    <div class="col-md-12 stylelbl">
                        <label>When would you like for your job to be started?</label>
                    </div>

                    <div class="col-md-4">

                        <asp:DropDownList runat="server" ID="ddl_days" CssClass="form-control bfh-states" Style="height: 45px">
                            <asp:ListItem Value="1" Text="ASAP"></asp:ListItem>
                            <asp:ListItem Value="2" Text="1 week"></asp:ListItem>
                            <asp:ListItem Value="3" Text="2 weeks"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Month"></asp:ListItem>
                            <asp:ListItem Value="5" Text="6 months"></asp:ListItem>
                        </asp:DropDownList>

                    </div>

                    <div class="clearfix"></div>
                    <div class="col-md-12 stylelbl">
                        <label>Please provide details about your job!</label>
                    </div>

                    <div class="col-md-12">

                        <asp:TextBox runat="server" TextMode="MultiLine" ID="txt_Details" Rows="10" placeholder="Default Text Field box"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Details" ControlToValidate="txt_Details" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-12 stylelbl">
                        <label>Are you prefer Location for this job ?</label>
                    </div>

                    <div class="col-md-6">

                        <asp:TextBox runat="server" ID="txt_location" placeholder="Prefer Location"></asp:TextBox>
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



    <div class="modal fade" id="message-modal" role="dialog">
        <div class="modal-dialog" style="width: 60%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: left;">Congratulation</h4>
                </div>
                <div class="modal-body">
                    <%--  <asp:Label runat="server" ID="lbl_mess"></asp:Label>--%>
                    <asp:UpdatePanel runat="server" ID="up_retailer">
                        <ContentTemplate>

                            <div class="col-md-12">
                                <!-- general form elements disabled -->
                                <div class="box box-warning">
                                    <br />
                                    <div runat="server" id="Div1">
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <div class="alert alert-success">Thanks for using our Connect services, your request will be posted once it has been approved.</div>
                                    </div>
                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->

                            </div>

                            <div class="clearfix"></div>

                            <div class="modal-footer">

                                <asp:LinkButton runat="server" ID="lnk_back" CssClass="btn btn-default" OnClick="lnk_back_Click"> Close</asp:LinkButton>

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
            </div>
        </div>
    </div>



</asp:Content>
