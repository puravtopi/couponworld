using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Entity;
using Coupon_Bal;
using System.Data;

namespace Coupon
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddl_type_bind();
                ddl_state_bind();
                ddl_city_bind();
                ddl_connect_category_bind();

                Cls_Common obj = new Cls_Common();
                obj.setCookiesRetailer();

                if (Session["rid"] != null)
                {
                    BindGrid(" where int_retailer_id = " + Session["rid"].ToString(), 1);
                    bind_social_data(" where int_retailer_id = " + Session["rid"].ToString(), 1);
                    bindData();
                }
            }
        }

        protected void ddl_city_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_city_bal objbal = new tbl_city_bal();
                DataSet ds = objbal.city_Select(" where int_state_id=" + ddl_state.SelectedItem.Value, 1, 0, out totalrecord);

                ddl_city.DataValueField = "int_city_id";
                ddl_city.DataTextField = "str_city_name";

                ddl_city.DataSource = ds;
                ddl_city.DataBind();

                ddl_city.Items.Insert(0, new ListItem("-- Select City --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_state_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_state_bal objbal = new tbl_state_bal();
                DataSet ds = objbal.state_Select(" ", 1, 0, out totalrecord);

                ddl_state.DataValueField = "int_state_id";
                ddl_state.DataTextField = "str_state_name";

                ddl_state.DataSource = ds;
                ddl_state.DataBind();

                ddl_state.Items.Insert(0, new ListItem("-- Select State --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_type_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_types_bal objbal = new tbl_types_bal();
                DataSet ds = objbal.types_Select(" ", 1, 0, out totalrecord);

                ddl_type.DataValueField = "int_type_id";
                ddl_type.DataTextField = "str_type_name";

                ddl_type.DataSource = ds;
                ddl_type.DataBind();

                ddl_type.Items.Insert(0, new ListItem("-- Select Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void bind_social_data(string query, int pageindex, string columnname = "str_retailer_name", string sortorder = "asc")
        {
            try
            {
                int totalcount;

                DataSet dt = new DataSet();

                tbl_retailer_social_bal objbal = new tbl_retailer_social_bal();

                dt = objbal.retailer_social_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rp_social.DataSource = dt;
                    rp_social.DataBind();

                    txt_fb_link.Text = dt.Tables[0].Rows[0]["str_fb_link"].ToString();
                    txt_twitter.Text = dt.Tables[0].Rows[0]["str_twitter_link"].ToString();
                    txt_linkin.Text = dt.Tables[0].Rows[0]["str_linkin_link"].ToString();
                    txt_google_plus.Text = dt.Tables[0].Rows[0]["str_google_plus_link"].ToString();
                    txt_other.Text = dt.Tables[0].Rows[0]["str_other_link"].ToString();
                }
                else
                {
                    //rpview.DataSource = null;
                    //rpview.DataBind();
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void BindGrid(string query, int pageindex, string columnname = "str_retailer_name", string sortorder = "asc")
        {
            try
            {
                int totalcount;
                DataSet ds = new DataSet();

                tbl_retailer_bal objbal = new tbl_retailer_bal();

                ds = objbal.retailer_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    rpview.DataSource = ds;
                    rpview.DataBind();


                    txt_name.Text = ds.Tables[0].Rows[0]["str_retailer_name"].ToString();
                    txt_cname.Text = ds.Tables[0].Rows[0]["str_corporate_name"].ToString();
                    txt_email.Text = ds.Tables[0].Rows[0]["str_email_id_p"].ToString();
                    txt_address.Value = ds.Tables[0].Rows[0]["str_street_address"].ToString();
                    ddl_state.SelectedValue = ds.Tables[0].Rows[0]["int_state_id"].ToString();
                    ddl_city_bind();
                    ddl_city.SelectedValue = ds.Tables[0].Rows[0]["int_city_id"].ToString();

                    txt_zip.Text = ds.Tables[0].Rows[0]["int_zip_code"].ToString();
                    ddl_type.SelectedValue = ds.Tables[0].Rows[0]["int_type_id"].ToString();
                    txt_telephone.Text = ds.Tables[0].Rows[0]["str_telephone_p"].ToString();
                    txt_contact.Text = ds.Tables[0].Rows[0]["str_contact_1_p"].ToString();
                    txt_contact_s.Text = ds.Tables[0].Rows[0]["str_contact_2_s"].ToString();
                    txt_web.Text = ds.Tables[0].Rows[0]["str_web_address"].ToString();

                    txt_bio.Value = ds.Tables[0].Rows[0]["str_bio"].ToString();
                }
                else
                {
                    rpview.DataSource = null;
                    rpview.DataBind();
                }



                //PopulatePager(totalcount, pageindex);
                //lblcount.Text = totalcount.ToString();
            }
            catch (Exception ex)
            {
            }
        }

        protected void lnk_edit_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "openModel('company_modal')", true);
        }

        protected void lnk_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_retailer_bal objbal = new tbl_retailer_bal();
                tbl_retailer_entity objentity = new tbl_retailer_entity();

                objentity.int_state_id = Convert.ToInt32(ddl_state.SelectedItem.Value);
                objentity.int_city_id = Convert.ToInt32(ddl_city.SelectedItem.Value);

                //objentity.int_type_id = Convert.ToInt32(ddl_type.SelectedItem.Value);
                objentity.int_zip_code = Convert.ToInt32(txt_zip.Text);
                objentity.int_retailer_id = Convert.ToInt32(Session["rid"].ToString());
                objentity.str_contact_1_p = txt_contact.Text;
                objentity.str_retailer_name = txt_name.Text;
                objentity.str_corporate_name = txt_cname.Text;
                objentity.str_email_id_p = txt_email.Text;
                objentity.str_street_address = txt_address.InnerText;
                objentity.str_telephone_p = txt_telephone.Text;
                objentity.str_contact_2_s = txt_contact_s.Text;
                objentity.str_web_address = txt_web.Text;

                int lVal = objbal.retailer_Update_profile(objentity);

                if (lVal > 0)
                {
                    BindGrid(" where int_retailer_id = " + Session["rid"].ToString(), 1);
                }
            }
            catch (Exception ex)
            {
            }

        }

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_city_bind();
        }

        protected void lnk_bio_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_retailer_bal objbal = new tbl_retailer_bal();
                tbl_retailer_entity objentity = new tbl_retailer_entity();

                objentity.int_retailer_id = Convert.ToInt32(Session["rid"].ToString());
                objentity.str_bio = txt_bio.Value;

                int val = objbal.retailer_bio_Update(objentity);
                if (val > 0)
                {
                    BindGrid(" where int_retailer_id = " + Session["rid"].ToString(), 1);
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void lnk_social_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_retailer_social_bal objbal = new tbl_retailer_social_bal();
                tbl_retailer_social_entity objentity = new tbl_retailer_social_entity();

                objentity.int_retailer_id = Convert.ToInt64(Session["rid"]);
                objentity.str_fb_link = txt_fb_link.Text;
                objentity.str_linkin_link = txt_linkin.Text;
                objentity.str_twitter_link = txt_twitter.Text;
                objentity.str_google_plus_link = txt_google_plus.Text;
                objentity.str_other_link = txt_other.Text;
                objentity.date_create_date = Convert.ToDateTime(DateTime.Now.ToString());
                objentity.bit_is_delete = false;


                int val = objbal.retailer_social_insert(objentity);

                if (val > 0)
                {
                    BindGrid(" where int_retailer_id = " + Session["rid"].ToString(), 1);
                    bind_social_data("where int_retailer_id = " + Session["rid"].ToString(), 1);
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void bindData()
        {
            tbl_retailer_bal objbal = new tbl_retailer_bal();
            DataSet ds = new DataSet();

            ds = objbal.retailer_select_connect_sub(Session["rid"].ToString());

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                rep_connect_sub.DataSource = ds;
                rep_connect_sub.DataBind();

                ddl_connect_cat.ClearSelection();
                ddl_connect_cat.Items.FindByValue(ds.Tables[0].Rows[0]["int_cat_id"].ToString()).Selected = true;

                bindConnectSubcat();

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    chk_connect_sub.Items.FindByValue(ds.Tables[0].Rows[i]["int_sub_cat_id"].ToString()).Selected = true;
                }
            }


        }

        protected void ddl_connect_category_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_connect_category_bal objbal = new tbl_connect_category_bal();
                DataSet ds = objbal.cat_select(" ", 1, 0, out totalrecord);

                ddl_connect_cat.DataValueField = "int_connect_cat_id";
                ddl_connect_cat.DataTextField = "str_cat";

                ddl_connect_cat.DataSource = ds;
                ddl_connect_cat.DataBind();

                ddl_connect_cat.Items.Insert(0, new ListItem("-- Select Connect Category --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_connect_cat_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddl_connect_cat.SelectedIndex > 0)
            {
                try
                {
                    bindConnectSubcat();
                }
                catch (Exception ex)
                {
                }
            }
            else
            {
                chk_connect_sub.Items.Clear();
            }
        }

        public void bindConnectSubcat()
        {
            int totalrecords = 0;
            tbl_connect_subcategory_bal objbal = new tbl_connect_subcategory_bal();
            DataSet ds = objbal.subcat_select(" where int_connect_cat_id=" + ddl_connect_cat.SelectedItem.Value, 1, 0, out totalrecords);

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                chk_connect_sub.DataTextField = "str_sub_cat";
                chk_connect_sub.DataValueField = "int_connect_sub_cat_id";

                chk_connect_sub.DataSource = ds;
                chk_connect_sub.DataBind();
            }
        }

        protected void lnk_connect_Click(object sender, EventArgs e)
        {
            string str = "";

            tbl_retailer_bal objbal = new tbl_retailer_bal();

            for (int i = 0; i < chk_connect_sub.Items.Count; i++)
            {
                if (chk_connect_sub.Items[i].Selected == true)
                {
                    str = str + "," + chk_connect_sub.Items[i].Value;
                }

            }
            objbal.member_insert_sub_connect(Session["rid"].ToString(), ddl_connect_cat.SelectedItem.Value, str + ",");

            Response.Redirect(Request.Url.ToString());
        }
    }
}