using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Entity;
using Coupon_Bal;
using System.Data;

namespace Coupon.member_user
{
    public partial class member_profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cls_Common obj = new Cls_Common();
                obj.setCookiesCosumer();

                ddl_company_bind();
                ddl_state_bind();
                ddl_city_bind();
                ddl_org_bind();
                if (Session["cid"] != null)
                {
                    BindGrid(" where int_user_id = " + Session["cid"].ToString(), 1);
                    //bind_social_data(" where int_retailer_id = " + Session["rid"].ToString(), 1);
                }
            }
        }

        protected void ddl_city_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_city_bal objbal = new tbl_city_bal();
                DataSet ds = objbal.city_Select(" where int_state_id=" + ddl_state.SelectedItem.Value, 1, 0, out totalrecord);

                ddl_city.DataValueField = "int_city_id";
                ddl_city.DataTextField = "str_city_name";

                ddl_city.DataSource = ds;
                ddl_city.DataBind();

                ddl_city.Items.Insert(0, new ListItem("-- Select City --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_state_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_state_bal objbal = new tbl_state_bal();
                DataSet ds = objbal.state_Select(" ", 1, 0, out totalrecord);

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

        protected void ddl_org_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_organization_bal objbal = new tbl_organization_bal();
                DataSet ds = objbal.organization_Select(" ", 1, 0, out totalrecord);

                ddl_org.DataValueField = "int_organization_id";
                ddl_org.DataTextField = "str_organization_name";

                ddl_org.DataSource = ds;
                ddl_org.DataBind();

                ddl_org.Items.Insert(0, new ListItem("-- Select Organization --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_company_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_company_bal objbal = new tbl_company_bal();
                DataSet ds = objbal.company_Select(" ", 1, 0, out totalrecord);

                ddl_company.DataValueField = "int_company_id";
                ddl_company.DataTextField = "str_company_name";

                ddl_company.DataSource = ds;
                ddl_company.DataBind();

                ddl_company.Items.Insert(0, new ListItem("-- Select Company --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void BindGrid(string query, int pageindex, string columnname = "str_first_name", string sortorder = "asc")
        {
            try
            {
                int totalcount;
                DataSet ds = new DataSet();

                tbl_member_bal objbal = new tbl_member_bal();

                ds = objbal.member_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    rpview.DataSource = ds;
                    rpview.DataBind();

                    txt_name.Text = ds.Tables[0].Rows[0]["str_first_name"].ToString();
                    txt_lname.Text = ds.Tables[0].Rows[0]["str_last_name"].ToString();
                    txt_email.Text = ds.Tables[0].Rows[0]["str_email_id"].ToString();
                    txt_address.Value = ds.Tables[0].Rows[0]["str_street_address"].ToString();
                    ddl_state.SelectedValue = ds.Tables[0].Rows[0]["int_state_id"].ToString();
                    ddl_city_bind();
                    ddl_city.SelectedValue = ds.Tables[0].Rows[0]["int_city_id"].ToString();

                    txt_zip.Text = ds.Tables[0].Rows[0]["int_zip_code"].ToString();
                    ddl_org.SelectedValue = ds.Tables[0].Rows[0]["int_organization_id"].ToString();
                    ddl_gender.SelectedValue = ds.Tables[0].Rows[0]["str_gender"].ToString();
                    ddl_company.SelectedValue = ds.Tables[0].Rows[0]["int_company_id"].ToString();
                    txt_telephone.Text = ds.Tables[0].Rows[0]["str_telephone"].ToString();
                    txt_birth_date.Text = ds.Tables[0].Rows[0]["str_date_of_birth"].ToString();
                }
                else
                {
                    rpview.DataSource = null;
                    rpview.DataBind();
                }



                //PopulatePager(totalcount, pageindex);
                //lblcount.Text = totalcount.ToString();
            }
            catch (Exception ex)
            {
            }
        }


        protected void lnk_edit_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "openModel('company_modal')", true);
        }

        //protected void lnk_update_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        tbl_member_bal objbal = new tbl_member_bal();
        //        tbl_member_entity objentity = new tbl_member_entity();

        //        objentity.int_state_id = Convert.ToInt32(ddl_state.SelectedItem.Value);
        //        objentity.int_city_id = Convert.ToInt32(ddl_city.SelectedItem.Value);

        //        objentity.int_organization_id = Convert.ToInt32(ddl_org.SelectedItem.Value);
        //        objentity.int_zip_code = Convert.ToInt32(txt_zip.Text);
        //        objentity.int_user_id = Convert.ToInt64(Session["cid"].ToString());
        //        objentity.str_date_of_birth = txt_birth_date.Text;
        //        objentity.str_first_name = txt_name.Text;
        //        objentity.str_last_name = txt_lname.Text;
        //        objentity.str_email_id = txt_email.Text;
        //        objentity.str_street_address = txt_address.InnerText;
        //        objentity.str_telephone = txt_telephone.Text;
        //        objentity.int_company_id = Convert.ToInt64(ddl_company.SelectedItem.Value);
        //        objentity.str_gender = ddl_gender.SelectedItem.Value;

        //        int lVal = objbal.member_Update_profile(objentity);

        //        if (lVal > 0)
        //        {
        //            BindGrid(" where int_user_id = " + Session["cid"].ToString(), 1);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //    }

        //}

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_city_bind();
        }

        protected void link_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_member_bal objbal = new tbl_member_bal();
                tbl_member_entity objentity = new tbl_member_entity();

                objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);

                objentity.int_organization_id = Convert.ToInt64(ddl_org.SelectedItem.Value);
                objentity.int_zip_code = Convert.ToInt32(txt_zip.Text);
                objentity.int_user_id = Convert.ToInt64(Session["cid"].ToString());
                objentity.str_date_of_birth = txt_birth_date.Text;
                objentity.str_first_name = txt_name.Text;
                objentity.str_last_name = txt_lname.Text;
                objentity.str_email_id = txt_email.Text;
                objentity.str_street_address = txt_address.InnerText;
                objentity.str_telephone = txt_telephone.Text;
                objentity.int_company_id = Convert.ToInt64(ddl_company.SelectedItem.Value);
                objentity.str_gender = ddl_gender.SelectedItem.Value;

                int lVal = objbal.member_Update_profile(objentity);

                if (lVal > 0)
                {
                    BindGrid(" where int_user_id = " + Session["cid"].ToString(), 1);
                }
            }
            catch (Exception ex)
            {
            }
        }


    }
}