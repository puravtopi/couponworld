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
    public partial class edit_connect_category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                btn_update.Visible = false;
                if (Request["cat_id"] != null)
                {
                    binddata(" where int_connect_cat_id=" + Request.QueryString["cat_id"], 1);
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

                tbl_connect_category_bal objbal = new tbl_connect_category_bal();

                dt = objbal.cat_select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_cat.Text = dt.Tables[0].Rows[0]["str_cat"].ToString();
                    chk_is_show.Checked = Convert.ToBoolean(dt.Tables[0].Rows[0]["bit_is_show"].ToString()); 

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
                tbl_connect_category_bal objbal = new tbl_connect_category_bal();
                tbl_connect_category_entity objentity = new tbl_connect_category_entity();

                objentity.str_cat = txt_cat.Text;
                objentity.bit_is_show = chk_is_show.Checked;

                objentity.bit_is_delete = false;

                int val = objbal.cat_insert(objentity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "Category Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_cat.Text = string.Empty;
                    chk_is_show.Checked = false;

                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this Category is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_connect_category.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_connect_category_bal objbal = new tbl_connect_category_bal();
                tbl_connect_category_entity objentity = new tbl_connect_category_entity();

                objentity.int_connect_cat_id = Convert.ToInt32(Request.QueryString["cat_id"]);
                objentity.str_cat = txt_cat.Text;
                objentity.bit_is_show = chk_is_show.Checked;

                objentity.bit_is_delete = false;

                int val = objbal.cat_update(objentity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "Category Updated Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_cat.Text = string.Empty;

                }
                else
                {
                    lblmess.InnerHtml = "Sorry,there may be some problem.";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}