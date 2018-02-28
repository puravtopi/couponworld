﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using Coupon_Entity;
using System.Data;

namespace Coupon.Admin.Report
{
    public partial class offer_report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["pageindex"] = "1";
                ViewState["cnd"] = "";
                ViewState["c_order"] = "asc";
                BindGrid("", 1);

                ddl_retailer_bind();
            }
        }

        protected void ddl_retailer_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_retailer_bal objbal = new tbl_retailer_bal();
                DataSet ds = objbal.retailer_Select(" ", 1, 0, out totalrecord);

                ddl_retailer.DataValueField = "int_retailer_id";
                ddl_retailer.DataTextField = "str_retailer_name";

                ddl_retailer.DataSource = ds;
                ddl_retailer.DataBind();

                ddl_retailer.Items.Insert(0, new ListItem("-- Select Retailer --", "0"));
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

        protected void BindGrid(string query, int pageindex, string columnname = "str_offer_name", string sortorder = "asc")
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                tbl_offer_bal objbal = new tbl_offer_bal();

                dt = objbal.offer_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rpview.DataSource = dt;
                    rpview.DataBind();
                }
                else
                {
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
            //string query = "";
            string cnd = "";

            if (ddl_retailer.SelectedIndex > 0)
            {
                cnd = " where int_retailer_id=" + ddl_retailer.SelectedItem.Value;
            }

            //if (!string.IsNullOrEmpty(txtsearch.Value))
            //{
            //    if (string.IsNullOrEmpty(cnd))
            //        cnd = "where str_offer_name like '%" + txtsearch.Value + "%'";
            //    else
            //        cnd = cnd + " and str_offer_name like '%" + txtsearch.Value + "%' ";
            //}

            if (!string.IsNullOrEmpty(txt_start_date.Value) && !string.IsNullOrEmpty(txt_end_date.Value))
            {
                if (string.IsNullOrEmpty(cnd))
                    cnd = "where CONVERT(date, date_start_date, 101) BETWEEN '%" + txt_start_date.Value + "%' OR date_end_date like '%" + txt_end_date.Value + "%'  ";
                else
                    cnd = cnd + " and CONVERT(date, date_start_date, 101) BETWEEN '%" + txt_start_date.Value + "%' date_end_date like '%" + txt_end_date.Value + "%'  ";
            }
            //if (!string.IsNullOrEmpty(txt_end_date.Value))
            //{
            //    if (string.IsNullOrEmpty(cnd))
            //        cnd = "where date_end_date like '%" + txt_end_date.Value + "%' ";
            //    else
            //        cnd = " and date_end_date like '%" + txt_end_date.Value + "%' ";
            //}
            //query = " ";
            BindGrid(cnd, 1);
        }

        protected void lnk_del_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnk = (LinkButton)sender;
                tbl_offer_bal objbal = new tbl_offer_bal();
                tbl_offer_entity objentity = new tbl_offer_entity();

                for (int i = 0; i < rpview.Items.Count; i++)
                {
                    CheckBox chkDelete = (CheckBox)rpview.Items[i].FindControl("chkDelete");
                    HiddenField hdnID = (HiddenField)rpview.Items[i].FindControl("hdnid");

                    if (chkDelete.Checked)
                    {
                        objentity.int_offer_id = Convert.ToInt16(hdnID.Value);
                        objbal.offer_delete(objentity);
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
            //Response.Redirect("offer_details.aspx");
        }

        protected void lnk_offer_name_Click(object sender, EventArgs e)
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

        protected void ddl_retailer_SelectedIndexChanged(object sender, EventArgs e)
        {

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

        protected void ddl_retailer_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}