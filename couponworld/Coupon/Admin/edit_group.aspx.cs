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
    public partial class group_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btn_update.Visible = false;
                if (Request["gid"] != null)
                {
                    binddata(" where int_group_id=" + Request.QueryString["gid"], 1);
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

                tbl_group_bal objbal = new tbl_group_bal();

                dt = objbal.group_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_name.Text = dt.Tables[0].Rows[0]["str_name"].ToString();
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
                tbl_group_bal objbalbal = new tbl_group_bal();
                tbl_group_entity objentity = new tbl_group_entity();

                objentity.str_name = txt_name.Text;
                objentity.bit_isactive = true;
                objentity.date_create_date = Convert.ToDateTime(DateTime.Now.ToString("dd-MM-yyyy").ToString());
                objentity.bit_is_delete = false;

                int val = objbalbal.group_insert(objentity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "Group Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_name.Text = string.Empty;
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this Group is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_group.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_group_bal objbalbal = new tbl_group_bal();
                tbl_group_entity objentity = new tbl_group_entity();

                objentity.int_group_id = Convert.ToInt64(Request.QueryString["gid"].ToString());
                objentity.str_name = txt_name.Text;
                objentity.bit_isactive = false;

                int val = objbalbal.group_Update(objentity);
                if (val > 0)
                {
                    Response.Redirect("view_group.aspx");
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