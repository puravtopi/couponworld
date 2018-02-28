using Coupon_Bal;
using Coupon_Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon.connect
{
    public partial class connect_home_sellbuy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["postid"] != null)
                    bindData(Request.QueryString["postid"]);
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {

                int _lResult = 0;
                tbl_connect_home_bal objbal = new tbl_connect_home_bal();
                tbl_connect_home_enetity objentity = new tbl_connect_home_enetity();

                objentity.str_location = txt_location.Text;
                objentity.int_monthly_payment = Convert.ToInt16(ddl_monthly.SelectedItem.Value);
                objentity.int_bath_room = Convert.ToInt16(ddl_bathrooms.SelectedItem.Value);
                objentity.int_bed_room = Convert.ToInt16(ddl_bedrrooms.SelectedItem.Value);
                objentity.int_user_id = Convert.ToInt32(Session["cid"].ToString());

                objentity.int_SqFt_id = Convert.ToInt32(ddl_sqft.SelectedItem.Value);

                objentity.int_credit_range = Convert.ToInt32(ddl_credit.SelectedItem.Value);
                objentity.int_home_type = Convert.ToInt32(ddl_type.SelectedItem.Value);
                objentity.dec_approx_budget_min = ddl_min_price.SelectedItem.Text;
                objentity.dec_approx_budget_max = ddl_max_price.SelectedItem.Text;
                objentity.bit_have_deposit = chk_security.Checked;

                objentity.str_title = txt_title.Text;
                objentity.str_details = txt_Details.Text;

                if (Request["postid"] == null)
                {
                    objentity.int_connect_cat_id = Convert.ToInt32(Request["cid"].ToString());
                    objentity.int_service_id = Convert.ToInt32(Request["sid"].ToString());
                    _lResult = objbal.connect_home_sellbuy_insert(objentity);
                }
                else
                {
                    objentity.int_post_id = Convert.ToInt32(Request.QueryString["postid"]);

                    _lResult = objbal.connect_home_sellbuy_update(objentity);
                }
                if (_lResult > 0)
                {


                    if (Request["postid"] == null)
                    {
                        lblmessage.InnerHtml = "Thanks for Posting Connect Request.it will be live once admin approve it.";
                    }
                    else
                    {
                        lblmessage.InnerHtml = "Connect Post Updated Successfully.";
                    }
                    lblmessage.Attributes.Add("class", "alert alert-success");
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "openModel('message-modal')", true);
                }
                else
                {
                    lblmessage.InnerHtml = "Sorry, there may be any issue to save this post.";
                    lblmessage.Attributes.Add("class", "alert alert-danger");
                }

            }
            catch (Exception ex)
            {


            }
        }

        protected void lnk_back_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/consumer-profile"));
        }

        public void bindData(string postid)
        {
            try
            {
                DataSet ds = null;
                int totalrecords = 0;
                tbl_connect_bal objbal = new tbl_connect_bal();

                string sp = "";
                sp = "usp_select_tbl_connect_home_sellbuy";
                ds = objbal.connect_select(" where int_post_id = " + postid, 1, 0, out totalrecords, sp);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddl_type.ClearSelection();
                    ddl_type.Items.FindByValue(ds.Tables[0].Rows[0]["int_home_type"].ToString()).Selected = true;

                    ddl_monthly.ClearSelection();
                    ddl_monthly.Items.FindByValue(ds.Tables[0].Rows[0]["int_monthly_payment"].ToString()).Selected = true;

                    ddl_credit.ClearSelection();
                    ddl_credit.Items.FindByValue(ds.Tables[0].Rows[0]["int_credit_range"].ToString()).Selected = true;

                    ddl_bedrrooms.ClearSelection();
                    ddl_bedrrooms.Items.FindByValue(ds.Tables[0].Rows[0]["int_bed_room"].ToString()).Selected = true;

                    ddl_bathrooms.ClearSelection();
                    ddl_bathrooms.Items.FindByValue(ds.Tables[0].Rows[0]["int_bath_room"].ToString()).Selected = true;





                    txt_Details.Text = ds.Tables[0].Rows[0]["str_details"].ToString();
                    txt_title.Text = ds.Tables[0].Rows[0]["str_title"].ToString();

                    ddl_max_price.ClearSelection();
                    ddl_max_price.Items.FindByText(ds.Tables[0].Rows[0]["dec_approx_budget_max"].ToString()).Selected = true;

                    ddl_sqft.ClearSelection();
                    ddl_sqft.Items.FindByValue(ds.Tables[0].Rows[0]["int_SqFt_id"].ToString()).Selected = true;

                    ddl_min_price.ClearSelection();
                    ddl_min_price.Items.FindByText(ds.Tables[0].Rows[0]["dec_approx_budget_min"].ToString()).Selected = true;

                    txt_location.Text = ds.Tables[0].Rows[0]["str_location"].ToString();
                    chk_security.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["bit_have_deposit"].ToString());

                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}