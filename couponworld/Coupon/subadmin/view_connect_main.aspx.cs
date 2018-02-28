using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using System.Data;
using Coupon_Bal;

namespace Coupon.subadmin
{
    public partial class view_connect_main : System.Web.UI.Page
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
                int totalrecord = 0;
                DataSet ds = new DataSet();
                tbl_connect_category_bal objbal = new tbl_connect_category_bal();
                ds = objbal.cat_select("", 1, 0, out totalrecord);

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    rep_category.DataSource = ds;
                    rep_category.DataBind();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void rep_category_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int totalrecord = 0;
                HiddenField hidcatid = e.Item.FindControl("hid_catid") as HiddenField;
                Repeater rep = e.Item.FindControl("rep_sub_category") as Repeater;


                tbl_connect_subcategory_bal objbal = new tbl_connect_subcategory_bal();
                DataSet ds = objbal.subcat_select(" where int_connect_cat_id=" + hidcatid.Value, 1, 0, out totalrecord);

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                {
                    rep.DataSource = ds;
                    rep.DataBind();
                }

            }
        }

        public string getCount(string sid)
        {
            tbl_admin_bal objbal = new tbl_admin_bal();
            DataSet ds = objbal.admin_Select_connect_categorywise(" where int_sub_cat_id=" + sid);

            if (ds != null )
                return ds.Tables[0].Rows.Count.ToString();
            else
                return "0";
        }
    }
}