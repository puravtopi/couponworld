using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon.retailer
{
    public partial class retailer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cls_Common obj = new Cls_Common();
            obj.setCookiesRetailer();
            lbl_name.Text = Session["retailer_name"].ToString();
        }
    }
}