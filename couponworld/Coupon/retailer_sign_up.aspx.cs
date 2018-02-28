using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Coupon_Bal;
using Coupon_Entity;
using System.Web.Services;
using System.Net;
using System.IO;
using System.Xml;

namespace Coupon
{
    public partial class retailer_sign_up : System.Web.UI.Page
    {
        protected static string ReCaptcha_Key = "6LekHjIUAAAAAL0QsqtYHFB_4guR4xRuvyfFVu2R";
        protected static string ReCaptcha_Secret = "6LekHjIUAAAAACD3kllXxVt7ayGyv81qPw-R0jQu";

        [WebMethod]
        public static string VerifyCaptcha(string response)
        {
            string url = "https://www.google.com/recaptcha/api/siteverify?secret=" + ReCaptcha_Secret + "&response=" + response;
            return (new WebClient()).DownloadString(url);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddl_state_bind();
                ddl_share_bind();
                ddl_category_bind();
                ddl_connect_category_bind();
            }
        }

        protected void ddl_city_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_city_bal objbal = new tbl_city_bal();
                DataSet ds = objbal.city_Select(" where int_state_id=" + ddl_state.SelectedItem.Value, 1, 0, out totalrecord);

                ddl_city.DataValueField = "int_city_id";
                ddl_city.DataTextField = "str_city_name";

                ddl_city.DataSource = ds;
                ddl_city.DataBind();

