using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Coupon_Bal;
using Coupon_Entity;

namespace Coupon.Admin
{
    public partial class offer_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddl_discount_type_bind();
                ddl_retailer_bind();
                ddl_category_bind();
                ddl_sb_bind();
                ddl_deal_type_bind();
                ddl_sub_category_bind();
                btn_update.Visible = false;
                Image1.Visible = false;
                if (Request["oid"] != null)
                {
                    binddata(" where int_offer_id=" + Request.QueryString["oid"], 1);
                    btn_add.Visible = false;
                    btn_update.Visible = true;
                    Image1.Visible = true;
                }
            }
        }

        protected void ddl_deal_type_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_discount_type_bal objbal = new tbl_discount_type_bal();
                DataSet ds = objbal.deal_type_Select(" ", 1, 0, out totalrecord);

                ddl_deal.DataValueField = "int_deal_type_id";
                ddl_deal.DataTextField = "str_deal_name";

                ddl_deal.DataSource = ds;
                ddl_deal.DataBind();

                ddl_deal.Items.Insert(0, new ListItem("-- Select Deal Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_discount_type_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_discount_type_bal objbal = new tbl_discount_type_bal();
                DataSet ds = objbal.discount_type_Select(" ", 1, 0, out totalrecord);

                ddl_ctype.DataValueField = "int_discount_type_id";
                ddl_ctype.DataTextField = "str_discount_type";

                ddl_ctype.DataSource = ds;
                ddl_ctype.DataBind();

                ddl_ctype.Items.Insert(0, new ListItem("-- Select Discount Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_sb_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_small_business_bal objbal = new tbl_small_business_bal();
                DataSet ds = objbal.small_business_Select(" ", 1, 0, out totalrecord);

                ddl_sb.DataValueField = "int_small_business_id";
                ddl_sb.DataTextField = "str_name";

                ddl_sb.DataSource = ds;
                ddl_sb.DataBind();

                ddl_sb.Items.Insert(0, new ListItem("-- Select Small Business --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_retailer_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_retailer_bal objbal = new tbl_retailer_bal();
                DataSet ds = objbal.retailer_Select(" ", 1, 0, out totalrecord);

                ddl_retailer.DataValueField = "int_retailer_id";
                ddl_retailer.DataTextField = "str_retailer_name";

                ddl_retailer.DataSource = ds;
                ddl_retailer.DataBind();

                ddl_retailer.Items.Insert(0, new ListItem("-- Select Retailer --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_category_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_category_bal objbal = new tbl_category_bal();
                DataSet ds = objbal.category_Select(" ", 1, 0, out totalrecord);

                ddl_category.DataValueField = "int_category_id";
                ddl_category.DataTextField = "str_category_name";

                ddl_category.DataSource = ds;
                ddl_category.DataBind();

                ddl_category.Items.Insert(0, new ListItem("-- Select Category --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_sub_category_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_sub_category_bal objbal = new tbl_sub_category_bal();
                DataSet ds = objbal.sub_category_Select(" ", 1, 0, out totalrecord);

                ddl_sub_category.DataValueField = "int_sub_category_id";
                ddl_sub_category.DataTextField = "str_sub_category_name";

                ddl_sub_category.DataSource = ds;
                ddl_sub_category.DataBind();

                ddl_sub_category.Items.Insert(0, new ListItem("-- Select Sub Category --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void binddata(string query, int pageindex)
        {
            try
            {
                int totalcount;

                DataSet dt = new DataSet();

                tbl_offer_bal objbal = new tbl_offer_bal();

                dt = objbal.offer_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_offer_name.Text = dt.Tables[0].Rows[0]["str_offer_name"].ToString();
                    txt_details.Text = dt.Tables[0].Rows[0]["str_offer_details"].ToString();
                    ddl_ctype.SelectedValue = dt.Tables[0].Rows[0]["int_discount_type_id"].ToString();
                    txt_amount.Text = dt.Tables[0].Rows[0]["dec_discount_amount"].ToString();
                    ddl_retailer.SelectedValue = dt.Tables[0].Rows[0]["int_retailer_id"].ToString();
                    txt_sdate.Text = dt.Tables[0].Rows[0]["date_start_date"].ToString();
                    txt_edate.Text = dt.Tables[0].Rows[0]["date_end_date"].ToString();
                    Image1.ImageUrl = "/Admin/offer_image/" + dt.Tables[0].Rows[0]["str_img"].ToString();
                    ddl_category.SelectedValue = dt.Tables[0].Rows[0]["int_category_id"].ToString();
                    ViewState["img"] = dt.Tables[0].Rows[0]["str_img"].ToString();
                    ddl_sb.SelectedValue = dt.Tables[0].Rows[0]["int_small_business_id"].ToString();
                    txt_org_share.Text = dt.Tables[0].Rows[0]["int_organization_share"].ToString();
                    ddl_sponsor.SelectedValue = dt.Tables[0].Rows[0]["str_sponsor"].ToString();
                    ddl_deal.SelectedValue = dt.Tables[0].Rows[0]["int_deal_type_id"].ToString();
                    ddl_sub_category.SelectedValue = dt.Tables[0].Rows[0]["int_sub_category_id"].ToString();
                    txt_limitation.Text = dt.Tables[0].Rows[0]["str_limitation"].ToString();
                    txt_original.Text = dt.Tables[0].Rows[0]["dec_original_price"].ToString();
                    txt_saving.Text = dt.Tables[0].Rows[0]["dec_savings"].ToString();
                    chk_treading.Checked = Convert.ToBoolean(dt.Tables[0].Rows[0]["bit_is_treading"].ToString());
                    chk_featured.Checked = Convert.ToBoolean(dt.Tables[0].Rows[0]["bit_is_featured"].ToString());
                    hid_maketing_type.Value = dt.Tables[0].Rows[0]["int_marketing_type_id"].ToString();    
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_offer_bal objbal = new tbl_offer_bal();
                tbl_offer_entity objentity = new tbl_offer_entity();
                if (fupimg.HasFile)
                {
                    string filename = fupimg.FileName;

                    objentity.str_offer_name = txt_offer_name.Text;
                    objentity.str_offer_details = txt_details.Text;
                    objentity.int_discount_type_id = Convert.ToInt64(ddl_ctype.SelectedItem.Value);
                    objentity.int_deal_type_id = Convert.ToInt64(ddl_deal.SelectedItem.Value);
                    objentity.dec_original_price = Convert.ToDecimal(txt_original.Text);
                    objentity.dec_discount_amount = Convert.ToDecimal(txt_amount.Text);
                    objentity.dec_savings = Convert.ToDecimal(txt_saving.Text);
                    objentity.int_retailer_id = Convert.ToInt64(ddl_retailer.SelectedItem.Value);
                    objentity.date_start_date = txt_sdate.Text;
                    objentity.date_end_date = txt_edate.Text;
                    objentity.bit_isactive = true;
                    objentity.str_img = filename;
                    fupimg.SaveAs(Server.MapPath("/Admin/offer_image/") + filename);
                    objentity.int_category_id = ddl_category.SelectedItem.Value;
                    objentity.int_sub_category_id = Convert.ToInt64(ddl_sub_category.SelectedItem.Value);
                    objentity.bit_accept = false;
                    objentity.int_small_business_id = Convert.ToInt64(ddl_sb.SelectedItem.Value);
                    objentity.int_organization_share = Convert.ToInt16(txt_org_share.Text);
                    objentity.str_sponsor = ddl_sponsor.SelectedItem.Value;
                    objentity.str_limitation = txt_limitation.Text;
                    objentity.date_created_date = Convert.ToDateTime(DateTime.Now.ToString("dd-MM-yyyy").ToString());
                    objentity.bit_is_delete = false;
                    objentity.bit_is_treading = chk_treading.Checked;
                    objentity.bit_is_featured = chk_featured.Checked;
                    objentity.int_marketing_type_id = Convert.ToInt16(hid_maketing_type.Value);

                    int val = objbal.offer_insert(objentity);
                    if (val > 0)
                    {
                        lblmess.InnerHtml = "Offer Inserted Successfully.";
                        lblmess.Attributes.Add("class", "alert alert-success");
                        txt_amount.Text = string.Empty;
                        //txt_created_by.Text = string.Empty;
                        txt_details.Text = string.Empty;
                        txt_edate.Text = string.Empty;
                        txt_offer_name.Text = string.Empty;
                        txt_sdate.Text = string.Empty;
                        ddl_ctype.ClearSelection();
                        ddl_retailer.ClearSelection();
                        txt_org_share.Text = string.Empty;
                        ddl_sponsor.ClearSelection();
                        ddl_sb.ClearSelection();
                    }
                    else
                    {
                        lblmess.InnerHtml = "Sorry,this Offer is already allocated";
                        lblmess.Attributes.Add("class", "alert alert-danger");
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_offer.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_offer_bal objbal = new tbl_offer_bal();
                tbl_offer_entity objentity = new tbl_offer_entity();

                objentity.int_offer_id = Convert.ToInt64(Request.QueryString["oid"].ToString());
                objentity.str_offer_name = txt_offer_name.Text;
                objentity.str_offer_details = txt_details.Text;
                objentity.int_discount_type_id = Convert.ToInt64(ddl_ctype.SelectedItem.Value);
                objentity.int_deal_type_id = Convert.ToInt64(ddl_deal.SelectedItem.Value);
                objentity.dec_original_price = Convert.ToDecimal(txt_original.Text);
                objentity.dec_discount_amount = Convert.ToDecimal(txt_amount.Text);
                objentity.dec_savings = Convert.ToDecimal(txt_saving.Text);
                objentity.int_retailer_id = Convert.ToInt64(ddl_retailer.SelectedItem.Value);
                objentity.date_start_date = txt_sdate.Text;
                objentity.date_end_date = txt_edate.Text;
                objentity.int_category_id = ddl_category.SelectedItem.Value;
                objentity.int_sub_category_id = Convert.ToInt64(ddl_sub_category.SelectedItem.Value);
                objentity.int_small_business_id = Convert.ToInt64(ddl_sb.SelectedItem.Value);
                objentity.int_organization_share = Convert.ToInt16(txt_org_share.Text);
                objentity.str_sponsor = ddl_sponsor.SelectedItem.Value;
                objentity.str_limitation = txt_limitation.Text;
                objentity.bit_is_treading = chk_treading.Checked;
                objentity.bit_is_featured = chk_featured.Checked;
                objentity.int_marketing_type_id = Convert.ToInt16(hid_maketing_type.Value);

                if (fupimg.HasFile)
                {
                    objentity.str_img = fupimg.FileName; ;
                    fupimg.SaveAs(Server.MapPath("/Admin/offer_image/") + objentity.str_img);
                }
                else
                    objentity.str_img = ViewState["img"].ToString();

                int val = objbal.offer_Update(objentity);
                if (val > 0)
                {
                    Response.Redirect("view_offer.aspx");
                }
                else
                {
                }
            }

            catch (Exception ex)
            {
            }
        }

        protected void txt_amount_TextChanged(object sender, EventArgs e)
        {
            txt_saving.Text = Convert.ToString(Convert.ToInt32(txt_original.Text) - Convert.ToInt32(txt_amount.Text));
        }

        protected void ddl_retailer_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddl_retailer.SelectedIndex > 0)
                {
                    int totalrecord = 0;
                    tbl_retailer_bal objbal = new tbl_retailer_bal();
                    DataSet ds = objbal.retailer_Select(" where int_retailer_id=" + ddl_retailer.SelectedItem.Value, 1, 0, out totalrecord);
                    if (totalrecord > 0)
                    {
                        txt_hid_marketing.Text = ds.Tables[0].Rows[0]["int_organization_share"].ToString();
                        hid_maketing_type.Value = ds.Tables[0].Rows[0]["int_marketing_type_id"].ToString();
                    }
                    else
                    {
                        txt_hid_marketing.Text = "0";
                        hid_maketing_type.Value = "0";
                    }
                }
                else
                {
                    txt_hid_marketing.Text = "0";
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}