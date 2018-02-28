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
    public partial class electrician_connectlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["utype"] != null)
                {
                    if (Session["utype"].ToString() != "3")
                    {
                        if (Request["sid"] != null)
                            bindConnectList(Request.QueryString["sid"]);
                    }
                    else
                    {
                        bindConnectList(Session["subcatid"].ToString());
                    }

                }
                else
                    Response.Redirect("~/login/consumer/3?rd_url=" + Request.Url.ToString());



            }
        }

        private void bindConnectList(string subcat)
        {
            try
            {
                int _totalrecord = 0;
                string sp = "";
                DataSet dt = new DataSet();
                
                tbl_connect_bal objbal = new tbl_connect_bal();


                if (subcat == "5")
                    sp = "usp_select_tbl_connect_post";
                else if (subcat == "2")
                    sp = "usp_select_tbl_connect_car_rent";
                else if (subcat == "26")
                    sp = "usp_select_tbl_connect_appartment_rent";
                else if (subcat == "28" || subcat == "29")
                    sp = "usp_select_tbl_connect_home_sellbuy";



                dt = objbal.connect_select("where int_user_id=" + Session["cid"].ToString(), 1, 0, out _totalrecord, sp);
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

        protected void lnk_details_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            string subcat = lnk.CommandArgument.Split(',')[0];
            string postid = lnk.CommandArgument.Split(',')[1];

            if (subcat == "2")
                Response.Redirect("connect_car_rental.aspx?postid=" + postid);
            else if (subcat == "5")
                Response.Redirect("requestpage.aspx?postid=" + postid);
            else if (subcat == "26")
                Response.Redirect("connect_appartmet_rental.aspx?postid=" + postid);
            else if (subcat == "28" || subcat == "29")
                Response.Redirect("connect_home_sellbuy.aspx?postid=" + postid);
        }


    }
}