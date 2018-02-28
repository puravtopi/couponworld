using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Entity;
using Coupon_Bal;
using System.Data;
using System.Configuration;


namespace Coupon
{
    public partial class company_details : System.Web.UI.Page
    {
        string cid = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            cid = Page.RouteData.Values["cid"].ToString();  
            if (!IsPostBack)
            {

                BindGrid(" where int_company_id = " + cid, 1);

            }
        }


        protected void BindGrid(string query, int pageindex, string columnname = "str_company_name", string sortorder = "asc")
        {
            try
            {
                //ViewState["cnd"] = query;
                int totalcount;
                DataSet dt = new DataSet();

                tbl_company_bal objbal = new tbl_company_bal();

                dt = objbal.company_Select(query, pageindex, 20, out totalcount, sortorder, columnname);
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
                //PopulatePager(totalcount, pageindex);
                //lbl_total.Text = " Showing all " + totalcount.ToString() + " results";
            }
            catch (Exception ex)
            {
            }
        }

    }
}