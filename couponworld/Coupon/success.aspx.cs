using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Entity;
using Coupon_Bal;
using System.Data;
using System.Configuration;
using System.Net.Mail;

namespace Coupon
{
    public partial class success : System.Web.UI.Page
    {
        //string oid = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            tbl_donation_bal objbal = new tbl_donation_bal();
            tbl_donation_entity objentity = new tbl_donation_entity();

            objentity.str_name = Session["name"].ToString();
            objentity.str_message = Session["message"].ToString();
            objentity.int_organization_id = Convert.ToInt64(Session["orgid"].ToString());
            objentity.str_amount = Session["amount"].ToString();
            objentity.date_date_time = Convert.ToDateTime(Session["date"].ToString());
            objentity.str_email_id = Session["email"].ToString();
            objentity.str_address = Session["address"].ToString();

            int val = objbal.donation_insert(objentity);
            if (val > 0)
            {
                MailMessage Msg = new MailMessage();
                // Sender e-mail address.
                Msg.From = new MailAddress("nikdarji03@gmail.com");
                // Recipient e-mail address.
                Msg.To.Add(Session["email"].ToString());
                Msg.Subject = "Donation";
                Msg.Body = "Hi, <br/><br/>" + Session["email"].ToString() + " <p>Thank you for Donation For</p>" + Session["org_name"].ToString();
                Msg.IsBodyHtml = true;
                // your remote SMTP server IP.
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("nikdarji03@gmail.com", "7801995354darji");
                smtp.EnableSsl = true;
                smtp.Send(Msg);
                //Msg = null;
                //lblmess.InnerText = "Your Password Details Sent to your mail";
                //lblmess.InnerHtml = "Your Bill Details Sent to your mail";
                //lblmess.Attributes.Add("class", "alert alert-success");
                // Clear the textbox valuess
                //txt_email.Text = "";
            }

            // oid = Page.RouteData.Values["oid"].ToString();
            if (!IsPostBack)
            {
                BindGrid(" ", 1);
            }
        }

        protected void BindGrid(string query, int pageindex, string columnname = "str_offer_name", string sortorder = "asc")
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                tbl_offer_bal objbal = new tbl_offer_bal();

                //   string today_date = System.DateTime.Now.ToString("yyyy-MM-dd");

                dt = null;
                objbal = new tbl_offer_bal();
                // query = "where int_offer_id<>" + oid + " and '" + today_date + "'>=date_start_date and '" + today_date + "'<=date_end_date";
                dt = objbal.offer_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rep_other.DataSource = dt;
                    rep_other.DataBind();
                }
                else
                {
                    rep_other.DataSource = null;
                    rep_other.DataBind();
                }


                //PopulatePager(totalcount, pageindex);
                //lblcount.Text = totalcount.ToString();
                ScriptManager.RegisterStartupScript(Page, this.GetType(), Guid.NewGuid().ToString(), "ReversCounter()", true);
            }
            catch (Exception ex)
            {
            }
        }
    }
}