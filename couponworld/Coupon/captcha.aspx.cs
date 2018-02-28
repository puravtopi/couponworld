using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon
{
    public partial class captcha : System.Web.UI.Page
    {
        protected static string ReCaptcha_Key = "6LdMpBUUAAAAAHq-13CuHDu1fzkQTwcYbonVgpHn";
        protected static string ReCaptcha_Secret = "6LdMpBUUAAAAAGYRiufDEeXchuW4GKz19BV2uomZ";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string VerifyCaptcha(string response)
        {
            string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
            return (new WebClient()).DownloadString(url);
        }
    }
}