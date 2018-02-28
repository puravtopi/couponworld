using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using Coupon_Entity;
using System.Data;
using System.Web.Services;
using System.Net;

namespace Coupon
{
    public partial class sign_up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddl_city_bind();
                ddl_bind_state();
            }
        }
        protected void ddl_city_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_city_bal objbal = new tbl_city_bal();
                DataSet ds = objbal.city_Select(" ", 1, 0, out totalrecord);

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

        protected void ddl_bind_state()
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

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ddl_bind_city();
        }

        protected void ddl_city_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_sing_up_Click(object sender, EventArgs e)
        {
            //if (recaptcha.IsValid)
            //{
            if (ddl_user.SelectedItem.Value == "1")
            {
                insert_member();
            }
            else if (ddl_user.SelectedItem.Value == "2")
            {
                insert_org();
            }
            else if (ddl_user.SelectedItem.Value == "3")
            {
                insert_retailer();
            }
            else if (ddl_user.SelectedItem.Value == "4")
            {

            }
            //}
            //else
            //{
            //    divmess.InnerHtml = "Sorry,Invalid Captcha";
            //    divmess.Attributes.Add("class", "alert alert-danger");
            //}
        }

        protected void insert_org()
        {
            try
            {
                tbl_organization_bal objbal = new tbl_organization_bal();
                tbl_organization_entity objentity = new tbl_organization_entity();

                objentity.str_organization_name = txt_uname.Text;
                objentity.str_email_id_p = txt_email.Text;
                objentity.str_street_address = txt_address.Value;
                objentity.str_password = txt_pass.Text;
                objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);
                objentity.int_zip_code = txt_pincode.Text;
                objentity.date_created_date = DateTime.Now.ToString("dd/MM/yyyy");
                objentity.bit_is_delete = false;

                int val = objbal.org_insert(objentity);
                if (val > 0)
                {
                    txt_address.Value = string.Empty;
                    txt_email.Text = string.Empty;
                    txt_pass.Text = string.Empty;
                    txt_pincode.Text = string.Empty;
                    txt_uname.Text = string.Empty;
                    ddl_city.ClearSelection();
                    ddl_state.ClearSelection();
                    ddl_user.ClearSelection();
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void insert_retailer()
        {
            try
            {
                tbl_retailer_bal objbal = new tbl_retailer_bal();
                tbl_retailer_entity objentity = new tbl_retailer_entity();

                objentity.str_retailer_name = txt_uname.Text;
                objentity.str_email_id_p = txt_email.Text;
                objentity.str_street_address = txt_address.Value;
                objentity.str_password = txt_pass.Text;
                objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);
                objentity.int_zip_code = Convert.ToInt32(txt_pincode.Text);
                objentity.date_created_date = DateTime.Now.ToString("dd/MM/yyyy");

                int val = objbal.retailersign_up_insert(objentity);
                if (val > 0)
                {
                    txt_address.Value = string.Empty;
                    txt_email.Text = string.Empty;
                    txt_pass.Text = string.Empty;
                    txt_pincode.Text = string.Empty;
                    txt_uname.Text = string.Empty;
                    ddl_city.ClearSelection();
                    ddl_state.ClearSelection();
                    ddl_user.ClearSelection();
                }
                else
                {
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void insert_member()
        {
            try
            {
                tbl_member_bal objbal = new tbl_member_bal();
                tbl_member_entity objentity = new tbl_member_entity();

                objentity.str_first_name = txt_uname.Text;
                objentity.str_email_id = txt_email.Text;
                objentity.str_street_address = txt_address.Value;
                objentity.str_password = txt_pass.Text;
                objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);
                objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                objentity.int_zip_code = Convert.ToInt32(txt_pincode.Text);
                objentity.date_create_date = DateTime.Now.ToString("dd/MM/yyyy");
                objentity.bit_is_delete = false;

                int val = objbal.member_sign_up_insert(objentity);
                if (val > 0)
                {
                    txt_address.Value = string.Empty;
                    txt_email.Text = string.Empty;
                    txt_pass.Text = string.Empty;
                    txt_pincode.Text = string.Empty;
                    txt_uname.Text = string.Empty;
                    ddl_city.ClearSelection();
                    ddl_state.ClearSelection();
                    ddl_user.ClearSelection();
                }
                else
                {
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected static string ReCaptcha_Key = "6LekHjIUAAAAAL0QsqtYHFB_4guR4xRuvyfFVu2R";
        protected static string ReCaptcha_Secret = "6LekHjIUAAAAACD3kllXxVt7ayGyv81qPw-R0jQu";

        [WebMethod]
        public static string VerifyCaptcha(string response)
        {
            string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
            return (new WebClient()).DownloadString(url);
        }

    }
}