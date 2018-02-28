<%@ Page Title="" Language="C#" MasterPageFile="~/other.Master" AutoEventWireup="true" CodeBehind="rate.aspx.cs" Inherits="Coupon.rate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="rate/bootstrap.min.css" rel="stylesheet" />
    <link href="rate/star-rating.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="rate/star-rating.js"></script>

    <script>
        $(document).ready(function () {
            $("#input-21b").on("rating.change", function (event, value, caption) {

                var ratingValue = $('#<%=hdfRatingValue.ClientID%>').val();
                ratingValue = value;
                alert(ratingValue);
            });
        });
    </script>
    <div class="row">
        <div class="col-lg-12">
            <input id="input-21e" value="0" type="number" class="rating" min="0" max="5" step="0.5" data-size="xs" />
            <hr />
        </div>
    </div>
    <asp:HiddenField ID="hdfRatingValue" runat="server" />
</asp:Content>
