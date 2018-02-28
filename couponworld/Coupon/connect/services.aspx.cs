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
    public partial class services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["cid"] != null)
                    bindService(Request.QueryString["cid"]);
            }
        }

        public void bindService(string catid)
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();
                string query = " where int_connect_cat_id=" + catid;
                tbl_connect_subcategory_bal objbal = new tbl_connect_subcategory_bal();

                dt = objbal.subcat_select(query, 1, 0, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rbl_serv.DataTextField = "str_sub_cat";
                    rbl_serv.DataValueField = "int_connect_sub_cat_id";

                    rbl_serv.DataSource = dt;
                    rbl_serv.DataBind();




                }
                else
                {
                    rbl_serv.DataSource = null;
                    rbl_serv.DataBind();
                }
                rbl_serv.Items.Insert(0, new ListItem("Services", "0"));
            }
            catch (Exception ex)
            {
            }

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            if (rbl_serv.SelectedItem.Value == "2")
                Response.Redirect("connect_car_rental.aspx?cid=" + Request.QueryString["cid"] + "&sid=" + rbl_serv.SelectedItem.Value);
            else if (rbl_serv.SelectedItem.Value == "5")
                Response.Redirect("requestpage.aspx?cid=" + Request.QueryString["cid"] + "&sid=" + rbl_serv.SelectedItem.Value);
            else if (rbl_serv.SelectedItem.Value == "26")
                Response.Redirect("connect_appartmet_rental.aspx?cid=" + Request.QueryString["cid"] + "&sid=" + rbl_serv.SelectedItem.Value);
            else if (rbl_serv.SelectedItem.Value == "28" || rbl_serv.SelectedItem.Value == "29")
                Response.Redirect("connect_home_sellbuy.aspx?cid=" + Request.QueryString["cid"] + "&sid=" + rbl_serv.SelectedItem.Value);
        }

    }
}