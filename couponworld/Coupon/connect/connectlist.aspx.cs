using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Coupon_Bal;

namespace Coupon.connect
{
    public partial class connectlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["utype"] != null)
                {
                    if (Session["utype"].ToString() != "3")
                        Response.Redirect("~/login/consumer/3?rd_url=" + Request.Url.ToString());
                }
                else
                    Response.Redirect("~/login/consumer/3?rd_url=" + Request.Url.ToString());
               
                if (Session["catid"] != null)
                    bindConnectList(" where bit_is_approved='True' and int_service_id=" + Session["subcatid"].ToString(), 1);
                else
                    bindConnectList("", 1);
            }
        }

       
        private void bindConnectList(string query, int pageindex)
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                tbl_connect_bal objbal = new tbl_connect_bal();



                dt = objbal.connect_select(query, pageindex, 20, out totalcount,"");
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
                lbl_total.InnerText = " Showing all " + totalcount.ToString() + " results";
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
            double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(20));
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

        protected void Page_Changed(object sender, EventArgs e)
        {
            int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
            ViewState["pageindex"] = pageIndex;
            this.bindConnectList(" ", pageIndex);
        }

        public bool isapplied(string postid)
        {
            bool _lval = false;
            try
            {
                DataSet ds = new tbl_connect_bal().connect_reply_select(" where int_connect_id=" + postid + " and int_retailer_id=" + Session["rid"].ToString());

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                    _lval = true;
            }
            catch (Exception ex)
            {


            }
            return _lval;
        }
    }
}