using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon.subadmin
{
    public partial class Subadmin_mst : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
                Response.Redirect(ResolveUrl("../admin/login.aspx"));
            //lbl_admin.Text = Session["user_name"].ToString();
        }
    }
}