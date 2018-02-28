using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using Coupon_Entity;
using System.Data.SqlClient;
using System.Data;

namespace Coupon
{
    public partial class deal_details_retailer : System.Web.UI.Page
    {
        string oid = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.RouteData.Values["oid"] != null)
            {
                oid = this.Page.RouteData.Values["oid"].ToString();
            }
            if (!IsPostBack)
            {

                txt_merketing.Text = Session["marketingfee"].ToString();
                txt_hid_maketing.Text = Session["marketingfee"].ToString();
                cmp1.ErrorMessage = "Sorry, your marketing fee is $" + txt_merketing.Text + ".you can not enter less value than your marketing fee";

                ddl_category_bind();
                ddl_deal_type_bind();
                update_btn.Visible = false;
                btn_cancle.Visible = false;
                Image1.Visible = false;

                if (oid != "0")
                {
                    rf10.Enabled = false;
                    binddata(" where int_offer_id=" + oid, 1);
                    Image1.Visible = true;
                    update_btn.Visible = true;
                    btn_submit.Visible = false;

                    if (ddl_deal_type.SelectedValue == "2")
                    {
                        div_discount.Attributes.Add("style", "display:block");
                        RequiredFieldValidator3.Enabled = true;
                        RequiredFieldValidator4.Enabled = true;
                        rf5.Enabled = true;
                    }
                }

                ddl_dec_type.Items.Insert(0, new ListItem("-- Select Discount Type --", "0"));
                ddl_sub_category.Items.Insert(0, new ListItem("-- Select Sub Category --", "0"));
            }
        }

        protected void ddl_category_bind()
        {
            try
            {
                int totalrecords = 0;
                tbl_category_bal objbal = new tbl_category_bal();
                DataSet dt = objbal.category_Select("", 1, 0, out totalrecords, "asc", "str_category_name");

                ddl_category.DataValueField = "int_category_id";
                ddl_category.DataTextField = "str_category_name";

                ddl_category.DataSource = dt;
                ddl_category.DataBind();

                ddl_category.Items.Insert(0, new ListItem("-- Select Category --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_deal_type_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_discount_type_bal objbal = new tbl_discount_type_bal();
                DataSet ds = objbal.deal_type_Select(" ", 1, 0, out totalrecord);

                ddl_deal_type.DataValueField = "int_deal_type_id";
                ddl_deal_type.DataTextField = "str_deal_name";

                ddl_deal_type.DataSource = ds;
                ddl_deal_type.DataBind();

                ddl_deal_type.Items.Insert(0, new ListItem("-- Select Deal Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_discount_type_bind(string deal_type_id)
        {
            try
            {
                if (deal_type_id != "0")
                {
                    int totalrecords = 0;
                    tbl_discount_type_bal objbal = new tbl_discount_type_bal();
                    DataSet dt = objbal.discount_type_Select(" where int_deal_type_id=" + ddl_deal_type.SelectedItem.Value, 1, 0, out totalrecords, "asc", "str_discount_type");

                    ddl_dec_type.DataValueField = "int_discount_type_id";
                    ddl_dec_type.DataTextField = "str_discount_type";

                    ddl_dec_type.DataSource = dt;
                    ddl_dec_type.DataBind();

                    ddl_dec_type.Items.Insert(0, new ListItem("-- Select Discount Type --", "0"));
                }
                else
                {
                    ddl_dec_type.Items.Clear();
                    ddl_dec_type.Items.Insert(0, new ListItem("-- Select Discount Type --", "0"));
                }
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
                    CKEditor1.Text = dt.Tables[0].Rows[0]["str_offer_details"].ToString();
                    ddl_deal_type.SelectedValue = dt.Tables[0].Rows[0]["int_deal_type_id"].ToString();
                    ddl_discount_type_bind(ddl_deal_type.SelectedItem.Value);
                    ddl_dec_type.SelectedValue = dt.Tables[0].Rows[0]["int_discount_type_id"].ToString();
                    txt_orginal_amount.Text = dt.Tables[0].Rows[0]["dec_original_price"].ToString();
                    txt_discount_amount.Text = dt.Tables[0].Rows[0]["dec_discount_amount"].ToString();
                    txt_saving_amount.Text = dt.Tables[0].Rows[0]["dec_savings"].ToString();
                    txt_start_date.Text = dt.Tables[0].Rows[0]["date_start_date"].ToString();
                    txt_end_date.Text = dt.Tables[0].Rows[0]["date_end_date"].ToString();
                    Image1.ImageUrl = "/Admin/offer_image/" + dt.Tables[0].Rows[0]["str_img"].ToString();
                    ddl_category.SelectedValue = dt.Tables[0].Rows[0]["int_category_id"].ToString();
                    ddl_sub_category_bind(ddl_category.SelectedItem.Value);
                    ddl_sub_category.SelectedValue = dt.Tables[0].Rows[0]["int_sub_category_id"].ToString();
                    ddl_limitation.SelectedValue = dt.Tables[0].Rows[0]["str_limitation"].ToString();
                    txt_merketing.Text = dt.Tables[0].Rows[0]["dec_marketing_fee"].ToString();


                    ViewState["img"] = dt.Tables[0].Rows[0]["str_img"].ToString();
                    ViewState["sd_id"] = dt.Tables[0].Rows[0]["int_small_business_id"].ToString();
                    ViewState["org_share"] = dt.Tables[0].Rows[0]["int_organization_share"].ToString();
                    ViewState["sponsor"] = dt.Tables[0].Rows[0]["str_sponsor"].ToString();
                    ViewState["istreading"] = dt.Tables[0].Rows[0]["bit_is_treading"].ToString();
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
                tbl_offer_bal objbal = new tbl_offer_bal();
                tbl_offer_entity objentity = new tbl_offer_entity();

                string filename = fupimg.FileName;

                objentity.str_offer_name = txt_offer_name.Text;
                objentity.str_offer_details = CKEditor1.Text;
                objentity.int_discount_type_id = Convert.ToInt64(ddl_dec_type.SelectedItem.Value);
                objentity.int_deal_type_id = Convert.ToInt64(ddl_deal_type.SelectedItem.Value);


                objentity.date_start_date = txt_start_date.Text;
                objentity.date_end_date = txt_end_date.Text;
                objentity.bit_isactive = true;

                if (fupimg.HasFile)
                {
                    fupimg.SaveAs(Server.MapPath("/Admin/offer_image/") + filename);
                    objentity.str_img = filename;
                }
                else
                    objentity.str_img = "NA";
                objentity.int_category_id = ddl_category.SelectedItem.Value;
                objentity.int_sub_category_id = Convert.ToInt64(ddl_sub_category.SelectedItem.Value);
                objentity.bit_accept = true;

                objentity.int_organization_share = 10;
                objentity.str_sponsor = "";
                objentity.bit_is_delete = false;
                objentity.date_created_date = Convert.ToDateTime(DateTime.Now.ToString());

                if (ddl_deal_type.SelectedValue == "2")
                {
                    objentity.dec_original_price = Convert.ToDecimal(txt_orginal_amount.Text);
                    objentity.dec_discount_amount = Convert.ToDecimal(txt_discount_amount.Text);
                    objentity.dec_savings = Convert.ToDecimal(txt_saving_amount.Text);
                    objentity.str_limitation = ddl_limitation.SelectedItem.Value;
                }
                else
                {
                    objentity.dec_original_price = 0;
                    objentity.dec_discount_amount = 0;
                    objentity.dec_savings = 0;
                    objentity.str_limitation = "0";
                }

                if (Session["utype"].ToString() == appConstant.reatiler)
                {
                    objentity.int_retailer_id = Convert.ToInt64(Session["rid"].ToString());

                }
                else
                    objentity.int_retailer_id = 0;

                if (Session["utype"].ToString() == appConstant.smallbusiness)
                    objentity.int_small_business_id = Convert.ToInt64(Session["sid"].ToString());
                else
                    objentity.int_small_business_id = 0;

                objentity.bit_is_treading = false;
                objentity.int_marketing_type_id = Convert.ToInt32(Session["marketingtype"].ToString());
                objentity.dec_marketing_fee = string.IsNullOrEmpty(txt_merketing.Text) == true ? 0 : Convert.ToDecimal(txt_merketing.Text);

                int val = objbal.offer_insert(objentity);
                if (val > 0)
                {
                    Response.Redirect(ResolveUrl("~/retailer-deals"));

                    lblmess.InnerHtml = "Offer Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    CKEditor1.Text = string.Empty;
                    //txt_amount.Text = string.Empty;
                    ////txt_created_by.Text = string.Empty;
                    //txt_details.Text = string.Empty;
                    //txt_edate.Text = string.Empty;
                    //txt_offer_name.Text = string.Empty;
                    //txt_sdate.Text = string.Empty;
                    //ddl_ctype.ClearSelection();
                    //ddl_retailer.ClearSelection();
                    //txt_org_share.Text = string.Empty;
                    //ddl_sponsor.ClearSelection();
                    //ddl_sb.ClearSelection();
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this Offer is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }

            catch (Exception ex)
            {
            }
        }

        protected void btn_cancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_deals_retailer.aspx");
        }

        protected void update_btn_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_offer_bal objbal = new tbl_offer_bal();
                tbl_offer_entity objentity = new tbl_offer_entity();

                objentity.int_offer_id = Convert.ToInt64(oid);
                objentity.str_offer_name = txt_offer_name.Text;
                objentity.str_offer_details = CKEditor1.Text;
                objentity.int_discount_type_id = Convert.ToInt64(ddl_dec_type.SelectedItem.Value);
                objentity.dec_discount_amount = Convert.ToDecimal(txt_discount_amount.Text);
                objentity.int_retailer_id = Convert.ToInt64(Session["rid"].ToString());
                objentity.date_start_date = txt_start_date.Text;
                objentity.date_end_date = txt_end_date.Text;
                objentity.int_category_id = ddl_category.SelectedItem.Value;
                objentity.int_sub_category_id = Convert.ToInt64(ddl_sub_category.SelectedItem.Value);
                objentity.int_small_business_id = Convert.ToInt64(ViewState["sd_id"]);
                objentity.int_organization_share = Convert.ToInt32(ViewState["org_share"]);
                objentity.str_sponsor = ViewState["sponsor"] == null ? "" : ViewState["sponsor"].ToString();
                objentity.dec_original_price = Convert.ToDecimal(txt_orginal_amount.Text);
                objentity.dec_savings = Convert.ToDecimal(txt_saving_amount.Text);
                objentity.str_limitation = ddl_limitation.SelectedItem.Value;
                objentity.int_deal_type_id = Convert.ToInt64(ddl_deal_type.SelectedItem.Value);
                objentity.dec_marketing_fee = string.IsNullOrEmpty(txt_merketing.Text) == true ? 0 : Convert.ToDecimal(txt_merketing.Text);
                objentity.bit_is_treading = string.IsNullOrEmpty(ViewState["istreading"].ToString()) == true ? false : Convert.ToBoolean(ViewState["istreading"].ToString());

                if (fupimg.HasFile)
                {
                    objentity.str_img = fupimg.FileName;
                    fupimg.SaveAs(Server.MapPath("/Admin/offer_image/") + objentity.str_img);
                }
                else
                    objentity.str_img = ViewState["img"].ToString();

                int val = objbal.offer_Update(objentity);
                if (val > 0)
                {
                    Response.Redirect(ResolveUrl("~/retailer-deals"));
                    //Response.Redirect("view_deals_retailer.aspx");
                }
                else
                {
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_deal_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_discount_type_bind(ddl_deal_type.SelectedItem.Value);
            if (ddl_deal_type.SelectedValue == "1")
            {
                div_discount.Attributes.Add("style", "display:none");
                RequiredFieldValidator3.Enabled = false;
                RequiredFieldValidator4.Enabled = false;
                rf5.Enabled = false;
            }
            else
            {
                div_discount.Attributes.Add("style", "display:block");
                RequiredFieldValidator3.Enabled = true;
                RequiredFieldValidator4.Enabled = true;
                rf5.Enabled = true;
            }
        }

        protected void ddl_sub_category_bind(string cat_id)
        {
            try
            {
                if (cat_id != "0")
                {
                    int totalrecord = 0;
                    tbl_sub_category_bal objbal = new tbl_sub_category_bal();
                    DataSet ds = objbal.sub_category_Select(" where int_category_id=" + cat_id, 1, 0, out totalrecord);

                    ddl_sub_category.DataValueField = "int_sub_category_id";
                    ddl_sub_category.DataTextField = "str_sub_category_name";

                    ddl_sub_category.DataSource = ds;
                    ddl_sub_category.DataBind();

                    ddl_sub_category.Items.Insert(0, new ListItem("-- Select Sub Category --", "0"));
                }
                else
                {
                    ddl_sub_category.Items.Clear();
                    ddl_sub_category.Items.Insert(0, new ListItem("-- Select Sub Category --", "0"));
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_category_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_sub_category_bind(ddl_category.SelectedItem.Value);
        }
    }
}