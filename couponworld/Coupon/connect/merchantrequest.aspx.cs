using Coupon_Bal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon.connect
{
    public partial class merchantrequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["pid"] != null)
                {
                    bindConnectList(" where int_post_id=" + Request.QueryString["pid"]);
                    bindRequestList(" where int_connect_id=" + Request.QueryString["pid"]);
                }
            }

        }

        private void bindConnectList(string query)
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                tbl_connect_bal objbal = new tbl_connect_bal();



                dt = objbal.connect_select(query, 1, 0, out totalcount, "");
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rep_details.DataSource = dt;
                    rep_details.DataBind();
                }
                else
                {

                    rep_details.DataSource = null;
                    rep_details.DataBind();
                }

            }
            catch (Exception ex)
            {
            }
        }

        private void bindRequestList(string query)
        {
            try
            {
                DataSet dt = new DataSet();

                tbl_connect_bal objbal = new tbl_connect_bal();

                dt = objbal.connect_reply_select(query);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rpview.DataSource = dt;
                    rpview.DataBind();
                }
                else
                {

                    rpview.DataSource = null;
                    rpview.DataBind();
                }

            }
            catch (Exception ex)
            {
            }
        }

        protected void lnk_show_details_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnk = sender as LinkButton;
                DataSet dt = new DataSet();

                tbl_connect_bal objbal = new tbl_connect_bal();

                string query = " where int_reply_id=" + lnk.CommandArgument;

                dt = objbal.connect_reply_select(query);

                if (dt.Tables[0].Rows.Count > 0)
                {
                    lbl_budget.InnerText = dt.Tables[0].Rows[0]["str_approx_budget"].ToString() + " ($)";
                    lbl_days.InnerText = dt.Tables[0].Rows[0]["str_approx_days"].ToString();
                    lbl_name.InnerText = dt.Tables[0].Rows[0]["str_retailer_name"].ToString();
                    lbl_details.InnerText = dt.Tables[0].Rows[0]["str_comment"].ToString();
                }

                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "openModel('model_details')", true);
            }
            catch (Exception ex)
            {


            }
        }
    }
}