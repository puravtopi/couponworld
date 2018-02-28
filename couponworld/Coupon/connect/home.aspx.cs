using Coupon_Bal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coupon.connect
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                bindCategory(); 
        }

        private void bindCategory()
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();
                string query = " where bit_is_show='True'";
                tbl_connect_category_bal objbal = new tbl_connect_category_bal();

                dt = objbal.cat_select(query, 1, 0, out totalcount);
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
             
            }
            catch (Exception ex)
            {
            }
        
        }
    }
}