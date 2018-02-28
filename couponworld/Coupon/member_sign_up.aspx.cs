using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Coupon_Bal;
using Coupon_Entity;
using System.Net;
using System.Web.Services;

namespace Coupon
{
    public partial class member_sign_up : System.Web.UI.Page
    {
        protected static string ReCaptcha_Key = "6LekHjIUAAAAAL0QsqtYHFB_4guR4xRuvyfFVu2R";
        protected static string ReCaptcha_Secret = "6LekHjIUAAAAACD3kllXxVt7ayGyv81qPw-R0jQu";

        [WebMethod]
        public static string VerifyCaptcha(string response)
        {
            string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
            return (new WebClient()).DownloadString(url);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddl_state_bind();
                ddl_grp_bind();
                ddl_age_grp_bind();
                ddl_org_state_bind();
                ddl_org_type_bind();
                bindYear();
                //ddl_org_city_bind();
                ddl_company_state_bind();
                ddl_company_type_bind();
                bindOrg();
                bindcompany();
            }
        }

        protected void Bind_company(string query, int pageindex)
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                //query = " where int_state_id=" + ddl_company_state.SelectedItem.Value + " and int_city_id=" + ddl_company_city.SelectedItem.Value + " and int_company_type_id=" + ddl_company_type.SelectedItem.Value;

                tbl_company_bal o_bal = new tbl_company_bal();

