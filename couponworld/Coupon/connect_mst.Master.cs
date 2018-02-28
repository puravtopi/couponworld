using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon
{
    public partial class connect_mst : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["utype"] == null)
            {
                if (Request.Url.ToString().Contains("postdetails"))
                    Response.Redirect("~/login/retailer/3?rd_url=" + Request.Url.ToString());
                else
                    Response.Redirect("~/login/consumer/1?rd_url=" + Request.Url.ToString());
            }

        }
    }
}