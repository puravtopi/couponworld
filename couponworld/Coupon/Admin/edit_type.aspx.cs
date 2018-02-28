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
    public partial class type_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btn_update.Visible = false;
                if (Request["typeid"] != null)
                {
                    binddata(" where int_type_id=" + Request.QueryString["typeid"], 1);
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

                tbl_types_bal objbal = new tbl_types_bal();

                dt = objbal.types_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_type.Text = dt.Tables[0].Rows[0]["str_type_name"].ToString();
                    //txt_region.Text = dt.Tables[0].Rows[0]["str_region"].ToString();
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
                tbl_types_bal typebal = new tbl_types_bal();
                tbl_types_entity type_entity = new tbl_types_entity();

                type_entity.str_type_name = txt_type.Text;
                type_entity.date_create_date = Convert.ToDateTime(DateTime.Now.ToString("dd-MM-yyyy").ToString());
                type_entity.bit_is_delete = false;

                int val = typebal.types_insert(type_entity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "Type Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_type.Text = string.Empty;
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this Type is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_type.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_types_bal typebal = new tbl_types_bal();
                tbl_types_entity entity = new tbl_types_entity();

                entity.int_type_id = Convert.ToInt64(Request.QueryString["typeid"].ToString());
                entity.str_type_name = txt_type.Text;

                int val = typebal.types_Update(entity);
                if (val > 0)
                {
                    Response.Redirect("view_type.aspx");
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