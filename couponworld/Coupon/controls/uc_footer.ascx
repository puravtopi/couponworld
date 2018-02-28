<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uc_footer.ascx.cs" Inherits="Coupon.controls.uc_footer" %>


<div class="copy-right">
    <div class="container">
        <div class="col-lg-12 social-icons w3ls-add-grids-mdl">
            <ul>
                <li class="footertitle">Seva is Giving</li>
                <li class="footertitle">Seva is Caring</li>
                <li class="footertitle">Seva is Saving</li>

            </ul>
        </div>
        <div class="col-md-12 social-icons w3-agile-icons">
            <h4 style="color: white;">Keep in touch</h4>

            <ul>
                <li><a href="#" class="fa fa-facebook icon facebook"></a></li>
                <li><a href="#" class="fa fa-twitter icon twitter"></a></li>
                <li><a href="#" class="fa fa-google-plus icon googleplus"></a></li>
                <li><a href="#" class="fa fa-dribbble icon dribbble"></a></li>
                <li><a href="#" class="fa fa-rss icon rss"></a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
        <br />
        <p>© <%= System.DateTime.Now.Year.ToString()  %> Seva Connect . All rights reserved </p>
    </div>
</div>
