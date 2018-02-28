using Coupon_Bal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Coupon_Entity;

namespace Coupon.connect
{
    public partial class postdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["pid"] != null)
                    bindConnectList(" where int_post_id=" + Request.QueryString["pid"]);

                //check user already apply on this post or not

                if (isapplied(Request.QueryString["pid"]))
                {
                    btn_next.Enabled = false;
                    lblmess.Attributes.Add("style", "display:block"); 
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



                dt = objbal.connect_select(query, 1, 0, out totalcount,"");
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
        
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_connect_bal objbal = new tbl_connect_bal();
                tbl_connect_entity objentity = new tbl_connect_entity();

                objentity.int_post_id = Convert.ToInt32(Request.QueryString["pid"]);
                objentity.str_details = txt_Details.Text;
                objentity.str_no_of_days = txt_days.Text;
                objentity.str_approx_budget = txt_cost.Text;
                objentity.int_retailer_id = Convert.ToInt32(Session["rid"].ToString());

                int _lval = objbal.connect_reply_insert(objentity);
                if (_lval > 0)
                    Response.Redirect("connectlist.aspx"); 
            }
            catch (Exception ex)
            {
            }
        }

        public bool isapplied(string postid)
        {
            bool _lval = false;
            try
            {
                DataSet ds = new tbl_connect_bal().connect_reply_select(" where int_connect_id=" + postid + " and int_retailer_id=" + Session["rid"].ToString());

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                    _lval = true;
            }
            catch (Exception ex)
            {


            }
            return _lval;
        }
    }
}