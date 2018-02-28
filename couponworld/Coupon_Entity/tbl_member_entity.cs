using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coupon_Entity
{
    public class tbl_member_entity
    {
        public long int_user_id { get; set; }
        public string str_first_name { get; set; }
        public string str_middle_name { get; set; }
        public string str_last_name { get; set; }
        public string str_password { get; set; }
        public string str_email_id { get; set; }
        public string str_designation { get; set; }
        public long int_group_id { get; set; }
        public string str_gender { get; set; }
        public long int_age_group_id { get; set; }
        public string str_apt_suite { get; set; }
        public string str_street_address { get; set; }
        public long int_city_id { get; set; }
        public long int_state_id { get; set; }
        public int int_zip_code { get; set; }
        public string date_create_date { get; set; }
        public bool bit_isactive { get; set; }
        public string str_telephone { get; set; }
        public string str_date_of_birth { get; set; }
        public long int_organization_id { get; set; }
        public long int_company_id { get; set; }
        public string str_logo_img { get; set; }
        public DateTime date_update_date { get; set; }
        public bool bit_is_delete { get; set; }
    }
}
