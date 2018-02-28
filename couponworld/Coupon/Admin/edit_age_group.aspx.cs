using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using Coupon_Entity;
using System.Data;

namespace Coupon.Admin
{
    public partial class age_group_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btn_update.Visible = false;
                if (Request["agid"] != null)
                {
                    binddata(" where int_age_group_id=" + Request.QueryString["agid"], 1);
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

                tbl_agegroup_bal objbal = new tbl_agegroup_bal();

                dt = objbal.agegroup_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_age_grp.Text = dt.Tables[0].Rows[0]["str_age_group_name"].ToString();
                    txt_details.Text = dt.Tables[0].Rows[0]["str_details"].ToString();
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
                tbl_agegroup_bal objbal = new tbl_agegroup_bal();
                tbl_agegroup_entity objentity = new tbl_agegroup_entity();

                objentity.str_age_group_name = txt_age_grp.Text;
                objentity.str_details = txt_details.Text;

                int val = objbal.agegroup_insert(objentity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "Age Group Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_age_grp.Text = string.Empty;
                    txt_details.Text = string.Empty;
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this Age Group is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_age_group.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_agegroup_bal objbal = new tbl_agegroup_bal();
                tbl_agegroup_entity objentity = new tbl_agegroup_entity();

                objentity.int_age_group_id = Convert.ToInt64(Request.QueryString["agid"].ToString());
                objentity.str_age_group_name = txt_age_grp.Text;
                objentity.str_details = txt_details.Text;

                int val = objbal.agegroup_Update(objentity);
                if (val > 0)
                {
                    Response.Redirect("view_age_group.aspx");
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