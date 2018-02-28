using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using Coupon_Entity;
using System.Data;
using System.Net.Mail;

namespace Coupon.Admin
{
    public partial class org_request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["pageindex"] = "1";
                ViewState["cnd"] = "";
                ViewState["c_order"] = "asc";
                BindGrid("", 1);

                ddl_bind_share_type();
                ddl_bind_type();
            }
        }

        protected void ddl_bind_share_type()
        {

            try
            {
                int totalrecords = 0;
                tbl_share_type_bal objbal = new tbl_share_type_bal();
                DataSet ds = objbal.share_type_Select("", 0, 0, out totalrecords);

                ddl_share_type.DataTextField = "str_share_type";
                ddl_share_type.DataValueField = "int_share_type_id";

                ddl_share_type.DataSource = ds;
                ddl_share_type.DataBind();

                ddl_share_type.Items.Insert(0, new ListItem(" -- Select Share Type --", "0"));

            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_bind_type()
        {

            try
            {
                int totalrecords = 0;
                tbl_organization_type_bal objbal = new tbl_organization_type_bal();
                DataSet ds = objbal.organization_type_Select("", 0, 0, out totalrecords);

                ddl_type.DataTextField = "str_organization_type";
                ddl_type.DataValueField = "int_organization_type_id";

                ddl_type.DataSource = ds;
                ddl_type.DataBind();

                ddl_type.Items.Insert(0, new ListItem(" -- Select Organization --", "0"));

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

        protected void BindGrid(string query, int pageindex, string columnname = "str_organization_name", string sortorder = "asc")
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                if (string.IsNullOrEmpty(query))

                    query = " where bit_isactive = 'False'";

                else
                    query = query + " and bit_isactive = 'False'";



                tbl_organization_bal objbal = new tbl_organization_bal();

                dt = objbal.organization_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rpview.DataSource = dt;
                    rpview.DataBind();
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,No Data Found...!!!";
                    //lblmess.Attributes.Add("class", "alert alert-danger");
                    //rpview.DataSource = null;
                    //rpview.DataBind();
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
                    query = " where str_organization_name like '%" + txtsearch.Value + "%' OR str_corporate_name like '%" + txtsearch.Value + "%' ";
                }
                BindGrid(query, 1);
            }
            catch (Exception ex)
            {
            }
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

        protected void lnk_view_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            int totalrecords = 0;
            tbl_organization_bal objbal = new tbl_organization_bal();
            DataSet ds = objbal.organization_Select(" where int_organization_id = " + lnk.CommandArgument, 0, 0, out totalrecords, "asc", "str_organization_name");

            if (ds.Tables[0].Rows.Count > 0)
            {
                lbl_name.Text = ds.Tables[0].Rows[0]["str_organization_name"].ToString();
                lbl_cname.Text = ds.Tables[0].Rows[0]["str_corporate_name"].ToString();
                lbl_email.Text = ds.Tables[0].Rows[0]["str_email_id_p"].ToString();
                lbl_add.Text = ds.Tables[0].Rows[0]["str_street_address"].ToString();
                lbl_state.Text = ds.Tables[0].Rows[0]["str_state_name"].ToString();
                lbl_city.Text = ds.Tables[0].Rows[0]["str_city_name"].ToString();
                lbl_zip.Text = ds.Tables[0].Rows[0]["int_zip_code"].ToString();
                // lbl_org_share.Text = ds.Tables[0].Rows[0]["int_organization_share"].ToString();
                lbl_tele_p.Text = ds.Tables[0].Rows[0]["str_telephone_p"].ToString();
                lbl_contact_p.Text = ds.Tables[0].Rows[0]["str_contact_1_p"].ToString();
                lbl_contact_s.Text = ds.Tables[0].Rows[0]["str_contact_2_s"].ToString();
                lbl_tele_s.Text = ds.Tables[0].Rows[0]["str_telephone_s"].ToString();
                lbl_email_s.Text = ds.Tables[0].Rows[0]["str_email_id_s"].ToString();
                //lbl_share_type.Text = ds.Tables[0].Rows[0]["int_share_type_id"].ToString();
                //lbl_share_amt.Text = ds.Tables[0].Rows[0]["dec_share_amount"].ToString();
                lbl_rno.Text = ds.Tables[0].Rows[0]["int_organization_id"].ToString();
                lbl_type.Text = ds.Tables[0].Rows[0]["str_organization_type"].ToString();
                //lbl_market_fee.Text = ds.Tables[0].Rows[0][""].ToString();
                lbl_web.Text = ds.Tables[0].Rows[0]["str_web_address"].ToString();
                img.ImageUrl = "/Admin/org_logo/" + ds.Tables[0].Rows[0]["str_logo_img"].ToString();
            }

            ViewState["rid"] = lnk.CommandArgument;
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "openModel('company-modal')", true);
        }

        protected void lnk_active_status_Click(object sender, EventArgs e)
        {
            tbl_organization_bal objbal = new tbl_organization_bal();
            int lVal = objbal.org_active(ddl_share_type.SelectedItem.Value, ddl_type.SelectedItem.Value, ViewState["rid"].ToString());

            if (lVal > 0)
            {
                BindGrid("", 1);
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "closeModel('company-modal')", true);

            }
        }
    }
}