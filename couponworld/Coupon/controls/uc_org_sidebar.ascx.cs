using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using System.Data;

namespace Coupon.controls
{
    public partial class uc_org_sidebar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindData();
        }

        private void bindData()
        {
            try
            {
                int totalcount = 0;
                string query = " where int_organization_id = " + Session["oid"].ToString();
                tbl_organization_bal objbal = new tbl_organization_bal();

                DataSet ds = objbal.organization_Select(query, 1, 10, out totalcount, "asc", "str_organization_name");

                if (ds != null)
                {
                    img_retailer_pic.Src = ResolveUrl("~/Admin/org_logo/" + ds.Tables[0].Rows[0]["str_logo_img"].ToString());
                }
            }
            catch (Exception ex)
            {


            }

        }
    }
}