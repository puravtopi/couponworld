﻿using System;
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
    public partial class organization_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ddl_city_bind();
                ddl_state_bind();
                ddl_type_bind();
                ddl_org_type_bind("");
                ddl_share_type_bind("");
                btn_update.Visible = false;
                if (Request["oid"] != null)
                {
                    binddata(" where int_organization_id=" + Request.QueryString["oid"], 1);
                    btn_add.Visible = false;
                    btn_update.Visible = true;
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
            //try
            //{
            //    int totalrecord = 0;
            //    tbl_types_bal objbal = new tbl_types_bal();
            //    DataSet ds = objbal.types_Select(" ", 1, 0, out totalrecord);

            //    ddl_type.DataValueField = "int_type_id";
            //    ddl_type.DataTextField = "str_type_name";

            //    ddl_type.DataSource = ds;
            //    ddl_type.DataBind();

            //    ddl_type.Items.Insert(0, new ListItem("-- Select Type --", "0"));
            //}
            //catch (Exception ex)
            //{
            //}
        }

        protected void ddl_org_type_bind(string query)
        {
            try
            {
                int totalrecord = 0;
                tbl_organization_type_bal objbal = new tbl_organization_type_bal();
                DataSet ds = objbal.organization_type_Select(" ", 1, 0, out totalrecord);

                ddl_org_type.DataValueField = "int_organization_type_id";
                ddl_org_type.DataTextField = "str_organization_type";

                ddl_org_type.DataSource = ds;
                ddl_org_type.DataBind();

                ddl_org_type.Items.Insert(0, new ListItem("-- Select Organization Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_share_type_bind(string query)
        {
            try
            {
                int totalrecord = 0;
                tbl_share_type_bal objbal = new tbl_share_type_bal();
                DataSet ds = objbal.share_type_Select(" ", 1, 0, out totalrecord);

                ddl_share_type.DataValueField = "int_share_type_id";
                ddl_share_type.DataTextField = "str_share_type";

                ddl_share_type.DataSource = ds;
                ddl_share_type.DataBind();

                ddl_share_type.Items.Insert(0, new ListItem("-- Select Share Type --", "0"));
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

                tbl_organization_bal objbal = new tbl_organization_bal();

                dt = objbal.organization_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_org_name.Text = dt.Tables[0].Rows[0]["str_organization_name"].ToString();
                    txt_cname.Text = dt.Tables[0].Rows[0]["str_corporate_name"].ToString();
                    txt_email_p.Text = dt.Tables[0].Rows[0]["str_email_id_p"].ToString();
                    txt_address.Value = dt.Tables[0].Rows[0]["str_street_address"].ToString();
                    txt_api.Text = dt.Tables[0].Rows[0]["str_apt_suite"].ToString();
                    ddl_state.SelectedValue = dt.Tables[0].Rows[0]["int_state_id"].ToString();
                    ddl_city_bind();
                    ddl_city.SelectedValue = dt.Tables[0].Rows[0]["int_city_id"].ToString();

                    txt_pincode.Text = dt.Tables[0].Rows[0]["int_zip_code"].ToString();
                    txt_org_share.Text = dt.Tables[0].Rows[0]["int_organization_share"].ToString();
                    ddl_org_type.SelectedValue = dt.Tables[0].Rows[0]["int_organization_type_id"].ToString();
                    ddl_share_type.SelectedValue = dt.Tables[0].Rows[0]["int_share_type_id"].ToString();
                    txt_telephone_p.Text = dt.Tables[0].Rows[0]["str_telephone_p"].ToString();
                    txt_contact_1_p.Text = dt.Tables[0].Rows[0]["str_contact_1_p"].ToString();
                    txt_contact_2_s.Text = dt.Tables[0].Rows[0]["str_contact_2_s"].ToString();
                    txt_tele_s.Text = dt.Tables[0].Rows[0]["str_telephone_s"].ToString();
                    txt_email_s.Text = dt.Tables[0].Rows[0]["str_email_id_s"].ToString();
                    ddl_share_type.SelectedValue = dt.Tables[0].Rows[0]["int_share_type_id"].ToString();
                    txt_web_address.Text = dt.Tables[0].Rows[0]["str_web_address"].ToString();
                    txt_password.Text = dt.Tables[0].Rows[0]["str_password"].ToString();
                    img.ImageUrl = "/Admin/org_logo/" + dt.Tables[0].Rows[0]["str_logo_img"].ToString();
                    ViewState["img"] = dt.Tables[0].Rows[0]["str_logo_img"].ToString();
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
                tbl_organization_bal objbal = new tbl_organization_bal();
                tbl_organization_entity objentity = new tbl_organization_entity();


                string filename = fupimg.FileName;
                objentity.str_organization_name = txt_org_name.Text;
                objentity.str_corporate_name = txt_cname.Text;
                objentity.str_email_id_p = txt_email_p.Text;
                objentity.str_street_address = txt_address.Value;
                objentity.str_password = txt_password.Text;
                objentity.str_apt_suite = txt_api.Text;
                objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);

                objentity.int_zip_code = txt_pincode.Text;
                objentity.int_organization_share = Convert.ToInt32(txt_org_share.Text);
                objentity.date_created_date = DateTime.Now.ToString("dd/MM/yyyy");
                objentity.bit_isactive = true;
                objentity.int_organization_type_id = Convert.ToInt64(ddl_org_type.SelectedItem.Value);
                objentity.int_share_type_id = Convert.ToInt64(ddl_share_type.SelectedItem.Value);
                objentity.str_telephone_p = txt_telephone_p.Text;
                objentity.str_contact_1_p = txt_contact_1_p.Text;
                objentity.str_contact_2_s = txt_contact_2_s.Text;
                objentity.str_email_id_s = txt_email_s.Text;
                objentity.str_web_address = txt_web_address.Text;
                objentity.str_telephone_s = txt_tele_s.Text;
                if (fupimg.HasFile)
                {
                    objentity.str_logo_img = filename;
                    fupimg.SaveAs(Server.MapPath("/Admin/org_logo/") + filename);
                }
                else
                    objentity.str_logo_img = "noimg.png";
                objentity.bit_spotlight = false;
                objentity.bit_is_delete = false;

                int val = objbal.organization_insert(objentity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "Organization Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_api.Text = string.Empty;
                    txt_cname.Text = string.Empty;
                    txt_email_p.Text = string.Empty;
                    txt_address.Value = string.Empty;
                    txt_org_share.Text = string.Empty;
                    txt_pincode.Text = string.Empty;
                    txt_org_name.Text = string.Empty;
                    ddl_city.ClearSelection();
                    ddl_state.ClearSelection();
                    ddl_share_type.ClearSelection();
                    ddl_org_type.ClearSelection();
                    txt_tele_s.Text = string.Empty;
                    txt_telephone_p.Text = string.Empty;
                    txt_web_address.Text = string.Empty;
                    txt_email_s.Text = string.Empty;
                    txt_password.Text = string.Empty;
                    txt_contact_1_p.Text = string.Empty;
                    txt_contact_2_s.Text = string.Empty;
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,there may be any issue to save data.";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }

            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_organization.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_organization_bal objbal = new tbl_organization_bal();
                tbl_organization_entity objentity = new tbl_organization_entity();

                objentity.int_organization_id = Convert.ToInt64(Request.QueryString["oid"]);
                objentity.str_organization_name = txt_org_name.Text;
                objentity.str_corporate_name = txt_cname.Text;
                objentity.str_email_id_p = txt_email_p.Text;
                objentity.str_street_address = txt_address.Value;
                objentity.str_password = txt_password.Text;
                objentity.str_apt_suite = txt_api.Text;
                objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);
                objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                objentity.int_zip_code = txt_pincode.Text;
                objentity.int_organization_share = Convert.ToInt16(txt_org_share.Text);
                objentity.int_organization_type_id = Convert.ToInt64(ddl_org_type.SelectedItem.Value);
                objentity.int_share_type_id = Convert.ToInt64(ddl_share_type.SelectedItem.Value);
                objentity.str_telephone_p = txt_telephone_p.Text;
                objentity.str_contact_1_p = txt_contact_1_p.Text;
                objentity.str_contact_2_s = txt_contact_2_s.Text;
                objentity.str_email_id_s = txt_email_s.Text;
                objentity.str_web_address = txt_web_address.Text;
                objentity.str_telephone_s = txt_tele_s.Text;

                if (fupimg.HasFile)
                {
                    objentity.str_logo_img = fupimg.FileName;
                    fupimg.SaveAs(Server.MapPath("/Admin/org_logo/") + objentity.str_logo_img);
                }
                else
                    objentity.str_logo_img = ViewState["img"].ToString();

                int val = objbal.organization_Update(objentity);
                if (val > 0)
                {
                    Response.Redirect("view_organization.aspx");
                }
                else
                {
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

        protected void ddl_city_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txt_email_p_TextChanged(object sender, EventArgs e)
        {
            int total = 0;
            tbl_organization_bal objbal = new tbl_organization_bal();
            DataSet ds = objbal.organization_Select(" where str_email_id_p='" + txt_email_p.Text + "'", 1, 0, out total);

            if (total > 0)
            {
                lblemail.Attributes.Add("style", "display:block;color:red");
                txt_email_p.Focus();
            }
            else
            {
                lblemail.Attributes.Add("style", "display:none;");
            }
        }
    }
}