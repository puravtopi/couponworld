<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="contact_us.aspx.cs" Inherits="Coupon.contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact">
        <div class="container">
            <!-- breadcrumbs -->
            <ol class="breadcrumb breadcrumb1">
                <li><a href='<%= ResolveUrl("~/home") %>'>Home</a></li>
                <li class="active">Contact Us</li>
            </ol>
            <div class="clearfix"></div>
            <!-- //breadcrumbs -->
            <br />
            <br />
            <br />
            <div class="map-info">
                <div class="map-grids">
                    <%--<h4>Our Smart bazaar Store1</h4>--%>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3023.9503398796587!2d-73.9940307!3d40.719109700000004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a27e2f24131%3A0x64ffc98d24069f02!2sCANADA!5e0!3m2!1sen!2sin!4v1441710758555"></iframe>
                </div>
                <div class="clearfix"></div>
            </div>
            <h2 style="text-align: center;">GET IN TOUCH WITH US</h2>
            <br />

            <br />
            <h3 style="text-align: center;">Say Hello! Don’t be shy.</h3>
            <br />
            <br />
            <div class="col-md-4 contact-right">
                <div class="cnt-w3agile-row">
                    <%--<div class="col-md-3 contact-w3icon">
                            <i class="fa fa-truck" aria-hidden="true"></i>
                        </div>--%>
                    <div class="col-md-9 contact-w3text">
                        <h3>OUR OFFICE
                        </h3>
                        <%--<p>
                            Manage Your Orders
                        <br>
                            Easily Track Orders & Returns
                        </p>--%>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="cnt-w3agile-row cnt-w3agile-row-mdl">
                    <%--<div class="col-md-3 contact-w3icon">
                        <i class="fa fa-bell" aria-hidden="true"></i>
                    </div>--%>
                    <div class="col-md-9 contact-w3text">
                        <%--<p>
                            Notifications
                        <br>
                            Get Relevant Alerts & Recommendations
                        </p>--%>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="cnt-w3agile-row">
                    <%-- <div class="col-md-3 contact-w3icon">
                            <i class="fa fa-heart" aria-hidden="true"></i>
                        </div>--%>
                    <div class="col-md-9 contact-w3text">
                        <p>
                            198  West 21th Street, Suite 721<br />
                            New York, NY 10010<br />
                            Email: youremail@yourdomain.com<br />
                            Phone: +88 (0) 101 0000 000<br />
                            Fax: +88 (0) 202 0000 001<br />
                        </p>
                    </div>
                    <br />
                    <br />
                    <div class="col-md-9 social-icons w3-agile-icons">
                        <ul>
                            <li><a href="#" class="fa fa-facebook icon facebook"></a></li>
                            <li><a href="#" class="fa fa-twitter icon twitter"></a></li>
                            <li><a href="#" class="fa fa-google-plus icon googleplus"></a></li>
                            <li><a href="#" class="fa fa-dribbble icon dribbble"></a></li>
                            <li><a href="#" class="fa fa-rss icon rss"></a></li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="contact-form-row">
                <h3 class="w3ls-title w3ls-title1" style="margin: 0 0 0.5em;">Contact Us</h3>
                <div class="col-md-8 contact-left">
                    <asp:TextBox runat="server" ID="txt_name" placeholder="Name" MaxLength="30" Style="margin-right: 4%;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf1" runat="server" ErrorMessage="Enter Valid Name" ValidationGroup="sign_up" ControlToValidate="txt_name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:TextBox runat="server" ID="txt_email" placeholder="Email" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rf2" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txt_email" ValidationGroup="sign_up" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="re1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txt_email" ValidationGroup="sign_up" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    <%--<textarea id="txt_msg" placeholder="Message" name="Message" required="" maxlength="500"></textarea>--%>
                    <textarea id="txt_msg" class="user" runat="server" placeholder="Message" style="width: 100%;" maxlength="500"></textarea>
                    <asp:RequiredFieldValidator ID="rf4" runat="server" ErrorMessage="Enter Valid Message" ControlToValidate="txt_msg" ValidationGroup="sign_up" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                    <asp:Button runat="server" ID="btn_submit" Text="Submit" ValidationGroup="sign_up" OnClick="btn_submit_Click" />
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>
