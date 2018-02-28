using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon.Admin
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
         

            Session.Abandon();

            HttpCookie RetailerCookie = Request.Cookies.Get("Admin");
            if (RetailerCookie != null)
            {
                RetailerCookie.Expires = System.DateTime.Now.AddDays(-1);

                Response.Cookies.Add(RetailerCookie);
            }

            Response.Redirect(ResolveUrl("login.aspx"));
        }
    }
}