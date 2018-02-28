using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Coupon_Bal;
using Coupon_Entity;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Net;
using System.IO;
using System.Xml;
using System.Web.Script.Serialization;

namespace Coupon
{
    public partial class user_master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // lbl_name.Text = GetIPAddress();
                //GetLocation("70.167.162.2");
                ddl_bind_state();
                ddl_bind_cities();
                //if (Session["uname"] != null)
                //{
                //    lbl_name.Text = Session["uname"].ToString();
                //}
                //if (Session["consumer"] != null)
                //    lbl_name.Text = Session["consumer"].ToString();
                //if (Session["org_name"] != null)
                //    lbl_name.Text = Session["org_name"].ToString();
                //if (Session["retailer_name"] != null)
                //    lbl_name.Text = Session["retailer_name"].ToString();
                //if (Session["small_business_name"] != null)
                //    lbl_name.Text = Session["small_business_name"].ToString();
            }
        }

        protected void ddl_bind_state()
        {
            int totalrecord = 0;
            tbl_state_bal objbal = new tbl_state_bal();
            DataSet ds = objbal.state_Select(" ", 1, 0, out totalrecord);

            ddl_state.DataValueField = "int_state_id";
            ddl_state.DataTextField = "str_state_name";

            ddl_state.DataSource = ds;
            ddl_state.DataBind();

            ddl_state.Items.Insert(0, new ListItem("-- Select Your State --", "0"));
        }

        protected void ddl_bind_city()
        {
            int totalrecord = 0;
            tbl_city_bal objbal = new tbl_city_bal();
            DataSet ds = objbal.city_Select(" where int_state_id=" + ddl_state.SelectedItem.Value, 1, 0, out totalrecord);

            ddl_city.DataValueField = "int_city_id";
            ddl_city.DataTextField = "str_city_name";

            ddl_city.DataSource = ds;
            ddl_city.DataBind();

            ddl_city.Items.Insert(0, new ListItem("-- Select Your City --", "0"));
        }
        protected void ddl_bind_cities()
        {
            int totalrecord = 0;
            tbl_city_bal objbal = new tbl_city_bal();
            DataSet ds = objbal.city_Select(" ", 1, 0, out totalrecord);

            //ddl_cities.DataValueField = "int_city_id";
            //ddl_cities.DataTextField = "str_city_name";

            //ddl_cities.DataSource = ds;
            //ddl_cities.DataBind();

            //ddl_cities.Items.Insert(0, new ListItem("-- Select Your City --", "0"));
        }

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_bind_city();
        }

        protected void ddl_city_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }

        protected void lnk_searck_Click(object sender, EventArgs e)
        {
            //Response.Redirect("products.aspx?search_id=" + txt_search.Text);
        }

        protected string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }

            return context.Request.ServerVariables["REMOTE_ADDR"];
        }

        private void GetLocation(string ipaddress)
        {
            string APIKey = "7f80462dff7e273038bc0b4cb40b7cd192af3198db042d1180e38eda79aa721a";
            string url = string.Format("http://api.ipinfodb.com/v3/ip-city/?key={0}&ip={1}&format=json", APIKey, ipaddress);
            using (WebClient client = new WebClient())
            {
                string json = client.DownloadString(url);
                Location location = new JavaScriptSerializer().Deserialize<Location>(json);
                List<Location> locations = new List<Location>();
                locations.Add(location);


            }
        }
    }

    public class Location
    {
        public string IPAddress { get; set; }
        public string CountryName { get; set; }
        public string CountryCode { get; set; }
        public string CityName { get; set; }
        public string RegionName { get; set; }
        public string ZipCode { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string TimeZone { get; set; }
    }
}