using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon
{
    public partial class other : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["uname"] != null)
            //{
            //    lbl_name.Text = Session["uname"].ToString();
            //}
            //else
            //{

            //}

        }


        protected void lnk_searck_Click(object sender, EventArgs e)
        {
            //Response.Redirect("products.aspx?search_id=" + txt_search.Text);
        }
    }
}