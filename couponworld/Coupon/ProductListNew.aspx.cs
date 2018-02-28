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
    public partial class ProductListNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Coupon_Site.MenuId = 4;
            string query = "";
            if (!IsPostBack)
            {
                ViewState["pageindex"] = "1";
                ViewState["cnd"] = "";
                ViewState["c_order"] = "asc";
                BindGrid("", 1);
                BindCategory("", 1);
                BindDis_type("", 1);
                //BindRetailer("", 1);
                //ddl_state_bind();
               
                if (Request["search_id"] != null)
                {

                    if (!string.IsNullOrEmpty(Request.QueryString["search_id"]))
                    {
                        query = " where str_offer_name like '%" + Request.QueryString["search_id"] + "%'";
                        // BindGrid(" where str_offer_name=" + Request.QueryString["search_id"], 1, "asc", "str_offer_name");
                    }
                }
            }
            BindGrid(query, 1, "str_offer_name", "asc");
        }

        protected void BindGrid(string query, int pageindex, string columnname = "str_offer_name", string sortorder = "asc")
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                tbl_offer_bal objbal = new tbl_offer_bal();

                if (string.IsNullOrEmpty(query))
                    query = " where bit_accept='True'";
                else
                    query = query + " and  bit_accept='True'";


                string today_date = System.DateTime.Now.ToString("yyyy-MM-dd");

                query = query + " and '" + today_date + "'>=CAST(date_start_date as Date) and '" + today_date + "'<=CAST(date_end_date as Date)";

                dt = objbal.offer_Select(query, pageindex, 20, out totalcount, sortorder, columnname);
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

        protected void btnsave_Click(object sender, EventArgs e)
        {

            //string txt = hidamt.Value;


            string query = "";

            if (string.IsNullOrEmpty(query))
                query = " where dec_discount_amount between " + txt_min_price.Text.Replace("$", "") + " AND " + txt_max_price.Text.Replace("$", "");

            BindGrid(query, 1);
        }

        protected void btn_clear_Click(object sender, EventArgs e)
        {
            txt_min_price.Text = string.Empty;
            txt_max_price.Text = string.Empty;
            BindGrid("", 1);
            //chk_category.ClearSelection();
            //chk_discount_type.ClearSelection();
        }

        protected void chk_category_SelectedIndexChanged(object sender, EventArgs e)
        {
            // System.Threading.Thread.Sleep(5000);
            searchparameter();
        }

        protected void searchparameter()
        {
            try
            {
                string query = "";

                string str = "";
                for (int i = 0; i < chk_category.Items.Count; i++)
                {
                    if (chk_category.Items[i].Selected)
                    {
                        str = chk_category.Items[i].Value;
                    }
                }

                if (str != "")
                {
                    query = " where int_category_id like '%" + str + "%'";
                    //query = " where int_category_id in (select int_offer_id from tbl_offer where int_category_id in (" + str + "))";
                }

                string dis = "";
                //for (int i = 0; i < chk_discount_type.Items.Count; i++)
                //{
                //    if (chk_discount_type.Items[i].Selected)
                //    {
                //        dis = chk_discount_type.Items[i].Value;
                //    }
                //}
                if (dis != "")
                {
                    if (string.IsNullOrEmpty(query))
                        query = " where int_discount_type_id like '%" + dis + "%'";
                    else
                        query = query + " and int_discount_type_id like '%" + dis + "%'";
                }
                //if (ddl_state.SelectedIndex > 0)
                //{
                //    if (string.IsNullOrEmpty(query))
                //        query = " where int_state_id=" + ddl_state.SelectedItem.Value;
                //    else
                //        query = query + " and int_state_id=" + ddl_state.SelectedItem.Value;
                //}

                //if (ddl_city.SelectedIndex > 0)
                //{
                //    if (string.IsNullOrEmpty(query))
                //        query = " where int_city_id=" + ddl_city.SelectedItem.Value;
                //    else
                //        query = query + " and int_city_id=" + ddl_city.SelectedItem.Value;
                //}

                //if (!string.IsNullOrEmpty(ViewState["search"].ToString()))
                //{
                //    query = query + " and str_retailer_name like '%" + ViewState["search"].ToString() + "%'";
                //    //BindGrid(" where str_retailer_name=" + lnk.CommandArgument, 1, "str_offer_name", "asc");
                //}
                BindGrid(query, 1);
            }
            catch (Exception ex)
            {
            }
        }

        protected void BindCategory(string query, int pageindex, string sortorder = "asc", string columnname = "str_category_name")
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                tbl_category_bal objbal = new tbl_category_bal();

                dt = objbal.category_Select(query, pageindex, 0, out totalcount, sortorder, columnname);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    chk_category.DataSource = dt;
                    chk_category.DataBind();
                }
                else
                {
                    chk_category.DataSource = null;
                    chk_category.DataBind();
                }
                //PopulatePager(totalcount, pageindex);
                //lblcount.Text = totalcount.ToString();
            }
            catch (Exception ex)
            {
            }
        }

        protected void chk_discount_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            //  System.Threading.Thread.Sleep(5000);
            searchparameter();
        }


        protected void BindDis_type(string query, int pageindex, string sortorder = "asc", string columnname = "str_discount_type")
        {
            try
            {
                int totalcount;
                DataSet dt = new DataSet();

                tbl_discount_type_bal objbal = new tbl_discount_type_bal();

                dt = objbal.discount_type_Select(query, pageindex, 10, out totalcount, sortorder, columnname);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    chk_discount_type.DataSource = dt;
                    chk_discount_type.DataBind();
                }
                else
                {
                    chk_discount_type.DataSource = null;
                    chk_discount_type.DataBind();
                }
                //PopulatePager(totalcount, pageindex);
                //lblcount.Text = totalcount.ToString();
            }
            catch (Exception ex)
            {
            }
        }

    }


}