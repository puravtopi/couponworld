using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using System.Data;

namespace Coupon
{
    public partial class rate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // AvgRating();
            }
        }
        //protected void AvgRating()
        //{

        //    try
        //    {
        //        tbl_rating_review_bal bal = new tbl_rating_review_bal();

        //        DataSet dt = new DataSet();

        //        dt = bal.get_avg_rating(" where int_retailer_id = " + Session["rid"]);
        //        if (dt.Tables[0].Rows.Count > 0)
        //        {
        //            string cnt = "0";
        //            if (dt.Tables[0].Rows[0][0] != DBNull.Value)
        //                cnt = dt.Tables[0].Rows[0][0].ToString();

        //            lbl_cnt.Text = "&nbsp;&nbsp;&nbsp;&nbsp; Rating : " + cnt + " / 5 ";
        //            txt_cnt_rate.Value = dt.Tables[0].Rows[0][0].ToString();
        //            lblreview.Text = "Total Review : " + dt.Tables[0].Rows[0][1].ToString();
        //        }

        //        //PopulatePager(totalcount, pageindex);
        //        //lblcount.Text = totalcount.ToString();
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //}
        public void saveRating()
        {
            string val = hdfRatingValue.Value;
        }
    }
}