                ddl_city.Items.Insert(0, new ListItem("-- Select City --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_state_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_state_bal objbal = new tbl_state_bal();
                DataSet ds = objbal.state_Select(" ", 1, 0, out totalrecord);

                ddl_state.DataValueField = "int_state_id";
                ddl_state.DataTextField = "str_state_name";

                ddl_state.DataSource = ds;
                ddl_state.DataBind();

                ddl_state.Items.Insert(0, new ListItem("-- Select State --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_share_bind()
        {
            try
            {
                //int totalrecord = 0;
                //tbl_share_type_bal objbal = new tbl_share_type_bal();
                //DataSet ds = objbal.share_type_Select(" ", 1, 0, out totalrecord);

                //ddl_share_type.DataValueField = "int_share_type_id";
                //ddl_share_type.DataTextField = "str_share_type";

                //ddl_share_type.DataSource = ds;
                //ddl_share_type.DataBind();

                //ddl_share_type.Items.Insert(0, new ListItem("-- Select Share Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_connect_category_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_connect_category_bal objbal = new tbl_connect_category_bal();
                DataSet ds = objbal.cat_select(" ", 1, 0, out totalrecord);

                ddl_connect_cat.DataValueField = "int_connect_cat_id";
                ddl_connect_cat.DataTextField = "str_cat";

                ddl_connect_cat.DataSource = ds;
                ddl_connect_cat.DataBind();

                ddl_connect_cat.Items.Insert(0, new ListItem("-- Select Connect Category --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_sing_up_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_retailer_entity objentity = new tbl_retailer_entity();
                tbl_retailer_bal objbal = new tbl_retailer_bal();


                string filename = fupimg.FileName;

                objentity.str_retailer_name = txt_uname.Text;
                objentity.str_corporate_name = txt_corporate_name.Text;
                objentity.str_email_id_p = txt_email.Text;
                objentity.str_password = txt_pass.Text;
                objentity.str_street_address = txt_address.Value;
                objentity.str_apt_suite = "123";
                objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);
                objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                objentity.int_zip_code = Convert.ToInt32(txt_pincode.Text);
                // objentity.int_type_id = Convert.ToInt64("2");
                //  objentity.int_organization_share = Convert.ToInt16("1");
                objentity.date_created_date = DateTime.Now.ToString("dd/mm/yyyy");
                objentity.bit_isactive = false;


                objentity.int_connect_cat = Convert.ToInt32(ddl_cat.SelectedItem.Value);
                objentity.int_connect_sub = Convert.ToInt32(ddl_service_type.SelectedItem.Value);

                if (fupimg.HasFile)
                {
                    objentity.str_logo_img = filename;
                    fupimg.SaveAs(Server.MapPath("/Admin/retailer_logo/") + filename);
                }
                else
                {
                    objentity.str_logo_img = "NA";
                }

                objentity.str_telephone_p = txt_telephone_p.Text;
                objentity.str_contact_1_p = txt_contact_1_p.Text;
                objentity.str_contact_2_s = txt_contact_2_s.Text;
                objentity.str_telephone_s = txt_telephone_s.Text;
                objentity.str_email_id_s = txt_email_s.Text;
                //objentity.int_share_type_id = Convert.ToInt64(null);
                objentity.str_web_address = txt_web_address.Text;
                objentity.str_report_op = false;
                objentity.str_bio = txt_bio.Value;
                objentity.bit_is_delete = false;

                Adress adr = new Adress();

                adr.Address = txt_address.InnerText + "," + ddl_city.SelectedItem.Text + "," + ddl_state.SelectedItem.Text + " " + txt_pincode.Text;

                adr.GeoCode();

                objentity.str_langitude = adr.Longitude == null ? "37.0902" : adr.Longitude;
                objentity.str_latitude = adr.Latitude == null ? "95.7129" : adr.Latitude;

                int val = objbal.retailer_insert(objentity);
                if (val > 0)
                {


                    saveConnect(val.ToString());


                    lblmess.InnerHtml = "You Have Successfully Sign Up <Br/> You can login once your account activation";
                    lblmess.Attributes.Add("class", "alert alert-success");
                    //txt_api_suit.Text = string.Empty;
                    txt_corporate_name.Text = string.Empty;
                    txt_email.Text = string.Empty;
                    txt_address.Value = string.Empty;
                    txt_pass.Text = string.Empty;
                    txt_pincode.Text = string.Empty;
                    txt_uname.Text = string.Empty;
                    ddl_city.ClearSelection();
                    ddl_state.ClearSelection();
                    txt_contact_1_p.Text = string.Empty;
                    txt_contact_2_s.Text = string.Empty;
                    txt_telephone_p.Text = string.Empty;
                    txt_telephone_s.Text = string.Empty;
                    txt_email_s.Text = string.Empty;
                    //  ddl_share_type.ClearSelection();
                    txt_web_address.Text = string.Empty;
                    // txt_share_amt.Text = string.Empty;
                    txt_bio.InnerText = string.Empty;
                }
                else if (val == -1)
                {
                    lblmess.InnerHtml = "Sorry,this Retailer is already allocated";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
                else
                {
                    lblmess.InnerHtml = "Sorry,there may be same issue to save data.Please try again after sometime.";
                    lblmess.Attributes.Add("class", "alert alert-danger");
                }
            }

            catch (Exception ex)
            {
            }
        }

        protected void ddl_city_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_city_bind();
        }

        protected void txt_email_TextChanged(object sender, EventArgs e)
        {
            int totalrecords = 0;
            try
            {

                tbl_retailer_bal objbal = new tbl_retailer_bal();

                DataSet ds = objbal.retailer_Select(" where str_email_id_p ='" + txt_email.Text + "'", 1, 1, out totalrecords, "asc", "str_retailer_name");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txt_email.Focus();
                    lbl_email.Attributes.Add("style", "display:block;color:red");
                }
                else
                {
                    lbl_email.Attributes.Add("style", "display:none");
                }
            }
            catch (Exception ex)
            {
            }
        }

        public class Adress
        {
            public Adress()
            {
            }
            //Properties
            public string Latitude { get; set; }
            public string Longitude { get; set; }
            public string Address { get; set; }

            //The Geocoding here i.e getting the latt/long of address
            public void GeoCode()
            {
                //to Read the Stream
                StreamReader sr = null;

                //The Google Maps API Either return JSON or XML. We are using XML Here
                //Saving the url of the Google API 
                string url = String.Format("http://maps.googleapis.com/maps/api/geocode/xml?address=" +
                this.Address + "&sensor=false");

                //to Send the request to Web Client 
                WebClient wc = new WebClient();
                try
                {
                    sr = new StreamReader(wc.OpenRead(url));
                }
                catch (Exception ex)
                {
                    throw new Exception("The Error Occurred " + ex.Message);
                }

                try
                {
                    XmlTextReader xmlReader = new XmlTextReader(sr);
                    bool latread = false;
                    bool longread = false;

                    while (xmlReader.Read())
                    {
                        xmlReader.MoveToElement();
                        switch (xmlReader.Name)
                        {
                            case "lat":

                                if (!latread)
                                {
                                    xmlReader.Read();
                                    this.Latitude = xmlReader.Value.ToString();
                                    latread = true;

                                }
                                break;
                            case "lng":
                                if (!longread)
                                {
                                    xmlReader.Read();
                                    this.Longitude = xmlReader.Value.ToString();
                                    longread = true;
                                }

                                break;
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("An Error Occurred" + ex.Message);
                }
            }

            //public double getDistance(string ltA, string lgA, string ltB, string lgB)
            //{
            //    double latA = Convert.ToDouble(ltA);
            //    double longA = Convert.ToDouble(lgA);
            //    double latB = Convert.ToDouble(ltB);
            //    double longB = Convert.ToDouble(lgB);

            //    var locA = new GeoCoordinate(latA, longA);
            //    var locB = new GeoCoordinate(latB, longB);
            //    double distance = locA.GetDistanceTo(locB);

            //    return distance / 1000;
            //}
        }

        protected void ddl_category_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_connect_category_bal objbal = new tbl_connect_category_bal();
                DataSet ds = objbal.cat_select(" ", 1, 0, out totalrecord);

                ddl_cat.DataValueField = "int_connect_cat_id";
                ddl_cat.DataTextField = "str_cat";

                ddl_cat.DataSource = ds;
                ddl_cat.DataBind();

                ddl_cat.Items.Insert(0, new ListItem("-- Select Category --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_service_type_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_connect_subcategory_bal objbal = new tbl_connect_subcategory_bal();
                DataSet ds = objbal.subcat_select(" where int_connect_cat_id=" + ddl_cat.SelectedItem.Value, 1, 0, out totalrecord);

                ddl_service_type.DataValueField = "int_connect_sub_cat_id";
                ddl_service_type.DataTextField = "str_sub_cat";

                ddl_service_type.DataSource = ds;
                ddl_service_type.DataBind();

                ddl_service_type.Items.Insert(0, new ListItem("-- Select Service Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddl_cat_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_cat.SelectedIndex > 0)
                ddl_service_type_bind();
        }

        protected void ddl_connect_sub_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = null;
            if (ddl_connect_cat.SelectedIndex > 0)
            {
                try
                {
                    int totalrecords = 0;
                    tbl_connect_subcategory_bal objbal = new tbl_connect_subcategory_bal();
                    ds = objbal.subcat_select(" where int_connect_cat_id=" + ddl_connect_cat.SelectedItem.Value, 1, 0, out totalrecords);

                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        chk_connect_sub.DataTextField = "str_sub_cat";
                        chk_connect_sub.DataValueField = "int_connect_sub_cat_id";

                        chk_connect_sub.DataSource = ds;
                        chk_connect_sub.DataBind();
                    }
                }
                catch (Exception ex)
                {


                }
            }
            else
            {
                chk_connect_sub.Items.Clear();

            }
        }

        public void saveConnect(string retailer_id)
        {
            string str = "";

            tbl_retailer_bal objbal = new tbl_retailer_bal();

            for (int i = 0; i < chk_connect_sub.Items.Count; i++)
            {
                if (chk_connect_sub.Items[i].Selected == true)
                {
                    str = str + "," + chk_connect_sub.Items[i].Value;
                }

            }
            objbal.member_insert_sub_connect(retailer_id, ddl_connect_cat.SelectedItem.Value, str + ",");
        }

       
    }
}