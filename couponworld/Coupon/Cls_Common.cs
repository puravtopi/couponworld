using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Web;


namespace Coupon
{
    public class Cls_Common
    {
        //send mail function

        public static bool sendMailNew(String MailTo, String Subject, String Body)
        {
            String str = "0";
            try
            {
                using (SmtpClient smtpClient = new SmtpClient())
                {
                    smtpClient.Host = ConfigurationSettings.AppSettings["smtserver"].ToString();
                    smtpClient.EnableSsl = false;
                    smtpClient.Port = Convert.ToInt16(ConfigurationSettings.AppSettings["port"].ToString());
                    MailMessage message = new MailMessage();
                    MailAddress fromAddress = new MailAddress(ConfigurationSettings.AppSettings["femail"].ToString());
                    //MailAddress toAddress = new MailAddress(MailTo);
                    smtpClient.Credentials = new System.Net.NetworkCredential(ConfigurationSettings.AppSettings["femail"].ToString(), ConfigurationSettings.AppSettings["pass"].ToString());
                    message.From = fromAddress;

                    string[] multi = MailTo.ToString().Split(',');
                    foreach (string emailto in multi)
                    {
                        message.To.Add(new MailAddress(emailto));
                    }


                    message.IsBodyHtml = true;
                    message.Subject = Subject;
                    message.Body = Body;
                    smtpClient.Send(message);
                    str = "1";
                }
            }
            catch
            {
                str = "Connect TO Mail Failed";
            }
            return true;
        }

        public void setCookiesCosumer()
        {
            HttpCookie LoginCookie = HttpContext.Current.Request.Cookies.Get("Consumer"); // Credentials is the name of cookie

            if (LoginCookie == null)
            {
                HttpContext.Current.Response.Redirect(System.Web.VirtualPathUtility.ToAbsolute("~/home"));
            }
            else
            {
                HttpContext.Current.Session["cid"] = LoginCookie["cid"].ToString();
                HttpContext.Current.Session["consumer"] = LoginCookie["consumer"].ToString();
                HttpContext.Current.Session["consumerfullname"] = LoginCookie["consumerfullname"].ToString();
                HttpContext.Current.Session["zipcode"] = LoginCookie["zipcode"].ToString();
            }
        }

        public void setCookiesRetailer()
        {
            HttpCookie LoginCookie = HttpContext.Current.Request.Cookies.Get("Retailer"); // Credentials is the name of cookie

            if (LoginCookie == null)
            {
                HttpContext.Current.Response.Redirect(System.Web.VirtualPathUtility.ToAbsolute("~/home"));
            }
            else
            {
                HttpContext.Current.Session["rid"] = LoginCookie["rid"].ToString();
                HttpContext.Current.Session["catid"] = LoginCookie["catid"].ToString();
                HttpContext.Current.Session["subcatid"] = LoginCookie["subcatid"].ToString();
                HttpContext.Current.Session["retailer_name"] = LoginCookie["retailer_name"].ToString();
                HttpContext.Current.Session["marketingfee"] = LoginCookie["marketingfee"].ToString();
                HttpContext.Current.Session["marketingtype"] = LoginCookie["marketingtype"].ToString();

               

            }
        }
    }
}