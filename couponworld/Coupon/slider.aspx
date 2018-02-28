<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="slider.aspx.cs" Inherits="Coupon.slider" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#slider-range").slider({
                range: true,
                min: 0,
                max: 500,
                values: [75, 300],
                slide: function (event, ui) {
                    $("#<%= amount.ClientID%>").val("$" + ui.values[0] + " - $" + ui.values[1]);
                    $("#<%= hidamt.ClientID%>").val(ui.values[0] + "-" + ui.values[1]);
                }
            });
            $("#<%= amount.ClientID%>").val("$" + $("#slider-range").slider("values", 0) +
              " - $" + $("#slider-range").slider("values", 1));
        });
    </script>

    <p>
        <label for="amount">Price range:</label>
        <input type="text" id="amount" runat="server" style="border: 0; color: #f6931f; font-weight: bold;" />
        <asp:HiddenField runat="server" ID="hidamt" />
    </p>

    <div id="slider-range"></div>
    <asp:Button runat="server" ID="btnsave" Text="save" OnClick="btnsave_Click" />

</asp:Content>
