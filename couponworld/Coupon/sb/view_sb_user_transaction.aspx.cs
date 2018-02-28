using Coupon_Bal;
using Coupon_Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Coupon.sb
{
    public partial class view_sb_user_transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["pageindex"] = "1";
                ViewState["cnd"] = "";
                ViewState["c_order"] = "asc";
                BindGrid("", 1);

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

                if (string.IsNullOrEmpty(query))
                    query = " where int_small_business_id = " + Session["sid"];
                else
                    query = query + " and int_small_business_id = " + Session["sid"];


                tbl_transaction_bal objbal = new tbl_transaction_bal();

                dt = objbal.transaction_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
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
            try
            {
                string cnd = "";
                if (!string.IsNullOrEmpty(txt_receipt.Text))
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = "where str_receipt = '" + txt_receipt.Text + "' ";
                    //else
                    //    cnd = cnd + " " + rbloption.SelectedItem.Text + " str_receipt = '" + txt_receipt.Text + "'";
                }

                if (!string.IsNullOrEmpty(txt_start_date.Value) && !string.IsNullOrEmpty(txt_end_date.Value))
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = " where  CONVERT(date, date_trans_date, 101) BETWEEN '" + txt_start_date.Value + "' AND '" + txt_end_date.Value + "' ";
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + "  CONVERT(date, date_trans_date, 101) BETWEEN '" + txt_start_date.Value + "' AND '" + txt_end_date.Value + "'  ";
                }

                BindGrid(cnd, 1);
            }
            catch (Exception ex)
            {
            }


            //string query = "";
            //if (!string.IsNullOrEmpty(txtsearch.Value))
            //{
            //    query = " where str_first_name like '%" + txtsearch.Value + "%' OR str_retailer_name like '%" + txtsearch.Value + "%' OR str_offer_name like '%" + txtsearch.Value + "%'";
            //}
            //BindGrid(query, 1);
        }

        protected void lnk_trans_name_Click(object sender, EventArgs e)
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
                tbl_transaction_bal objbal = new tbl_transaction_bal();

                DataSet dt = objbal.transaction_Select(" where int_small_business_id =" + Session["sid"], 1, 0, out totalcount, "asc", "str_first_name");
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rpview.DataSource = dt;
                    rpview.DataBind();
                }

                ExportGridToExcel(dt.Tables[0], "transaction_" + System.DateTime.Now.ToString());
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
                tbl_transaction_bal objbal = new tbl_transaction_bal();

                DataSet dt = objbal.transaction_Select(" where int_small_business_id =" + Session["sid"], 1, 0, out totalcount, "asc", "str_first_name");
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rpview.DataSource = dt;
                    rpview.DataBind();
                }
                ExportToPDF(dt.Tables[0], "transaction_" + System.DateTime.Now.ToString());
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