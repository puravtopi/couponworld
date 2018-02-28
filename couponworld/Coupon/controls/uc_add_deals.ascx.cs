using Coupon_Bal;
using Coupon_Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon.controls
{
    public partial class uc_add_deals : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddl_category_bind();
                ddl_deal_type_bind();
                update_btn.Visible = false;
                btn_cancle.Visible = false;
                Image1.Visible = false;
                if (Request["oid"] != null)
                {
                    rf10.Enabled = false;
                    binddata(" where int_offer_id=" + Request.QueryString["oid"], 1);
                    Image1.Visible = true;
                    update_btn.Visible = true;
                    btn_submit.Visible = false;
                    btn_cancle.Visible = true;
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
                    txt_offer_details.Value = dt.Tables[0].Rows[0]["str_offer_details"].ToString();
                    ddl_dec_type.SelectedValue = dt.Tables[0].Rows[0]["int_discount_type_id"].ToString();
                    txt_discount_amount.Text = dt.Tables[0].Rows[0]["dec_discount_amount"].ToString();
                    txt_start_date.Text = dt.Tables[0].Rows[0]["date_start_date"].ToString();
                    txt_end_date.Text = dt.Tables[0].Rows[0]["date_end_date"].ToString();
                    Image1.ImageUrl = "/Admin/offer_image/" + dt.Tables[0].Rows[0]["str_img"].ToString();
                    ddl_category.SelectedValue = dt.Tables[0].Rows[0]["int_category_id"].ToString();
                    ViewState["img"] = dt.Tables[0].Rows[0]["str_img"].ToString();
                    ViewState["sd_id"] = dt.Tables[0].Rows[0]["int_small_business_id"].ToString();
                    ViewState["org_share"] = dt.Tables[0].Rows[0]["int_organization_share"].ToString();
                    ViewState["sponsor"] = dt.Tables[0].Rows[0]["str_sponsor"].ToString();
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
                if (fupimg.HasFile)
                {
                    string filename = fupimg.FileName;

                    objentity.str_offer_name = txt_offer_name.Text;
                    objentity.str_offer_details = txt_offer_details.InnerText;
                    objentity.int_discount_type_id = Convert.ToInt64(ddl_dec_type.SelectedItem.Value);
                    objentity.int_deal_type_id = Convert.ToInt64(ddl_deal_type.SelectedItem.Value);


                    objentity.date_start_date = txt_start_date.Text;
                    objentity.date_end_date = txt_end_date.Text;
                    objentity.bit_isactive = true;
                    objentity.str_img = filename;
                    fupimg.SaveAs(Server.MapPath("/Admin/offer_image/") + filename);
                    objentity.int_category_id = ddl_category.SelectedItem.Value;
                    objentity.int_sub_category_id = Convert.ToInt64(ddl_sub_category.SelectedItem.Value);
                    objentity.bit_accept = true;

                    objentity.int_organization_share = 10;
                    objentity.str_sponsor = "";

                    objentity.date_created_date = Convert.ToDateTime(DateTime.Now.ToString("dd-MM-yyyy").ToString());

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
                        objentity.int_retailer_id = Convert.ToInt64(Session["rid"].ToString());
                    else
                        objentity.int_retailer_id = 0;

                    if (Session["utype"].ToString() == appConstant.smallbusiness)
                        objentity.int_small_business_id = Convert.ToInt64(Session["sid"].ToString());
                    else
                        objentity.int_small_business_id = 0;


                    int val = objbal.offer_insert(objentity);
                    if (val > 0)
                    {
                        lblmess.InnerHtml = "Offer Inserted Successfully.";
                        lblmess.Attributes.Add("class", "alert alert-success");
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

                objentity.int_offer_id = Convert.ToInt64(Request.QueryString["oid"]);
                objentity.str_offer_name = txt_offer_name.Text;
                objentity.str_offer_details = txt_offer_details.Value;
                objentity.int_discount_type_id = Convert.ToInt64(ddl_dec_type.SelectedItem.Value);
                objentity.dec_discount_amount = Convert.ToDecimal(txt_discount_amount.Text);
                objentity.int_retailer_id = Convert.ToInt64(Session["rid"].ToString());
                objentity.date_start_date = txt_start_date.Text;
                objentity.date_end_date = txt_end_date.Text;
                objentity.int_category_id = ddl_category.SelectedItem.Value;
                objentity.int_small_business_id = Convert.ToInt64(ViewState["sd_id"]);
                //objentity.int_organization_share = Convert.ToInt32(ViewState["org_share"]);
                objentity.str_sponsor = ViewState["sponsor"].ToString();

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
                    Response.Redirect("view_deals_retailer.aspx");
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