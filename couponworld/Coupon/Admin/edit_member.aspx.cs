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
    public partial class member_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddl_state_bind();
                ddl_org_bind();
                ddl_company_bind();
                btn_update.Visible = false;
                if (Request["mid"] != null)
                {
                    binddata(" where int_user_id = " + Request.QueryString["mid"], 1);
                    btn_update.Visible = true;
                    btn_add.Visible = false;
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
        protected void ddl_org_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_organization_bal objbal = new tbl_organization_bal();
                DataSet ds = objbal.organization_Select(" ", 1, 0, out totalrecord);

                ddl_org.DataValueField = "int_organization_id";
                ddl_org.DataTextField = "str_organization_name";

                ddl_org.DataSource = ds;
                ddl_org.DataBind();

                ddl_org.Items.Insert(0, new ListItem("-- Select Organization --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_company_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_company_bal objbal = new tbl_company_bal();
                DataSet ds = objbal.company_Select(" ", 1, 0, out totalrecord);

                ddl_company.DataValueField = "int_company_id";
                ddl_company.DataTextField = "str_company_name";

                ddl_company.DataSource = ds;
                ddl_company.DataBind();

                ddl_company.Items.Insert(0, new ListItem("-- Select Company --", "0"));
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

                tbl_member_bal objbal = new tbl_member_bal();

                dt = objbal.member_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_fname.Text = dt.Tables[0].Rows[0]["str_first_name"].ToString();
                    txt_lame.Text = dt.Tables[0].Rows[0]["str_last_name"].ToString();
                    txt_password.Text = dt.Tables[0].Rows[0]["str_password"].ToString();
                    txt_email_p.Text = dt.Tables[0].Rows[0]["str_email_id"].ToString();
                    txt_address.Value = dt.Tables[0].Rows[0]["str_street_address"].ToString();
                    ddl_state.SelectedValue = dt.Tables[0].Rows[0]["int_state_id"].ToString();
                    ddl_city_bind();
                    ddl_city.SelectedValue = dt.Tables[0].Rows[0]["int_city_id"].ToString();
                    txt_pincode.Text = dt.Tables[0].Rows[0]["int_zip_code"].ToString();
                    txt_telephone_p.Text = dt.Tables[0].Rows[0]["str_telephone"].ToString();
                    txt_birth_date.Text = dt.Tables[0].Rows[0]["str_date_of_birth"].ToString();
                    ddl_gender.Text = dt.Tables[0].Rows[0]["str_gender"].ToString();
                    ddl_org.Text = dt.Tables[0].Rows[0]["int_organization_id"].ToString();
                    ddl_company.Text = dt.Tables[0].Rows[0]["int_company_id"].ToString();
                    img.ImageUrl = "/Admin/member_logo/" + dt.Tables[0].Rows[0]["str_logo_img"].ToString();
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
                tbl_member_bal objbal = new tbl_member_bal();
                tbl_member_entity objentity = new tbl_member_entity();

                if (fupimg.HasFile)
                {
                    string filename = fupimg.FileName;
                    objentity.str_first_name = txt_fname.Text;
                    objentity.str_last_name = txt_lame.Text;
                    objentity.str_email_id = txt_email_p.Text;

                    objentity.str_password = txt_password.Text;
                    objentity.str_gender = ddl_gender.SelectedItem.Value;
                    objentity.str_date_of_birth = txt_birth_date.Text;
                    objentity.str_street_address = txt_address.Value;
                    objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                    objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);

                    objentity.int_zip_code = Convert.ToInt32(txt_pincode.Text);
                    objentity.str_telephone = txt_telephone_p.Text;
                    objentity.int_organization_id = Convert.ToInt64(ddl_org.SelectedItem.Value);
                    objentity.int_company_id = Convert.ToInt64(ddl_company.SelectedItem.Value);
                    objentity.date_create_date = DateTime.Now.ToString("dd/MM/yyyy");
                    objentity.bit_isactive = true;
                    objentity.str_logo_img = filename;
                    fupimg.SaveAs(Server.MapPath("/Admin/member_logo/") + filename);
                    objentity.bit_is_delete = true;

                    int val = objbal.member_sign_up_insert(objentity);
                    if (val > 0)
                    {
                        lblmess.InnerHtml = "Consumer Inserted Successfully.";
                        lblmess.Attributes.Add("class", "alert alert-success");
                        txt_fname.Text = string.Empty;
                        ddl_gender.ClearSelection();
                        txt_birth_date.Text = string.Empty;
                        ddl_org.ClearSelection();
                        ddl_company.ClearSelection();
                        txt_lame.Text = string.Empty;
                        txt_email_p.Text = string.Empty;
                        txt_address.Value = string.Empty;
                        txt_pincode.Text = string.Empty;
                        ddl_city.ClearSelection();
                        ddl_state.ClearSelection();
                        txt_telephone_p.Text = string.Empty;
                        txt_email_p.Text = string.Empty;
                        txt_password.Text = string.Empty;
                    }
                    else
                    {
                        lblmess.InnerHtml = "Sorry,this Consumer is already allocated";
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
                tbl_member_bal objbal = new tbl_member_bal();
                tbl_member_entity objentity = new tbl_member_entity();

                objentity.int_user_id = Convert.ToInt64(Request.QueryString["mid"]);
                objentity.str_first_name = txt_fname.Text;
                objentity.str_last_name = txt_lame.Text;
                objentity.str_email_id = txt_email_p.Text;

                objentity.str_password = txt_password.Text;
                objentity.str_gender = ddl_gender.SelectedItem.Value;
                objentity.str_date_of_birth = txt_birth_date.Text;
                objentity.str_street_address = txt_address.Value;
                objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);

                objentity.int_zip_code = Convert.ToInt32(txt_pincode.Text);
                objentity.str_telephone = txt_telephone_p.Text;
                objentity.int_organization_id = Convert.ToInt64(ddl_org.SelectedItem.Value);
                objentity.int_company_id = Convert.ToInt64(ddl_company.SelectedItem.Value);

                if (fupimg.HasFile)
                {
                    objentity.str_logo_img = fupimg.FileName;
                    fupimg.SaveAs(Server.MapPath("/Admin/member_logo/") + objentity.str_logo_img);
                }
                else
                    objentity.str_logo_img = ViewState["img"].ToString();

                int val = objbal.member_Update(objentity);
                if (val > 0)
                {
                    Response.Redirect("view_member.aspx");
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

        protected void txt_email_p_TextChanged(object sender, EventArgs e)
        {
            int total = 0;
            tbl_member_bal objbal = new tbl_member_bal();
            DataSet ds = objbal.member_Select(" where str_email_id='" + txt_email_p.Text + "'", 1, 0, out total);

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