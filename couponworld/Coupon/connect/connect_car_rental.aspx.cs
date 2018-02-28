using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using Coupon_Entity;
using System.Data;

namespace Coupon.connect
{
    public partial class connect_car_rental : System.Web.UI.Page
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
                tbl_connect_car_rental_bal objbal = new tbl_connect_car_rental_bal();
                tbl_connect_car_rental_entity objentity = new tbl_connect_car_rental_entity();

                objentity.date_return_date = Convert.ToDateTime(txt_return_date.Text);
                objentity.date_pickup_date = Convert.ToDateTime(txt_pick_date.Text);
                objentity.int_vech_type = Convert.ToInt32(ddl_vech_type.SelectedItem.Value);
                objentity.int_vech_class = Convert.ToInt32(ddl_vech_class.SelectedItem.Value);
                objentity.int_user_id = Convert.ToInt32(Session["cid"].ToString());

                objentity.int_capacity = Convert.ToInt32(ddl_capacity.SelectedItem.Value);
                objentity.int_age = Convert.ToInt32(ddl_age.SelectedItem.Value);
                objentity.str_price = ddl_price.SelectedItem.Value;
                objentity.str_pick_location = txt_location.Text;
                objentity.str_details = txt_Details.Text;
                objentity.str_title = txt_title.Text;

                if (Request["postid"] == null)
                {
                    objentity.int_connect_cat_id = Convert.ToInt32(Request["cid"].ToString());
                    objentity.int_connect_service_id = Convert.ToInt32(Request["sid"].ToString());
                    _lResult = objbal.connect_car_rental_insert(objentity);
                }
                else
                {
                    objentity.int_id = Convert.ToInt32(Request.QueryString["postid"]);

                    _lResult = objbal.connect_car_rental_update(objentity);
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
                sp = "usp_select_tbl_connect_car_rent";
                ds = objbal.connect_select(" where int_post_id = " + postid, 1, 0, out totalrecords, sp);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddl_age.ClearSelection();
                    ddl_age.Items.FindByValue(ds.Tables[0].Rows[0]["int_age"].ToString()).Selected = true;

                    ddl_price.ClearSelection();
                    ddl_price.Items.FindByValue(ds.Tables[0].Rows[0]["str_price"].ToString()).Selected = true;

                    txt_Details.Text = ds.Tables[0].Rows[0]["str_details"].ToString();
                    txt_title.Text = ds.Tables[0].Rows[0]["str_title"].ToString();

                    txt_pick_date.Text = ds.Tables[0].Rows[0]["date_pickup_date"].ToString().Split(' ')[0];

                    txt_location.Text = ds.Tables[0].Rows[0]["str_pick_location"].ToString();
                    txt_return_date.Text = ds.Tables[0].Rows[0]["date_return_date"].ToString().Split(' ')[0];

                    ddl_vech_class.ClearSelection();
                    ddl_vech_class.Items.FindByValue(ds.Tables[0].Rows[0]["int_vech_class"].ToString()).Selected = true;

                    ddl_vech_type.ClearSelection();
                    ddl_vech_type.Items.FindByValue(ds.Tables[0].Rows[0]["int_vech_type"].ToString()).Selected = true;

                    ddl_capacity.ClearSelection();
                    ddl_capacity.Items.FindByValue(ds.Tables[0].Rows[0]["int_capacity"].ToString()).Selected = true;

                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}