                dt = o_bal.company_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rp_company.DataSource = dt;
                    rp_company.DataBind();
                }
                else
                {
                    rp_company.DataSource = null;
                    rp_company.DataBind();
                }
                //PopulatePager(totalcount, pageindex);
                //lblcount.Text = totalcount.ToString();
            }
            catch (Exception ex)
            {

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
        protected void ddl_org_state_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_state_bal objbal = new tbl_state_bal();
                DataSet ds = objbal.state_Select(" ", 1, 0, out totalrecord);

                ddl_org_state.DataValueField = "int_state_id";
                ddl_org_state.DataTextField = "str_state_name";

                ddl_org_state.DataSource = ds;
                ddl_org_state.DataBind();

                ddl_org_state.Items.Insert(0, new ListItem("-- Select State --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_org_city_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_city_bal objbal = new tbl_city_bal();
                DataSet ds = objbal.city_Select(" where int_state_id=" + ddl_org_state.SelectedItem.Value, 1, 0, out totalrecord);

                ddl_org_city.DataValueField = "int_city_id";
                ddl_org_city.DataTextField = "str_city_name";

                ddl_org_city.DataSource = ds;
                ddl_org_city.DataBind();

                ddl_org_city.Items.Insert(0, new ListItem("-- Select City --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_company_state_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_state_bal objbal = new tbl_state_bal();
                DataSet ds = objbal.state_Select(" ", 1, 0, out totalrecord);

                ddl_company_state.DataValueField = "int_state_id";
                ddl_company_state.DataTextField = "str_state_name";

                ddl_company_state.DataSource = ds;
                ddl_company_state.DataBind();

                ddl_company_state.Items.Insert(0, new ListItem("-- Select State --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_company_city_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_city_bal objbal = new tbl_city_bal();
                DataSet ds = objbal.city_Select(" where int_state_id=" + ddl_company_state.SelectedItem.Value, 1, 0, out totalrecord);

                ddl_company_city.DataValueField = "int_city_id";
                ddl_company_city.DataTextField = "str_city_name";

                ddl_company_city.DataSource = ds;
                ddl_company_city.DataBind();

                ddl_company_city.Items.Insert(0, new ListItem("-- Select City --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_grp_bind()
        {
            //try
            //{
            //    int totalrecord = 0;
            //    tbl_group_bal objbal = new tbl_group_bal();
            //    DataSet ds = objbal.group_Select(" ", 1, 0, out totalrecord);

            //    ddl_grp.DataValueField = "int_group_id";
            //    ddl_grp.DataTextField = "str_name";

            //    ddl_grp.DataSource = ds;
            //    ddl_grp.DataBind();

            //    ddl_grp.Items.Insert(0, new ListItem("-- Select Group --", "0"));
            //}
            //catch (Exception ex)
            //{
            //}
        }
        protected void ddl_age_grp_bind()
        {
            //try
            //{
            //    int totalrecord = 0;
            //    tbl_agegroup_bal objbal = new tbl_agegroup_bal();
            //    DataSet ds = objbal.agegroup_Select(" ", 1, 0, out totalrecord);

            //    ddl_age_grp.DataValueField = "int_age_group_id";
            //    ddl_age_grp.DataTextField = "str_age_group_name";

            //    ddl_age_grp.DataSource = ds;
            //    ddl_age_grp.DataBind();

            //    ddl_age_grp.Items.Insert(0, new ListItem("-- Select Age Group --", "0"));
            //}
            //catch (Exception ex)
            //{
            //}
        }

        protected void ddl_org_type_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_organization_type_bal objbal = new tbl_organization_type_bal();
                DataSet ds = objbal.organization_type_Select(" ", 1, 0, out totalrecord);

                ddl_org_type.DataValueField = "int_organization_type_id";
                ddl_org_type.DataTextField = "str_organization_type";

                ddl_org_type.DataSource = ds;
                ddl_org_type.DataBind();

                ddl_org_type.Items.Insert(0, new ListItem("-- Select Organization Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_company_type_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_company_type_bal objbal = new tbl_company_type_bal();
                DataSet ds = objbal.company_type_Select(" ", 1, 0, out totalrecord);

                ddl_company_type.DataValueField = "int_company_type_id";
                ddl_company_type.DataTextField = "str_company_type";

                ddl_company_type.DataSource = ds;
                ddl_company_type.DataBind();

                ddl_company_type.Items.Insert(0, new ListItem("-- Select Company Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void bindOrg()
        {
            try
            {
                int totalcount;
                string query = " where 1=1";
                DataSet dt = new DataSet();

                tbl_organization_bal objbal = new tbl_organization_bal();

                if (ddl_org_state.SelectedIndex > 0)
                    query = query + " and int_state_id = " + ddl_org_state.SelectedItem.Value;

                if (ddl_org_city.SelectedIndex > 0)
                    query = query + " and int_city_id = " + ddl_org_city.SelectedItem.Value;

                if (ddl_org_type.SelectedIndex > 0)
                    query = query + " and int_organization_type_id = " + ddl_org_type.SelectedItem.Value;

                dt = objbal.organization_Select(query, 1, 0, out totalcount, "desc", "str_organization_name");

                ddl_organization.DataValueField = "int_organization_id";
                ddl_organization.DataTextField = "str_organization_name";

                ddl_organization.Items.Clear();

                if (dt.Tables[0].Rows.Count > 0)
                {


                    ddl_organization.DataSource = dt;
                    ddl_organization.DataBind();

                    rp_view_org.DataSource = dt;
                    rp_view_org.DataBind();

                }
                else
                {
                    ddl_organization.DataSource = null;
                    ddl_organization.DataBind();

                    rp_view_org.DataSource = null;
                    rp_view_org.DataBind();
                }
                ddl_organization.Items.Insert(0, new ListItem("-- Select Organization --", "0"));

            }
            catch (Exception ex)
            {
            }
        }

        protected void bindcompany()
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                tbl_company_bal objbal = new tbl_company_bal();

                string query = " where 1=1";

                if (ddl_company_city.SelectedIndex > 0)
                    query = query + " and int_city_id=" + ddl_company_city.SelectedItem.Value;

                if (ddl_company_state.SelectedIndex > 0)
                    query = query + " and int_state_id=" + ddl_company_state.SelectedItem.Value;

                if (ddl_company_type.SelectedIndex > 0)
                    query = query + " and int_company_type_id=" + ddl_company_type.SelectedItem.Value;

                dt = objbal.company_Select(query, 1, 0, out totalcount, "asc", "str_company_name");

                ddl_company.Items.Clear();


                if (dt.Tables[0].Rows.Count > 0)
                {
                    ddl_company.DataValueField = "int_company_id";
                    ddl_company.DataTextField = "str_company_name";

                    ddl_company.DataSource = dt;
                    ddl_company.DataBind();

                    rp_company.DataSource = dt;
                    rp_company.DataBind();


                    //ddl_organization.SelectedValue = dt.Tables[0].Rows[0]["str_organization_name"].ToString();
                }
                else
                {
                    ddl_company.DataSource = null;
                    ddl_company.DataBind();

                    rp_company.DataSource = null;
                    rp_company.DataBind();

                }

                ddl_company.Items.Insert(0, new ListItem("-- Select Company --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_city_bind();
        }

        protected void btn_sing_up_Click(object sender, EventArgs e)
        {
            try
            {
                //string date = ddl_month.SelectedItem.Value + "/" + ddl_date.SelectedItem.Value + "/" + ddl_year.SelectedItem.Value;

                tbl_member_bal objbal = new tbl_member_bal();
                tbl_member_entity objentity = new tbl_member_entity();


                string filename = fupimg.FileName;
                objentity.str_first_name = txt_fname.Text;
                // objentity.str_middle_name = "Null";
                objentity.str_last_name = txt_l_name.Text;
                objentity.str_password = txt_pass.Text;
                objentity.str_email_id = txt_email.Text;
                //objentity.str_designation = "Null";
                //objentity.int_group_id = Convert.ToInt64(null);
                objentity.str_gender = ddl_gender.SelectedItem.Value;
                //  objentity.int_age_group_id = Convert.ToInt64(null);
                //  objentity.str_apt_suite = "Null";
                objentity.str_street_address = txt_address.Value;
                objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);
                objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                objentity.int_zip_code = Convert.ToInt32(txt_pincode.Text);
                objentity.date_create_date = DateTime.Now.ToString("MM/dd/yyyy");
                objentity.bit_isactive = true;
                objentity.str_telephone = txt_telephone.Text;
                objentity.str_date_of_birth = txt_birth_date.Text;
                objentity.int_organization_id = Convert.ToInt64(ddl_organization.SelectedItem.Value);
                objentity.int_company_id = Convert.ToInt64(ddl_company.SelectedItem.Value);
                if (fupimg.HasFile)
                {
                    objentity.str_logo_img = filename;
                    fupimg.SaveAs(Server.MapPath("/Admin/member_logo/") + filename);
                }
                else
                    objentity.str_logo_img = "noimg.png";
                    objentity.bit_is_delete = false;

                int val = objbal.member_sign_up_insert(objentity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "You Have Successfully Sign Up.";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_birth_date.Text = string.Empty;
                    //ddl_date.ClearSelection();
                    //ddl_month.ClearSelection();
                    //ddl_year.ClearSelection();
                    txt_address.Value = string.Empty;
                    //txt_api_suit.Text = string.Empty;
                    //txt_designation.Text = string.Empty;
                    txt_email.Text = string.Empty;
                    txt_fname.Text = string.Empty;
                    txt_l_name.Text = string.Empty;
                    //txt_m_name.Text = string.Empty;
                    txt_pass.Text = string.Empty;
                    txt_pincode.Text = string.Empty;
                    txt_telephone.Text = string.Empty;
                    //ddl_age_grp.ClearSelection();
                    ddl_city.ClearSelection();
                    ddl_gender.ClearSelection();
                    //ddl_grp.ClearSelection();
                    ddl_org_state.ClearSelection();
                    ddl_org_type.ClearSelection();
                    ddl_organization.ClearSelection();
                    ddl_state.ClearSelection();
                    ddl_org_city.ClearSelection();
                    ddl_company_type.ClearSelection();
                    ddl_company_state.ClearSelection();
                    ddl_company_city.ClearSelection();
                    ddl_company.ClearSelection();
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this Consumer is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }

            catch (Exception ex)
            {
            }
        }

        protected void ddl_org_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_org_city_bind();
            try
            {
                bindOrg();
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_org_type_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {

                bindOrg();

            }
            catch (Exception ex)
            {
            }
        }

        private void bindYear()
        {
            //try
            //{
            //    DataTable dt = new DataTable();
            //    dt.Columns.AddRange(new DataColumn[1] { 
            //                new DataColumn("Year", typeof(string))
            //                });

            //    for (int i = 1970; i <= System.DateTime.Now.AddYears(-1).Year; i++)
            //    {
            //        dt.Rows.Add(i.ToString());
            //    }

            //    ddl_year.DataValueField = "Year";
            //    ddl_year.DataTextField = "Year";

            //    ddl_year.DataSource = dt;
            //    ddl_year.DataBind();

            //    ddl_year.Items.Insert(0, new ListItem("-- Select Year --", "0"));
            //}
            //catch (Exception ex)
            //{
            //}
        }

        protected void ddl_org_city_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                bindOrg();
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_company_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_company_city_bind();
            try
            {
                bindcompany();
            }
            catch (Exception ex)
            {
            }

        }

        protected void ddl_company_city_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                bindcompany();
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_company_type_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                bindcompany();
            }
            catch (Exception ex)
            {
            }
        }

        protected void txt_email_TextChanged(object sender, EventArgs e)
        {
            int totalrecords = 0;
            try
            {

                tbl_member_bal objbal = new tbl_member_bal();

                DataSet ds = objbal.member_Select(" where str_email_id ='" + txt_email.Text + "'", 1, 1, out totalrecords, "asc", "str_first_name");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txt_email.Focus();
                    lbl_email.Attributes.Add("style", "display:block;color:red");
                }
                else
                {
                    lbl_email.Attributes.Add("style", "display:none");
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}