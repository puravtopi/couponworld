using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Entity;
using Coupon_Bal;
using System.Data;

namespace Coupon
{
    public partial class view_retailer : System.Web.UI.Page
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
                ddl_type_bind();
            }
        }

        protected void ddl_city_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_city_bal objbal = new tbl_city_bal();
                DataSet ds = objbal.city_Select(" where int_state_id=" + ddl_state.SelectedItem.Value, 1, 0, out totalrecord);

                ddl_city.DataValueField = "int_city_id";
                ddl_city.DataTextField = "str_city_name";

                ddl_city.DataSource = ds;
                ddl_city.DataBind();

                ddl_city.Items.Insert(0, new ListItem("-- Select City --", "0"));
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

                ddl_state.Items.Insert(0, new ListItem("-- Select State --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_type_bind()
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

                ddl_type.Items.Insert(0, new ListItem("-- Select Type --", "0"));
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

        protected void BindGrid(string query, int pageindex, string columnname = "str_retailer_name", string sortorder = "asc")
        {
            try
            {
                //ViewState["cnd"] = query;
                int totalcount;
                DataSet dt = new DataSet();

                if (string.IsNullOrEmpty(query))

                    query = " where bit_isactive = 'True'";

                else
                    query = query + " and bit_isactive = 'True'";


                tbl_retailer_bal objbal = new tbl_retailer_bal();

                dt = objbal.retailer_Select(query, pageindex, 20, out totalcount, sortorder, columnname);
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
                //lbl_total.Text = " Showing all " + totalcount.ToString() + " results";
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

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_city_bind();
            //   searchparameter();
        }


        protected void btn_filter_Click(object sender, EventArgs e)
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
                        cnd = cnd + " and int_city_id=" + ddl_city.SelectedItem.Value;
                }
                if (ddl_type.SelectedIndex > 0)
                {
                    if (string.IsNullOrEmpty(cnd))
                        cnd = " where int_type_id =" + ddl_type.SelectedItem.Value;
                    else
                        cnd = cnd + " and int_type_id =" + ddl_type.SelectedItem.Value;
                }
                BindGrid(cnd, 1);
            }
            catch (Exception ex)
            {
            }
        }

    }
}