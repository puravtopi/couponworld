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
    public partial class city_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlstate_bind();
                btn_update.Visible = false;
                if (Request["city_id"] != null)
                {
                    binddata(" where int_city_id=" + Request.QueryString["city_id"], 1);
                    btn_add.Visible = false;
                    btn_update.Visible = true;
                }
            }
        }
        protected void ddlstate_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_state_bal statebal = new tbl_state_bal();
                DataSet ds = statebal.state_Select(" ", 1, 0, out totalrecord);

                ddl_state.DataValueField = "int_state_id";
                ddl_state.DataTextField = "str_state_name";

                ddl_state.DataSource = ds;
                ddl_state.DataBind();

                ddl_state.Items.Insert(0, new ListItem("-- Select State --", "0"));
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

                tbl_city_bal objbal = new tbl_city_bal();

                dt = objbal.city_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_city.Text = dt.Tables[0].Rows[0]["str_city_name"].ToString();
                    ddl_state.SelectedValue = dt.Tables[0].Rows[0]["int_state_id"].ToString();
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
                tbl_city_bal objbal = new tbl_city_bal();
                tbl_city_entity objentity = new tbl_city_entity();

                objentity.str_city_name = txt_city.Text;
                objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                objentity.date_create_date = DateTime.Now;
                objentity.bit_is_delete = false;

                int val = objbal.city_insert(objentity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "City Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_city.Text = string.Empty;
                    ddl_state.ClearSelection();
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this City is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_city.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_city_bal citybal = new tbl_city_bal();
                tbl_city_entity cityentity = new tbl_city_entity();

                cityentity.int_city_id = Convert.ToInt64(Request.QueryString["city_id"].ToString());
                cityentity.str_city_name = txt_city.Text;
                cityentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);

                int val = citybal.city_Update(cityentity);
                if (val > 0)
                {
                    Response.Redirect("view_city.aspx");
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