using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Entity;
using Coupon_Bal;
using System.Data;
using System.IO;

namespace Coupon
{
    public partial class offer_details : System.Web.UI.Page
    {
        string oid = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            oid = this.Page.RouteData.Values["oid"].ToString();
            if (!IsPostBack)
            {
                BindGrid(" where int_offer_id = " + oid, 1);
                Bind_retailer_grid(" where int_retailer_id = " + ViewState["retailer_id"], 1);
                Bind_sb_grid(" where int_small_business_id = " + ViewState["sb_id"], 1);

                String originalPath = new Uri(HttpContext.Current.Request.Url.AbsoluteUri).OriginalString;
                ViewState["path"] = originalPath;
            }
        }

        protected void BindGrid(string query, int pageindex, string columnname = "str_offer_name", string sortorder = "asc")
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                tbl_offer_bal objbal = new tbl_offer_bal();

                dt = objbal.offer_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rpview.DataSource = dt;
                    rpview.DataBind();
                    hidendtime.Value = dt.Tables[0].Rows[0]["date_end_date"].ToString();
                    // Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "ReversCounter()", true);
                    ViewState["retailer_id"] = dt.Tables[0].Rows[0]["int_retailer_id"].ToString();
                    ViewState["sb_id"] = dt.Tables[0].Rows[0]["int_small_business_id"].ToString();
                    lbl_details.Text = dt.Tables[0].Rows[0]["str_offer_details"].ToString();
                }
                else
                {
                    rpview.DataSource = null;
                    rpview.DataBind();
                }

                string today_date = System.DateTime.Now.ToString("yyyy-MM-dd");

                dt = null;
                objbal = new tbl_offer_bal();
                query = "where int_offer_id<>" + oid + " and '" + today_date + "'>=date_start_date and '" + today_date + "'<=date_end_date";
                dt = objbal.offer_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rep_other.DataSource = dt;
                    rep_other.DataBind();
                }
                else
                {
                    rep_other.DataSource = null;
                    rep_other.DataBind();
                }

                //PopulatePager(totalcount, pageindex);
                //lblcount.Text = totalcount.ToString();
                ScriptManager.RegisterStartupScript(Page, this.GetType(), Guid.NewGuid().ToString(), "ReversCounter()", true);
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_buy_Click(object sender, EventArgs e)
        {

        }

        protected void lnk_buy_Click(object sender, EventArgs e)
        {
            if (Session["cid"] == null)
                Response.Redirect("login.aspx?lid=1&rd_url=" + Request.UrlReferrer.ToString());
        }

        protected void Bind_retailer_grid(string query, int pageindex, string columnname = "str_retailer_name", string sortorder = "asc")
        {
            try
            {
                int totalcount;
                DataSet ds = new DataSet();

                tbl_retailer_bal objbal = new tbl_retailer_bal();

                ds = objbal.retailer_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lbl_name.Text = ds.Tables[0].Rows[0]["str_retailer_name"].ToString();
                    lbl_cname.Text = ds.Tables[0].Rows[0]["str_corporate_name"].ToString();
                    lbl_email.Text = ds.Tables[0].Rows[0]["str_email_id_p"].ToString();
                    lbl_add.Text = ds.Tables[0].Rows[0]["str_street_address"].ToString();
                    lbl_state.Text = ds.Tables[0].Rows[0]["str_state_name"].ToString();
                    lbl_city.Text = ds.Tables[0].Rows[0]["str_city_name"].ToString();
                    lbl_zip.Text = ds.Tables[0].Rows[0]["int_zip_code"].ToString();
                    // lbl_org_share.Text = ds.Tables[0].Rows[0]["int_organization_share"].ToString();
                    lbl_tele_p.Text = ds.Tables[0].Rows[0]["str_telephone_p"].ToString();
                    lbl_contact_p.Text = ds.Tables[0].Rows[0]["str_contact_1_p"].ToString();
                    lbl_contact_s.Text = ds.Tables[0].Rows[0]["str_contact_2_s"].ToString();
                    lbl_tele_s.Text = ds.Tables[0].Rows[0]["str_telephone_s"].ToString();
                    lbl_email_s.Text = ds.Tables[0].Rows[0]["str_email_id_s"].ToString();
                    //lbl_share_type.Text = ds.Tables[0].Rows[0]["int_share_type_id"].ToString();
                    //lbl_share_amt.Text = ds.Tables[0].Rows[0]["dec_share_amount"].ToString();
                    lbl_type.Text = ds.Tables[0].Rows[0]["str_type_name"].ToString();
                    //lbl_market_fee.Text = ds.Tables[0].Rows[0][""].ToString();
                    lbl_web.Text = ds.Tables[0].Rows[0]["str_web_address"].ToString();
                    img.ImageUrl = "/Admin/retailer_logo/" + ds.Tables[0].Rows[0]["str_logo_img"].ToString();
                    //lbl_share_amt.Text = ds.Tables[0].Rows[0]["dec_share_amount"].ToString();
                    // lbl_share_type.Text = ds.Tables[0].Rows[0]["str_share_type"].ToString();
                    //lbl_rtype.Text = ds.Tables[0].Rows[0]["str_type_name"].ToString();
                    ViewState["rid"] = ds.Tables[0].Rows[0]["int_retailer_id"].ToString();
                }
                else
                {
                    //lblmess.InnerHtml = "Sorry,No Data Found...!!!";
                    //lblmess.Attributes.Add("class", "alert alert-danger");
                    //rpview.DataSource = null;
                    //rpview.DataBind();
                }
                //PopulatePager(totalcount, pageindex);
                //lblcount.Text = totalcount.ToString();
            }
            catch (Exception ex)
            {
            }
        }

        protected void Bind_sb_grid(string query, int pageindex, string columnname = "str_name", string sortorder = "asc")
        {
            try
            {
                int totalcount;
                DataSet ds = new DataSet();

                tbl_small_business_bal objbal = new tbl_small_business_bal();

                ds = objbal.small_business_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lbl_name.Text = ds.Tables[0].Rows[0]["str_name"].ToString();
                    lbl_cname.Text = ds.Tables[0].Rows[0]["str_corporate_name"].ToString();
                    lbl_email.Text = ds.Tables[0].Rows[0]["str_email_id_p"].ToString();
                    lbl_add.Text = ds.Tables[0].Rows[0]["str_street_address"].ToString();
                    lbl_state.Text = ds.Tables[0].Rows[0]["str_state_name"].ToString();
                    lbl_city.Text = ds.Tables[0].Rows[0]["str_city_name"].ToString();
                    lbl_zip.Text = ds.Tables[0].Rows[0]["int_zip_code"].ToString();
                    // lbl_org_share.Text = ds.Tables[0].Rows[0]["int_organization_share"].ToString();
                    lbl_tele_p.Text = ds.Tables[0].Rows[0]["str_telephone_p"].ToString();
                    lbl_contact_p.Text = ds.Tables[0].Rows[0]["str_contact_1_p"].ToString();
                    lbl_contact_s.Text = ds.Tables[0].Rows[0]["str_contact_2_s"].ToString();
                    lbl_tele_s.Text = ds.Tables[0].Rows[0]["str_telephone_s"].ToString();
                    lbl_email_s.Text = ds.Tables[0].Rows[0]["str_email_id_s"].ToString();
                    //lbl_share_type.Text = ds.Tables[0].Rows[0]["int_share_type_id"].ToString();
                    //lbl_share_amt.Text = ds.Tables[0].Rows[0]["dec_share_amount"].ToString();
                    lbl_type.Text = ds.Tables[0].Rows[0]["str_small_business_type_name"].ToString();
                    //lbl_market_fee.Text = ds.Tables[0].Rows[0][""].ToString();
                    lbl_web.Text = ds.Tables[0].Rows[0]["str_web_address"].ToString();
                    img.ImageUrl = "/Admin/small_business_logo/" + ds.Tables[0].Rows[0]["str_logo_img"].ToString();
                    //lbl_share_amt.Text = ds.Tables[0].Rows[0]["dec_share_amount"].ToString();
                    // lbl_share_type.Text = ds.Tables[0].Rows[0]["str_share_type"].ToString();
                    //lbl_rtype.Text = ds.Tables[0].Rows[0]["str_type_name"].ToString();
                }
                else
                {
                    //lblmess.InnerHtml = "Sorry,No Data Found...!!!";
                    //lblmess.Attributes.Add("class", "alert alert-danger");
                    //rpview.DataSource = null;
                    //rpview.DataBind();
                }
                //PopulatePager(totalcount, pageindex);
                //lblcount.Text = totalcount.ToString();
            }
            catch (Exception ex)
            {
            }
        }

        protected void lnk_rating_Click(object sender, EventArgs e)
        {
            if (Session["cid"] != null)
            {
                tbl_rating_review_bal objbal = new tbl_rating_review_bal();
                tbl_rating_review_entity objentity = new tbl_rating_review_entity();

                objentity.int_retailer_id = Convert.ToInt16(ViewState["rid"].ToString());
                objentity.int_user_id = Convert.ToInt16(Session["cid"].ToString());
                objentity.dec_rate = Convert.ToInt16(ddl_rate.SelectedItem.Value);
                objentity.str_review = txt_review.Value;
                objentity.date_create_date = Convert.ToDateTime(DateTime.Now.ToString());
                objentity.date_update_date = Convert.ToDateTime(DateTime.Now.ToString());
                objentity.bit_is_delete = false;

                int val = objbal.rating_review_insert(objentity);
                if (val > 0)
                {
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertmessage", "alert('Please First Login.')", true);
                Response.Redirect("~/login/consumer/1");
            }
        }
    }
}