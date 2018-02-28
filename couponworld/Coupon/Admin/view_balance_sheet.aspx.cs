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

namespace Coupon.Admin
{
    public partial class view_balance_sheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["pageindex"] = "1";
                ViewState["cnd"] = "";
                ViewState["c_order"] = "asc";
                ViewState["amt"] = "0";
                BindGrid("", 1);
                ddl_state_bind();
                ddl_city_bind();
                ddl_share_bind();
                ddl_retaieler_type_bind();
                ddl_small_business_type_bind();
                ddl_retaieler_name_bind();
                ddl_retaieler_no_bind();
                ddl_sb_no_bind();
                ddl_sb_name_bind();
                ddl_member_name_bind();
                ddl_member_no_bind();
                // totalsal();

            }
        }


        public string totalsal()
        {
            tbl_transaction_bal objbal = new tbl_transaction_bal();
            DataSet ds = objbal.total();
            //lbl_total_amt.Text = ds.Tables[0].Rows[0][0].ToString();

            return Convert.ToString(ds);

        }
        //public string total_amt()
        //{
        //    tbl_transaction_bal objbal = new tbl_transaction_bal();
        //    DataSet ds = objbal.total();
        //    if (ds != null)
        //        lbl_total_amt.Text = ds.Tables[0].Rows[0][0].ToString();
        //    else
        //        return lbl_total_amt.Text;

        //}

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

        protected void ddl_share_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_share_type_bal objbal = new tbl_share_type_bal();
                DataSet ds = objbal.share_type_Select(" ", 1, 0, out totalrecord);

                ddl_share_type.DataValueField = "int_share_type_id";
                ddl_share_type.DataTextField = "str_share_type";

                ddl_share_type.DataSource = ds;
                ddl_share_type.DataBind();

                ddl_share_type.Items.Insert(0, new ListItem("-- Search by Fee Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_retaieler_type_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_types_bal objbal = new tbl_types_bal();
                DataSet ds = objbal.types_Select(" ", 1, 0, out totalrecord);

                ddl_type.DataValueField = "int_type_id";
                ddl_type.DataTextField = "str_type_name";

                ddl_type.DataSource = ds;
                ddl_type.DataBind();

                ddl_type.Items.Insert(0, new ListItem("-- Search by Retailer Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_small_business_type_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_small_business_type_bal objbal = new tbl_small_business_type_bal();
                DataSet ds = objbal.small_business_types_Select(" ", 1, 0, out totalrecord);

                ddl_sb_type.DataValueField = "int_small_business_type_id";
                ddl_sb_type.DataTextField = "str_small_business_type_name";

                ddl_sb_type.DataSource = ds;
                ddl_sb_type.DataBind();

                ddl_sb_type.Items.Insert(0, new ListItem("-- Search by Small Business Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_retaieler_name_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_retailer_bal objbal = new tbl_retailer_bal();
                DataSet ds = objbal.retailer_Select(" ", 1, 0, out totalrecord);

                ddl_retailer_name.DataValueField = "int_retailer_id";
                ddl_retailer_name.DataTextField = "str_retailer_name";

                ddl_retailer_name.DataSource = ds;
                ddl_retailer_name.DataBind();

                ddl_retailer_name.Items.Insert(0, new ListItem("-- Search by Retailer Name --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_retaieler_no_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_retailer_bal objbal = new tbl_retailer_bal();
                DataSet ds = objbal.retailer_Select(" ", 1, 0, out totalrecord);

                ddl_retailer_no.DataValueField = "int_retailer_id";
                ddl_retailer_no.DataTextField = "int_retailer_id";

                ddl_retailer_no.DataSource = ds;
                ddl_retailer_no.DataBind();

                ddl_retailer_no.Items.Insert(0, new ListItem("-- Search by Retailer Number --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_sb_name_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_small_business_bal objbal = new tbl_small_business_bal();
                DataSet ds = objbal.small_business_Select(" ", 1, 0, out totalrecord);

                ddl_small_business_name.DataValueField = "int_small_business_id";
                ddl_small_business_name.DataTextField = "str_name";

                ddl_small_business_name.DataSource = ds;
                ddl_small_business_name.DataBind();

                ddl_small_business_name.Items.Insert(0, new ListItem("-- Search by SB Name --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_sb_no_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_small_business_bal objbal = new tbl_small_business_bal();
                DataSet ds = objbal.small_business_Select(" ", 1, 0, out totalrecord);

                ddl_sb_no.DataValueField = "int_small_business_id";
                ddl_sb_no.DataTextField = "int_small_business_id";

                ddl_sb_no.DataSource = ds;
                ddl_sb_no.DataBind();

                ddl_sb_no.Items.Insert(0, new ListItem("-- Search by SB Number --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_member_name_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_member_bal objbal = new tbl_member_bal();
                DataSet ds = objbal.member_Select(" ", 1, 0, out totalrecord);

                ddl_member_name.DataValueField = "int_user_id";
                ddl_member_name.DataTextField = "str_first_name";

                ddl_member_name.DataSource = ds;
                ddl_member_name.DataBind();

                ddl_member_name.Items.Insert(0, new ListItem("-- Search by Consumer Name --", "0"));
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddl_member_no_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_member_bal objbal = new tbl_member_bal();
                DataSet ds = objbal.member_Select(" ", 1, 0, out totalrecord);

                ddl_member_no.DataValueField = "int_user_id";
                ddl_member_no.DataTextField = "int_user_id";

                ddl_member_no.DataSource = ds;
                ddl_member_no.DataBind();

                ddl_member_no.Items.Insert(0, new ListItem("-- Search by Consumer Number --", "0"));
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
                        cnd = " where  CONVERT(date, date_trans_date, 101) BETWEEN '" + txt_start_date.Value + "' AND '" + txt_end_date.Value + "' ";
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + "  CONVERT(date, date_trans_date, 101) BETWEEN '" + txt_start_date.Value + "' AND '" + txt_end_date.Value + "'  ";
                }
                if (ddl_retailer_name.SelectedIndex > 0)
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = "where int_retailer_id='" + ddl_retailer_name.SelectedItem.Value + "' ";
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " int_retailer_id='" + ddl_retailer_name.SelectedItem.Value + "'  ";
                }
                if (ddl_retailer_no.SelectedIndex > 0)
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = "where int_retailer_id = '" + ddl_retailer_no.SelectedItem.Value + "' ";
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " int_retailer_id='" + ddl_retailer_no.SelectedItem.Value + "'  ";
                }
                if (ddl_type.SelectedIndex > 0)
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = " where int_type_id = " + ddl_type.SelectedItem.Value;
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " int_type_id = " + ddl_type.SelectedItem.Value;
                }
                if (ddl_small_business_name.SelectedIndex > 0)
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = "where int_small_business_id='" + ddl_small_business_name.SelectedItem.Value + "' ";
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " int_small_business_id='" + ddl_small_business_name.SelectedItem.Value + "'  ";
                }
                if (ddl_sb_no.SelectedIndex > 0)
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = "where int_small_business_id = '" + ddl_sb_no.SelectedItem.Value + "' ";
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " int_small_business_id = '" + ddl_sb_no.SelectedItem.Value + "'  ";
                }
                if (ddl_sb_type.SelectedIndex > 0)
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = " where int_small_business_type_id=" + ddl_sb_type.SelectedItem.Value;
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " int_small_business_type_id=" + ddl_sb_type.SelectedItem.Value;
                }
                if (ddl_member_name.SelectedIndex > 0)
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = "where int_user_id='" + ddl_member_name.SelectedItem.Value + "' ";
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " int_user_id='" + ddl_member_name.SelectedItem.Value + "'  ";
                }
                if (ddl_member_no.SelectedIndex > 0)
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = "where int_user_id = '" + ddl_member_no.SelectedItem.Value + "' ";
                    else
                        cnd = cnd + " " + rbloption.SelectedItem.Text + " int_user_id = '" + ddl_member_no.SelectedItem.Value + "'  ";
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

        protected void lnk_del_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnk = (LinkButton)sender;

                tbl_transaction_bal objbal = new tbl_transaction_bal();
                tbl_transaction_entity objentity = new tbl_transaction_entity();

                for (int i = 0; i < rpview.Items.Count; i++)
                {
                    CheckBox chkDelete = (CheckBox)rpview.Items[i].FindControl("chkDelete");
                    HiddenField hdnID = (HiddenField)rpview.Items[i].FindControl("hdnid");

                    if (chkDelete.Checked)
                    {
                        objentity.int_trans_id = Convert.ToInt16(hdnID.Value);
                        objbal.transaction_delete(objentity);
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
            Response.Redirect("country_details.aspx");
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

                DataSet dt = objbal.transaction_Select(ViewState["cnd"].ToString(), 1, 0, out totalcount, "asc", "str_first_name");
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

                DataSet dt = objbal.transaction_Select(ViewState["cnd"].ToString(), 1, 0, out totalcount, "asc", "str_first_name");
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
        decimal Total = 0;
        protected void rpview_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblamt = (Label)e.Item.FindControl("lbl_purchase");
                //gives the sum in string Total.                 
                Total += Convert.ToDecimal(lblamt.Text);
            }
            else if (e.Item.ItemType == ListItemType.Footer)
            {
                Label lbltotal = (Label)e.Item.FindControl("lbl_total");
                lbltotal.Text = Total.ToString();
                // The following label displays the total
                //    Label1.Text = TotalCost;

            }
            //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.Separator)
            //{
            //    Label lblamt = (Label)e.Item.FindControl("lbl_purchase");

            //    if (ViewState["amt"].ToString() == "0")
            //    {
            //        ViewState["amt"] = lblamt.Text;
            //    }
            //    else
            //    {
            //        ViewState["amt"] = Convert.ToDecimal(ViewState["amt"].ToString()) + Convert.ToDecimal(lblamt.Text);
            //    }

            //}
            //else if (e.Item.ItemType == ListItemType.Footer)
            //{
            //    Label lbltotal = (Label)e.Item.FindControl("lbl_total");
            //    lbltotal.Text = ViewState["amt"].ToString();

            //    ViewState["amt"] = "0";
            //}
        }
    }
}