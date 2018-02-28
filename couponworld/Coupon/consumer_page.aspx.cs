using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon
{
    public partial class consumer_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Coupon_Site.MenuId = 3;
        }
    }
}