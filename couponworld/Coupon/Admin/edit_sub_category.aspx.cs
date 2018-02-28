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
    public partial class sub_category_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btn_update.Visible = false;
                ddlcat_bind();
                if (Request["sub_cat_id"] != null)
                {
                    binddata(" where int_sub_category_id=" + Request.QueryString["sub_cat_id"], 1);
                    btn_add.Visible = false;
                    btn_update.Visible = true;
                }
            }
        }

        protected void ddlcat_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_category_bal catbal = new tbl_category_bal();
                DataSet ds = catbal.category_Select(" ", 1, 0, out totalrecord);

                ddl_cat.DataValueField = "int_category_id";
                ddl_cat.DataTextField = "str_category_name";

                ddl_cat.DataSource = ds;
                ddl_cat.DataBind();

                ddl_cat.Items.Insert(0, new ListItem("-- Select Category --", "0"));
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

                tbl_sub_category_bal objbal = new tbl_sub_category_bal();

                dt = objbal.sub_category_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_cat.Text = dt.Tables[0].Rows[0]["str_sub_category_name"].ToString();
                    ddl_cat.SelectedValue = dt.Tables[0].Rows[0]["int_category_id"].ToString();
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
                tbl_sub_category_bal cbal = new tbl_sub_category_bal();
                tbl_sub_category_entity centity = new tbl_sub_category_entity();


                centity.str_sub_category_name = txt_cat.Text;
                centity.int_category_id = Convert.ToInt64(ddl_cat.SelectedItem.Value);
                centity.date_create_date = Convert.ToDateTime(DateTime.Now.ToString());
                centity.bit_is_delete = false;

                int val = cbal.sub_category_insert(centity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "Sub Category Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_cat.Text = string.Empty;
                    ddl_cat.ClearSelection();
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this Sub Category is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }

            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_sub_category.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_sub_category_bal cbal = new tbl_sub_category_bal();
                tbl_sub_category_entity centity = new tbl_sub_category_entity();

                centity.int_sub_category_id = Convert.ToInt16(Request.QueryString["sub_cat_id"].ToString());
                centity.str_sub_category_name = txt_cat.Text;
                centity.int_category_id = Convert.ToInt64(ddl_cat.SelectedItem.Value);

                int val = cbal.sub_category_Update(centity);
                if (val > 0)
                {
                    Response.Redirect("view_sub_category.aspx");
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this Sub Category is not Updated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}