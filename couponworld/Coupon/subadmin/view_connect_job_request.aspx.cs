using Coupon_Bal;
using Coupon_Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon.subadmin
{
    public partial class view_connect_job_request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["pageindex"] = "1";
                ViewState["cnd"] = "";
                ViewState["c_order"] = "asc";
                BindGrid("", 1);
                ddl_bind_reason();

            }
        }

        protected void ddl_bind_reason()
        {

            try
            {

                tbl_connect_bal objbal = new tbl_connect_bal();
                DataSet ds = objbal.connect_reject_reason_select();

                ddl_reason.DataTextField = "str_reason";
                ddl_reason.DataValueField = "int_id";

                ddl_reason.DataSource = ds;
                ddl_reason.DataBind();

                ddl_reason.Items.Insert(0, new ListItem(" -- Select Reason --", "0"));

                ddl_reason_5.DataTextField = "str_reason";
                ddl_reason_5.DataValueField = "int_id";

                ddl_reason_5.DataSource = ds;
                ddl_reason_5.DataBind();

                ddl_reason_5.Items.Insert(0, new ListItem(" -- Select Reason --", "0"));

                ddl_26_reason.DataTextField = "str_reason";
                ddl_26_reason.DataValueField = "int_id";

                ddl_26_reason.DataSource = ds;
                ddl_26_reason.DataBind();

                ddl_26_reason.Items.Insert(0, new ListItem(" -- Select Reason --", "0"));

                ddl_28_reason.DataTextField = "str_reason";
                ddl_28_reason.DataValueField = "int_id";

                ddl_28_reason.DataSource = ds;
                ddl_28_reason.DataBind();

                ddl_28_reason.Items.Insert(0, new ListItem(" -- Select Reason --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void Page_Changed(object sender, EventArgs e)
        {
            int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
            ViewState["pageindex"] = pageIndex;
            this.BindGrid(" ", pageIndex);
        }

        protected void BindGrid(string query, int pageindex, string columnname = "int_post_id", string sortorder = "desc")
        {
            try
            {
                string subcat, sp = "";
                int totalcount;
                DataSet dt = new DataSet();

                subcat = Request.QueryString["sid"];

                if (subcat == "5")
                    sp = "usp_select_tbl_connect_post";
                else if (subcat == "2")
                    sp = "usp_select_tbl_connect_car_rent";
                else if (subcat == "26")
                    sp = "usp_select_tbl_connect_appartment_rent";
                else if (subcat == "28" || subcat == "29")
                    sp = "usp_select_tbl_connect_home_sellbuy";




                tbl_connect_bal objbal = new tbl_connect_bal();

                dt = objbal.connect_select(query, pageindex, 10, out totalcount, sp);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rpview.DataSource = dt;
                    rpview.DataBind();
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,No Data Found...!!!";
                    //lblmess.Attributes.Add("class", "alert alert-danger");
                    rpview.DataSource = null;
                    rpview.DataBind();
                }
                PopulatePager(totalcount, pageindex);
                //lblcount.Text = totalcount.ToString();
            }
            catch (Exception ex)
            {
            }
        }

        private void PopulatePager(int recordCount, int currentPage)
        {
            List<ListItem> pages = new List<ListItem>();
            int startIndex, endIndex;
            int pagerSpan = 5;

            //Calculate the Start and End Index of pages to be displayed.
            double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(10));
            int pageCount = (int)Math.Ceiling(dblPageCount);




            startIndex = currentPage > 1 && currentPage + pagerSpan - 1 < pagerSpan ? currentPage : 1;
            endIndex = pageCount > pagerSpan ? pagerSpan : pageCount;
            if (currentPage > pagerSpan % 2)
            {
                if (currentPage == 2)
                {
                    endIndex = 5;
                }
                else
                {
                    endIndex = currentPage + 2;
                }
            }
            else
            {
                endIndex = (pagerSpan - currentPage) + 1;
            }

            if (endIndex - (pagerSpan - 1) > startIndex)
            {
                startIndex = endIndex - (pagerSpan - 1);
            }

            if (endIndex > pageCount)
            {
                endIndex = pageCount;
                startIndex = ((endIndex - pagerSpan) + 1) > 0 ? (endIndex - pagerSpan) + 1 : 1;
            }

            //Add the First Page Button.
            if (currentPage > 1)
            {
                pages.Add(new ListItem("First", "1"));
            }

            //Add the Previous Button.
            if (currentPage > 1)
            {
                pages.Add(new ListItem("<<", (currentPage - 1).ToString()));
            }

            for (int i = startIndex; i <= endIndex; i++)
            {
                pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
            }

            //Add the Next Button.
            if (currentPage < pageCount)
            {
                pages.Add(new ListItem(">>", (currentPage + 1).ToString()));
            }

            //Add the Last Button.
            if (currentPage != pageCount)
            {
                pages.Add(new ListItem("Last", pageCount.ToString()));
            }

            if (recordCount > 0)
            {
                lbl_page_no.InnerText = currentPage.ToString();
                lbl_total_page.InnerText = pageCount.ToString();


                rptPager.DataSource = pages;
                rptPager.DataBind();
            }
            else
            {
                div_page.Style.Add("display", "none");

                rptPager.DataSource = null;
                rptPager.DataBind();
            }

        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "";
                if (!string.IsNullOrEmpty(txtsearch.Value))
                {
                    query = " where str_retailer_name like '%" + txtsearch.Value + "%' OR str_corporate_name like '%" + txtsearch.Value + "%' ";
                }
                BindGrid(query, 1);
            }
            catch (Exception ex)
            {
            }
        }

        protected void lnk_del_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnk = (LinkButton)sender;
                tbl_retailer_bal objbal = new tbl_retailer_bal();
                tbl_retailer_entity objentity = new tbl_retailer_entity();
                for (int i = 0; i < rpview.Items.Count; i++)
                {
                    CheckBox chkDelete = (CheckBox)rpview.Items[i].FindControl("chkDelete");
                    HiddenField hdnID = (HiddenField)rpview.Items[i].FindControl("hdnid");

                    if (chkDelete.Checked)
                    {
                        objentity.int_retailer_id = Convert.ToInt16(hdnID.Value);
                        objbal.retailer_delete(objentity);
                    }
                }
                BindGrid("", 1);
            }
            catch (Exception ex)
            {
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Index.aspx");
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("retailer_details.aspx");
        }

        protected void lnk_retailer_name_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            sortorder(lnk.CommandArgument);
        }

        private void sortorder(string colname)
        {
            try
            {
                int pageindex = Convert.ToInt16(ViewState["pageindex"]);
                string query = ViewState["cnd"].ToString();

                if (string.IsNullOrEmpty(ViewState["cnd"].ToString()))
                    query = " where  1=1 ";
                else
                    query = ViewState["cnd"].ToString();


                if (ViewState["c_order"].ToString().ToUpper() == "ASC")
                    ViewState["c_order"] = "DESC";
                else if (ViewState["c_order"].ToString().ToUpper() == "DESC")
                    ViewState["c_order"] = "ASC";

                ViewState["o_column"] = colname;

                BindGrid(query, pageindex, ViewState["o_column"].ToString(), ViewState["c_order"].ToString());
            }
            catch (Exception ex)
            {
            }
        }

        protected void checkAll_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                CheckBox chkAll = (CheckBox)sender;
                Repeater grid;
                grid = rpview;
                for (int i = 0; i < grid.Items.Count; i++)
                {
                    //Repeater row = grid.Items[i];
                    if (chkAll.Checked == true)
                        ((CheckBox)grid.Items[i].FindControl("chkDelete")).Checked = true;
                    else ((CheckBox)grid.Items[i].FindControl("chkDelete")).Checked = false;
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void chkHeader_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                CheckBox chkAll = (CheckBox)sender;
                Repeater grid;
                grid = rpview;
                for (int i = 0; i < grid.Items.Count; i++)
                {
                    //Repeater row = grid.Items[i];
                    if (chkAll.Checked == true)
                        ((CheckBox)grid.Items[i].FindControl("chkDelete")).Checked = true;
                    else ((CheckBox)grid.Items[i].FindControl("chkDelete")).Checked = false;
                }
            }
            catch (Exception ex)
            {
            }
        }

        //protected void lnk_active_status_Click(object sender, EventArgs e)
        //{
        //    tbl_retailer_bal objbal = new tbl_retailer_bal();
        //    int lVal = objbal.retailer_active(ddl_share_type.SelectedItem.Value, txt_mar.Text, txt_share_amount.Text, ViewState["rid"].ToString(), ddl_marketing_type.SelectedItem.Value, ddl_connect_fee.SelectedItem.Value, txt_connect_fee.Text);

        //    if (lVal > 0)
        //    {
        //        BindGrid("", 1);
        //        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "closeModel('company-modal')", true);

        //    }
        //}

        protected void lnk_details_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            DataSet ds = null;
            int totalrecords = 0;
            tbl_connect_bal objbal = new tbl_connect_bal();

            string subcat, sp = "";


            subcat = Request.QueryString["sid"];

            if (subcat == "5")
            {
                sp = "usp_select_tbl_connect_post";
                ds = objbal.connect_select(" where int_post_id = " + lnk.CommandArgument, 1, 0, out totalrecords, sp);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lbl_cost.Text = ds.Tables[0].Rows[0]["dec_approx_budget"].ToString();
                    lbl_days.Text = ds.Tables[0].Rows[0]["int_no_of_days"].ToString();
                    lbl_details.Text = ds.Tables[0].Rows[0]["str_details"].ToString();
                    lbl_heading.InnerText = ds.Tables[0].Rows[0]["str_title"].ToString();
                    lbl_location.Text = ds.Tables[0].Rows[0]["str_zip_code"].ToString();
                }
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "openModel('model_5')", true);
            }
            else if (subcat == "2")
            {
                sp = "usp_select_tbl_connect_car_rent";
                ds = objbal.connect_select(" where int_post_id = " + lnk.CommandArgument, 1, 0, out totalrecords, sp);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lbl_age.Text = ds.Tables[0].Rows[0]["int_age"].ToString();
                    lbl_price.Text = "$ " + ds.Tables[0].Rows[0]["str_price"].ToString();
                    lbl_details_2.Text = ds.Tables[0].Rows[0]["str_details"].ToString();
                    lbl_heading_2.InnerText = ds.Tables[0].Rows[0]["str_title"].ToString();
                    lbl_pickup_date.Text = ds.Tables[0].Rows[0]["date_pickup_date"].ToString().Split(' ')[0];

                    lbl_pickup_location.Text = ds.Tables[0].Rows[0]["str_pick_location"].ToString();
                    lbl_return_date.Text = ds.Tables[0].Rows[0]["date_return_date"].ToString().Split(' ')[0];
                    lbl_v_class.Text = appConstant.getVechicleClass(ds.Tables[0].Rows[0]["int_vech_class"].ToString());
                    lbl_v_type.Text = appConstant.getVechicleType(ds.Tables[0].Rows[0]["int_vech_type"].ToString());
                    lbl_cap.Text = ds.Tables[0].Rows[0]["int_capacity"].ToString();
                }
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "openModel('model_2')", true);
            }
            else if (subcat == "26")
            {
                sp = "usp_select_tbl_connect_appartment_rent";
                ds = objbal.connect_select(" where int_post_id = " + lnk.CommandArgument, 1, 0, out totalrecords, sp);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lbl_26_bath.Text = ds.Tables[0].Rows[0]["int_bath_room"].ToString();
                    lbl_26_bed.Text = ds.Tables[0].Rows[0]["int_bed_room"].ToString();
                    lbl_26_credit.Text = ds.Tables[0].Rows[0]["int_credit_range"].ToString();
                    lbl_26_deposit.Text = ds.Tables[0].Rows[0]["bit_have_deposit"].ToString();
                    lbl_26_details.Text = ds.Tables[0].Rows[0]["str_details"].ToString();

                    lbl_26_location.Text = ds.Tables[0].Rows[0]["str_location"].ToString();
                    lbl_26_monthly_payment.Text = ds.Tables[0].Rows[0]["dec_approx_budget"].ToString();
                    lbl_26_month.Text = ds.Tables[0].Rows[0]["str_month"].ToString();
                    lbl_26_monthly_payment.Text = ds.Tables[0].Rows[0]["dec_approx_budget"].ToString();
                    lbl_26_rental_type.Text = appConstant.getRentalType(ds.Tables[0].Rows[0]["int_rental_type"].ToString());

                    lbl_heading_26.InnerText = ds.Tables[0].Rows[0]["str_title"].ToString();

                }
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "openModel('model_26')", true);

            }
            else if (subcat == "28" || subcat == "29")
            {
                sp = "usp_select_tbl_connect_home_sellbuy";
                ds = objbal.connect_select(" where int_post_id = " + lnk.CommandArgument, 1, 0, out totalrecords, sp);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lbl_28_bath.Text = ds.Tables[0].Rows[0]["int_bath_room"].ToString();
                    lbl_28_bed.Text = ds.Tables[0].Rows[0]["int_bed_room"].ToString();
                    lbl_28_credit.Text = appConstant.getCreditRang(ds.Tables[0].Rows[0]["int_credit_range"].ToString());
                    lbl_28_deposit.Text = ds.Tables[0].Rows[0]["bit_have_deposit"].ToString();
                    lbl_28_details.Text = ds.Tables[0].Rows[0]["str_details"].ToString();
                    lbl_28_location.Text = ds.Tables[0].Rows[0]["str_location"].ToString();

                    lbl_28_price.Text = "$" + ds.Tables[0].Rows[0]["dec_approx_budget_min"].ToString() + " - $" + ds.Tables[0].Rows[0]["dec_approx_budget_max"].ToString();
                    lbl_28_sqft.Text = appConstant.getSqFtRang(ds.Tables[0].Rows[0]["int_SqFt_id"].ToString());
                    lbl_28_monthly.Text = ds.Tables[0].Rows[0]["int_monthly_payment"].ToString();
                    lbl_28_home_type.Text = appConstant.getRentalType(ds.Tables[0].Rows[0]["int_home_type"].ToString());

                    lbl_heading_28.InnerText = ds.Tables[0].Rows[0]["str_title"].ToString();

                }
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "openModel('model_28')", true);

            }
            ViewState["rid"] = lnk.CommandArgument;


        }

        protected void lnk_accept_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_connect_bal objbal = new tbl_connect_bal();
                tbl_connect_entity objentity = new tbl_connect_entity();


                objentity.int_post_id = Convert.ToInt32(ViewState["rid"].ToString());
                objentity.int_service_id = Convert.ToInt32(Request.QueryString["sid"]);

                int val = objbal.connect_request_accept(objentity);

                if (val > 0)
                {
                    BindGrid("", 1);

                    if (objentity.int_service_id == 5)
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "closeModel('model_5')", true);
                    else if (objentity.int_service_id == 2)
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "closeModel('model_2')", true);
                    else if (objentity.int_service_id == 26)
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "closeModel('model_26')", true);
                    else if (objentity.int_service_id == 28 || objentity.int_service_id == 29)
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "closeModel('model_28')", true);
                    //sendacceptmail(ViewState["rid"].ToString());
                    //sendmail(ViewState["rid"].ToString());
                }

            }
            catch (Exception ex)
            {


            }
        }

        protected void lnk_reject_Click(object sender, EventArgs e)
        {
            div_reason.Attributes.Add("style", "display:block");
            div_buttons.Attributes.Add("style", "display:none");
            div_reject_button.Attributes.Add("style", "display:block");
        }

        protected void lnk_reject_final_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_connect_bal objbal = new tbl_connect_bal();
                tbl_connect_entity objentity = new tbl_connect_entity();

                string subcat = Request.QueryString["sid"];

                if (subcat == "5")
                    objentity.int_reject_reason = Convert.ToInt16(ddl_reason.SelectedItem.Value);
                else if (subcat == "2")
                    objentity.int_reject_reason = Convert.ToInt16(ddl_reason_5.SelectedItem.Value);
                else if (subcat == "26")
                    objentity.int_reject_reason = Convert.ToInt16(ddl_26_reason.SelectedItem.Value);
                else if (subcat == "28")
                    objentity.int_reject_reason = Convert.ToInt16(ddl_28_reason.SelectedItem.Value);


                objentity.int_service_id = Convert.ToInt32(subcat);
                objentity.int_post_id = Convert.ToInt32(ViewState["rid"].ToString());

                int val = objbal.connect_request_reject(objentity);

                if (val > 0)
                {
                    BindGrid("", 1);


                    if (subcat == "5")
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "closeModel('model_5')", true);
                    else if (subcat == "2")
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "closeModel('model_2')", true);
                    else if (subcat == "26")
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "closeModel('model_26')", true);
                    else if (subcat == "28" || subcat == "29")
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "closeModel('model_28')", true);


                    sendrejectmail(objentity.int_post_id.ToString());
                }


            }
            catch (Exception ex)
            {


            }

        }

        protected void lnk_back_Click(object sender, EventArgs e)
        {
            div_reason.Attributes.Add("style", "display:none");
            div_buttons.Attributes.Add("style", "display:block");
            div_reject_button.Attributes.Add("style", "display:none");
        }

        public string getStatus(string int_post_id)
        {
            int totalrecord = 0;
            string _lval = "Pendding";
            tbl_connect_bal objbal = new tbl_connect_bal();
            DataSet ds = objbal.connect_select(" where int_post_id=" + int_post_id, 1, 0, out totalrecord, "");

            if (ds.Tables[0].Rows[0]["bit_is_approved"].ToString() == "True")
            {
                _lval = "Accept";
            }
            else if (ds.Tables[0].Rows[0]["bit_is_reject"].ToString() == "True")
            {
                _lval = "Reject";
            }

            return _lval;

        }

        public void sendacceptmail(string pid)
        {
            string _path = Server.MapPath("~/EmailTemplate/ConnectAcceptMailToConsumer.html");
            string html = System.IO.File.ReadAllText(_path);


            DataSet ds = getPostDetails(pid);
            string stremail = getconusmeremail(ds.Tables[0].Rows[0]["int_user_id"].ToString());



            if (!string.IsNullOrEmpty(html) && !string.IsNullOrEmpty(stremail))
            {

                html = html.Replace("#title", ds.Tables[0].Rows[0]["str_title"].ToString());
                html = html.Replace("#date", ds.Tables[0].Rows[0]["date_post_date"].ToString().Split(' ')[0]);
                html = html.Replace("#location", string.IsNullOrEmpty(ds.Tables[0].Rows[0]["str_zip_code"].ToString()) == true ? "NA" : ds.Tables[0].Rows[0]["str_zip_code"].ToString());
                html = html.Replace("#budget", ds.Tables[0].Rows[0]["dec_approx_budget"].ToString());
                html = html.Replace("#days", ds.Tables[0].Rows[0]["int_no_of_days"].ToString());
                html = html.Replace("#details", ds.Tables[0].Rows[0]["str_details"].ToString());


                // Cls_Common.sendMailNew(stremail + ",purav.topi@gmail.com", "Congratulation,Job accepted on sevaconnect.", html.ToString());
                Cls_Common.sendMailNew(stremail, "Congratulation,Job accepted on sevaconnect.", html.ToString());
            }


        }

        public void sendrejectmail(string pid)
        {
            string _path = Server.MapPath("~/EmailTemplate/ConnectRejectMailToConsumer.html");
            string html = System.IO.File.ReadAllText(_path);


            DataSet ds = getPostDetails(pid);
            string stremail = getAllMerchantEmail(ds.Tables[0].Rows[0]["int_user_id"].ToString());



            if (!string.IsNullOrEmpty(html) && !string.IsNullOrEmpty(stremail))
            {

                html = html.Replace("#title", ds.Tables[0].Rows[0]["str_title"].ToString());
                html = html.Replace("#date", ds.Tables[0].Rows[0]["date_post_date"].ToString().Split(' ')[0]);
                html = html.Replace("#location", string.IsNullOrEmpty(ds.Tables[0].Rows[0]["str_zip_code"].ToString()) == true ? "NA" : ds.Tables[0].Rows[0]["str_zip_code"].ToString());
                html = html.Replace("#budget", ds.Tables[0].Rows[0]["dec_approx_budget"].ToString());
                html = html.Replace("#days", ds.Tables[0].Rows[0]["int_no_of_days"].ToString());
                html = html.Replace("#details", ds.Tables[0].Rows[0]["str_details"].ToString());
                html = html.Replace("#reason", ds.Tables[0].Rows[0]["str_reason"].ToString());

                //Cls_Common.sendMailNew(stremail + ",purav.topi@gmail.com", "Sorry,Job rejected on sevaconnect.", html.ToString());
                Cls_Common.sendMailNew(stremail, "Sorry,Job rejected on sevaconnect.", html.ToString());
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

        public DataSet getPostDetails(string id)
        {
            int totalrecords = 0;
            tbl_connect_bal objbal = new tbl_connect_bal();
            DataSet ds = objbal.connect_select(" where int_post_id = " + id, 0, 0, out totalrecords, "asc", "str_title");

            return ds;
        }

        public void sendmail(string pid)
        {
            string _path = Server.MapPath("~/EmailTemplate/ConnectMailToMerchant.html");
            string html = System.IO.File.ReadAllText(_path);

            DataSet ds = getPostDetails(pid);
            string stremail = getAllMerchantEmail(ds.Tables[0].Rows[0]["int_service_id"].ToString());



            if (!string.IsNullOrEmpty(html) && !string.IsNullOrEmpty(stremail))
            {
                html = html.Replace("#fullname", ds.Tables[0].Rows[0]["str_retailer_name"].ToString());
                html = html.Replace("#title", ds.Tables[0].Rows[0]["str_title"].ToString());
                html = html.Replace("#date", ds.Tables[0].Rows[0]["date_post_date"].ToString().Split(' ')[0]);
                html = html.Replace("#location", string.IsNullOrEmpty(ds.Tables[0].Rows[0]["str_zip_code"].ToString()) == true ? "NA" : ds.Tables[0].Rows[0]["str_zip_code"].ToString());
                html = html.Replace("#budget", ds.Tables[0].Rows[0]["dec_approx_budget"].ToString());
                html = html.Replace("#days", ds.Tables[0].Rows[0]["int_no_of_days"].ToString());
                html = html.Replace("#details", ds.Tables[0].Rows[0]["str_details"].ToString());
                html = html.Replace("#reviewurl", appConstant.websiteurl + "/connect/postdetails.aspx?pid=" + pid);

                Cls_Common.sendMailNew(stremail, "Hurry up! New Job post in the Connect.", html.ToString());
            }


        }

        public string getconusmeremail(string consmerid)
        {
            string stremails = "";
            int totalrecords = 0;
            tbl_member_bal objbal = new tbl_member_bal();

            string query = " where int_user_id=" + consmerid;


            DataSet ds = objbal.member_Select(query, 1, 0, out totalrecords);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {

                stremails = stremails + "," + ds.Tables[0].Rows[0]["str_email_id"].ToString();

            }

            return stremails.Trim(',');

        }

        protected void lnk_reject_5_Click(object sender, EventArgs e)
        {
            div_reason_5.Attributes.Add("style", "display:block");
            div_buttons_5.Attributes.Add("style", "display:none");
            div_reject_button_5.Attributes.Add("style", "display:block");
        }

        protected void lnk_reject_26_Click(object sender, EventArgs e)
        {
            div_reason_26.Attributes.Add("style", "display:block");
            div_buttons_26.Attributes.Add("style", "display:none");
            div_reject_button_26.Attributes.Add("style", "display:block");
        }

        protected void lnk_reject_28_Click(object sender, EventArgs e)
        {
            div_reason_28.Attributes.Add("style", "display:block");
            div_buttons_28.Attributes.Add("style", "display:none");
            div_reject_button_28.Attributes.Add("style", "display:block");
        }


    }
}