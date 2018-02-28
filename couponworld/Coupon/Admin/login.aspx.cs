using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using Coupon_Entity;
using System.Data;
using System.Data.SqlClient;

namespace Coupon.Admin
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
                login_bal admin = new login_bal();

                DataSet lds = admin.Check_Login(txt_user_id.Value, txt_pwd_id.Value);

                if (lds != null && lds.Tables[0].Rows.Count > 0)
                {

                    if (lds.Tables[0].Rows[0]["str_password"].ToString() == txt_pwd_id.Value)
                    {




                        Session["admin"] = txt_user_id.Value;
                        Session["user_name"] = lds.Tables[0].Rows[0]["str_user_name"].ToString();
                        HttpCookie cookie = new HttpCookie("Admin");

                        cookie.Values.Add("admin", Session["admin"].ToString());
                        cookie.Values.Add("user_name", Session["user_name"].ToString());

                        cookie.Expires = DateTime.Now.AddDays(1); // --------> cookie.Expires is the property you can set timeout

                        HttpContext.Current.Response.AppendCookie(cookie);



                        if (lds.Tables[0].Rows[0]["bit_is_sub_admin"].ToString() == "False")
                            Response.Redirect("index.aspx");
                        else
                            Response.Redirect("../subadmin/Dashboard.aspx");
                    }
                    else
                    {
                        divmess.Attributes.Add("style", "display:block");
                        divmess.InnerText = "Sorry,Invalid Login";
                    }
                }
                else
                {
                    divmess.Attributes.Add("style", "display:block");
                    divmess.InnerText = "Sorry,Invalid Login";
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}