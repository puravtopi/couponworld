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
    public partial class audit_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddl_member_bind();
                btn_update.Visible = false;
                if (Request["auditid"] != null)
                {
                    binddata(" where int_log_id=" + Request.QueryString["auditid"], 1);
                    btn_add.Visible = false;
                    btn_update.Visible = true;
                }
            }
        }

        protected void ddl_member_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_member_bal objbal = new tbl_member_bal();
                DataSet ds = objbal.member_Select(" ", 1, 0, out totalrecord);

                ddl_member.DataValueField = "int_user_id";
                ddl_member.DataTextField = "str_first_name";

                ddl_member.DataSource = ds;
                ddl_member.DataBind();

                ddl_member.Items.Insert(0, new ListItem("-- Select Member --", "0"));
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

                tbl_auditmaster_bal objbal = new tbl_auditmaster_bal();

                dt = objbal.auditmaster_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_date.Text = dt.Tables[0].Rows[0]["date_log_date"].ToString();
                    ddl_member.SelectedValue = dt.Tables[0].Rows[0]["time_log_time"].ToString();
                    txt_time.Text = dt.Tables[0].Rows[0]["int_user_id"].ToString();
                    txt_details.Value = dt.Tables[0].Rows[0]["str_activity_details"].ToString();
                    txt_os.Text = dt.Tables[0].Rows[0]["str_os"].ToString();
                    txt_ip.Text = dt.Tables[0].Rows[0]["str_ip"].ToString();
                    txt_device.Text = dt.Tables[0].Rows[0]["str_device"].ToString();
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
                tbl_auditmaster_bal objbal = new tbl_auditmaster_bal();
                tbl_auditmaster_entity objentity = new tbl_auditmaster_entity();

                objentity.date_log_date = txt_date.Text;
                objentity.time_log_time = txt_time.Text;
                objentity.int_user_id = Convert.ToInt64(ddl_member.SelectedItem.Value);
                objentity.str_activity_details = txt_details.Value;
                objentity.str_os = txt_os.Text;
                objentity.str_ip = txt_ip.Text;
                objentity.str_device = txt_device.Text;

                int val = objbal.auditmaster_insert(objentity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "Audit Details Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_date.Text = string.Empty;
                    ddl_member.ClearSelection();
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this Audit Details is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_audit_list.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_auditmaster_bal objbal = new tbl_auditmaster_bal();
                tbl_auditmaster_entity objentity = new tbl_auditmaster_entity();

                objentity.int_log_id = Convert.ToInt64(Request.QueryString["auditid"]);
                objentity.date_log_date = txt_date.Text;
                objentity.time_log_time = txt_time.Text;
                objentity.int_user_id = Convert.ToInt64(ddl_member.SelectedItem.Value);
                objentity.str_activity_details = txt_details.Value;
                objentity.str_os = txt_os.Text;
                objentity.str_ip = txt_ip.Text;
                objentity.str_device = txt_device.Text;

                int val = objbal.auditmaster_Update(objentity);
                if (val > 0)
                {
                    Response.Redirect("view_audit_list.aspx");
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