<%@ Page Title="" Language="C#" MasterPageFile="~/connect_mst.Master" AutoEventWireup="true" CodeBehind="connect_car_rental.aspx.cs" Inherits="Coupon.connect.connect_car_rental" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">



    <script>


        function openModel(divid) {


            $('#' + divid).modal('show');

        }

        function closeModel(divid) {

            $('#' + divid).modal('hide');

        }

        $(document).ready(function () {

            $("#<%= txt_pick_date.ClientID %>").datepicker({

                orientation: "bottom auto",
                autoclose: true,
                dateFormat: 'mm/dd/yy', // Set the date format
                constrainInput: false, // Client can directly modify date in textbox?

                onSelect: function (selected) {
                    var dt = new Date(selected);

                    dt.setDate(dt.getDate());

                    $("#<%= txt_return_date.ClientID %>").datepicker("option", "minDate", dt);

                }
            });

            $("#<%= txt_return_date.ClientID %>").datepicker({

                autoclose: true,
                orientation: "bottom auto",
                dateFormat: 'mm/dd/yy', // Set the date format
                constrainInput: false,
                onSelect: function (selected) {
                    var dt = new Date(selected);
                    dt.setDate(dt.getDate());

                    $("#<%= txt_pick_date.ClientID %>").datepicker("option", "maxDate", dt);


                }// Client can directly modify date in textbox?
            });
        });

        var options = {
            types: ['address'],
            componentRestrictions: { country: 'us' }

        }

        var places = new google.maps.places.Autocomplete(document.getElementById('<%= txt_location.ClientID%>'), options);
        google.maps.event.addListener(places, 'place_changed', function () {
            var place = places.getPlace();
            var address = place.formatted_address;
            var latitude = place.geometry.location.lat();
            var longitude = place.geometry.location.lng();
            var mesg = "Address: " + address;
            mesg += "\nLatitude: " + latitude;
            mesg += "\nLongitude: " + longitude;
            //alert(mesg);
        });
    </script>

    <asp:UpdatePanel runat="server" ID="upMain">
        <ContentTemplate>

            <div class="login-page">
                <div class="container">


                    <h1 class="h1titel">Submit Car Rental Request form</h1>
                    <%--<div class="login-body">--%>
                    <div id="lblmessage" runat="server"></div>

                    <div class="col-md-12 stylelbl">
                        <label>Request Title</label>
                    </div>

                    <div class="col-md-12">

                        <asp:TextBox runat="server" ID="txt_title" placeholder="Enter Request Title"></asp:TextBox>
                    </div>
                    <div class="clearfix"></div>

                    <div class="col-md-12 stylelbl">
                        <label>Pickup Location</label>
                    </div>

                    <div class="col-md-12">

                        <asp:TextBox runat="server" ID="txt_location" placeholder="Enter Pickup location"></asp:TextBox>
                    </div>
                    <div class="clearfix"></div>

                    <div class="col-md-6 stylelbl">
                        <label>Pick-UP Date</label>
                    </div>

                    <div class="col-md-6 stylelbl">
                        <label>Return Date</label>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-6">

                        <asp:TextBox runat="server" ID="txt_pick_date" placeholder="Enter Pickup date"></asp:TextBox>
                    </div>
                    <div class="col-md-6">

                        <asp:TextBox runat="server" ID="txt_return_date" placeholder="Enter Return date"></asp:TextBox>
                    </div>
                    <div class="clearfix"></div>


                    <div class="col-md-6 stylelbl">
                        <label>Renters Age</label>
                    </div>

                    <div class="col-md-6 stylelbl">
                        <label>Passenger Capacity</label>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-6">

                        <asp:DropDownList runat="server" ID="ddl_age" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="-- Age --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="18" Value="18"></asp:ListItem>
                            <asp:ListItem Text="19" Value="19"></asp:ListItem>
                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                            <asp:ListItem Text="21" Value="21"></asp:ListItem>
                            <asp:ListItem Text="22" Value="22"></asp:ListItem>
                            <asp:ListItem Text="23" Value="23"></asp:ListItem>
                            <asp:ListItem Text="24" Value="24"></asp:ListItem>
                            <asp:ListItem Text="25+" Value="25"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">

                        <asp:DropDownList runat="server" ID="ddl_capacity" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="-- Passenger Capacity --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Text="15" Value="15"></asp:ListItem>

                        </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>

                    <div class="col-md-6 stylelbl">
                        <label>Vehicle Type</label>
                    </div>

                    <div class="col-md-6 stylelbl">
                        <label>Vehicle Class</label>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-6">

                        <asp:DropDownList runat="server" ID="ddl_vech_type" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="-- Vehicle Type --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Car" Value="1"></asp:ListItem>
                            <asp:ListItem Text="SUV" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Van" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Truck" Value="4"></asp:ListItem>

                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">

                        <asp:DropDownList runat="server" ID="ddl_vech_class" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="-- Vehicle Class --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Economy" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Compact" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Intermediate" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Standard" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Full Size" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>


                    <div class="col-md-6 stylelbl">
                        <label>Per Day Price Range </label>
                    </div>


                    <div class="clearfix"></div>
                    <div class="col-md-6">

                        <asp:DropDownList runat="server" ID="ddl_price" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="-- Per Day Price Range --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="$35" Value="35"></asp:ListItem>
                            <asp:ListItem Text="$40" Value="40"></asp:ListItem>
                            <asp:ListItem Text="$50" Value="50"></asp:ListItem>
                            <asp:ListItem Text="$60" Value="60"></asp:ListItem>
                            <asp:ListItem Text="$70" Value="70"></asp:ListItem>
                            <asp:ListItem Text="$80" Value="80"></asp:ListItem>
                            <asp:ListItem Text="$90" Value="90"></asp:ListItem>
                            <asp:ListItem Text="$100+" Value="100"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="clearfix"></div>



                    <div class="col-md-12 stylelbl">
                        <label>Rental Details/Special Notes </label>
                    </div>

                    <div class="col-md-12">

                        <asp:TextBox runat="server" TextMode="MultiLine" ID="txt_Details" Rows="10" placeholder="Default Text Field box"></asp:TextBox>
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
