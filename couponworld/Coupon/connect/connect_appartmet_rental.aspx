<%@ Page Title="" Language="C#" MasterPageFile="~/connect_mst.Master" AutoEventWireup="true" CodeBehind="connect_appartmet_rental.aspx.cs" Inherits="Coupon.connect.connect_appartmet_rental" %>

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


                    <h1 class="h1titel">Submit Apartment Rental Request form</h1>
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
                        <label>Location</label>
                    </div>

                    <div class="col-md-12">

                        <asp:TextBox runat="server" ID="txt_location" placeholder="Enter location"></asp:TextBox>
                    </div>
                    <div class="clearfix"></div>


                    <div class="col-md-6 stylelbl">
                        <label>Rental Type</label>
                    </div>

                    <div class="col-md-6 stylelbl">
                        <label>Bedrooms</label>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-6">

                        <asp:DropDownList runat="server" ID="ddl_type" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="-- Rental Type --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Single Family" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Condo" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Townhomes" Value="3"></asp:ListItem>

                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">

                        <asp:DropDownList runat="server" ID="ddl_bedrrooms" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="--Bedrooms --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6+" Value="6"></asp:ListItem>


                        </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>

                    <div class="col-md-6 stylelbl">
                        <label>Bathrooms</label>
                    </div>

                    <div class="col-md-6 stylelbl">
                        <label>Move in Month</label>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-6">

                        <asp:DropDownList runat="server" ID="ddl_bathrooms" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="--Bathrooms --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6+" Value="6"></asp:ListItem>


                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">

                        <asp:DropDownList runat="server" ID="ddl_month" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="-- Month --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="January" Value="1"></asp:ListItem>
                            <asp:ListItem Text="February" Value="2"></asp:ListItem>
                            <asp:ListItem Text="March" Value="3"></asp:ListItem>
                            <asp:ListItem Text="April" Value="4"></asp:ListItem>
                            <asp:ListItem Text="May" Value="5"></asp:ListItem>

                            <asp:ListItem Text="June" Value="6"></asp:ListItem>
                            <asp:ListItem Text="July" Value="7"></asp:ListItem>
                            <asp:ListItem Text="August" Value="8"></asp:ListItem>
                            <asp:ListItem Text="September" Value="9"></asp:ListItem>
                            <asp:ListItem Text="October" Value="10"></asp:ListItem>
                            <asp:ListItem Text="November" Value="11"></asp:ListItem>
                            <asp:ListItem Text="December" Value="12"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>


                    <div class="col-md-6 stylelbl">
                        <label>Monthly Payment Range</label>
                    </div>
                    <div class="col-md-6 stylelbl">
                        <label>Credit Range</label>
                    </div>

                    <div class="clearfix"></div>
                    <div class="col-md-3">
                        <asp:TextBox runat="server" ID="txt_min_cost" CssClass="user" placeholder="Min" onblur="appendDollar(this.id);" onkeypress="return onlyNumbersWithDecimal(event)" MaxLength="10"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox runat="server" ID="txt_max_cost" CssClass="user" placeholder="Max" onblur="appendDollar(this.id);" onkeypress="return onlyNumbersWithDecimal(event)" MaxLength="10"></asp:TextBox>

                    </div>

                    <div class="col-md-6">

                        <asp:DropDownList runat="server" ID="ddl_credit" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="-- Credit Range --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Not sure" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Low" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Average" Value="3"></asp:ListItem>
                            <asp:ListItem Text="High" Value="4"></asp:ListItem>

                        </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>


                    <div class="col-md-6 stylelbl">
                        <asp:CheckBox runat="server" ID="chk_security" Text="Have a Security Deposit?" />
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
