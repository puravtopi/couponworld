using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_retailer_entity
    {

        public long int_retailer_id { get; set; }
        public string str_retailer_name { get; set; }
        public string str_corporate_name { get; set; }
        public string str_email_id_p { get; set; }
        public string str_street_address { get; set; }
        public string str_password { get; set; }
        public string str_apt_suite { get; set; }
        public long int_city_id { get; set; }
        public long int_state_id { get; set; }
        public int int_zip_code { get; set; }
      
        public int int_organization_share { get; set; }
        public string date_created_date { get; set; }
        public bool bit_isactive { get; set; }
        public string str_logo_img { get; set; }

        public string str_telephone_p { get; set; }
        public string str_contact_1_p { get; set; }
        public string str_contact_2_s { get; set; }
        public string str_telephone_s { get; set; }
        public string str_email_id_s { get; set; }
        public long int_share_type_id { get; set; }
        public string str_web_address { get; set; }
        public decimal dec_share_amount { get; set; }
        public bool str_report_op { get; set; }
        public string str_bio { get; set; }
        public DateTime date_update_date { get; set; }
        public bool bit_is_delete { get; set; }

        public string str_langitude { get; set; }
        public string str_latitude { get; set; }
        public int int_marketing_type_id { get; set; }
        public int int_connect_cat { get; set; }
        public int int_connect_sub { get; set; }

       
        public int int_connect_fee_type { get; set; }
        public decimal dec_connect_fee { get; set; }
    }
}