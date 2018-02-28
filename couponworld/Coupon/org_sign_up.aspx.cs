using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Coupon_Bal;
using Coupon_Entity;
using System.Web.Services;
using System.Net;

namespace Coupon
{
    public partial class org_sign_up : System.Web.UI.Page
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

        protected void btn_sing_up_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_organization_entity objentity = new tbl_organization_entity();
                tbl_organization_bal objbal = new tbl_organization_bal();


                string filename = fupimg.FileName;

                objentity.str_organization_name = txt_org_name.Text;
                objentity.str_corporate_name = txt_corporate_name.Text;
                objentity.str_email_id_p = txt_email.Text;
                objentity.str_password = txt_pass.Text;
                objentity.str_street_address = txt_address.Value;
                objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);
                objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                objentity.int_zip_code = txt_pincode.Text;
                objentity.date_created_date = DateTime.Now.ToString("dd/MM/yyyy");
                objentity.bit_isactive = false;
                if (fupimg.HasFile)
                {
                    objentity.str_logo_img = filename;
                    fupimg.SaveAs(Server.MapPath("/Admin/org_logo/") + filename);
                }
                else
                    objentity.str_logo_img = "NA";

                objentity.str_telephone_p = txt_telephone_p.Text;
                objentity.str_contact_1_p = txt_contact_1_p.Text;
                objentity.str_contact_2_s = txt_contact_2_s.Text;
                objentity.str_telephone_s = txt_telephone_s.Text;
                objentity.str_email_id_s = txt_email_s.Text;
                objentity.str_web_address = txt_web_address.Text;
                objentity.bit_spotlight = false;
                objentity.bit_is_delete = false;

                int val = objbal.org_insert(objentity);
                if (val > 0)
                {
                    lblmess.InnerHtml = "You Have Successfully Sign Up ";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    txt_api_suit.Text = string.Empty;
                    txt_corporate_name.Text = string.Empty;
                    txt_email.Text = string.Empty;
                    txt_address.Value = string.Empty;
                    txt_pass.Text = string.Empty;
                    txt_pincode.Text = string.Empty;
                    txt_org_name.Text = string.Empty;
                    ddl_city.ClearSelection();
                    ddl_state.ClearSelection();
                    txt_contact_1_p.Text = string.Empty;
                    txt_contact_2_s.Text = string.Empty;
                    txt_telephone_p.Text = string.Empty;
                    txt_telephone_s.Text = string.Empty;
                    txt_email_s.Text = string.Empty;
                    //  ddl_share_type.ClearSelection();
                    txt_web_address.Text = string.Empty;
                    // txt_share_amt.Text = string.Empty;
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,this Retailer is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }

            catch (Exception ex)
            {
            }
        }


        protected void ddl_city_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_city_bind();
        }

        protected void txt_email_TextChanged(object sender, EventArgs e)
        {
            int totalrecords = 0;
            try
            {

                tbl_organization_bal objbal = new tbl_organization_bal();

                DataSet ds = objbal.organization_Select(" where str_email_id_p ='" + txt_email.Text + "'", 1, 1, out totalrecords, "asc", "str_organization_name");
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