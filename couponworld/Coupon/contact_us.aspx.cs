using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;


namespace Coupon
{
    public partial class contact_us : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            MailMessage Msg = new MailMessage();
            // Sender e-mail address.
            Msg.From = new MailAddress(txt_email.Text);
            // Recipient e-mail address.
            Msg.To.Add("nikdarji03@gmail.com");
            Msg.Subject = "Contact Us";
            Msg.Body = "Hi, <br/><br/>" + txt_name.Text + "<br/><br/> Email Id :-" + txt_email.Text + "<br/><br/> Message :" + txt_msg.Value;
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
            txt_email.Text = string.Empty;
            txt_msg.Value = string.Empty;
            txt_name.Text = string.Empty;
        }
    }
}