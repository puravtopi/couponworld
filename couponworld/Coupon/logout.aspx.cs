using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();

            HttpCookie RetailerCookie = Request.Cookies.Get("Retailer");
            if (RetailerCookie != null)
            {
                RetailerCookie.Expires = System.DateTime.Now.AddDays(-1);

                Response.Cookies.Add(RetailerCookie);
            }

            HttpCookie ConsumerCookie = Request.Cookies.Get("Consumer");

            if (ConsumerCookie != null)
            {
                ConsumerCookie.Expires = System.DateTime.Now.AddDays(-1);

                Response.Cookies.Add(ConsumerCookie);

            }

            Response.Redirect(ResolveUrl("~/home"));
        }
    }
}