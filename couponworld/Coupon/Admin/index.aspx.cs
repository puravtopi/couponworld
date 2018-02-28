using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using Coupon_Entity;
using System.Data;

namespace Coupon.Admin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            count();
        }
        protected void count()
        {
            try
            {
                tbl_organization_bal objbal = new tbl_organization_bal();
                DataSet ds = objbal.organization_count();

                if (ds != null)
                {
                    lbl_org.Text = ds.Tables[0].Rows[0][0].ToString();
                    lbl_offer.Text = ds.Tables[1].Rows[0][0].ToString();
                    lbl_member.Text = ds.Tables[2].Rows[0][0].ToString();
                    lbl_retailer.Text = ds.Tables[3].Rows[0][0].ToString();
                    lbl_trans.Text = ds.Tables[4].Rows[0][0].ToString();
                }
                else
                {
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}