using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using Coupon_Entity;
using System.Data;
using System.Configuration;


namespace Coupon.connect
{
    public partial class requestpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                com1.Enabled = false;
                txt_location.Text = Session["zipcode"].ToString();

                if (!IsPostBack)
                {
                    if (Request["postid"] != null)
                        bindData(Request.QueryString["postid"]);
                }

            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            int _lval = 0;
            try
            {
                tbl_connect_entity objentity = new tbl_connect_entity();
                tbl_connect_bal objbal = new tbl_connect_bal();


                objentity.str_no_of_days = ddl_days.SelectedItem.Text;
                objentity.str_approx_budget = txt_min_cost.Text + "-" + txt_max_cost.Text;
                objentity.str_zip_code = txt_location.Text;
                objentity.str_title = txt_title.Text;
                objentity.str_details = txt_Details.Text;
                objentity.int_user_id = Convert.ToInt32(Session["cid"].ToString());

                if (Request["postid"] == null)
                {
                    objentity.int_category_id = Convert.ToInt32(Request.QueryString["cid"]);
                    objentity.int_service_id = Convert.ToInt32(Request.QueryString["sid"]);
                    _lval = objbal.connect_insert(objentity);
                }
                else
                {
                    objentity.int_post_id = Convert.ToInt32(Request.QueryString["postid"]);
                    _lval = objbal.connect_update(objentity);
                }

                if (_lval > 0)
                {


                    if (Request["postid"] == null)
                    {
                        lblmessage.InnerHtml = "Thanks for Posting Connect Request.it will be live once admin approve it.";
                        // sendmail(objentity.int_service_id.ToString(), _lval.ToString());
                        sendmailadmin(objentity.int_service_id.ToString(), _lval.ToString());
                    }
                    else
                    {
                        lblmessage.InnerHtml = "Connect Post Updated Successfully.";
                    }
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "openModel('message-modal')", true);


                    lblmessage.Attributes.Add("class", "alert alert-success");


                }
                else
                {
                    lblmessage.InnerHtml = "Sorry, there may be any issue to save this post.";
                    lblmessage.Attributes.Add("class", "alert alert-danger");
                }



            }
            catch (Exception ex)
            {

            }
        }

        public void sendmailadmin(string servid, string pid)
        {
            string _path = Server.MapPath("~/EmailTemplate/ConnetMailToAdmin.html");
            string html = System.IO.File.ReadAllText(_path);

            string stremail = ConfigurationManager.AppSettings["adminemail"];

            if (!string.IsNullOrEmpty(html) && !string.IsNullOrEmpty(stremail))
            {
                html = html.Replace("#fullname", Session["consumerfullname"].ToString());
                html = html.Replace("#title", txt_title.Text);
                html = html.Replace("#date", System.DateTime.Now.ToString("MM-dd-yyyy"));
                html = html.Replace("#location", string.IsNullOrEmpty(txt_location.Text) == true ? "NA" : txt_location.Text);
                html = html.Replace("#budget", chk_cost.Checked == true ? "NA" : "$" + txt_min_cost.Text + " To $" + txt_max_cost.Text);
                html = html.Replace("#days", ddl_days.SelectedItem.Text);
                html = html.Replace("#details", txt_Details.Text);
                html = html.Replace("#reviewurl", appConstant.websiteurl + "/admin/view_connect_request.aspx");

                Cls_Common.sendMailNew(stremail, "New Job post in the Connect.", html.ToString());
            }




        }

        public string getAllMerchantEmail(string servid)
        {
            string stremails = "";
            int totalrecords = 0;
            tbl_retailer_bal objbal = new tbl_retailer_bal();

            string query = " where int_connect_sub=" + servid;


            DataSet ds = objbal.retailer_Select(query, 1, 0, out totalrecords);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    stremails = stremails + "," + ds.Tables[0].Rows[i]["str_email_id_p"].ToString();
                }
            }

            return stremails.Trim(',');
        }

        protected void lnk_back_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/consumer-profile"));
        }

        public void bindData(string postid)
        {
            try
            {
                DataSet ds = null;
                int totalrecords = 0;
                tbl_connect_bal objbal = new tbl_connect_bal();

                string sp = "usp_select_tbl_connect_post";
                ds = objbal.connect_select(" where int_post_id = " + postid, 1, 0, out totalrecords, sp);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    txt_min_cost.Text = ds.Tables[0].Rows[0]["dec_approx_budget"].ToString().Split('-')[0];
                    txt_max_cost.Text = ds.Tables[0].Rows[0]["dec_approx_budget"].ToString().Split('-')[1];

                    ddl_days.ClearSelection();
                    ddl_days.Items.FindByText(ds.Tables[0].Rows[0]["int_no_of_days"].ToString()).Selected = true;

                    txt_Details.Text = ds.Tables[0].Rows[0]["str_details"].ToString();
                    txt_title.Text = ds.Tables[0].Rows[0]["str_title"].ToString();
                    txt_location.Text = ds.Tables[0].Rows[0]["str_zip_code"].ToString();
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}