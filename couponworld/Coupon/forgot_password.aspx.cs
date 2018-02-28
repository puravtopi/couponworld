using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Entity;
using Coupon_Bal;
using System.Data;
using System.Net.Mail;

namespace Coupon
{
    public partial class forgot_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddl_user.SelectedItem.Value == "1")
                {
                    snd_mail_other();
                }
                else if (ddl_user.SelectedItem.Value == "2")
                {
                    snd_mail_other();
                }
                else if (ddl_user.SelectedItem.Value == "3")
                {
                    snd_mail_other();
                }
                else if (ddl_user.SelectedItem.Value == "4")
                {
                    snd_mail_other();
                }


            }
            catch (Exception ex)
            {
            }
        }

        protected void snd_mail()
        {
            try
            {
                user_login loginbal = new user_login();
                DataSet lds = loginbal.forgot_password(txt_user.Value, ddl_user.SelectedItem.Value);

                if (lds != null && lds.Tables[0].Rows.Count > 0)
                {
                    MailMessage Msg = new MailMessage();
                    // Sender e-mail address.
                    Msg.From = new MailAddress("nikdarji03@gmail.com");
                    // Recipient e-mail address.
                    Msg.To.Add(txt_user.Value);
                    Msg.Subject = "Password Details";
                    Msg.Body = "Hi, <br/>Please check your Login Detailss<br/><br/>Your Username: " + lds.Tables[0].Rows[0]["str_email_id"] + "<br/><br/>Your Password: " + lds.Tables[0].Rows[0]["str_password"] + "<br/><br/> Click Hear To Login : http://localhost:2628/login/consumer/1";
                    Msg.IsBodyHtml = true;
                    // your remote SMTP server IP.
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.Credentials = new System.Net.NetworkCredential("nikdarji03@gmail.com", "7801995354darji");
                    smtp.EnableSsl = true;
                    smtp.Send(Msg);
                    //Msg = null;
                    divmess.InnerText = "Your Password Details Sent to your mail";
                    //lblmess.InnerHtml = "Your Bill Details Sent to your mail";
                    divmess.Attributes.Add("class", "alert alert-success");
                    // Clear the textbox valuess
                    txt_user.Value = "";
                    ddl_user.ClearSelection();
                }
                else
                {
                    divmess.InnerHtml = "Sorry,Invalid Email ID.";
                    divmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void snd_mail_other()
        {
            try
            {
                user_login loginbal = new user_login();
                DataSet lds = loginbal.forgot_password(txt_user.Value, ddl_user.SelectedItem.Value);

                if (lds != null && lds.Tables[0].Rows.Count > 0)
                {
                    MailMessage Msg = new MailMessage();
                    // Sender e-mail address.
                    Msg.From = new MailAddress("nikdarji03@gmail.com");
                    // Recipient e-mail address.
                    Msg.To.Add(txt_user.Value);
                    Msg.Subject = "Password Details";
                    if (ddl_user.SelectedItem.Value == "1")
                    {
                        Msg.Body = "Hi, <br/>Please check your Login Detailss<br/><br/>Your Username: " + lds.Tables[0].Rows[0]["str_email_id"] + "<br/><br/>Your Password: " + lds.Tables[0].Rows[0]["str_password"] + "<br/><br/> Click Hear To Login : http://localhost:2628/login/consumer/1";
                    }
                    else if (ddl_user.SelectedItem.Value == "2")
                    {
                        Msg.Body = "Hi, <br/>Please check your Login Detailss<br/><br/>Your Username: " + lds.Tables[0].Rows[0]["str_email_id_p"] + "<br/><br/>Your Password: " + lds.Tables[0].Rows[0]["str_password"] + "<br/><br/> Click Hear To Login :http://localhost:2628/login/orgnization/2";
                    }
                    else if (ddl_user.SelectedItem.Value == "3")
                    {
                        Msg.Body = "Hi, <br/>Please check your Login Detailss<br/><br/>Your Username: " + lds.Tables[0].Rows[0]["str_email_id_p"] + "<br/><br/>Your Password: " + lds.Tables[0].Rows[0]["str_password"] + "<br/><br/> Click Hear To Login : http://localhost:2628/login/retailer/3";
                    }
                    else if (ddl_user.SelectedItem.Value == "4")
                    {
                        Msg.Body = "Hi, <br/>Please check your Login Detailss<br/><br/>Your Username: " + lds.Tables[0].Rows[0]["str_email_id_p"] + "<br/><br/>Your Password: " + lds.Tables[0].Rows[0]["str_password"] + "<br/><br/> Click Hear To Login : http://localhost:2628/login/small-business/4";
                    }
                    //Msg.Body = "Hi, <br/><br/>" + Session["email"].ToString() + " <p>Thank you for Donation For</p>" + Session["org_name"].ToString();
                    Msg.IsBodyHtml = true;
                    // your remote SMTP server IP.
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.Credentials = new System.Net.NetworkCredential("nikdarji03@gmail.com", "7801995354darji");
                    smtp.EnableSsl = true;
                    smtp.Send(Msg);
                    //Msg = null;
                    divmess.InnerText = "Your Password Details Sent to your mail";
                    //lblmess.InnerHtml = "Your Bill Details Sent to your mail";
                    divmess.Attributes.Add("class", "alert alert-success");
                    // Clear the textbox valuess
                    txt_user.Value = "";
                    ddl_user.ClearSelection();
                }
                else
                {
                    divmess.InnerHtml = "Sorry,Invalid Email ID.";
                    divmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}