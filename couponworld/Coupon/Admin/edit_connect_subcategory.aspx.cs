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
    public partial class edit_connect_subcategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlcat_bind();
                btn_update.Visible = false;
                if (Request["subcat_id"] != null)
                {
                    binddata(" where int_connect_sub_cat_id=" + Request.QueryString["subcat_id"], 1);
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
                tbl_connect_category_bal statebal = new tbl_connect_category_bal();
                DataSet ds = statebal.cat_select(" ", 1, 0, out totalrecord);

                ddl_cat.DataValueField = "int_connect_cat_id";
                ddl_cat.DataTextField = "str_cat";

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

                tbl_connect_subcategory_bal objbal = new tbl_connect_subcategory_bal();

                dt = objbal.subcat_select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_sub_cat.Text = dt.Tables[0].Rows[0]["str_sub_cat"].ToString();
                    ddl_cat.ClearSelection();
                    ddl_cat.Items.FindByValue(dt.Tables[0].Rows[0]["int_connect_cat_id"].ToString()).Selected = true;
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
                tbl_connect_subcategory_bal objbal = new tbl_connect_subcategory_bal();
                tbl_connect_subcategory_entity objentity = new tbl_connect_subcategory_entity();

                objentity.str_sub_cat = txt_sub_cat.Text;
                objentity.int_connect_cat_id = Convert.ToInt32(ddl_cat.SelectedItem.Value);

                int val = objbal.subcat_insert(objentity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "Sub Category Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_sub_cat.Text = string.Empty;
                    ddl_cat.ClearSelection();
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this sub ctaegory is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_connect_subcategory.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_connect_subcategory_bal objbal = new tbl_connect_subcategory_bal();
                tbl_connect_subcategory_entity objentity = new tbl_connect_subcategory_entity();

                objentity.int_connect_sub_cat_id = Convert.ToInt32(Request.QueryString["subcat_id"].ToString());
                objentity.str_sub_cat = txt_sub_cat.Text;
                objentity.int_connect_cat_id = Convert.ToInt32(ddl_cat.SelectedItem.Value);
                objentity.bit_is_delete = false;

                int val = objbal.subcat_update(objentity);
                if (val > 0)
                {
                    Response.Redirect("view_connect_subcategory.aspx");
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