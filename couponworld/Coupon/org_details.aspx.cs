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
    public partial class org_details : System.Web.UI.Page
    {
        string oid = "0";

        protected void Page_Load(object sender, EventArgs e)
        {
            oid = Page.RouteData.Values["oid"].ToString();
            if (!IsPostBack)
            {
                BindGrid(" where int_organization_id = " + oid, 1);
            }

        }


        protected void BindGrid(string query, int pageindex, string columnname = "str_organization_name", string sortorder = "asc")
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                tbl_organization_bal objbal = new tbl_organization_bal();

                dt = objbal.organization_Select(query, pageindex, 20, out totalcount, sortorder, columnname);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rpview.DataSource = dt;
                    rpview.DataBind();
                    Session["org_name"] = dt.Tables[0].Rows[0]["str_organization_name"].ToString();
                }
                else
                {
                    rpview.DataSource = null;
                    rpview.DataBind();
                }
                //PopulatePager(totalcount, pageindex);
                //lbl_total.Text = " Showing all " + totalcount.ToString() + " results";
            }
            catch (Exception ex)
            {
            }
        }

        protected void lnk_gift_Click(object sender, EventArgs e)
        {
            tbl_donation_bal objbal = new tbl_donation_bal();
            tbl_donation_entity objentity = new tbl_donation_entity();

            Session["name"] = objentity.str_name = txt_name.Text;
            Session["message"] = objentity.str_message = txt_msg.Value;
            Session["orgid"] = objentity.int_organization_id = Convert.ToInt64(oid);
            Session["amount"] = objentity.str_amount = txt_amt.Text;
            Session["date"] = objentity.date_date_time = Convert.ToDateTime(DateTime.Now.ToString());
            Session["email"] = objentity.str_email_id = txt_email.Text;
            Session["address"] = objentity.str_address = txt_address.Value;

            string redirecturl = "";

            //Mention URL to redirect content to paypal site
            redirecturl += "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=" + ConfigurationManager.AppSettings["paypalemail"].ToString();

            //First name i assign static based on login details assign this value
            redirecturl += "&first_name = " + txt_name.Text;

            //City i assign static based on login user detail you change this value
            redirecturl += "&city=chennai";

            //State i assign static based on login user detail you change this value
            redirecturl += "&state=tamilnadu";

            //Product Name
            redirecturl += "&item_name=Donation";

            //Product Amount
            redirecturl += "&amount = " + txt_amt.Text;

            //Business contact id
            //redirecturl += "&business=nravindranmca@gmail.com";

            //Shipping charges if any
            redirecturl += "&shipping=0";

            //Handling charges if any
            redirecturl += "&handling=0";

            //Tax amount if any
            redirecturl += "&tax=0";

            ////Add quatity i added one only statically 
            //redirecturl += "&quantity=1";

            //Currency code 
            redirecturl += "&currency=USD";

            //Success return page url
            redirecturl += "&return=" + ConfigurationManager.AppSettings["SuccessURL"].ToString();

            //Failed return page url
            redirecturl += "&cancel_return=" + ConfigurationManager.AppSettings["FailedURL"].ToString();

            Response.Redirect(redirecturl);

        }
    }
}