using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Coupon_Bal;
using Coupon_Entity;
using System.IO;
using System.Net;
using System.Xml;

namespace Coupon.Admin
{
    public partial class retailer_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ddl_state_bind();
                ddl_category_bind();

                ddl_share_bind();
                btn_update.Visible = false;
                if (Request["rid"] != null)
                {
                    binddata(" where int_retailer_id=" + Request.QueryString["rid"], 1);
                    btn_add.Visible = false;
                    btn_update.Visible = true;
                }
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

        protected void ddl_share_bind()
        {
            try
            {
                int totalrecord = 0;
                tbl_share_type_bal objbal = new tbl_share_type_bal();
                DataSet ds = objbal.share_type_Select(" ", 1, 0, out totalrecord);

                ddl_share_type.DataValueField = "int_share_type_id";
                ddl_share_type.DataTextField = "str_share_type";

                ddl_share_type.DataSource = ds;
                ddl_share_type.DataBind();

                ddl_share_type.Items.Insert(0, new ListItem("-- Select Share Type --", "0"));
            }
            catch (Exception ex)
            {
            }
        }

        protected void binddata(string query, int pageindex)
        {
            try
            {
                int totalcount;

                DataSet dt = new DataSet();

                tbl_retailer_bal objbal = new tbl_retailer_bal();

                dt = objbal.retailer_Select(query, pageindex, 10, out totalcount);
                if (dt.Tables[0].Rows.Count > 0)
                {
                    txt_retailer_name.Text = dt.Tables[0].Rows[0]["str_retailer_name"].ToString();
                    txt_cname.Text = dt.Tables[0].Rows[0]["str_corporate_name"].ToString();
                    txt_email.Text = dt.Tables[0].Rows[0]["str_email_id_p"].ToString();
                    txt_address.Value = dt.Tables[0].Rows[0]["str_street_address"].ToString();
                    txt_password.Text = dt.Tables[0].Rows[0]["str_password"].ToString();
                    txt_api.Text = dt.Tables[0].Rows[0]["str_apt_suite"].ToString();
                    txt_bio.Text = dt.Tables[0].Rows[0]["str_bio"].ToString();

                    txt_org_share.Text = dt.Tables[0].Rows[0]["int_organization_share"].ToString();

                    ddl_state.ClearSelection();
                    ddl_state.Items.FindByValue(dt.Tables[0].Rows[0]["int_state_id"].ToString()).Selected = true;

                   

                    if (dt.Tables[0].Rows[0]["int_connect_fee_type"] != DBNull.Value)
                        ddl_Connect_Fee_Type.Items.FindByValue(dt.Tables[0].Rows[0]["int_connect_fee_type"].ToString()).Selected = true;

                    txt_Connect_fee.Text = dt.Tables[0].Rows[0]["dec_connect_fee"].ToString();


                    if (dt.Tables[0].Rows[0]["int_marketing_type_id"] != DBNull.Value)
                        ddl_Marketing_Fee_Type.Items.FindByValue(dt.Tables[0].Rows[0]["int_marketing_type_id"].ToString()).Selected = true;

                    ddl_cat.ClearSelection();
                    if (dt.Tables[0].Rows[0]["int_connect_cat"] != DBNull.Value)
                    {
                        ddl_cat.Items.FindByValue(dt.Tables[0].Rows[0]["int_connect_cat"].ToString()).Selected = true;
                        ddl_service_type_bind();
                    }

                    ddl_service_type.ClearSelection();
                    if (dt.Tables[0].Rows[0]["int_connect_sub"] != DBNull.Value)
                    {
                        ddl_service_type.Items.FindByValue(dt.Tables[0].Rows[0]["int_connect_sub"].ToString()).Selected = true;

                    }


                    ddl_city_bind();
                    ddl_city.Items.FindByValue(dt.Tables[0].Rows[0]["int_city_id"].ToString()).Selected = true;

                    txt_pincode.Text = dt.Tables[0].Rows[0]["int_zip_code"].ToString();


                    txt_org_share.Text = dt.Tables[0].Rows[0]["int_organization_share"].ToString();
                    img.ImageUrl = "/Admin/retailer_logo/" + dt.Tables[0].Rows[0]["str_logo_img"].ToString();
                    txt_tele_primary.Text = dt.Tables[0].Rows[0]["str_telephone_p"].ToString();
                    txt_contact_primary.Text = dt.Tables[0].Rows[0]["str_contact_1_p"].ToString();
                    txt_contact_s.Text = dt.Tables[0].Rows[0]["str_contact_2_s"].ToString();
                    txt_telephone_s.Text = dt.Tables[0].Rows[0]["str_telephone_s"].ToString();
                    txt_email_s.Text = dt.Tables[0].Rows[0]["str_email_id_s"].ToString();
                    ddl_share_type.SelectedValue = dt.Tables[0].Rows[0]["int_share_type_id"].ToString();
                    txt_share_type.Text = dt.Tables[0].Rows[0]["dec_share_amount"].ToString();
                    txt_web_address.Text = dt.Tables[0].Rows[0]["str_web_address"].ToString();
                    ViewState["img"] = dt.Tables[0].Rows[0]["str_logo_img"].ToString();
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_retailer_bal objbal = new tbl_retailer_bal();
                tbl_retailer_entity objentity = new tbl_retailer_entity();

                if (fupimg.HasFile)
                {
                    string filename = fupimg.FileName;
                    objentity.str_retailer_name = txt_retailer_name.Text;
                    objentity.str_corporate_name = txt_cname.Text;
                    objentity.str_email_id_p = txt_email.Text;
                    objentity.str_street_address = txt_address.Value;
                    objentity.str_password = txt_address.Value;
                    objentity.str_apt_suite = txt_api.Text;
                    objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);
                    objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                    objentity.int_zip_code = Convert.ToInt32(txt_pincode.Text);
                    //objentity.int_type_id = Convert.ToInt64(ddl_type.SelectedItem.Value);
                    objentity.int_organization_share = Convert.ToInt16(txt_org_share.Text);
                    objentity.date_created_date = DateTime.Now.ToString("dd/MM/yyyy");
                    objentity.bit_isactive = true;
                    objentity.str_logo_img = filename;
                    objentity.int_marketing_type_id = Convert.ToInt16(ddl_Marketing_Fee_Type.SelectedValue);
                    fupimg.SaveAs(Server.MapPath("/Admin/retailer_logo/") + filename);
                    objentity.bit_is_delete = false;
                    objentity.int_connect_cat = Convert.ToInt32(ddl_cat.SelectedItem.Value);
                    objentity.int_connect_sub = Convert.ToInt32(ddl_service_type.SelectedItem.Value);

                    int val = objbal.retailer_insert(objentity);
                    if (val > 0)
                    {
                        lblmess.InnerHtml = "Retailer Inserted Successfully.";
                        lblmess.Attributes.Add("class", "alert alert-success");
                        txt_api.Text = string.Empty;
                        txt_cname.Text = string.Empty;
                        txt_email.Text = string.Empty;
                        txt_address.Value = string.Empty;
                        txt_org_share.Text = string.Empty;
                        txt_password.Text = string.Empty;
                        txt_pincode.Text = string.Empty;
                        txt_retailer_name.Text = string.Empty;
                        ddl_city.ClearSelection();
                        ddl_state.ClearSelection();
                        ddl_service_type.ClearSelection();
                        ddl_cat.ClearSelection();
                        txt_tele_primary.Text = string.Empty;
                    }
                    else
                    {
                        lblmess.InnerHtml = "Sorry,this Retailer is already allocated";
                        lblmess.Attributes.Add("class", "alert alert-danger");
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_retailer.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_retailer_bal objbal = new tbl_retailer_bal();
                tbl_retailer_entity objentity = new tbl_retailer_entity();



                objentity.int_retailer_id = Convert.ToInt64(Request.QueryString["rid"]);
                objentity.str_retailer_name = txt_retailer_name.Text;
                objentity.str_corporate_name = txt_cname.Text;
                objentity.str_email_id_p = txt_email.Text;
                objentity.str_street_address = txt_address.Value;
                objentity.str_password = txt_password.Text;
                objentity.str_apt_suite = txt_api.Text;
                objentity.int_city_id = Convert.ToInt64(ddl_city.SelectedItem.Value);
                objentity.int_state_id = Convert.ToInt64(ddl_state.SelectedItem.Value);
                objentity.int_zip_code = Convert.ToInt32(txt_pincode.Text);

                objentity.int_connect_cat = Convert.ToInt32(ddl_cat.SelectedItem.Value);
                objentity.int_connect_sub = Convert.ToInt32(ddl_service_type.SelectedItem.Value);

                objentity.int_organization_share = Convert.ToInt16(txt_org_share.Text);
                objentity.str_bio = txt_bio.Text;
                //objentity.str_logo_img = filename;
                //fupimg.SaveAs(Server.MapPath("/Admin/retailer_logo/") + filename);
                objentity.str_telephone_p = txt_tele_primary.Text;
                objentity.str_contact_1_p = txt_contact_primary.Text;
                objentity.str_contact_2_s = txt_contact_s.Text;
                objentity.str_telephone_s = txt_telephone_s.Text;
                objentity.str_email_id_s = txt_email_s.Text;
                objentity.int_share_type_id = Convert.ToInt64(ddl_share_type.SelectedItem.Value);
                objentity.dec_share_amount = Convert.ToDecimal(txt_share_type.Text);
                objentity.str_web_address = txt_web_address.Text;
                objentity.int_marketing_type_id = Convert.ToInt16(ddl_Marketing_Fee_Type.SelectedValue);
                objentity.int_connect_fee_type = Convert.ToInt16(ddl_Connect_Fee_Type.SelectedValue);
                objentity.dec_connect_fee = Convert.ToDecimal(txt_Connect_fee.Text);

                Adress adr = new Adress();

                adr.Address = txt_address.InnerText + "," + ddl_city.SelectedItem.Text + "," + ddl_state.SelectedItem.Text + " " + txt_pincode.Text;

                adr.GeoCode();

                objentity.str_langitude = adr.Longitude;
                objentity.str_latitude = adr.Latitude;


                if (fupimg.HasFile)
                {
                    objentity.str_logo_img = fupimg.FileName;
                    fupimg.SaveAs(Server.MapPath("/Admin/retailer_logo/") + objentity.str_logo_img);
                }
                else
                    objentity.str_logo_img = ViewState["img"].ToString();


                int val = objbal.retailer_Update(objentity);
                if (val > 0)
                {
                    Response.Redirect("view_retailer.aspx");
                }
                else
                {
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
            int total = 0;
            tbl_retailer_bal objbal = new tbl_retailer_bal();
            DataSet ds = objbal.retailer_Select(" where str_email_id_p='" + txt_email.Text + "'", 1, 0, out total);

            if (total > 0)
            {
                lblemail.Attributes.Add("style", "display:block;color:red");
                txt_email.Focus();
            }
            else
            {
                lblemail.Attributes.Add("style", "display:none;");
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

        protected void ddl_cat_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_cat.SelectedIndex > 0)
                ddl_service_type_bind();
        }
    }
}