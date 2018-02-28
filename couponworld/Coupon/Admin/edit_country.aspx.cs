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
    public partial class country_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btn_update.Visible = false;
                if (Request["cid"] != null)
                {
                    binddata(" where int_country_id=" + Request.QueryString["cid"], 1);
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

                tbl_country_bal objbal = new tbl_country_bal();

                dt = objbal.country_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_country.Text = dt.Tables[0].Rows[0]["str_country_name"].ToString();
                    txt_region.Text = dt.Tables[0].Rows[0]["str_region"].ToString();
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
                tbl_country_bal cbal = new tbl_country_bal();
                tbl_country_entity centity = new tbl_country_entity();

                centity.str_country_name = txt_country.Text;
                centity.str_region = txt_region.Text;
                centity.date_create_date = Convert.ToDateTime(DateTime.Now.ToString("dd-MM-yyyy").ToString());
                centity.bit_is_delete = false;

                int val = cbal.country_insert(centity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "State Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_country.Text = string.Empty;
                    txt_region.Text = string.Empty;
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this State is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_country.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_country_bal cbal = new tbl_country_bal();
                tbl_country_entity centity = new tbl_country_entity();

                centity.int_country_id = Convert.ToInt64(Request.QueryString["cid"].ToString());
                centity.str_country_name = txt_country.Text;
                centity.str_region = txt_region.Text;

                int val = cbal.country_Update(centity);
                if (val > 0)
                {
                    Response.Redirect("view_country.aspx");
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