using Coupon_Bal;
using Coupon_Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon.Admin
{
    public partial class edit_admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                btn_update.Visible = false;
                if (Request["admin_id"] != null)
                {
                    binddata(" where int_admin_id=" + Request.QueryString["admin_id"], 1);
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

                tbl_admin_bal objbal = new tbl_admin_bal();

                dt = objbal.admin_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_email_id.Text = dt.Tables[0].Rows[0]["str_email_id"].ToString();
                    txt_uname.Text = dt.Tables[0].Rows[0]["str_user_name"].ToString();
                    txt_pass.Attributes.Add("value", dt.Tables[0].Rows[0]["str_password"].ToString());

                    chk_is_active.Checked = Convert.ToBoolean(dt.Tables[0].Rows[0]["bit_isactive"].ToString());
                    chk_is_subadmin.Checked = Convert.ToBoolean(dt.Tables[0].Rows[0]["bit_is_sub_admin"].ToString());
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
                tbl_admin_bal objbal = new tbl_admin_bal();
                tbl_admin_entity objentity = new tbl_admin_entity();

                objentity.str_user_name = txt_uname.Text;
                objentity.bit_is_sub_admin = chk_is_subadmin.Checked;
                objentity.str_email_id = txt_email_id.Text;
                objentity.bit_isactive = chk_is_active.Checked;
                objentity.str_password = txt_pass.Text;


                int val = objbal.admin_insert(objentity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "Admin Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_pass.Text = string.Empty;
                    txt_uname.Text = string.Empty;
                    txt_email_id.Text = string.Empty;
                    chk_is_active.Checked = false;
                    chk_is_subadmin.Checked = false;
                }
                else if (val == -1)
                {
                    lblmess.InnerHtml = "Sorry,this username/email is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_admin.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                

               
                tbl_admin_bal objbal = new tbl_admin_bal();
                tbl_admin_entity objentity = new tbl_admin_entity();

                objentity.int_admin_id = Convert.ToInt32(Request.QueryString["admin_id"].ToString());
                objentity.str_user_name = txt_uname.Text;
                objentity.bit_is_sub_admin = chk_is_subadmin.Checked;
                objentity.str_email_id = txt_email_id.Text;
                objentity.bit_isactive = chk_is_active.Checked;
                objentity.str_password = txt_pass.Text;

                int val = objbal.admin_update(objentity);
                if (val > 0)
                {
                    Response.Redirect("view_admin.aspx");
                }
                else
                {
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}