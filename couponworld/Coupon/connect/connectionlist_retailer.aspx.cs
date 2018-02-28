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
    public partial class connectionlist_retailer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindConnectList();
            }
        }

        private void bindConnectList()
        {
            try
            {

                DataSet dt = new DataSet();

                tbl_retailer_bal objbal = new tbl_retailer_bal();

                //int _uid = Convert.ToInt32(Session["cid"].ToString());

                dt = objbal.retailer_connect_categorywise(Session["subcatid"].ToString());
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
                //lbl_total.InnerText = " Showing all " + totalcount.ToString() + " results";
            }
            catch (Exception ex)
            {
            }
        }

        private void bindConnectListSubcategory(int catid)
        {
            try
            {

                DataSet dt = new DataSet();

                tbl_member_bal objbal = new tbl_member_bal();

                int _uid = Convert.ToInt32(Session["cid"].ToString());

                dt = objbal.member_connect_subcategorywise(_uid, catid);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    rpviewsubcat.DataSource = dt;
                    rpviewsubcat.DataBind();
                }
                else
                {

                    rpviewsubcat.DataSource = null;
                    rpviewsubcat.DataBind();
                }
                //PopulatePager(totalcount, pageindex);
                //lbl_total.InnerText = " Showing all " + totalcount.ToString() + " results";
            }
            catch (Exception ex)
            {
            }
        }

        protected void lnk_cat_Click(object sender, EventArgs e)
        {

            LinkButton lnkcat = sender as LinkButton;

            int _catid = Convert.ToInt32(lnkcat.CommandArgument);

            bindConnectListSubcategory(_catid);

            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Guid.NewGuid().ToString(), "openModel('message-modal')", true);
        }

        protected void lnk_sub_cat_Click(object sender, EventArgs e)
        {
            LinkButton lnk_sub = sender as LinkButton;


            Response.Redirect("electrician_connectlist.aspx?sid=" + lnk_sub.CommandArgument);

        }
    }
}