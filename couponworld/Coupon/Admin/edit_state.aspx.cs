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
    public partial class State_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlcountry_bind();
                btn_update.Visible = false;
                if (Request["sid"] != null)
                {
                    binddata(" where int_state_id=" + Request.QueryString["sid"], 1);
                    btn_add.Visible = false;
                    btn_update.Visible = true;
                }
            }
        }

        protected void ddlcountry_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_country_bal countrybal = new tbl_country_bal();
                DataSet ds = countrybal.country_Select(" ", 1, 0, out totalrecord);

                ddl_country.DataValueField = "int_country_id";
                ddl_country.DataTextField = "str_country_name";

                ddl_country.DataSource = ds;
                ddl_country.DataBind();

                ddl_country.Items.Insert(0, new ListItem("-- Select Country --", "0"));
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

                tbl_state_bal objbal = new tbl_state_bal();

                dt = objbal.state_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_state.Text = dt.Tables[0].Rows[0]["str_state_name"].ToString();
                    txt_short.Text = dt.Tables[0].Rows[0]["str_short_name"].ToString();
                    ddl_country.SelectedValue = dt.Tables[0].Rows[0]["int_country_id"].ToString();
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
                tbl_state_bal statebal = new tbl_state_bal();
                tbl_state_entity stateentity = new tbl_state_entity();

                stateentity.str_state_name = txt_state.Text;
                stateentity.str_short_name = txt_short.Text;
                stateentity.int_country_id = Convert.ToInt64(ddl_country.SelectedItem.Value);
                stateentity.date_create_date = Convert.ToDateTime(DateTime.Now.ToString("dd-MM-yyyy").ToString());
                stateentity.bit_is_delete = false;

                int val = statebal.state_insert(stateentity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "State Inserted Successfully.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_state.Text = string.Empty;
                    ddl_country.ClearSelection();
                    txt_short.Text = string.Empty;
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
            Response.Redirect("view_state.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_state_bal statebal = new tbl_state_bal();
                tbl_state_entity state_entity = new tbl_state_entity();

                state_entity.int_state_id = Convert.ToInt64(Request.QueryString["sid"].ToString());
                state_entity.str_state_name = txt_state.Text;
                state_entity.str_short_name = txt_short.Text;
                state_entity.int_country_id = Convert.ToInt64(ddl_country.SelectedItem.Value);

                int val = statebal.state_Update(state_entity);
                if (val > 0)
                {
                    Response.Redirect("view_state.aspx");
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
