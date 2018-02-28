﻿using Coupon_Bal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Entity;
using System.IO;

namespace Coupon.Admin
{
    public partial class view_member_report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["pageindex"] = "1";
                ViewState["cnd"] = "";
                ViewState["c_order"] = "asc";
                BindGrid("", 1);
                ddl_state_bind();
                ddl_city_bind();
                ddl_org_bind();
                ddl_company_bind();
            }
        }
        //" where int_state_id=" + ddl_state.SelectedItem.Value
        protected void ddl_city_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_city_bal objbal = new tbl_city_bal();
                DataSet ds = objbal.city_Select("", 1, 0, out totalrecord);

                ddl_city.DataValueField = "int_city_id";
                ddl_city.DataTextField = "str_city_name";

                ddl_city.DataSource = ds;
                ddl_city.DataBind();

                ddl_city.Items.Insert(0, new ListItem("-- Search by City --", "0"));
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

                ddl_state.Items.Insert(0, new ListItem("-- Search by State --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_org_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_organization_bal objbal = new tbl_organization_bal();
                DataSet ds = objbal.organization_Select(" ", 1, 0, out totalrecord);

                ddl_organization.DataValueField = "int_organization_id";
                ddl_organization.DataTextField = "str_organization_name";

                ddl_organization.DataSource = ds;
                ddl_organization.DataBind();

                ddl_organization.Items.Insert(0, new ListItem("-- Search by Organization --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_company_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_company_bal objbal = new tbl_company_bal();
                DataSet ds = objbal.company_Select(" ", 1, 0, out totalrecord);

                ddl_company.DataValueField = "int_company_id";
                ddl_company.DataTextField = "str_company_name";

                ddl_company.DataSource = ds;
                ddl_company.DataBind();

                ddl_company.Items.Insert(0, new ListItem("-- Search by Company --", "0"));
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

        protected void BindGrid(string query, int pageindex, string columnname = "str_first_name", string sortorder = "asc")
        {
            try
            {
                ViewState["cnd"] = query;
                int totalcount;
                DataSet dt = new DataSet();

                tbl_member_bal objbal = new tbl_member_bal();

                dt = objbal.member_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
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
                lbl_total.Text = "Search Result:- " + totalcount.ToString();
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
                string cnd = "";

                if (ddl_state.SelectedIndex > 0)
                {
                    cnd = " where int_state_id=" + ddl_state.SelectedItem.Value;
                }

                if (ddl_city.SelectedIndex > 0)
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = " where int_city_id=" + ddl_city.SelectedItem.Value;
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " int_city_id=" + ddl_city.SelectedItem.Value;
                }
                if (ddl_gender.SelectedIndex > 0)
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = "where str_gender='" + ddl_gender.SelectedItem.Value + "' ";
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " str_gender='" + ddl_gender.SelectedItem.Value + "'  ";
                }
                if (ddl_organization.SelectedIndex > 0)
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = " where int_organization_id=" + ddl_organization.SelectedItem.Value;
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " int_organization_id=" + ddl_organization.SelectedItem.Value;
                }
                if (ddl_company.SelectedIndex > 0)
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = " where int_company_id=" + ddl_company.SelectedItem.Value;
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " int_company_id=" + ddl_company.SelectedItem.Value;
                }
                if (!string.IsNullOrEmpty(txt_zipcode.Value))
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = "where int_zip_code like '%" + txt_zipcode.Value + "%' ";
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " int_zip_code like '%" + txt_zipcode.Value + "%'";
                }
                if (!string.IsNullOrEmpty(txt_start_date.Value) && !string.IsNullOrEmpty(txt_end_date.Value))
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = " where  CONVERT(date, str_date_of_birth, 101) BETWEEN '" + txt_start_date.Value + "' AND '" + txt_end_date.Value + "' ";
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + "  CONVERT(date, str_date_of_birth, 101) BETWEEN '" + txt_start_date.Value + "' AND '" + txt_end_date.Value + "'  ";
                }
                if (!string.IsNullOrEmpty(txt_name_search.Value))
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = "where str_first_name like '%" + txt_name_search.Value + "%' ";
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " str_first_name like '%" + txt_name_search.Value + "%'";
                }
                if (!string.IsNullOrEmpty(txt_search_no.Value))
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = "where int_user_id = '" + txt_search_no.Value + "' ";
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " int_user_id = '" + txt_search_no.Value + "'";
                }

                //string query = "";
                //if (!string.IsNullOrEmpty(txtsearch.Value))
                //{
                //    query = " where str_first_name like '%" + txtsearch.Value + "%' OR str_city_name like '%" + txtsearch.Value + "%' OR str_short_name like '%" + txtsearch.Value + "%'OR str_email_id like '%" + txtsearch.Value + "%'";
                //}
                //lbl_total.Text =
                BindGrid(cnd, 1);
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

                tbl_member_bal objbal = new tbl_member_bal();
                tbl_member_entity objentity = new tbl_member_entity();

                for (int i = 0; i < rpview.Items.Count; i++)
                {
                    CheckBox chkDelete = (CheckBox)rpview.Items[i].FindControl("chkDelete");
                    HiddenField hdnID = (HiddenField)rpview.Items[i].FindControl("hdnid");

                    if (chkDelete.Checked)
                    {
                        objentity.int_user_id = Convert.ToInt64(hdnID.Value);
                        objbal.member_delete(objentity);
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
            //Response.Redirect("type_details.aspx");
        }

        protected void lnk_first_name_Click(object sender, EventArgs e)
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

        //protected void checkAll_CheckedChanged(object sender, EventArgs e)
        //{
        //    //CheckBox chkAll = (CheckBox)sender;
        //    //Repeater grid;
        //    //grid = rpview;
        //    //for (int i = 0; i < grid.Items.Count; i++)
        //    //{
        //    //    //Repeater row = grid.Items[i];
        //    //    if (chkAll.Checked == true)
        //    //        ((CheckBox)grid.Items[i].FindControl("chkDelete")).Checked = true;
        //    //    else ((CheckBox)grid.Items[i].FindControl("chkDelete")).Checked = false;
        //    //}
        //}

        //protected void chkHeader_CheckedChanged(object sender, EventArgs e)
        //{
        //    CheckBox chkAll = (CheckBox)sender;
        //    Repeater grid;
        //    grid = rpview;
        //    for (int i = 0; i < grid.Items.Count; i++)
        //    {
        //        //Repeater row = grid.Items[i];
        //        if (chkAll.Checked == true)
        //            ((CheckBox)grid.Items[i].FindControl("chkDelete")).Checked = true;
        //        else ((CheckBox)grid.Items[i].FindControl("chkDelete")).Checked = false;
        //    }
        //}

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_city_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_gender_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void ExportGridToExcel(DataTable dt, string FileName)
        {
            try
            {
                if (dt.Rows.Count > 0)
                {
                    string filename = FileName + ".xls";
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AppendHeader("Content-Disposition",
                                          "attachment; filename=" + filename + "");

                    System.IO.StringWriter tw = new System.IO.StringWriter();
                    System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
                    DataGrid dgGrid = new DataGrid();
                    gvtemp.DataSource = dt;
                    gvtemp.DataBind();
                    gvtemp.Visible = true;

                    //Get the HTML for the control.
                    gvtemp.RenderControl(hw);
                    //Write the HTML back to the browser.
                    //Response.ContentType = application/vnd.ms-excel;

                    this.EnableViewState = false;
                    Response.Write(tw.ToString());
                    Response.End();
                    gvtemp.Visible = false;
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_export_excel_Click(object sender, EventArgs e)
        {
            try
            {
                int totalcount = 0;
                tbl_member_bal objbal = new tbl_member_bal();

                DataSet dt = objbal.member_Select(ViewState["cnd"].ToString(), 1, 0, out totalcount, "asc", "str_first_name");
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rpview.DataSource = dt;
                    rpview.DataBind();
                }

                ExportGridToExcel(dt.Tables[0], "member_" + System.DateTime.Now.ToString());
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_pdf_Click(object sender, EventArgs e)
        {
            try
            {
                int totalcount = 0;
                tbl_member_bal objbal = new tbl_member_bal();

                DataSet dt = objbal.member_Select(ViewState["cnd"].ToString(), 1, 0, out totalcount, "asc", "str_first_name");
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rpview.DataSource = dt;
                    rpview.DataBind();
                }
                ExportToPDF(dt.Tables[0], "member_" + System.DateTime.Now.ToString());
            }
            catch (Exception ex)
            {
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        protected void ExportToPDF(DataTable dt, string Filename)
        {
            //Create a dummy GridView
            try
            {
                if (dt.Rows.Count > 0)
                {
                    string filename = Filename + ".pdf";
                    gvtemp.DataSource = dt;
                    gvtemp.DataBind();

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition",
                        "attachment;filename=" + filename + "");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    StringWriter sw = new StringWriter();
                    HtmlTextWriter hw = new HtmlTextWriter(sw);
                    gvtemp.Visible = true;
                    gvtemp.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    iTextSharp.text.Document pdfDoc = new iTextSharp.text.Document(iTextSharp.text.PageSize.A4, 10f, 10f, 10f, 0f);
                    iTextSharp.text.html.simpleparser.HTMLWorker htmlparser = new iTextSharp.text.html.simpleparser.HTMLWorker(pdfDoc);
                    iTextSharp.text.pdf.PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();
                    Response.Write(pdfDoc);
                    Response.End();
                    gvtemp.Visible = false;
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}