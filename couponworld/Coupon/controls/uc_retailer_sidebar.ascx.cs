using Coupon_Bal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Coupon.controls
{
    public partial class uc_retailer_sidebar : System.Web.UI.UserControl
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
                string query = " where int_retailer_id = " + Session["rid"].ToString();
                tbl_retailer_bal objbal = new tbl_retailer_bal();

                DataSet ds = objbal.retailer_Select(query, 1, 10, out totalcount, "asc", "str_retailer_name");

                if (ds != null)
                {
                    img_retailer_pic.Src = ResolveUrl("~/Admin/retailer_logo/" + ds.Tables[0].Rows[0]["str_logo_img"].ToString());
                }
            }
            catch (Exception ex)
            {


            }

        }
    }
}