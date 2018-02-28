<%@ Page Title="" Language="C#" MasterPageFile="~/connect_mst.Master" AutoEventWireup="true" CodeBehind="connect_home_sellbuy.aspx.cs" Inherits="Coupon.connect.connect_home_sellbuy" %>

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
                        <label>Home Type</label>
                    </div>

                    <div class="col-md-6 stylelbl">
                        <label>SqFt Range</label>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-6">

                        <asp:DropDownList runat="server" ID="ddl_type" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="-- Rental Type --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Single Family" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Condo" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Townhomes" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Lots and Land" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Manufactured" Value="5"></asp:ListItem>

                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <asp:DropDownList runat="server" ID="ddl_sqft" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="--SqFt Range --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="800-1000" Value="1"></asp:ListItem>
                            <asp:ListItem Text="1000-1500" Value="2"></asp:ListItem>
                            <asp:ListItem Text="1500-2000" Value="3"></asp:ListItem>
                            <asp:ListItem Text="2000+" Value="4"></asp:ListItem>

                        </asp:DropDownList>
                    </div>
                    <div class="clearfix"></div>

                    <div class="col-md-6 stylelbl">
                        <label>Bedrooms</label>
                    </div>
                    <div class="col-md-6 stylelbl">
                        <label>Bathrooms</label>
                    </div>


                    <div class="clearfix"></div>
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

                    <div class="clearfix"></div>


                    <div class="col-md-6 stylelbl">
                        <label>Price Range</label>
                    </div>

                    <div class="clearfix"></div>
                    <div class="col-md-6">
                        <asp:DropDownList runat="server" ID="ddl_min_price" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="--Min Price --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="$75,000" Value="75000"></asp:ListItem>
                            <asp:ListItem Text="$100,000" Value="100000"></asp:ListItem>
                            <asp:ListItem Text="$150,000" Value="150000"></asp:ListItem>
                            <asp:ListItem Text="$200,000" Value="200000"></asp:ListItem>
                            <asp:ListItem Text="$400,000" Value="400000"></asp:ListItem>
                            <asp:ListItem Text="$500,000" Value="500000"></asp:ListItem>
                            <asp:ListItem Text="$750,000" Value="750000"></asp:ListItem>
                            <asp:ListItem Text="$1,000,000+" Value="1000000"></asp:ListItem>

                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <asp:DropDownList runat="server" ID="ddl_max_price" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="-- Max Price --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="$75,000" Value="75000"></asp:ListItem>
                            <asp:ListItem Text="$100,000" Value="100000"></asp:ListItem>
                            <asp:ListItem Text="$150,000" Value="150000"></asp:ListItem>
                            <asp:ListItem Text="$200,000" Value="200000"></asp:ListItem>
                            <asp:ListItem Text="$400,000" Value="400000"></asp:ListItem>
                            <asp:ListItem Text="$500,000" Value="500000"></asp:ListItem>
                            <asp:ListItem Text="$750,000" Value="750000"></asp:ListItem>
                            <asp:ListItem Text="$1,000,000+" Value="1000000"></asp:ListItem>

                        </asp:DropDownList>

                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-6 stylelbl">
                        <label>Monthly Payment</label>
                    </div>
                    <div class="col-md-6 stylelbl">
                        <label>Credit Score</label>
                    </div>


                    <div class="clearfix"></div>
                    <div class="col-md-6">
                        <asp:DropDownList runat="server" ID="ddl_monthly" CssClass="form-control bfh-states" Style="height: 42px">
                            <asp:ListItem Text="-- Monthly Payment  --" Value="0"></asp:ListItem>
                            <asp:ListItem Text="$500" Value="500"></asp:ListItem>
                            <asp:ListItem Text="$600" Value="600"></asp:ListItem>
                            <asp:ListItem Text="$700" Value="700"></asp:ListItem>
                            <asp:ListItem Text="$800" Value="800"></asp:ListItem>
                            <asp:ListItem Text="$900" Value="900"></asp:ListItem>
                            <asp:ListItem Text="$1000" Value="1000"></asp:ListItem>
                            <asp:ListItem Text="$1200" Value="1200"></asp:ListItem>
                            <asp:ListItem Text="$1400" Value="1400"></asp:ListItem>
                            <asp:ListItem Text="$1600" Value="1600"></asp:ListItem>
                            <asp:ListItem Text="$2000" Value="2000"></asp:ListItem>
                        </asp:DropDownList>

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
