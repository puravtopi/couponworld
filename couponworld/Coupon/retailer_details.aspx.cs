using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Entity;
using Coupon_Bal;
using System.Data;
using System.Configuration;

namespace Coupon
{
    public partial class retailer_details : System.Web.UI.Page
    {
        string rid = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            rid = Page.RouteData.Values["rid"].ToString();
            //rid = Request.QueryString["rid"].ToString(); 
            if (!IsPostBack)
            {
                BindGrid(" where int_retailer_id = " + rid, 1);
                bindoffers();
                AvgRating();
            }
        }
        protected void AvgRating()
        {
            try
            {
                tbl_rating_review_bal bal = new tbl_rating_review_bal();

                DataSet dt = new DataSet();

                dt = bal.get_avg_rating(rid);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    string cnt = "0";
                    if (dt.Tables[0].Rows[0][0] != DBNull.Value)
                        cnt = dt.Tables[0].Rows[0][0].ToString();

                    lbl_cnt.Text = "Rating : " + cnt + " / 5 ";
                    //txt_cnt_rate.Value = dt.Tables[0].Rows[0][0].ToString();
                    lblreview.Text = "Total Review : " + dt.Tables[0].Rows[0][1].ToString();
                }

                //PopulatePager(totalcount, pageindex);
                //lblcount.Text = totalcount.ToString();
            }
            catch (Exception ex)
            {
            }
        }

        protected void BindGrid(string query, int pageindex, string columnname = "str_retailer_name", string sortorder = "asc")
        {
            try
            {
                //ViewState["cnd"] = query;
                int totalcount;
                DataSet dt = new DataSet();

                tbl_retailer_bal objbal = new tbl_retailer_bal();

                dt = objbal.retailer_Select(query, pageindex, 20, out totalcount, sortorder, columnname);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    img.ImageUrl = "/Admin/retailer_logo/" + dt.Tables[0].Rows[0]["str_logo_img"].ToString();
                    lbl_cname.Text = dt.Tables[0].Rows[0]["str_corporate_name"].ToString().ToUpper();
                    lbl_top_city.Text = dt.Tables[0].Rows[0]["str_city_name"].ToString();
                    lbl_top_state.Text = dt.Tables[0].Rows[0]["str_state_name"].ToString();
                    lbl_rname.Text = dt.Tables[0].Rows[0]["str_retailer_name"].ToString();
                    lbl_email_p.Text = dt.Tables[0].Rows[0]["str_email_id_p"].ToString();
                    lbl_city.Text = dt.Tables[0].Rows[0]["str_city_name"].ToString();
                    lbl_state.Text = dt.Tables[0].Rows[0]["str_state_name"].ToString();
                    lbl_zip.Text = dt.Tables[0].Rows[0]["int_zip_code"].ToString();
                    lbl_telephone.Text = dt.Tables[0].Rows[0]["str_telephone_p"].ToString();
                    lbl_contact_p.Text = dt.Tables[0].Rows[0]["str_contact_1_p"].ToString();
                    lbl_tele_s.Text = dt.Tables[0].Rows[0]["str_telephone_s"].ToString();
                    lbl_contect_2.Text = dt.Tables[0].Rows[0]["str_contact_2_s"].ToString();
                    lbl_email_s.Text = dt.Tables[0].Rows[0]["str_email_id_s"].ToString();
                    lbl_web_address.Text = dt.Tables[0].Rows[0]["str_web_address"].ToString();
                    lbl_address.Text = dt.Tables[0].Rows[0]["str_street_address"].ToString();
                    // rpview.DataSource = dt;
                    //rpview.DataBind();
                }
                else
                {
                    //rpview.DataSource = null;
                    //rpview.DataBind();
                }
                //PopulatePager(totalcount, pageindex);
                //lbl_total.Text = " Showing all " + totalcount.ToString() + " results";
            }
            catch (Exception ex)
            {
            }
        }

        protected void bindoffers()
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                tbl_offer_bal objbal = new tbl_offer_bal();

                string today_date = System.DateTime.Now.ToString("yyyy-MM-dd");

                string query = "where int_retailer_id=" + rid + " and '" + today_date + "'>=date_start_date and '" + today_date + "'<=date_end_date ";
                dt = objbal.offer_Select(query, 1, 10, out totalcount, "asc", "str_offer_name");
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
                ScriptManager.RegisterStartupScript(Page, this.GetType(), Guid.NewGuid().ToString(), "ReversCounter()", true);
            }
            catch (Exception ex)
            {
            }
        }

        protected void lnk_rating_Click(object sender, EventArgs e)
        {
            tbl_rating_review_bal objbal = new tbl_rating_review_bal();
            tbl_rating_review_entity objentity = new tbl_rating_review_entity();

            objentity.int_retailer_id = Convert.ToInt64(rid);
            objentity.int_user_id = Convert.ToInt64(Session["cid"].ToString());
            objentity.dec_rate = Convert.ToDecimal(ddl_rate.SelectedItem.Value);
            objentity.str_review = txt_review.Value;
            objentity.date_create_date = Convert.ToDateTime(DateTime.Now.ToString());
            objentity.bit_is_delete = false;

            int val = objbal.rating_review_insert(objentity);
            if (val > 0)
            {
                //   BindGrid(" where int_retailer_id = " + rid, 1);
                // bindoffers();
                AvgRating();
                ddl_rate.ClearSelection();
                txt_review.Value = string.Empty;
            }
            else
            {
                lblmess.InnerHtml = "Sorry,Already Review Inserted";
                lblmess.Attributes.Add("class", "alert alert-danger");
            }
        }
    }
}