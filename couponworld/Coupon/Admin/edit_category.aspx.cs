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
    public partial class category_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btn_update.Visible = false;
                if (Request["cat_id"] != null)
                {
                    binddata(" where int_category_id=" + Request.QueryString["cat_id"], 1);
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

                tbl_category_bal objbal = new tbl_category_bal();

                dt = objbal.category_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_cat.Text = dt.Tables[0].Rows[0]["str_category_name"].ToString();
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
                tbl_category_bal cbal = new tbl_category_bal();
                tbl_category_entity centity = new tbl_category_entity();

                centity.str_category_name = txt_cat.Text;
                centity.date_create_date = Convert.ToDateTime(DateTime.Now.Date.ToString());
                centity.bit_is_delete = false;

                int val = cbal.category_insert(centity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "Category Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_cat.Text = string.Empty;
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
            Response.Redirect("view_category.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_category_bal cbal = new tbl_category_bal();
                tbl_category_entity centity = new tbl_category_entity();

                centity.int_category_id = Convert.ToInt16(Request.QueryString["cat_id"].ToString());
                centity.str_category_name = txt_cat.Text;

                int val = cbal.category_Update(centity);
                if (val > 0)
                {
                    Response.Redirect("view_category.aspx");
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this Category is not Updated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}