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
    public partial class company_type_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btn_update.Visible = false;
                if (Request["company_typeid"] != null)
                {
                    binddata(" where int_company_type_id=" + Request.QueryString["company_typeid"], 1);
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

                tbl_company_type_bal objbal = new tbl_company_type_bal();

                dt = objbal.company_type_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_type.Text = dt.Tables[0].Rows[0]["str_company_type"].ToString();
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
                tbl_company_type_bal typebal = new tbl_company_type_bal();
                tbl_company_type_entity type_entity = new tbl_company_type_entity();

                type_entity.str_company_type = txt_type.Text;
                type_entity.date_create_date = Convert.ToDateTime(DateTime.Now.ToString("dd-MM-yyyy").ToString());
                type_entity.bit_is_delete = false;

                int val = typebal.company_types_insert(type_entity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "Company Type Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_type.Text = string.Empty;
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this Company Type is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_company_type.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_company_type_bal typebal = new tbl_company_type_bal();
                tbl_company_type_entity type_entity = new tbl_company_type_entity();


                type_entity.int_company_type_id = Convert.ToInt64(Request.QueryString["company_typeid"].ToString());
                type_entity.str_company_type = txt_type.Text;



                int val = typebal.company_types_Update(type_entity);
                if (val > 0)
                {
                    Response.Redirect("view_company_type.aspx");
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