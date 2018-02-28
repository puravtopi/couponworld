using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            HttpCookie LoginCookie = HttpContext.Current.Request.Cookies.Get("Admin"); // Credentials is the name of cookie

            if (LoginCookie == null)
            {
                Response.Redirect(ResolveUrl("login.aspx"));
            }
            else
            {
                HttpContext.Current.Session["admin"] = LoginCookie["admin"].ToString();
                HttpContext.Current.Session["user_name"] = LoginCookie["user_name"].ToString();
               
            }
        }
    }
}