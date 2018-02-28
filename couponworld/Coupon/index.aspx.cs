using Coupon_Bal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Connect_Home.MenuId = 1;

                BindGrid("", 1);
                BindTreadingGrid("", 1);
            }
            //Cls_Common.sendMail("purav.topi@gmail.com", "Test", "Test", "");


        }
        protected void BindGrid(string query, int pageindex, string columnname = "str_offer_name", string sortorder = "asc")
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                tbl_offer_bal objbal = new tbl_offer_bal();



                string today_date = System.DateTime.Now.ToString("yyyy-MM-dd");

                query = " where bit_accept='True' and '" + today_date + "'>= CAST(date_start_date as Date) and '" + today_date + "'<=CAST(date_end_date as Date)";

                dt = objbal.offer_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rpview.DataSource = dt.Tables[0].AsEnumerable().Take(4).CopyToDataTable();
                    rpview.DataBind();

                    rptreading.DataSource = dt.Tables[0].AsEnumerable().Take(6).CopyToDataTable();
                    rptreading.DataBind();
                }
                else
                {
                    rpview.DataSource = null;
                    rpview.DataBind();
                }



                //query = " where bit_is_featured='True'";

                //dt = objbal.offer_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                //if (dt.Tables[0].Rows.Count > 0)
                //{
                //    rptreading.DataSource = dt.Tables[0].AsEnumerable().Take(6).CopyToDataTable();
                //    rptreading.DataBind();
                //}
                //else
                //{
                //    rptreading.DataSource = null;
                //    rptreading.DataBind();
                //}
                //PopulatePager(totalcount, pageindex);
                //lblcount.Text = totalcount.ToString();
            }
            catch (Exception ex)
            {
            }
        }

        protected void BindTreadingGrid(string query, int pageindex, string columnname = "str_offer_name", string sortorder = "asc")
        {

            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                tbl_offer_bal objbal = new tbl_offer_bal();



                string today_date = System.DateTime.Now.ToString("yyyy-MM-dd");

                query = " where bit_accept='True' and '" + today_date + "'>= CAST(date_start_date as Date) and '" + today_date + "'<=CAST(date_end_date as Date)";


                query = " where bit_is_featured='True'";

                dt = objbal.offer_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rptreading.DataSource = dt.Tables[0].AsEnumerable().Take(6).CopyToDataTable();
                    rptreading.DataBind();
                }
                else
                {
                    rptreading.DataSource = null;
                    rptreading.DataBind();
                }

            }
            catch (Exception ex)
            {
            }
        }
    }
}