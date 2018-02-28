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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btn_login_Click(object sender, EventArgs e)
        {
            try
            {
                string lid = this.Page.RouteData.Values["lid"].ToString();
                user_login loginbal = new user_login();
                DataSet lds = loginbal.Check_Login(txt_user.Value, txt_password.Value, lid);

                if (lds != null && lds.Tables[0].Rows.Count > 0)
                {
                    Session["uname"] = txt_user.Value;
                    Session["utype"] = lid;
                    if (lid == "1")
                    {
                        Session["cid"] = lds.Tables[0].Rows[0]["int_user_id"].ToString();
                        Session["consumer"] = lds.Tables[0].Rows[0]["str_first_name"].ToString();
                        Session["consumerfullname"] = lds.Tables[0].Rows[0]["str_first_name"].ToString() + " " + lds.Tables[0].Rows[0]["str_last_name"].ToString();
                        Session["zipcode"] = lds.Tables[0].Rows[0]["int_zip_code"].ToString();


                        HttpCookie cookie = new HttpCookie("Consumer");

                        cookie.Values.Add("cid", Session["cid"].ToString());
                        cookie.Values.Add("consumer", Session["consumer"].ToString());
                        cookie.Values.Add("consumerfullname", Session["consumerfullname"].ToString());
                        cookie.Values.Add("zipcode", Session["zipcode"].ToString());
                       

                        cookie.Expires = DateTime.Now.AddDays(1); // --------> cookie.Expires is the property you can set timeout

                        HttpContext.Current.Response.AppendCookie(cookie);


                        if (Request["rd_url"] == null)
                            Response.Redirect(ResolveUrl("~/consumer-profile"));
                        else
                            Response.Redirect(Request.QueryString["rd_url"].ToString());
                    }
                    else if (lid == "2")
                    {
                        Session["oid"] = lds.Tables[0].Rows[0]["int_organization_id"].ToString();
                        Session["org_name"] = lds.Tables[0].Rows[0]["str_organization_name"].ToString();
                        Response.Redirect(ResolveUrl("~/org-profile"));
                    }
                    else if (lid == "3")
                    {
                        Session["rid"] = lds.Tables[0].Rows[0]["int_retailer_id"].ToString();
                        Session["catid"] = lds.Tables[0].Rows[0]["int_connect_cat"].ToString();
                        Session["subcatid"] = lds.Tables[0].Rows[0]["int_connect_sub"].ToString();
                        Session["retailer_name"] = lds.Tables[0].Rows[0]["str_retailer_name"].ToString();
                        Session["marketingfee"] = lds.Tables[0].Rows[0]["int_organization_share"].ToString();
                        Session["marketingtype"] = lds.Tables[0].Rows[0]["int_marketing_type_id"].ToString();

                        HttpCookie cookie = new HttpCookie("Retailer");

                        cookie.Values.Add("rid", Session["rid"].ToString());
                        cookie.Values.Add("catid", Session["catid"].ToString());
                        cookie.Values.Add("subcatid", Session["subcatid"].ToString());
                        cookie.Values.Add("retailer_name", Session["retailer_name"].ToString());
                        cookie.Values.Add("marketingfee", Session["marketingfee"].ToString());
                        cookie.Values.Add("marketingtype", Session["marketingtype"].ToString());

                        cookie.Expires = DateTime.Now.AddDays(1); // --------> cookie.Expires is the property you can set timeout

                        HttpContext.Current.Response.AppendCookie(cookie);




                        if (Request["rd_url"] == null)
                            Response.Redirect(ResolveUrl("~/retailer-profile"));
                        else
                            Response.Redirect(Request.QueryString["rd_url"].ToString());

                      


                    }
                    else if (lid == "4")
                    {
                        Session["sid"] = lds.Tables[0].Rows[0]["int_small_business_id"].ToString();
                        Session["small_business_name"] = lds.Tables[0].Rows[0]["str_name"].ToString();
                        Response.Redirect("~/sb-profile");
                    }
                }
                else
                {
                    divmess.InnerHtml = "Sorry,Invalid User Name and Password";
                    divmess.Attributes.Add("class", "alert alert-danger");
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}