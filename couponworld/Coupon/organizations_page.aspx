<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="organizations_page.aspx.cs" Inherits="Coupon.organizations_page" %>

<%@ Register Src="~/controls/uc_member_page.ascx" TagPrefix="uc1" TagName="uc_member_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="values">
        <div class="container">
            <h3 class="w3ls-title w3ls-title1" style="margin: 0 0 1em;">Orgnization Page</h3>
            <p style="text-align: center;">
                Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas faucibus ipsum et libero euismod iaculis.
            </p>
            <br />
            <br />
            <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas faucibus ipsum et libero euismod iaculis. Integer consectetur congue laoreet. Morbi eget leo elementum, vulputate eros et, egestas diam. Nam egestas, quam id viverra congue, elit mi eleifend libero, eget vulputate ante lorem vel quam. Sed suscipit ligula eu mi bibendum, vel mollis enim finibus. Suspendisse vitae est tortor. Donec aliquet leo vitae ligula mattis, vitae auctor mi pellentesque. Integer eu dui accumsan, convallis neque id, malesuada urna. </p>

            <br />
            <div class="clearfix"></div>
            <h3 class="w3ls-title w3ls-title1" style="margin: 0 0 0.3em;">What We Do</h3>
            <p style="text-align: center;">
                Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas faucibus ipsum et libero euismod iaculis.
            </p>
            <div class="w3values-row">
                <div class="col-md-4 w3values-grids">
                    <h6>Consumers </h6>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultrices orci at augue sollicitudin, sed rhoncus leo dictum. Duis sed elit tempus, convallis elit eget, ornare nibh. Sed eu risus eget magna condimentum blandit.  </p>
                </div>
                <div class="col-md-4 w3values-grids">
                    <h6>Donate </h6>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultrices orci at augue sollicitudin, sed rhoncus leo dictum. Duis sed elit tempus, convallis elit eget, ornare nibh. Sed eu risus eget magna condimentum blandit.  </p>
                </div>
                <div class="col-md-4 w3values-grids">
                    <h6>Campaign </h6>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultrices orci at augue sollicitudin, sed rhoncus leo dictum. Duis sed elit tempus, convallis elit eget, ornare nibh. Sed eu risus eget magna condimentum blandit.  </p>
                </div>
                <div class="col-md-4 w3values-grids">
                    <h6>Connect </h6>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultrices orci at augue sollicitudin, sed rhoncus leo dictum. Duis sed elit tempus, convallis elit eget, ornare nibh. Sed eu risus eget magna condimentum blandit.  </p>
                </div>
                <div class="col-md-4 w3values-grids">
                    <h6>Give  </h6>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultrices orci at augue sollicitudin, sed rhoncus leo dictum. Duis sed elit tempus, convallis elit eget, ornare nibh. Sed eu risus eget magna condimentum blandit.  </p>
                </div>
                <div class="col-md-4 w3values-grids">
                    <h6>Improve</h6>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultrices orci at augue sollicitudin, sed rhoncus leo dictum. Duis sed elit tempus, convallis elit eget, ornare nibh. Sed eu risus eget magna condimentum blandit.  </p>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <div class="clearfix"></div>

    <div class="w3l-services">
        <div class="container">
            <uc1:uc_member_page runat="server" ID="uc_member_page" />
        </div>
    </div>
    <br />
    <br />
    <br />
    <div class="clearfix"></div>

</asp:Content>
