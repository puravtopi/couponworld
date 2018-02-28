using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using Coupon_Entity;
using System.Data;
using System.Data.SqlClient;

namespace Coupon.Admin
{
    public partial class small_business_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ddl_state_bind();
                ddl_type_bind();
                btn_update.Visible = false;
                ddl_share_bind();
                if (Request["sbid"] != null)
                {
                    binddata(" where int_small_business_id=" + Request.QueryString["sbid"], 1);
                    btn_add.Visible = false;
                    btn_update.Visible = true;
                }
            }
        }
        protected void binddata(string query, int pageindex)
        {
            try
            {
                int totalcount;

                DataSet dt = new DataSet();

                tbl_small_business_bal objbal = new tbl_small_business_bal();

                dt = objbal.small_business_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_name.Text = dt.Tables[0].Rows[0]["str_name"].ToString();
                    txt_cname.Text = dt.Tables[0].Rows[0]["str_corporate_name"].ToString();
                    txt_email.Text = dt.Tables[0].Rows[0]["str_email_id_p"].ToString();
                    txt_address.Value = dt.Tables[0].Rows[0]["str_street_address"].ToString();
                    txt_password.Text = dt.Tables[0].Rows[0]["str_password"].ToString();
                    txt_api.Text = dt.Tables[0].Rows[0]["str_apt_suite"].ToString();
                    ddl_state.SelectedValue = dt.Tables[0].Rows[0]["int_state_id"].ToString();
                    ddl_city_bind();
                    ddl_city.SelectedValue = dt.Tables[0].Rows[0]["int_city_id"].ToString();

                    txt_pincode.Text = dt.Tables[0].Rows[0]["int_zip_code"].ToString();
                    ddl_type.SelectedValue = dt.Tables[0].Rows[0]["int_small_business_type_id"].ToString();
                    txt_org_share.Text = dt.Tables[0].Rows[0]["int_organization_share"].ToString();
                    Image1.ImageUrl = "/Admin/small_business_logo/" + dt.Tables[0].Rows[0]["str_logo_img"].ToString();
                    txt_tele_primary.Text = dt.Tables[0].Rows[0]["str_telephone_p"].ToString();
                    txt_contact_primary.Text = dt.Tables[0].Rows[0]["str_contact_1_p"].ToString();
                    txt_contact_s.Text = dt.Tables[0].Rows[0]["str_contact_2_s"].ToString();
                    txt_telephone_s.Text = dt.Tables[0].Rows[0]["str_telephone_s"].ToString();
                    txt_email_s.Text = dt.Tables[0].Rows[0]["str_email_id_s"].ToString();
                    ddl_share_type.SelectedValue = dt.Tables[0].Rows[0]["int_share_type_id"].ToString();
                    txt_web_address.Text = dt.Tables[0].Rows[0]["str_web_address"].ToString();
                    txt_bio.Text = dt.Tables[0].Rows[0]["str_bio"].ToString();
                    ViewState["img"] = dt.Tables[0].Rows[0]["str_logo_img"].ToString();
                }
            }
            catch (Exception ex)
            {
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

        protected void ddl_share_bind()
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
        protected void ddl_city_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_city_bind();
        }
        protected void ddl_type_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_small_business_type_bal objbal = new tbl_small_business_type_bal();
                DataSet ds = objbal.small_business_types_Select(" ", 1, 0, out totalrecord);

                ddl_type.DataValueField = "int_small_business_type_id";
                ddl_type.DataTextField = "str_small_business_type_name";

                ddl_type.DataSource = ds;
                ddl_type.DataBind();

                ddl_type.Items.Insert(0, new ListItem("-- Select Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_small_business_bal objbal = new tbl_small_business_bal();
                tbl_small_business_entity objentity = new tbl_small_business_entity();

                if (fupimg.HasFile)
                {
                    string filename = fupimg.FileName;

                    objentity.str_name = txt_name.Text;
                    objentity.str_corporate_name = txt_cname.Text;
                    objentity.str_email_id_p = txt_email.Text;
                    objentity.str_street_address = txt_address.InnerText;
                    objentity.str_password = txt_password.Text;
                    objentity.str_apt_suite = txt_api.Text;
                    objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);
                    objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                    objentity.int_zip_code = Convert.ToInt32(txt_pincode.Text);
                    objentity.int_small_business_type_id = Convert.ToInt64(ddl_type.SelectedItem.Value);
                    objentity.int_organization_share = Convert.ToInt16(txt_org_share.Text);
                    objentity.date_created_date = DateTime.Now.Date.ToString();
                    objentity.bit_isactive = false;
                    objentity.str_logo_img = filename;
                    fupimg.SaveAs(Server.MapPath("/Admin/small_business_logo/") + filename);
                    objentity.str_telephone_p = txt_tele_primary.Text;
                    objentity.str_contact_1_p = txt_contact_primary.Text;
                    objentity.str_contact_2_s = txt_contact_s.Text;
                    objentity.str_telephone_s = txt_telephone_s.Text;
                    objentity.str_email_id_s = txt_email_s.Text;
                    objentity.int_share_type_id = Convert.ToInt64(ddl_share_type.SelectedItem.Value);
                    objentity.str_web_address = txt_web_address.Text;
                    objentity.str_bio = txt_bio.Text;
                    objentity.bit_is_delete = false;

                    int val = objbal.small_business_insert(objentity);
                    if (val > 0)
                    {
                        lblmess.InnerHtml = "Small Business Inserted Successfully.";
                        lblmess.Attributes.Add("class", "alert alert-success");
                        txt_api.Text = string.Empty;
                        txt_cname.Text = string.Empty;
                        txt_email.Text = string.Empty;
                        txt_address.Value = string.Empty;
                        txt_org_share.Text = string.Empty;
                        txt_password.Text = string.Empty;
                        txt_pincode.Text = string.Empty;
                        txt_name.Text = string.Empty;
                        //txt_contact_primary = string.Empty;
                        //txt_contact_s = string.Empty;
                        ddl_city.ClearSelection();
                        ddl_state.ClearSelection();
                        ddl_type.ClearSelection();
                    }
                    else
                    {
                        lblmess.InnerHtml = "Sorry,this Small Business is already allocated";
                        lblmess.Attributes.Add("class", "alert alert-danger");
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_small_business_bal objbal = new tbl_small_business_bal();
                tbl_small_business_entity objentity = new tbl_small_business_entity();

                objentity.int_small_business_id = Convert.ToInt64(Request.QueryString["sbid"]);
                objentity.str_name = txt_name.Text;
                objentity.str_corporate_name = txt_cname.Text;
                objentity.str_email_id_p = txt_email.Text;
                objentity.str_street_address = txt_address.InnerText;
                objentity.str_password = txt_password.Text;
                objentity.str_apt_suite = txt_api.Text;
                objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);
                objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                objentity.int_zip_code = Convert.ToInt32(txt_pincode.Text);
                objentity.int_small_business_type_id = Convert.ToInt64(ddl_type.SelectedItem.Value);
                objentity.int_organization_share = Convert.ToInt16(txt_org_share.Text);
                //objentity.str_logo_img = filename;
                //fupimg.SaveAs(Server.MapPath("/Admin/small_business_logo/") + filename);
                objentity.str_telephone_p = txt_tele_primary.Text;
                objentity.str_contact_1_p = txt_contact_primary.Text;
                objentity.str_contact_2_s = txt_contact_s.Text;
                objentity.str_telephone_s = txt_telephone_s.Text;
                objentity.str_email_id_s = txt_email_s.Text;
                objentity.int_share_type_id = Convert.ToInt64(ddl_share_type.SelectedItem.Value);
                objentity.str_web_address = txt_web_address.Text;
                objentity.str_bio = txt_bio.Text;
                if (fupimg.HasFile)
                {
                    objentity.str_logo_img = fupimg.FileName;
                    fupimg.SaveAs(Server.MapPath("/Admin/small_business_logo/") + objentity.str_logo_img);
                }
                else
                    objentity.str_logo_img = ViewState["img"].ToString();


                int val = objbal.small_business_Update(objentity);
                if (val > 0)
                {
                    Response.Redirect("view_small_business.aspx");
                }

            }

            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_small_business.aspx");
        }

        protected void txt_email_TextChanged(object sender, EventArgs e)
        {
            int total = 0;
            tbl_small_business_bal objbal = new tbl_small_business_bal();
            DataSet ds = objbal.small_business_Select(" where str_email_id_p='" + txt_email.Text + "'", 1, 0, out total);

            if (total > 0)
            {
                lblemail.Attributes.Add("style", "display:block;color:red");
                txt_email.Focus();
            }
            else
            {
                lblemail.Attributes.Add("style", "display:none;");
            }
        }
    }
}