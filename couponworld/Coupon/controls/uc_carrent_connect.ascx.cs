using Coupon_Bal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon.controls
{
    public partial class uc_carrent_connect : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["postid"] != null)
                    bindData(Request.QueryString["postid"]);
            }
        }

        public void bindData(string postid)
        {
            try
            {
                DataSet ds = null;
                int totalrecords = 0;
                tbl_connect_bal objbal = new tbl_connect_bal();

                string sp = "";
                sp = "usp_select_tbl_connect_car_rent";
                ds = objbal.connect_select(" where int_post_id = " + postid, 1, 0, out totalrecords, sp);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lbl_age.Text = ds.Tables[0].Rows[0]["int_age"].ToString();
                    lbl_price.Text = "$ " + ds.Tables[0].Rows[0]["str_price"].ToString();
                    lbl_details_2.Text = ds.Tables[0].Rows[0]["str_details"].ToString();
                    lbl_heading_2.InnerText = ds.Tables[0].Rows[0]["str_title"].ToString();
                    lbl_pickup_date.Text = ds.Tables[0].Rows[0]["date_pickup_date"].ToString().Split(' ')[0];

                    lbl_pickup_location.Text = ds.Tables[0].Rows[0]["str_pick_location"].ToString();
                    lbl_return_date.Text = ds.Tables[0].Rows[0]["date_return_date"].ToString().Split(' ')[0];
                    lbl_v_class.Text = appConstant.getVechicleClass(ds.Tables[0].Rows[0]["int_vech_class"].ToString());
                    lbl_v_type.Text = appConstant.getVechicleType(ds.Tables[0].Rows[0]["int_vech_type"].ToString());
                    lbl_cap.Text = ds.Tables[0].Rows[0]["int_capacity"].ToString();

                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}